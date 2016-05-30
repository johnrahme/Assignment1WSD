package database;

import java.io.FileInputStream;
import java.io.FileOutputStream;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;


//This class handles all the convertion to and from xml for the users class
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
	public void writeToXml() throws Exception{
		  // Boilerplate code to convert objects to XML...
		  JAXBContext jc = JAXBContext.newInstance(Users.class);
		  Marshaller m = jc.createMarshaller();
		  //filePath = "/Users/johnrahme/test.xml";
		  m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
		  FileOutputStream fout = new FileOutputStream(filePath);
		  m.marshal(users, fout);
	}
	//Find the id the specific user has in the array by providing the email
	public int findUserByEmail(String email){
		for(int i = 0; i < users.getList().size(); i++){
			if(users.getList().get(i).getEmail().equals(email)){
				return i;
			}
		}
		return -1;
	}
	// Add user and update xml
	public void addUser(User user) throws Exception{
		  users.addUser(user);
		  writeToXml();
	}
	//remove user and update xml
	public void removeUser(String email) throws Exception{
		  int id = findUserByEmail(email);
		  if(id >-1){
			  users.getList().remove(id);
			  writeToXml();
		  }
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	
}
