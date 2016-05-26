<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<c:import url="WEB-INF/polls.xml" var= "xmltext"/>
<c:import url="xsl/userProfile.xsl" var="xslt"/>

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
<h1><%=currentUser.getFirstName()%> <%=currentUser.getLastName()%></h1>
<p>Email: <%=currentUser.getEmail()%></p>
<br>

<x:transform xml="${xmltext}" xslt="${xslt}"/>
<a href="logout.jsp">Logout</a>
<%}%>
</body>
</html>