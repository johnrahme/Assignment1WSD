package login;

import java.io.FileOutputStream;
import java.util.ArrayList;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;


public class Main {

	public static void main(String[] args) throws Exception {
		
		System.out.println("Hello World!");
		Users testUsers = new Users();
		testUsers.setExampleList();
		
		Polls polls = new Polls();
		polls.setExampleList();
		
		ArrayList <User> userList = testUsers.getList();
		ArrayList <Poll> pollList = polls.getList();
		for(int i = 0; i<userList.size(); i++){
			System.out.println(userList.get(i).getEmail());
			System.out.println(userList.get(i).getFirstName());
		}
		
		for(int i = 0; i<pollList.size(); i++){
			System.out.println(pollList.get(i).getLocation());
		}
		  JAXBContext jc = JAXBContext.newInstance(Users.class);
		  Marshaller m = jc.createMarshaller();
		  m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		  FileOutputStream fout = new FileOutputStream("WebContent/WEB-INF/testUsers.xml");
		  //m.marshal(testUsers, System.out);
		  m.marshal(testUsers, fout);
		  
		  JAXBContext jc2 = JAXBContext.newInstance(Polls.class);
		  Marshaller m2 = jc2.createMarshaller();
		  m2.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		  FileOutputStream fout2 = new FileOutputStream("WebContent/WEB-INF/testPolls.xml");
		  //m.marshal(testUsers, System.out);
		  m2.marshal(polls, fout2);
		  
		  

	}
	

}
