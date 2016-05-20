package database;

import java.io.Serializable;
import java.util.*;

import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
public class Poll implements Serializable {


	@XmlAttribute(name = "id")
	private long id;
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
	@XmlElement(name = "Options")
	private Options options;
	
	public Poll(){
		
	}
	
	
	public Poll(long id, String title, String creator, String description, String location, Time createdAt,
			boolean open, Options options) {
		super();
		this.id = id;
		this.title = title;
		this.creator = creator;
		this.description = description;
		this.location = location;
		this.createdAt = createdAt;
		this.open = open;
		this.options = options;
		//For now
		//this.id = System.currentTimeMillis();
	}


	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
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

	public Options getOptions() {
		return options;
	}

	public void setOptions(Options options) {
		this.options = options;
	}
	
}
