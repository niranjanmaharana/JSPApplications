<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Employee Registration</title>
<style type="text/css">
body
{
background-color:#575757;
}
td
{
width:130px;
color:white;
font-family:cambria;
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
<script type="text/javascript">
	function isValid()
	{
		//check emptyness of eid
		if(form1.teid.value=="")
		{
			alert("Fill Employee ID !")
			form1.teid.focus();
			return false;
		}
		//check teid is numeric or not
		else 
		{
			if(form1.teid.value=="")
			{
				alert("Fill valid Employee ID !")
				form1.teid.value=="";
				form1.teid.focus();
				return false;
			}
		}
		//check emptyness of tename
		if(form1.tename.value=="")
		{
			alert("Fill name of the employee !")
			form1.tename.focus();
			return false;
		}
		//check emptyness of teadd
		if(form1.teadd.value=="")
		{
			alert("Fill address !")
			form1.teadd.focus();
			return false;
		}
		//check emptyness of tecontact
		if(form1.tecontact.value=="")
		{
			alert("Fill mobile number !")
			form1.tecontact.focus();
			return false;
		}
		else
		{
			if(isNaN(form1.tecontact.value))
			{
				form1.tecontact.value="";
				form1.tecontact.focus();
				return false;
			}
		}
		return true;
	}
</script>
</head>
	<body>
		<form action="register" name="form1" method="post" enctype="multipart/form-data" onSubmit="return isValid()">
		<table cellpadding="5" align="center">
			<caption>Employee Registration</caption>
			<tr>
				<td>Employee ID</td>
				<td><input type="text" name="teid"/></td>
			</tr>
			<tr>
				<td>Employee Name</td>
				<td><input type="text" name="tename" /></td>
			</tr>
			<tr>
				<td>Contact No.</td>
				<td><input type="text" name="tecontact" maxlength="10"/></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><textarea name="teadd"></textarea>
			</tr>
			<tr>
				<td>Photo</td>
				<td><input type="file" name="fephotoloc"/></td>
			</tr>
			<tr>
				<td>Resume</td>
				<td><input type="file" name="feresumeloc"/></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="submit" value="Register" style="height: 30px; "/></td>
			</tr>
		</table>
	</form>
	</body>
</html>