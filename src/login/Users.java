package login;

import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="users")
@XmlAccessorType(XmlAccessType.FIELD)
public class Users implements Serializable {

	@XmlElement(name="user")
	private ArrayList<User> list = new ArrayList<User>();

	public Users(){
		  
	}
	
	public void setExampleList(){
		ArrayList <Time> times = new ArrayList<Time>();
		ArrayList <Participant> participants = new ArrayList <Participant>();
		ArrayList <Poll> polls = new ArrayList <Poll>();
		
		Profile profile = new Profile("John", "Rahme", "john.rahme.se@gmail.com", "password");	
		Time t1  = new Time(2016,3,10,1,4);
		Time t2 = new Time(2016, 4, 10, 1,4);
		times.add(t1);
		times.add(t2);
		Participant part1 = new Participant("Richard", times);
		Participant part2 = new Participant("James", times);
		participants.add(part1);
		participants.add(part2);
		Poll poll1 = new Poll("Poll Title", "Poll Desciption", "Poll Location", t1, true, times, participants);
		Poll poll2 = new Poll("Poll Title2", "Poll Desciption2", "Poll Location2", t1, true, times, participants);
		polls.add(poll1);
		polls.add(poll2);
		
		User u1 = new User(profile, polls);
		User u2 = new User(profile, polls);
		list.add(u1);
		list.add(u2);
	}
	
	public ArrayList<User> getList() {
		return list;
	}

	public void setList(ArrayList<User> list) {
		this.list = list;
	}
	
	

}
