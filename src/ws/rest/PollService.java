package ws.rest;
 
import database.*;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
 
//Rest service to write and retrieve a poll
@Path("/pollApp")
public class PollService {
 @Context
 private ServletContext application;
 
 private PollHandler getPollHandler() throws Exception {
  // The web server can handle requests from different clients in parallel.
  // These are called "threads".
  //
  // We do NOT want other threads to manipulate the application object at the same
  // time that we are manipulating it, otherwise bad things could happen.
  //
  // The "synchronized" keyword is used to lock the application object while
  // we're manpulating it.
  synchronized (application) {
	PollHandler pollHand = null;
	//Dunno if we need this...Should ask
    //PollHandler pollHand = (PollHandler)application.getAttribute("pollHand");
   if (pollHand == null) {
    pollHand = new PollHandler();
    pollHand.setFilePath(application.getRealPath("WEB-INF/polls.xml"));
    application.setAttribute("pollHand", pollHand);
   }
   return pollHand;
  }
 }
 
 //Get all polls, can filtered by creator, status and min responses and also sorted
@Path("polls")
@GET
@Produces(MediaType.APPLICATION_XML)
public Polls getPolls(@QueryParam("email") String email, @QueryParam("status") String status,@QueryParam("minResponses") int minRes, @QueryParam("sort") String sort ) throws Exception{
	PollHandler ph = getPollHandler();
	Polls returnPolls = ph.getPolls();
	if(email == null && status == null && minRes==0 && sort == null){
		ph.getPolls().filterOpenClosed(true);
		return ph.getPolls();
	}
	if(email !=null){
		returnPolls = ph.getPolls(email);
	}
	if(status != null){
		Polls bufferPolls = new Polls();
		for(Poll poll:returnPolls.getList()){
			if(status.equals("open")&&poll.isOpen()){
				bufferPolls.getList().add(poll);
			}
			else if(status.equals("closed")&&!poll.isOpen()){
				bufferPolls.getList().add(poll);
			}		
		}
		returnPolls = bufferPolls;
	}
	if(minRes != 0){
		Polls bufferPolls = new Polls();
		for(Poll poll:returnPolls.getList()){
			for(Option o : poll.getOptions().getList()){
				if(o.getParticipants().getList().size()>=minRes){
					bufferPolls.getList().add(poll);
					break;
				}
			}
		}
		returnPolls = bufferPolls;
	}
	
	if(sort != null){
		returnPolls.sortBy(sort);
	}
	return returnPolls;
}

//Post option to create a poll

@Path("polls")
@POST
@Consumes(MediaType.APPLICATION_XML)
	public void addPoll(Poll poll) throws Exception {
		PollHandler ph = getPollHandler();
		ph.addPoll(poll);
	}
}