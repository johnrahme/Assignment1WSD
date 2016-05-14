package database;

import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name="users")
@XmlAccessorType(XmlAccessType.FIELD)
public class Users implements Serializable {

	@XmlElement(name="user")
	private ArrayList<User> list = new ArrayList<User>();

	public Users(){
		  
	}
	
	public void setExampleList(){
		
		User u1 = new User("John", "Rahme", "john.rahme.se@gmail.com", "password");
		User u2 = new User("John", "Rahme", "john.rahme.se@gmail.com", "password");
		list.add(u1);
		list.add(u2);
	}
	
	public ArrayList<User> getList() {
		return list;
	}

	public void setList(ArrayList<User> list) {
		this.list = list;
	}
    public void addUser(User user) {
        list.add(user);
    }
    public void removeUser(User user) {
        list.remove(user);
    }
    //Return a user with the provided email and password
    public User login(String email, String password) {
        // For each user in the list...
        for (User user : list) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password))
                return user; // Login correct. Return this user.
        }
        return null; // Login incorrect. Return null.
    }
}
