package ws.soap.client;

import java.rmi.RemoteException;
import java.util.ArrayList;

import javax.xml.rpc.ServiceException;


public class PollServiceClient{
	 public static void main(String[] args) {
	  PollServiceSOAPServiceLocator locator = new PollServiceSOAPServiceLocator();
	  try {
		PollServiceSOAP soapService = locator.getPollServiceSOAPPort();
		
		// fetchPolls takes (Creator, Status, MinResponses, Sorting)
		Poll[] polls = soapService.fetchPolls(null,"open", 0, "creator");
		
		for(Poll p:polls){
			System.out.println(p.getTitle());
		}
		
		Time t1  = new Time("12/04/2016", "22:60");
		//Participant part1 = new Participant("Samuel", true);
		//Participant part2 = new Participant("Lillian", false);
		Participant [] participants = new Participant[0];
		
		Option opt1 = new Option(0, t1,participants);
		Option [] options = {opt1};
		
		Poll addedPoll = new Poll("Rest poll", null, "This is an example rest poll", "UTS", null, false, options, 0);
		
		//Add the example poll
		//System.out.println(soapService.addPoll("john.rahme.se@gmail.com", "password", addedPoll));
		
		//Change poll status takes (String email, String password, int id, boolean status)
		System.out.println(soapService.changePollStatus("john.rahme.se@gmail.com", "password", 2, false));
		
	} catch (ServiceException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (RemoteException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	  /** Insert your code here **/
	 }
}
