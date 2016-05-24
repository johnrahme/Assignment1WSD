<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
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
<table align="center" cellpadding="10">
<tr><td>Email </td><td><input type="text" name="email"></td></tr>
<tr><td>Password </td><td><input type="password" name="password"></td></tr>
<tr><td></td><td><input type="submit" value="Login"></td></tr>

</table>
</form>
</body>
</html>