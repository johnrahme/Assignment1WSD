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
		ArrayList <Time> times = new ArrayList<Time>();
		ArrayList <Participant> participants = new ArrayList <Participant>();
		Time t1  = new Time("2016-04-12", "22:30");
		Time t2 = new Time("2016-04-13", "22:34");
		times.add(t1);
		times.add(t2);
		Participant part1 = new Participant("Kyle", times);
		Participant part2 = new Participant("Martinez", times);
		participants.add(part1);
		participants.add(part2);
		Poll addedPoll = new Poll(3,"Poll Title3", "richard@gmail.com", "Poll Desciption3", "Poll Location 3", t1, true, times, participants);
		Participant addedPart = new Participant("Richard", null);
		
		Polls polls = new Polls();
		polls.setExampleList();
		
		UserHandler uh = new UserHandler();
		uh.setFilePath("WebContent/WEB-INF/testUsers.xml");
		//uh.addUser(addedUser);
		//uh.removeUser("adrian@gmail.com");
		
		PollHandler ph = new PollHandler();
		ph.setFilePath("WebContent/WEB-INF/testPolls.xml");
		//ph.addPoll(addedPoll);
		//ph.addParticipant(1, addedPart);
		//ph.setOpen(2, false);
		//ph.removePoll(132);
		
		
		
		  JAXBContext jc = JAXBContext.newInstance(Users.class);
		  Marshaller m = jc.createMarshaller();
		  m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		  //FileOutputStream fout = new FileOutputStream("WebContent/WEB-INF/testUsers.xml");
		  //m.marshal(testUsers, System.out);
		  //m.marshal(testUsers, fout);
		  
		  JAXBContext jc2 = JAXBContext.newInstance(Polls.class);
		  Marshaller m2 = jc2.createMarshaller();
		  m2.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		  //FileOutputStream fout2 = new FileOutputStream("WebContent/WEB-INF/testPolls.xml");
		  //m.marshal(testUsers, System.out);
		 //m2.marshal(polls, fout2);
		  
	}
	

}
