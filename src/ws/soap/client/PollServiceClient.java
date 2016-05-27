package ws.soap.client;

import java.rmi.RemoteException;
import java.util.ArrayList;

import javax.xml.rpc.ServiceException;


public class PollServiceClient{
	 public static void main(String[] args) {
	  PollServiceSOAPServiceLocator locator = new PollServiceSOAPServiceLocator();
	  try {
		PollServiceSOAP soapService = locator.getPollServiceSOAPPort();
		
		Poll[] polls2 = soapService.fetchPolls(null,"closed", 0);
		
		
		
		Time t1  = new Time("12/04/2016", "22:60");
		Participant part1 = new Participant("Samuel", true);
		Participant part2 = new Participant("Lillian", false);
		Participant [] participants = new Participant[0];
		
		Option opt1 = new Option(0, t1,participants);
		Option [] options = {opt1};
		
		Poll addedPoll = new Poll("Poll Title 7", null, "Poll Desciption7", "Poll Location7", null, false, options, 0);
		System.out.println(soapService.addPoll("john.rahme.se@gmail.com", "password", addedPoll));
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
