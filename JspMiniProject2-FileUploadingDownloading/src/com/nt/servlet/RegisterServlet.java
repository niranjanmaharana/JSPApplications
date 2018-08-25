package com.nt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadException;
import javazoom.upload.UploadParameters;

public class RegisterServlet extends HttpServlet
{
	private Connection con=null;
	private PreparedStatement ps=null;
	private int result=0;
	private static final long serialVersionUID = 1L;
	private PrintWriter out=null;
	private MultipartFormDataRequest mreq=null;
	private int eid=0;
	private String ename=null, econtact=null, eadd=null,ephotoloc=null,eresumeloc=null;
	//server file system
	private static final String ephotopath="D:/Java Practice Sets/Advance Java Practice Sets/JspMiniProject2-FileUploadingDownloading/WebContent/Downloads/ePhotos";
	private static final String eresumepath="D:/Java Practice Sets/Advance Java Practice Sets/JspMiniProject2-FileUploadingDownloading/WebContent/Downloads/eResumes";
	
	public RegisterServlet()
	{
		//System.out.println("Constructor");
		try
		{
			//register jdbc drvier
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//establish the connection
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
			//create PreparedStatement obj having the insert SQL Query
			ps=con.prepareStatement("insert into emp_register values(?,?,?,?,?,?)");
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		finally
		{
			
		}
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		//System.out.println("doGet(-,-)");
		//general settings
		out=response.getWriter();
		response.setContentType("text/html");
		try
		{
			//create MultipartFormDataRequest obj to read request parameters
			mreq=new MultipartFormDataRequest(request);
			//read form data
			eid=Integer.parseInt(mreq.getParameter("teid"));
			ename=mreq.getParameter("tename");
			econtact=mreq.getParameter("tecontact");
			eadd=mreq.getParameter("teadd");
			
			//create UploadBean class obj and start uploading
			UploadBean upb=new UploadBean();
			
			//upload photo
			upb.setFolderstore(ephotopath);
			upb.setOverwrite(false);
			upb.store(mreq,"fephotoloc");//photo uploaded
			
			//upload resume
			upb.setFolderstore(eresumepath);
			upb.setOverwrite(false);
			upb.store(mreq,"feresumeloc");//resume uploaded
			
			//store file location into database
			//create Vector pointing to the history of UploadBean
			Vector history=upb.getHistory();
			//create an ArrayList to hold the file names of the uploaded file
			ArrayList<String> fileNames=new ArrayList<String>();
			for(int i=0;i<history.size();i++)
			{
				UploadParameters up=(UploadParameters)history.elementAt(i);
				fileNames.add(up.getFilename());//fileNames contains both photo and resume file name
			}
			if(fileNames.size()!=0)
			{
				//append full path to the file name
				ephotoloc=ephotopath+"/"+fileNames.get(0);//photo path with file name
				eresumeloc=eresumepath+"/"+fileNames.get(1);//resume path with file name
				//out.println("Photo Path : "+ephotoloc);
				//out.println("Resume Path : "+eresumeloc);
				//store employee details to db s/w
				insertEmployeeDetails();
			}
			else
			{	
				out.print("Empty arrayList");
			}
		}
		catch (UploadException e) 
		{
			e.printStackTrace();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		//call doGet(-,-) method
		doGet(request, response);
	}
	
	//insert employee details to db s/w
	public void insertEmployeeDetails()
	{
		System.out.println("insertEmployeeDetails()");
		try
		{
			//set values to query params
			ps.setInt(1,eid);
			ps.setString(2,ename);
			ps.setString(3,econtact);
			ps.setString(4,eadd);
			ps.setString(5,ephotoloc);
			ps.setString(6,eresumeloc);
			//send and execute query
			result=ps.executeUpdate();
			out.println("<div style='text-align:center; margin-top:100px; font-size:20px;'>");
			if(result!=0)
				out.println("<span style='color:black;'>Employee registered.</span>");
			else
				out.println("<span style='color:red;'>Record not inserted !</span>");
			out.println("</div>");
			//add a hyper link
			out.println("<a style='color:red;' href='index.html'>Home</a>");
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	public void destroy()
	{
		try
		{
			if(con!=null)
				con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		try
		{
			if(ps!=null)
				ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}