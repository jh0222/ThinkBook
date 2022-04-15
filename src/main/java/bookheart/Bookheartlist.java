package bookheart;

public class Bookheartlist {
	private String[] book;
	private String booktitle;
	private String userID;
	
	public Bookheartlist() {
		// TODO Auto-generated constructor stub
	}

	public Bookheartlist(String[] book, String booktitle, String userID) {
		super();
		this.book = book;
		this.booktitle = booktitle;
		this.userID = userID;
	}

	public String[] getBook() {
		return book;
	}

	public void setBook(String[] book) {
		this.book = book;
	}

	public String getBooktitle() {
		return booktitle;
	}

	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	
	
}
