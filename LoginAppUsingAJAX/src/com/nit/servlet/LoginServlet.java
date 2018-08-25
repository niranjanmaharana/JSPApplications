package com.nit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/logurl")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=null;
		String userName=null,password=null;
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement ps=null;
		
		//general settings
		out=response.getWriter();
		response.setContentType("text/html");
		//read request parameter
		userName=request.getParameter("username");
		password=request.getParameter("password");
		
		//jdbc code
		try
		{
			//register jdbc driver
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//establish the connection
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
			//create PreparedStatement obj having the sql select query
			ps=con.prepareStatement("SELECT * FROM LOGINTAB WHERE USERNAME = ? AND PASSWORD = ?");
			//set values to query params
			ps.setString(1, userName);
			ps.setString(2, password);
			//send and execute query
			rs=ps.executeQuery();
			if(rs.next())
				out.println("Valid Credential");
			else
				out.println("Invalid Credential");
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
}