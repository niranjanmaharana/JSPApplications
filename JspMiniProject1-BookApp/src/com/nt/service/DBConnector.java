package com.nt.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.nt.models.BookBean;

public class DBConnector
{
	private Connection con=null;
	private ResultSet rs=null;
	private PreparedStatement ps=null;
	private static final String GET_BOOK_DETAILS="SELECT * FROM BOOK_LIBRARY WHERE CATEGORY=?"; 
	
	public DBConnector()
	{
		try 
		{
			//register jdbc driver
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//establish the connection
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}

		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public ArrayList<BookBean> searchBook(String category)
	{
		//create an ArrayList obj to have BookBean class objects
		ArrayList<BookBean> arrayList=new ArrayList<BookBean>();
		//read values from db s/w
		try 
		{
			//create PreparedStatement obj having select sql query
			ps=con.prepareStatement(GET_BOOK_DETAILS);
			//set values to query params
			ps.setString(1,category);
			//execute query
			System.out.println(GET_BOOK_DETAILS);
			rs=ps.executeQuery();
			//process the results
			while(rs.next())
			{
				//add values to the BookBean class obj
				BookBean bb=new BookBean();
				bb.setBook_id(rs.getInt(1));
				bb.setBook_name(rs.getString(3));
				bb.setAuthor(rs.getString(4));
				bb.setStatus(rs.getString(5));
				//add this BookBean class obj to the ArrayList obj
				arrayList.add(bb);
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		finally
		{
			//close ResultSet close
			if(rs!=null)
			{
				try
				{
					rs.close();
				}	
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			//close PreparedStatement close
			if(ps!=null)
			{
				try
				{
					ps.close();
				}	
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			//close Connection obj
			if(con!=null)
			{
				try
				{
					con.close();
				}	
				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
		}
		return arrayList;
	}
}