<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bill.jsp</title>
</head>
<body>
	<%
		String pname=null;
		float price=0.0f;
		float billAmt=0.0f;
		int qty=0;
		//read form values
		pname=request.getParameter("tpname");
		price=Float.parseFloat(request.getParameter("tpprice"));
		qty=Integer.parseInt(request.getParameter("tpqty"));
		billAmt=price*qty;
		//check for discount
		if(billAmt>50000)
		{
			%>
			<jsp:forward page="discount.jsp">
				<jsp:param value="<%=billAmt %>" name="billAmount"/>
			</jsp:forward>
			<%
		}
		else
		{
			%>
			<form name="form1">
				<table cellpading="3">
					<caption>Product Details</caption>
					<tr>
						<td>Product Name</td>
						<td><input type="text" name="tpname" value="<%=pname %>" required></td>
					</tr>
					<tr>
						<td>Product Price</td>
						<td><input type="text" name="tpprice" value="<%=price %>" required></td>
					</tr>
					<tr>
						<td>Quantity</td>
						<td><input type="text" name="tpqty" value="<%=qty %>" required></td>
					</tr>
					<tr>
						<td>Bill Amount</td>
						<td><input type="text" name="tbAmt" value="<%=billAmt %>" required></td>
					</tr>
				</table>
			</form>
			<%
		}
	%>
</body>
</html>