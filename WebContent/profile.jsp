<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>Profile</title>
</head>
<body>
<% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
<jsp:useBean id="handler" class="database.UserHandler" scope="application">
    <jsp:setProperty name="handler" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%User currentUser = (User)session.getAttribute("currentUser");
if(currentUser == null)
   currentUser = handler.getUsers().login(request.getParameter("email"), request.getParameter("password"));
if(currentUser == null){%>
<p>Password incorrect. Click <a href="login.jsp">here</a> to try again.</p>
<%}else{
session.setAttribute("currentUser", currentUser);%>
<!-- Create the XML START-->
<c:import url="xsl/userProfile.xsl" var="xslt"/>
<c:set var="xmlOpen">
<jsp:include page="pollsToXml.jsp">
        <jsp:param name="user" value="<%=currentUser.getEmail()%>"/>
        <jsp:param name="status" value="open"/>
</jsp:include>
</c:set>
<c:set var="xmlClosed">
<jsp:include page="pollsToXml.jsp">
        <jsp:param name="user" value="<%=currentUser.getEmail()%>"/>
        <jsp:param name="status" value="closed"/>
</jsp:include>
</c:set>
<!-- Create the XML END-->

<p>Welcome <%=currentUser.getFirstName()%>.</p>

<h2>Open polls</h2>
<x:transform xml="${xmlOpen}" xslt="${xslt}"/>
<h2>Closed polls</h2>
<x:transform xml="${xmlClosed}" xslt="${xslt}"/>

<a href="logout.jsp">Logout</a>
<%}%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>