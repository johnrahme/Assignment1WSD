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
	
	 @WebMethod
	public Polls fetchPolls(){
		 PollHandler ph = null;
		try {
			ph = getPollHandler();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return ph.getPolls();
	 }
}