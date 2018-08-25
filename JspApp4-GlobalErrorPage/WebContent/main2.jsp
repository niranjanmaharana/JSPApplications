<%@page%>
<%
int a=10/0;//ArithmeticException
out.println(a);
%>