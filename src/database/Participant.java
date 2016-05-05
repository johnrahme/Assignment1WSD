package database;

import java.io.Serializable;
import java.util.*;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
@XmlAccessorType(XmlAccessType.FIELD)
public class Participant implements Serializable {

	private String name;
	private ArrayList<Time> times = new ArrayList<Time>();
	
	public Participant(){
		
	}
	public Participant(String name, ArrayList<Time> times) {
		super();
		this.name = name;
		this.times = times;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ArrayList<Time> getTimes() {
		return times;
	}
	public void setTimes(ArrayList<Time> times) {
		this.times = times;
	}

}
