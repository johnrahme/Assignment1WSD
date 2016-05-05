package login;

import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="polls")
@XmlAccessorType(XmlAccessType.FIELD)
public class Polls implements Serializable {
	@XmlElement(name="poll")
	private ArrayList<Poll> list = new ArrayList<Poll>();

	
	public Polls() {
		
	}

	public void setExampleList(){
		ArrayList <Time> times = new ArrayList <Time>();
		ArrayList <Participant> participants = new ArrayList<Participant>();
		
		Time t1  = new Time("2016-04-12", "22:30");
		Time t2 = new Time("2016-04-13", "22:34");
		times.add(t1);
		times.add(t2);
		Participant part1 = new Participant("Richard", times);
		Participant part2 = new Participant("James", times);
		participants.add(part1);
		participants.add(part2);
		Poll poll1 = new Poll("Poll Title", "Poll Desciption", "Poll Location", t1, true, times, participants);
		Poll poll2 = new Poll("Poll Title2", "Poll Desciption2", "Poll Location2", t1, true, times, participants);
		list.add(poll1);
		list.add(poll2);
	}
	
	public ArrayList<Poll> getList() {
		return list;
	}

	public void setList(ArrayList<Poll> list) {
		this.list = list;
	}
	
	
}
