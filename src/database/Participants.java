package database;
import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

//List containing all the participants
@XmlAccessorType(XmlAccessType.FIELD)
public class Participants implements Serializable {

	@XmlElement(name="participant")
	private ArrayList<Participant> list = new ArrayList<Participant>();

	public Participants(){
		  
	}
	
	public Participants(ArrayList<Participant> list) {
		super();
		this.list = list;
	}

	public ArrayList<Participant> getList() {
		return list;
	}

	public void setList(ArrayList<Participant> list) {
		this.list = list;
	}
	
}