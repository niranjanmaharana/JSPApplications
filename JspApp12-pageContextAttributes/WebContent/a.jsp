<form name="form1" method="post" action="b.jsp">
<%!
	String pSName="Pabitra";
	String rSName="Ravi";
	String sSName="Sairita";
	String aSName="Aradhana";
%>
<%
pageContext.setAttribute("pageScopeValue", pSName);
pageContext.setAttribute("requestScopeValue", rSName,pageContext.REQUEST_SCOPE);
pageContext.setAttribute("sessionScopeValue", sSName,pageContext.SESSION_SCOPE);
pageContext.setAttribute("appScopeValue", aSName,pageContext.APPLICATION_SCOPE);
%>
Page Scope Value : <span style="color:red;"><%=pSName %></span><br>
Request Scope Value : <span style="color:red;"><%=rSName %></span><br>
Session Scope Value : <span style="color:red;"><%=sSName %></span><br>
App Scope Value : <span style="color:red;"><%=aSName %></span><br>
<!-- <input type="submit" value="Go to b.jsp"> -->
<jsp:forward page="b.jsp"/>
</form>