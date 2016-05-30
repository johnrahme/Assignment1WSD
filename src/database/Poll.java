package database;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.xml.bind.annotation.*;


//Class that contains the poll with the child options, this class also has comparators to sort polls
@XmlAccessorType(XmlAccessType.FIELD)
public class Poll implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = -8894367978881973424L;
	@XmlAttribute(name = "id")
	private long id;
	@XmlElement(name = "title")
	private String title;
	@XmlElement(name = "creator")
	private String creator;
	@XmlElement(name = "description")
	private String description;
	@XmlElement(name = "location")
	private String location;
	@XmlElement(name = "createdAt")
	private Time createdAt;
	@XmlElement(name = "open")
	private boolean open;
	@XmlElement(name = "options")
	private Options options;
	
	public Poll(){
		
	}
	
	
	public Poll(long id, String title, String creator, String description, String location, Time createdAt,
			boolean open, Options options) {
		super();
		this.id = id;
		this.title = title;
		this.creator = creator;
		this.description = description;
		this.location = location;
		this.createdAt = createdAt;
		this.open = open;
		this.options = options;
		//For now
		//this.id = System.currentTimeMillis();
	}


	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Time getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Time createdAt) {
		this.createdAt = createdAt;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public Options getOptions() {
		return options;
	}

	public void setOptions(Options options) {
		this.options = options;
	}
	
	//----Comparators START----
	//Compare by title ascending
	public static Comparator<Poll> PollTitleComparator = new Comparator<Poll>() {
		public int compare(Poll p1, Poll p2) {
			   String PollTitle1 = p1.getTitle();
			   String PollTitle2 = p2.getTitle();
			   return PollTitle1.compareTo(PollTitle2);

		}
	};
	//Compare by creator
	public static Comparator<Poll> PollCreatorComparator = new Comparator<Poll>() {
		public int compare(Poll p1, Poll p2) {
			   String PollTitle1 = p1.getCreator();
			   String PollTitle2 = p2.getCreator();
			   return PollTitle1.compareTo(PollTitle2);

		}
	};
	//Compare by creator
		public static Comparator<Poll> PollCreationComparator = new Comparator<Poll>() {
			public int compare(Poll p1, Poll p2) {
				   SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy/HH:mm");
				   Date date1 = null;
				   Date date2 = null;
				try {
					date1 = formatter.parse(p1.getCreatedAt().getDate()+"/"+p1.getCreatedAt().getTime());
					date2 = formatter.parse(p2.getCreatedAt().getDate()+"/"+p2.getCreatedAt().getTime());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(date1!=null&&date2!=null){
					return date2.compareTo(date1);
				}
				return -1;
				   

			}
		};
	//----Comparators END----
	
}
