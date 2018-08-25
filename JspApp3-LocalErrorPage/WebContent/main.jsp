<%@page errorPage="err.jsp"%>

<%
int a=Integer.parseInt("sss");//NumberFormatException
out.println(a);
%>