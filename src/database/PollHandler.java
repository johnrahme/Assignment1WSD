package database;

import java.io.FileInputStream;
import java.io.FileOutputStream;

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
		System.out.println(polls.getList().size());
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
	// Add a participant to the specific poll
	public void addParticipant(long pollId, Participant participant)throws Exception{
		int id = getIdOfPoll(pollId);
		if(id > -1){
			polls.getList().get(id).getParticipants().add(participant);
			writeToXml();
		}
	}
	public Polls getPolls() {
		return polls;
	}
	public void setPolls(Polls polls) {
		this.polls = polls;
	}
}
