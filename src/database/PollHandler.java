package database;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class PollHandler {

	private String filePath;
	private Polls polls;
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) throws Exception {
		
		this.filePath = filePath;
		// Create the unmarshaller
		JAXBContext jc = JAXBContext.newInstance(Polls.class);
		Unmarshaller u = jc.createUnmarshaller();
		 
		// Now unmarshal the object from the file
		FileInputStream fin = new FileInputStream(filePath);
		polls = (Polls)u.unmarshal(fin); // This loads the "shop" object
		fin.close();
	}
	public void writeToXml() throws Exception{
		  // Boilerplate code to convert objects to XML...
		  JAXBContext jc = JAXBContext.newInstance(Polls.class);
		  Marshaller m = jc.createMarshaller();
		  //filePath = "/Users/johnrahme/test.xml";
		  m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		  FileOutputStream fout = new FileOutputStream(filePath);
		  m.marshal(polls, fout);
	}
	
	//This function gets  the id in the poll array from the id specified in the xml
	private int getIdOfPoll(long pollId){
		for(int i = 0; i<polls.getList().size(); i++){
			if(polls.getList().get(i).getId() == pollId){
				return i;
			}
		}
		return -1;
	}
	//Add a poll and write it to the xml
	public void addPoll(Poll poll)throws Exception{
		polls.addPoll(poll);
		writeToXml();
	}
	//Remove a poll with the specified id
	public void removePoll(long pollId)throws Exception{
		int id = getIdOfPoll(pollId);
		if(id > -1){
			polls.getList().remove(id);
			writeToXml();
		}
	}
	//Set the specified poll to either open or closed
	public void setOpen(long pollId, boolean open)throws Exception{
		int id = getIdOfPoll(pollId);
		if(id > -1){
			polls.getList().get(id).setOpen(open);
			writeToXml();
		}
		
	}
	//Get poll from id
	public Poll getPoll(int pollId){
		int id = getIdOfPoll(pollId);
		if(id>-1){
			return polls.getList().get(id);
		}
		return null;
	}
	// Add a participant to the specific poll
	
	public void addParticipant(long pollId, int optionId, Participant participant)throws Exception{
		int id = getIdOfPoll(pollId);
		if(id > -1){
			polls.getList().get(id).getOptions().getList().get(optionId).getParticipants().getList().add(participant);
			writeToXml();
		}
	}
	//Get all polls
	public Polls getPolls() {
		return polls;
	}
	//Get polls from a specific creator
	public Polls getPolls(String creatorEmail){
		Polls creatorPolls = new Polls();
		//Loop through polls and find the ones with the 
		for(Poll poll:polls.getList()){
			if(poll.getCreator().equals(creatorEmail)){
				creatorPolls.getList().add(poll);
			}
		}
		return creatorPolls;
	}
	public void setPolls(Polls polls) {
		this.polls = polls;
	}
	
	//Creates a poll from the form input values
	public Poll getPollFromInput(String title, String creator, String description, String location, boolean open, String[] stringTimes){
		ArrayList <Participant> participantList = new ArrayList<Participant>();
		ArrayList <Option> optionList = new ArrayList<Option>();
		
		Participants participants = new Participants(participantList);	
		
		for(String time:stringTimes){
			Time t = new Time();
			t.stringToTime(time);
			optionList.add(new Option(t,participants));
		}
		// find created at time
		
		Time createdAt = getCurrentTimeObject();
		
		Options options = new Options(optionList);
		Poll addedPoll = new Poll(System.currentTimeMillis(),title, creator, description, location, createdAt, open, options);
		return addedPoll;
	}
	public Time getCurrentTimeObject(){
		DateFormat timeFormat = new SimpleDateFormat("HH:mm");
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();
		String createdTime = (timeFormat.format(date));
		String createdDate = (dateFormat.format(date));
		Time createdAt = new Time(createdDate, createdTime);
		return createdAt;
	}
}
