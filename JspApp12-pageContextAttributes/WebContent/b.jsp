Page Scope Value : <span style="color:red;"><%=pageContext.findAttribute("pageScopeValue") %></span><br>
Request Scope Value : <span style="color:red;"><%=request.getParameter("requestScopeValue") %></span><br>
Session Scope Value : <span style="color:red;"><%=pageContext.findAttribute("sessionScopeValue") %></span><br>
App Scope Value : <span style="color:red;"><%=pageContext.findAttribute("appScopeValue") %></span><br> 
<form name="form1" action="c.jsp">
	<input type="submit" value="Go to c.jsp">
</form>