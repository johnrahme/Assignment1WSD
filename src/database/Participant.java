package database;

import java.io.Serializable;
import java.util.*;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
@XmlAccessorType(XmlAccessType.FIELD)
public class Participant implements Serializable {
	@XmlElement(name="name")
	private String name;
	
	@XmlElement(name="available")
	private boolean available;

	public Participant(){
		
	}
	public Participant(String name, boolean available) {
		super();
		this.name = name;
		this.available = available;
	}
	public boolean isAvailable() {
		return available;
	}
	public void setAvailable(boolean available) {
		this.available = available;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
