<html>
	<head>
		<style type="text/css">
			td
			{
			color:red;
			font-size:15px;
			}
		</style>
	</head>
	<body>
		<%@page import="com.jit.services.CalcIntrAmtService" %>
		<!-- create or replace java bean class -->
		<jsp:useBean id="amtBean" class="com.jit.beans.AmtDetailsBean" scope="session" />
		
		<!-- set values to bean class properties -->
		<jsp:setProperty property="*" name="amtBean"/>
		<center><h1>Details are set....</h1></center><br>
		
		<!-- Call CalcIntrAmtService -->
		<%
		CalcIntrAmtService service=new CalcIntrAmtService();
		service.calcSimpleIntr(amtBean);
		%>
		
		<!-- get values from bean class properties -->
		<table>
		  <tr>
		    <td>Customer Name</td>
		    <td>:<jsp:getProperty property="cname" name="amtBean"/></td>
		  </tr>
		  <tr>
		    <td>Principle Amount</td>
		    <td>:<jsp:getProperty property="pamt" name="amtBean"/></td>
		  </tr>
		  <tr>
		    <td>Rate of Interest</td>
		    <td>:<jsp:getProperty property="rate" name="amtBean"/></td>
		  </tr>
		  <tr>
		    <td>Time</td>
		    <td>:<jsp:getProperty property="time" name="amtBean"/></td>
		  </tr>
		  <tr>
		    <td>Simple Interest</td>
		    <td>:<jsp:getProperty property="sInterest" name="amtBean"/></td>
		  </tr>
		</table>
	</body>
</html>