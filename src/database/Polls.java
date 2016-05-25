package database;

import java.io.Serializable;
import java.util.*;

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
		
		
		Time t1  = new Time("12/04/2016", "22:30");
		Time t2 = new Time("13/04/2016", "22:34");
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
		addPoll(poll1);
		addPoll(poll2);
	}
	
	public ArrayList<Poll> getList() {
		return list;
	}

	public void setList(ArrayList<Poll> list) {
		this.list = list;
		updatePollID();
	}
    public void addPoll(Poll poll) {
        list.add(poll);
        updatePollID();
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
    private void updatePollID(){
		// When an Polls list is set add unique ID:s to all option objects
		for(int i = 0; i<list.size(); i++){
			list.get(i).setId(i);
		}
		
	}
    public void sortBy(String sortBy){
		if(sortBy.equals("Title")){
			Collections.sort(this.list, Poll.PollTitleComparator);
		}
		else if(sortBy.equals("Creator")){
			Collections.sort(this.list, Poll.PollCreatorComparator);
		}
		else if(sortBy.equals("Creation")){
			Collections.sort(this.list, Poll.PollCreationComparator);
		}
	}
    public void filterOpenClosed(boolean open){
    	ArrayList <Poll> bufferList = new ArrayList <Poll>();
    	for(Poll p: list){
    		if(p.isOpen()&&open){
    			bufferList.add(p);
    		}
    		else if(!p.isOpen()&&!open){
    			bufferList.add(p);
    		}
    	}
    	list = bufferList;
    }
	
}
