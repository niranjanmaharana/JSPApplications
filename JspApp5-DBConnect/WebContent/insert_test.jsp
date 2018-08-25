<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Result</title>
</head>
	<body>
		<%@page import="java.sql.*"%>
		<%!
		Connection con=null;
		ResultSet rs=null;
		PreparedStatement ps1=null,ps2=null;
		int sno=0;
		String sname=null,sadd=null;
		%>
		<%!
			public void jspInit()
			{
				try
				{
					//register jdbc driver
					Class.forName("oracle.jdbc.driver.OracleDriver");
					//establish the connection
					con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
					//create PreparedStatement obj having the sql select query
					ps1=con.prepareStatement("insert into student values(?,?,?)");
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
		%>
		<%
		try
		{
			//read request params
			sno=Integer.parseInt(request.getParameter("tsno"));
			sname=request.getParameter("tsname");
			sadd=request.getParameter("tsadd");
			//set values to query params
			ps1.setInt(1, sno);
			ps1.setString(2, sname);
			ps1.setString(3, sadd);
			//execute query
			out.println("<center><h1 style='color:red'>");
			int result=ps1.executeUpdate();
			if(result!=0)
				out.print("Record inserted.");
			else
				out.print("Record not inserted.");
			out.println("</center></h1>");
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		%>
	</body>
</html>