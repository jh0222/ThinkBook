package com.library;

public class Book {
	private String booktitle;
	private String author;
	private String libname;
	private String callno;
	private String publisher;
	private String pubyear;
	
	public Book() {
		// TODO Auto-generated constructor stub
	}

	public Book(String booktitle, String author, String libname, String callno, String publisher, String pubyear) {
		super();
		this.booktitle = booktitle;
		this.author = author;
		this.libname = libname;
		this.callno = callno;
		this.publisher = publisher;
		this.pubyear = pubyear;
	}

	public String getBooktitle() {
		return booktitle;
	}

	public void setBooktitle(String booktitle) {
		this.booktitle = booktitle;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getLibname() {
		return libname;
	}

	public void setLibname(String libname) {
		this.libname = libname;
	}

	public String getCallno() {
		return callno;
	}

	public void setCallno(String callno) {
		this.callno = callno;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPubyear() {
		return pubyear;
	}

	public void setPubyear(String pubyear) {
		this.pubyear = pubyear;
	}

	
	
}
