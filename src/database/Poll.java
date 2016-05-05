package database;

import java.io.Serializable;
import java.util.*;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlAccessorType(XmlAccessType.FIELD)
public class Poll implements Serializable {


	@XmlElement(name = "title")
	private String title;
	@XmlElement(name = "creator")
	private String creator;
	@XmlElement(name = "description")
	private String description;
	@XmlElement(name = "location")
	private String location;
	@XmlElement(name = "createdAt")
	private Time createdAt;
	@XmlElement(name = "open")
	private boolean open;
	@XmlElement(name = "time")
	private ArrayList<Time> times = new ArrayList<Time>();
	@XmlElement(name = "participant")
	private ArrayList<Participant> participants = new ArrayList<Participant>();
	
	public Poll(){
		
	}
	
	public Poll(String title, String creator, String description, String location, Time createdAt, boolean open, ArrayList<Time> times,
			ArrayList<Participant> participants) {
		super();
		this.title = title;
		this.creator = creator;
		this.description = description;
		this.location = location;
		this.createdAt = createdAt;
		this.open = open;
		this.times = times;
		this.participants = participants;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Time getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Time createdAt) {
		this.createdAt = createdAt;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	public ArrayList<Time> getTimes() {
		return times;
	}
	public void setTimes(ArrayList<Time> times) {
		this.times = times;
	}
	public ArrayList<Participant> getParticipants() {
		return participants;
	}
	public void setParticipants(ArrayList<Participant> participants) {
		this.participants = participants;
	}

}
