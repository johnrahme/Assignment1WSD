package database;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Date;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;


public class Main {

	public static void main(String[] args) throws Exception {
		
		Users testUsers = new Users();
		testUsers.setExampleList();
		
		User addedUser = new User("Adrian", "Jackson", "adrian@gmail.com", "passwordAdrian");
		
		ArrayList <Time> times = new ArrayList <Time>();
		ArrayList <Participant> participantList = new ArrayList<Participant>();
		ArrayList <Option> optionList = new ArrayList<Option>();
		
		
		Time t1  = new Time("12/04/2016", "22:60");
		Time t2 = new Time("13/04/2016", "22:39");
		times.add(t1);
		times.add(t2);
		Participant part1 = new Participant("Samuel", true);
		Participant part2 = new Participant("Lillian", false);		
		participantList.add(part1);
		participantList.add(part2);
		Participants participants = new Participants(participantList);		
		Option opt1 = new Option(t1,participants);
		optionList.add(opt1);
		Options options = new Options(optionList);
		Poll addedPoll = new Poll(4,"Poll Title3", "test@test.se", "Poll Desciption3", "Poll Location3", t1, true, options);
		
		Participant addedPart = new Participant("Lisa", true);
		
		Polls polls = new Polls();
		polls.setExampleList();
		
		UserHandler uh = new UserHandler();
		//uh.setFilePath("WebContent/WEB-INF/testUsers.xml");
		//uh.addUser(addedUser);
		//uh.removeUser("adrian@gmail.com");
		
		PollHandler ph = new PollHandler();
		//ph.setFilePath("WebContent/WEB-INF/polls.xml");
		//ph.addPoll(addedPoll);
		//ph.addParticipant(1, 1, addedPart);
		//ph.setOpen(2, false);
		//ph.removePoll(132);
		
		
		
		  JAXBContext jc = JAXBContext.newInstance(Users.class);
		  Marshaller m = jc.createMarshaller();
		  //m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		  //FileOutputStream fout = new FileOutputStream("WebContent/WEB-INF/polls.xml");
		  //m.marshal(testUsers, System.out);
		  //m.marshal(testUsers, fout);
		  
		  JAXBContext jc2 = JAXBContext.newInstance(Polls.class);
		  Marshaller m2 = jc2.createMarshaller();
		  m2.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		  FileOutputStream fout2 = new FileOutputStream("WebContent/WEB-INF/polls.xml");
		  //m2.marshal(polls, System.out);
		  m2.marshal(polls, fout2);
		  
	}
	

}
