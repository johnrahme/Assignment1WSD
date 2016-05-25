package ws.soap.client;

import java.rmi.RemoteException;

import javax.xml.rpc.ServiceException;

public class PollServiceClient{
	 public static void main(String[] args) {
	  PollServiceSOAPServiceLocator locator = new PollServiceSOAPServiceLocator();
	  try {
		PollServiceSOAP soapService = locator.getPollServiceSOAPPort();
		Option[] options = soapService.fetchOptions();
		Poll p = soapService.getPoll();
		Poll[] polls = soapService.getPolls();
		Poll[] polls2 = soapService.fetchPolls(null,"closed", 0);
		for(Poll poll: polls2){
			System.out.println(poll.getTitle());
		}
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
