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
		
		ArrayList <User> list = testUsers.getList();
		for(int i = 0; i<list.size(); i++){
			System.out.println(list.get(i).getProfile().getFirstName());
			System.out.println(list.get(i).getPolls().get(1).getDescription());
		}
		  JAXBContext jc = JAXBContext.newInstance(Users.class);
		  Marshaller m = jc.createMarshaller();
		  m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		  FileOutputStream fout = new FileOutputStream("WebContent/WEB-INF/testUsers.xml");
		  //m.marshal(testUsers, System.out);
		  m.marshal(testUsers, fout);

	}
	

}
