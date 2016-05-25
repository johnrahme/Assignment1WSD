package ws.soap;

import database.*;
import javax.annotation.Resource;
import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.servlet.ServletContext;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;

@WebService
public class PollServiceSOAP {
	@Resource
	private WebServiceContext context;
	
	private PollHandler getPollHandler() throws Exception {
		  // The web server can handle requests from different clients in parallel.
		  // These are called "threads".
		  //
		  // We do NOT want other threads to manipulate the application object at the same
		  // time that we are manipulating it, otherwise bad things could happen.
		  //
		  // The "synchronized" keyword is used to lock the application object while
		  // we're manpulating it.
		  ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		  synchronized (application) {
		   PollHandler pollHand = null;
		   //pollHand = (PollHandler)application.getAttribute("pollHand");
		   if (pollHand == null) {
			   pollHand = new PollHandler();
			   pollHand.setFilePath(application.getRealPath("WEB-INF/polls.xml"));
		    application.setAttribute("pollHand", pollHand);
		   }
		   return pollHand;
		  }
		 }
	private UserHandler getUserHandler() throws Exception {
		  // The web server can handle requests from different clients in parallel.
		  // These are called "threads".
		  //
		  // We do NOT want other threads to manipulate the application object at the same
		  // time that we are manipulating it, otherwise bad things could happen.
		  //
		  // The "synchronized" keyword is used to lock the application object while
		  // we're manpulating it.
		  ServletContext application = (ServletContext)context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
		  synchronized (application) {
		   UserHandler userHand = null;
		   //pollHand = (PollHandler)application.getAttribute("pollHand");
		   if (userHand == null) {
			   userHand = new UserHandler();
			   userHand.setFilePath(application.getRealPath("WEB-INF/users.xml"));
		    application.setAttribute("userHand", userHand);
		   }
		   return userHand;
		  }
		 }
	
	//Add a poll, if the login provided is not a valid user return -1, otherwise return the id of the poll created
	@WebMethod
	public int addPoll(String email, String password, Poll poll){
		UserHandler uh = null;
		PollHandler ph = null;
		try {
			uh = getUserHandler();
			ph = getPollHandler();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
		User loggedInUser = uh.getUsers().login(email, password);
		if(loggedInUser!=null){
			try {
				ph.addPoll(poll);
				return ph.getPolls().getList().size();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	@WebMethod
	public String changePollStatus(String email, String password, int id, boolean status ){
		UserHandler uh = null;
		PollHandler ph = null;
		try {
			uh = getUserHandler();
			ph = getPollHandler();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "Error creating handlers";
		}
		User user = uh.getUsers().login(email, password);
		if(user == null){
			return "Invalid login details";
		}
		for(Poll p: ph.getPolls().getList()){
			if(p.getId()==id&&p.getCreator().equals(user.getEmail())){
				try {
					ph.setOpen(id, status);
					return "Poll status successfully changed";
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return "Could not change status";
					
				}
				
			}
		}
		return "Poll not found";
	}
	
	@WebMethod
	public Polls fetchPolls(String email, String status, int minRes){
		 PollHandler ph = null;
		try {
			ph = getPollHandler();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(email == null && status == null && minRes==0){
			ph.getPolls().filterOpenClosed(true);
			return ph.getPolls();
		}
			Polls returnPolls = ph.getPolls();
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
		return (Polls)returnPolls;
	 }
}
