package ws.soap.client;

public class PollServiceSOAPProxy implements ws.soap.client.PollServiceSOAP {
  private String _endpoint = null;
  private ws.soap.client.PollServiceSOAP pollServiceSOAP = null;
  
  public PollServiceSOAPProxy() {
    _initPollServiceSOAPProxy();
  }
  
  public PollServiceSOAPProxy(String endpoint) {
    _endpoint = endpoint;
    _initPollServiceSOAPProxy();
  }
  
  private void _initPollServiceSOAPProxy() {
    try {
      pollServiceSOAP = (new ws.soap.client.PollServiceSOAPServiceLocator()).getPollServiceSOAPPort();
      if (pollServiceSOAP != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)pollServiceSOAP)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)pollServiceSOAP)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (pollServiceSOAP != null)
      ((javax.xml.rpc.Stub)pollServiceSOAP)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public ws.soap.client.PollServiceSOAP getPollServiceSOAP() {
    if (pollServiceSOAP == null)
      _initPollServiceSOAPProxy();
    return pollServiceSOAP;
  }
  
  public int addPoll(java.lang.String arg0, java.lang.String arg1, ws.soap.client.Poll arg2) throws java.rmi.RemoteException{
    if (pollServiceSOAP == null)
      _initPollServiceSOAPProxy();
    return pollServiceSOAP.addPoll(arg0, arg1, arg2);
  }
  
  public java.lang.String changePollStatus(java.lang.String arg0, java.lang.String arg1, int arg2, boolean arg3) throws java.rmi.RemoteException{
    if (pollServiceSOAP == null)
      _initPollServiceSOAPProxy();
    return pollServiceSOAP.changePollStatus(arg0, arg1, arg2, arg3);
  }
  
  public ws.soap.client.Poll[] fetchPolls(java.lang.String arg0, java.lang.String arg1, int arg2, java.lang.String arg3) throws java.rmi.RemoteException{
    if (pollServiceSOAP == null)
      _initPollServiceSOAPProxy();
    return pollServiceSOAP.fetchPolls(arg0, arg1, arg2, arg3);
  }
  
  
}