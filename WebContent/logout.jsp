<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logout</title>
</head>
<body>
	<% session.removeAttribute("currentUser");%>
	<%
	//Redirect back to main page
	session.setAttribute("message", "You have been logged out");
	session.setAttribute("messageType", "info");
    String redirectURL = "main.jsp";
    response.sendRedirect(redirectURL);
	%>
</body>
</html>