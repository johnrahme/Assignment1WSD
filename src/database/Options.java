package database;

import java.io.Serializable;
import java.util.ArrayList;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

//An array list with all the option objects
@XmlAccessorType(XmlAccessType.FIELD)
public class Options implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5617279588316737551L;
	@XmlElement(name="option")
	private ArrayList<Option> list = new ArrayList<Option>();

	public Options(){
		  
	}

	public Options(ArrayList<Option> list) {
		super();
		this.list = list;
		updateOptionID();
		
		
	}


	public ArrayList<Option> getList() {
		return list;
	}

	public void setList(ArrayList<Option> list) {		
		this.list = list;
		updateOptionID();
	}
	private void updateOptionID(){
		// When an Options list is set add unique ID:s to all option objects
		for(int i = 0; i<list.size(); i++){
			list.get(i).setId(i);
		}
		
	}
}
