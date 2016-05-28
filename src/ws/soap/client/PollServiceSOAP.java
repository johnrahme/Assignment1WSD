/**
 * PollServiceSOAP.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ws.soap.client;

public interface PollServiceSOAP extends java.rmi.Remote {
    public int addPoll(java.lang.String arg0, java.lang.String arg1, ws.soap.client.Poll arg2) throws java.rmi.RemoteException;
    public java.lang.String changePollStatus(java.lang.String arg0, java.lang.String arg1, int arg2, boolean arg3) throws java.rmi.RemoteException;
    public ws.soap.client.Poll[] fetchPolls(java.lang.String arg0, java.lang.String arg1, int arg2, java.lang.String arg3) throws java.rmi.RemoteException;
}
