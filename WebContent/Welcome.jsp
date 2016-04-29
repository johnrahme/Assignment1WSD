<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styleSheet.css">
<title>Home Page</title>
</head>
<body background ="meeting.jpg">

<%
// code to go here

%>
<form action="loginAction.jsp" method="POST">
<table class = "login" align  = "right">
<tr><td>Email</td><td><input type="text" name="email"></td>
<td>Password</td><td><input type="text" name="password"></td>
<td><input type="submit" value="Login"></td></tr>
</table>

<div class = "text">
<p>Welcome <%//to person logged in %></p>
</div>




</form>

</body>
</html>