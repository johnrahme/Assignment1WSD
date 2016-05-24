<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile</title>
</head>
<body>
<% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
<jsp:useBean id="handler" class="database.UserHandler" scope="application">
    <jsp:setProperty name="handler" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<% User currentUser = handler.getUsers().login(request.getParameter("email"), request.getParameter("password"));
if(currentUser == null){%>
<p>Password incorrect. Click <a href="login.jsp">here</a> to try again.</p>
<%}else{
session.setAttribute("currentUser", currentUser);%>
<p>Welcome <%=currentUser.getFirstName()%>.</p>
<%}%>
<a href="logout.jsp">Logout</a>
</body>
</html>