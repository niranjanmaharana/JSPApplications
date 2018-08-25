package com.nt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nt.models.BookBean;
import com.nt.service.DBConnector;

public class MainServlet extends HttpServlet 
{
	PrintWriter out=null;
	String category=null;
	String source=null;
	ArrayList<BookBean> arrayList=new ArrayList<BookBean>();
	String target=null;
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
	{
		//read request params
		source=request.getParameter("source");
		category=request.getParameter("category");
		//call searchBook(-) method of DBConnector class
		DBConnector dbc=new DBConnector();
		arrayList=dbc.searchBook(category);
		
		//decide target page
		if(source.equals("HTML"))
			target="html_print.jsp";
		else
			target="excel_print.jsp";
		//set values to request attribute
		request.setAttribute("arrayList",arrayList);
		request.setAttribute("category", category);
		
		//forward the request to the target page
		RequestDispatcher rd=null;
		rd=request.getRequestDispatcher(target);
		if(rd!=null)
			rd.forward(request, response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
	{
		//call doGet(-,-) method
		doGet(request,response);
	}
}
