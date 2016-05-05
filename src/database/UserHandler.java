package database;

import java.io.FileInputStream;
import java.io.FileOutputStream;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class UserHandler {

	private String filePath;
	private Users users;
	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) throws Exception {
		
		this.filePath = filePath;
		// Create the unmarshaller
		JAXBContext jc = JAXBContext.newInstance(Users.class);
		Unmarshaller u = jc.createUnmarshaller();
		 
		// Now unmarshal the object from the file
		FileInputStream fin = new FileInputStream(filePath);
		users = (Users)u.unmarshal(fin); // This loads the "shop" object
		System.out.println(users.getList().size());
		fin.close();
	}
	public void addUserToXml(User user) throws Exception{
		  users.addUser(user);
		  // Boilerplate code to convert objects to XML...
		  JAXBContext jc = JAXBContext.newInstance(Users.class);
		  Marshaller m = jc.createMarshaller();
		  //filePath = "/Users/johnrahme/test.xml";
		  m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		  FileOutputStream fout = new FileOutputStream(filePath);
		  m.marshal(users, fout);
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	
}
