package ws.soap.client;

import java.rmi.RemoteException;

import javax.xml.rpc.ServiceException;

public class PollServiceClient {
	 public static void main(String[] args) {
	  PollServiceSOAPServiceLocator locator = new PollServiceSOAPServiceLocator();
	  try {
		PollServiceSOAP soapService = locator.getPollServiceSOAPPort();
		Option[] options = soapService.fetchOptions();
		String p = soapService.getPoll().getDescription();
		//Poll[] polls = soapService.fetchPolls(null, null, 0);
		//System.out.println(p.getDescription());
		
		
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
