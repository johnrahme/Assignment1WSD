package ws.soap.client;

import java.rmi.RemoteException;

import javax.xml.rpc.ServiceException;

public class PollServiceClient{
	 public static void main(String[] args) {
	  PollServiceSOAPServiceLocator locator = new PollServiceSOAPServiceLocator();
	  try {
		PollServiceSOAP soapService = locator.getPollServiceSOAPPort();
		
		Poll[] polls2 = soapService.fetchPolls(null,"closed", 0);
		//System.out.println(soapService.addPoll("john.rahme.se@gmail.com", "password", testPoll));
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
