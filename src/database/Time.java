package database;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

@XmlAccessorType(XmlAccessType.FIELD)
public class Time implements Serializable {
	
	@XmlElement(name = "date")
	private String date;
	@XmlElement(name = "time")
	private String time;
	
	public Time(){
		
	}
	public Time(String date, String time) {
		super();
		this.date = date;
		this.time = time;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
