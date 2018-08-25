package com.nt.models;

public class BookBean 
{
	private int book_id=0;
	private String book_name=null;
	private String author=null;
	private String status=null;
	
	public int getBook_id() 
	{
		return book_id;
	}
	
	public void setBook_id(int book_id) 
	{
		this.book_id = book_id;
	}
	
	public String getBook_name() 
	{
		return book_name;
	}
	
	public void setBook_name(String book_name) 
	{
		this.book_name = book_name;
	}
	
	public String getAuthor() 
	{
		return author;
	}
	
	public void setAuthor(String author) 
	{
		this.author = author;
	}
	
	public String getStatus() 
	{
		return status;
	}
	
	public void setStatus(String status) 
	{
		this.status = status;
	}
}