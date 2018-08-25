<html>
<head>
	<style type="text/css">
	td
	{
		width:630px;
		height:300px;
	}
	</style>
</head>
	<body>
		<table border="1">
			<tr>
				<!-- code inclusion -->
				<td><%@include file="a.jsp" %></td><!-- standard syntax -->
				<td><jsp:directive.include file="b.jsp"/></td><!-- xml syntax -->
			</tr>
			<tr>
				<!-- output inclusion -->
				<td><jsp:include page="c.html" flush="true"/></td><!-- xml syntax -->
				<td><jsp:include page="d.html" flush="true"/></td><!-- xml syntax -->
			</tr>
		</table>
	</body>
</html>