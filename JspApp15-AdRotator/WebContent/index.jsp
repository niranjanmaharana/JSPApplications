<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Advertisement Rotator</title>
</head>
<body>
	<!-- create or locate bean class obj -->
	<jsp:useBean id="rotator" class="com.jit.services.RotatorService"/>
	<!-- refresh the page after every  -->
	<%response.setIntHeader("refresh",2); %>
	<!-- call generateNextRandom() on bean class obj to generate random number -->
	<%rotator.generateNextRandom(); %>
	<div style="margin:0px auto; width:300px; height:300px;">
		<a href="<jsp:getProperty property='links' name='rotator'/>" target="_blank">
			<img alt="Graphical Hyper Link" src="<jsp:getProperty property='images' name='rotator'/>" style="width:300px; height:300px;">
		</a>
	</div>
</body>
</html>