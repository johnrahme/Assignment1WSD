<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet.css">
<title>Login</title>
</head>
<body>
<div class="container clear-top" style="box-shadow: 0px 0px 5px 2px #888888; background-color: #fff; padding: 18px">
<h1 align="center">Login</h1>

<% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
<jsp:useBean id="handler" class="database.UserHandler" scope="application">
    <jsp:setProperty name="handler" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<% User newUser = new User(request.getParameter("firstName"), request.getParameter("lastName"), request.getParameter("email"), request.getParameter("password"));
if(newUser.getEmail() != null){
handler.getUsers().addUser(newUser);
%>
<p>Registration complete. Please login.</p>
<%}%>

<form action="profile.jsp" method="POST">
<table align="center" cellpadding="90">

<div class = "row">
	<div class = "col-md-4">
	</div>
	<div class = "col-md-4">
	<div class = "form-group">
        		<label for = "title" class = "control-label">Email:</label>
        		<input class = "form-control" type="text" name="email">
	</div>
	</div>
</div>

<div class = "row">
	<div class = "col-md-4">
	</div>
	<div class = "col-md-4">
		<div class = "form-group">
        		<label for = "title" class = "control-label">Password: </label>
        		<input class = "form-control" type="password" name="password">
		</div>
	</div>
</div>

<div class = "row">
	<div class = "col-md-4">
	</div>
	<div class = "col-md-4">
		<input class = "btn btn-primary" type="submit" value="Login">
	</div>
</div>


</table>
</form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>