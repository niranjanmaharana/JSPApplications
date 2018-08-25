<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BOOK DETAILS</title>
<style type="text/css">
th
{
font-size:15px;
color:blue;
}
td
{
font-size:12px;
text-align:center;
}
</style>
</head>
<body>
	<%@page import="java.util.*,com.nt.models.BookBean" %>
	<%
	response.addHeader("Content-Disposition","attachment;filename=niranjan.xls");
	response.setContentType("application/ms-excel");
	%>
	<form action="" name="form1" method="post">
		<center><h1 style="color:red">BOOK CATEGORY : <u><%=request.getAttribute("category") %></u></h1></center>
		<!-- create a table to display all the data -->
		<table style="margin:0px auto; margin-top:100px;" border="1" cellpadding="5">
			<tr>
				<th>BOOK ID</th>
				<th>BOOK NAME</th>
				<th>AUTHOR</th>
				<th>STATUS</th>
			</tr>
			<%
			//create an ArrayList and read the request attribute
			ArrayList<BookBean> arrayList=(ArrayList<BookBean>)request.getAttribute("arrayList");
			//bring them to BookBean class obj
			int i=0;
			boolean flag=false;
			for(i=0;i<arrayList.size();i++)
			{
				flag=true;
				BookBean bean=(BookBean)arrayList.get(i);
				%>
					<tr>
						<td><%=bean.getBook_id() %></td>
						<td><%=bean.getBook_name() %></td>
						<td><%=bean.getAuthor() %></td>
						<td><%=bean.getStatus() %></td>
					</tr>
				<%
				i++;
			}
			if(flag==false)
				out.println("No records found !");
			%>
		</table>
	</form>
</body>
</html>