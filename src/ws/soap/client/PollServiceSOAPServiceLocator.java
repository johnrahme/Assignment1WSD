/**
 * PollServiceSOAPServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ws.soap.client;

public class PollServiceSOAPServiceLocator extends org.apache.axis.client.Service implements ws.soap.client.PollServiceSOAPService {

    public PollServiceSOAPServiceLocator() {
    }


    public PollServiceSOAPServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public PollServiceSOAPServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for PollServiceSOAPPort
    private java.lang.String PollServiceSOAPPort_address = "http://localhost:8080/Assignment1WSD/soap/polls";

    public java.lang.String getPollServiceSOAPPortAddress() {
        return PollServiceSOAPPort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String PollServiceSOAPPortWSDDServiceName = "PollServiceSOAPPort";

    public java.lang.String getPollServiceSOAPPortWSDDServiceName() {
        return PollServiceSOAPPortWSDDServiceName;
    }

    public void setPollServiceSOAPPortWSDDServiceName(java.lang.String name) {
        PollServiceSOAPPortWSDDServiceName = name;
    }

    public ws.soap.client.PollServiceSOAP getPollServiceSOAPPort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(PollServiceSOAPPort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getPollServiceSOAPPort(endpoint);
    }

    public ws.soap.client.PollServiceSOAP getPollServiceSOAPPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            ws.soap.client.PollServiceSOAPPortBindingStub _stub = new ws.soap.client.PollServiceSOAPPortBindingStub(portAddress, this);
            _stub.setPortName(getPollServiceSOAPPortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setPollServiceSOAPPortEndpointAddress(java.lang.String address) {
        PollServiceSOAPPort_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (ws.soap.client.PollServiceSOAP.class.isAssignableFrom(serviceEndpointInterface)) {
                ws.soap.client.PollServiceSOAPPortBindingStub _stub = new ws.soap.client.PollServiceSOAPPortBindingStub(new java.net.URL(PollServiceSOAPPort_address), this);
                _stub.setPortName(getPollServiceSOAPPortWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("PollServiceSOAPPort".equals(inputPortName)) {
            return getPollServiceSOAPPort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://soap.ws/", "PollServiceSOAPService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://soap.ws/", "PollServiceSOAPPort"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("PollServiceSOAPPort".equals(portName)) {
            setPollServiceSOAPPortEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
