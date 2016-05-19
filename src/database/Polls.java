package database;

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
		ArrayList <Participant> participantList = new ArrayList<Participant>();
		ArrayList <Option> optionList = new ArrayList<Option>();
		
		
		Time t1  = new Time("2016-04-12", "22:30");
		Time t2 = new Time("2016-04-13", "22:34");
		times.add(t1);
		times.add(t2);
		Participant part1 = new Participant("Richard", true);
		Participant part2 = new Participant("James", false);
		
		participantList.add(part1);
		participantList.add(part2);
		Participants participants = new Participants(participantList);
		
		Option opt1 = new Option(t1,participants);
		Option opt2 = new Option(t2,participants);
		optionList.add(opt1);
		optionList.add(opt2);
		
		Options options = new Options(optionList);
		Poll poll1 = new Poll(1,"Poll Title", "john.rahme.se@gmail.com", "Poll Desciption", "Poll Location", t1, true, options);
		Poll poll2 = new Poll(2, "Poll Title2", "test@test.se", "Poll Desciption2", "Poll Location2", t1, true, options);
		list.add(poll1);
		list.add(poll2);
	}
	
	public ArrayList<Poll> getList() {
		return list;
	}

	public void setList(ArrayList<Poll> list) {
		this.list = list;
	}
    public void addPoll(Poll poll) {
        list.add(poll);
    }
    public void removePoll(Poll poll) {
        list.remove(poll);
    }
    public String toString(){
    	String returnString = "";
    	for(Poll poll:list){
    		returnString += poll.getTitle()+"\n";
    		returnString += poll.getId()+"\n";
    	}
    	return returnString;
    }
	
}
