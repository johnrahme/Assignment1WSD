package login;

import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

@XmlAccessorType(XmlAccessType.FIELD)
public class User implements Serializable{

	@XmlElement(name = "profile")
	private Profile profile;
	@XmlElement(name = "poll")
	private ArrayList<Poll> polls = new ArrayList<Poll>();
	
	
	
	public User(Profile profile, ArrayList<Poll> polls) {
		super();
		this.profile = profile;
		this.polls = polls;
	}
	public Profile getProfile() {
		return profile;
	}
	public void setProfile(Profile profile) {
		this.profile = profile;
	}
	public ArrayList<Poll> getPolls() {
		return polls;
	}
	public void setPolls(ArrayList<Poll> polls) {
		this.polls = polls;
	}
	
	

}
