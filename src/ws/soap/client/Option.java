/**
 * Option.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ws.soap.client;

public class Option  implements java.io.Serializable {
    private int id;

    private ws.soap.client.Time timeslot;

    private ws.soap.client.Participant[] participants;

    public Option() {
    }

    public Option(
           int id,
           ws.soap.client.Time timeslot,
           ws.soap.client.Participant[] participants) {
           this.id = id;
           this.timeslot = timeslot;
           this.participants = participants;
    }


    /**
     * Gets the id value for this Option.
     * 
     * @return id
     */
    public int getId() {
        return id;
    }


    /**
     * Sets the id value for this Option.
     * 
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }


    /**
     * Gets the timeslot value for this Option.
     * 
     * @return timeslot
     */
    public ws.soap.client.Time getTimeslot() {
        return timeslot;
    }


    /**
     * Sets the timeslot value for this Option.
     * 
     * @param timeslot
     */
    public void setTimeslot(ws.soap.client.Time timeslot) {
        this.timeslot = timeslot;
    }


    /**
     * Gets the participants value for this Option.
     * 
     * @return participants
     */
    public ws.soap.client.Participant[] getParticipants() {
        return participants;
    }


    /**
     * Sets the participants value for this Option.
     * 
     * @param participants
     */
    public void setParticipants(ws.soap.client.Participant[] participants) {
        this.participants = participants;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Option)) return false;
        Option other = (Option) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            this.id == other.getId() &&
            ((this.timeslot==null && other.getTimeslot()==null) || 
             (this.timeslot!=null &&
              this.timeslot.equals(other.getTimeslot()))) &&
            ((this.participants==null && other.getParticipants()==null) || 
             (this.participants!=null &&
              java.util.Arrays.equals(this.participants, other.getParticipants())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        _hashCode += getId();
        if (getTimeslot() != null) {
            _hashCode += getTimeslot().hashCode();
        }
        if (getParticipants() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getParticipants());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getParticipants(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Option.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://soap.ws/", "option"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("id");
        elemField.setXmlName(new javax.xml.namespace.QName("", "id"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("timeslot");
        elemField.setXmlName(new javax.xml.namespace.QName("", "timeslot"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://soap.ws/", "time"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("participants");
        elemField.setXmlName(new javax.xml.namespace.QName("", "participants"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://soap.ws/", "participant"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("", "participant"));
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
