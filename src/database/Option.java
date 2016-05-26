package database;

import java.io.Serializable;

import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
public class Option implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -460458780174444627L;
	@XmlElement(name="id")
	private int id;
	@XmlElement(name = "timeslot")
	private Time time;
	@XmlElement(name = "participants")
	private Participants participants;
	
	
	public Option(){
		
	}

	public Option(Time time, Participants participants) {
		super();
		this.time = time;
		this.participants = participants;
	}
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Time getTime() {
		return time;
	}

	public void setTime(Time time) {
		this.time = time;
	}

	public Participants getParticipants() {
		return participants;
	}

	public void setParticipants(Participants participants) {
		this.participants = participants;
	}
	
}
