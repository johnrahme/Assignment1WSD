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
	public void addPollToXml(Poll poll) throws Exception{
		polls.addPoll(poll);
		  // Boilerplate code to convert objects to XML...
		  JAXBContext jc = JAXBContext.newInstance(Polls.class);
		  Marshaller m = jc.createMarshaller();
		  //filePath = "/Users/johnrahme/test.xml";
		  m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		  FileOutputStream fout = new FileOutputStream(filePath);
		  m.marshal(polls, fout);
	}
	public Polls getPolls() {
		return polls;
	}
	public void setPolls(Polls polls) {
		this.polls = polls;
	}
}
