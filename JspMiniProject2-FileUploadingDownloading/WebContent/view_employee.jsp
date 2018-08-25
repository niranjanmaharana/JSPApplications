<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Details</title>
<style type="text/css">
body
{
background-color:#575757;
}
a
{
color:yellow;
font-size:15px;
}
td
{
width:130px;
color:white;
font-family:cambria;
text-align:center;
}
input
{
height:20px;
width:200px;
}
textarea
{
width:200px;
height:50px;
overflow:auto;
}
table
{
margin-top:100px;
}
caption
{
font-size:24px;
color:white;
font-weight:bold;
border-bottom:1px solid red;
padding:5px;
}
</style>
</head>
<body>
	<form action="download.jsp" name="form1" method="post">
		<%@page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException" %>
		<%!
		private Connection con=null;
		private PreparedStatement ps=null;
		private ResultSet rs=null;
		private int eid=0;
		private String ename=null, econtact=null, eadd=null,ephotoloc=null,eresumeloc=null;
		%>
		<%!
		public void jspInit()
		{
			initConnection();
		}
		public void initConnection()
		{
			System.out.println("initConnection");
			try
			{
				//register jdbc drvier
				Class.forName("oracle.jdbc.driver.OracleDriver");
				//establish the connection
				con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
				//create PreparedStatement obj having the insert SQL Query
				ps=con.prepareStatement("SELECT * FROM EMP_REGISTER");
			}
			catch (ClassNotFoundException e)
			{
				e.printStackTrace();
			}
			catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}
		%>
		
		<%
		//request processing logic
		try
		{
			//send and execute query
			rs=ps.executeQuery();
			//process the result
			%>
			<!-- create a table -->
			<table>
				<caption>All Employee Details</caption>
				<!-- create one row with table headings -->
				<tr>
					<th>Employee ID</th>
					<th>Employee Name</th>
					<th>Contact No.</th>
					<th>Address</th>
					<th>Resume</th>
					<th>Photo</th>
				</tr>
				<!-- create rows with table data -->
				<%
				while(rs.next())
				{
					eid=rs.getInt(1);
					ename=rs.getString(2);
					econtact=rs.getString(3);
					eadd=rs.getString(4);
					ephotoloc=rs.getString(5);
					eresumeloc=rs.getString(6);
					
					//display each row
					%>
					<tr>
						<td width="100"><%=eid %></td>
						<td><%=ename %></td>
						<td width="150"><%=econtact %></td>
						<td><%=eadd %></td>
						<td><a href="download.jsp?resumeid=<%=eid %>"> Download here</a></td>
						<td>
							<center>
								<img src="<%=ephotoloc %>" width="100" height="100" alt=""/><br>
								<a href="download.jsp?photoid=<%=eid %>">Download here</a>
							</center>
						</td>
					</tr>
					<%
				}
				%>
			</table>
			<%
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
		<!-- create an hyper link -->
		<br>
		<span><a style="margin:0px auto; color:red;" href="">Home</a></span>
	</form>
</body>
</html>