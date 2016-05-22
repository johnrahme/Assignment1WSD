<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet.css">

<title>Book your meeting</title>
</head>
<body>
<!-- Code for displaying a poll START -->
<jsp:useBean id="pollHand" class="database.PollHandler" scope="application">
</jsp:useBean>
<%
String pollID = request.getParameter("id");
String filePathPoll = application.getRealPath("WEB-INF/polls.xml");
try{
	pollHand.setFilePath(filePathPoll);
}
catch(Exception e){
	out.println(e.toString());
}
Poll currentPoll = null;
if(pollID!=null){
	currentPoll = pollHand.getPolls().getList().get(Integer.parseInt(pollID));
}

%>
<!-- Code for displaying a poll END -->
<% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
<jsp:useBean id="handler" class="database.UserHandler" scope="application">
    <jsp:setProperty name="handler" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<% User currentUser = handler.getUsers().login(request.getParameter("email"), request.getParameter("password"));
if(currentUser == null){%>
<p>Password incorrect. Click <a href="Welcome.jsp">here</a> to try again.</p>
<%}else{%>
<p>Login successful. Welcome <%=currentUser.getFirstName()%>.</p>

<ul class="list-inline">

<ul class="dropdown-menu">
   <li><a href="#"></a></li>
   <li><a href="#"></a></li>
   <li><a href="#"></a></li>
</ul>


 <li><a href="#">Logout</a></li>
</ul>
<%}%>

<!-- Display poll information START -->
<%if(currentPoll != null){ %>
<h2>Information</h2>
Title: 
<%=currentPoll.getTitle() %>
<br>
Desc: 
<%=currentPoll.getDescription() %>
<br>
Location: 
<%=currentPoll.getLocation() %>
<br>
Creator: 
<%=currentPoll.getCreator() %>
<br>
<h2>Register</h2>
<form method = "POST" action = "storeParticipant.jsp">
	<div class = "form-group">
		<label class = "form-label">Name: </label>
		<input class = "form-control" name = "name" id = "name" type = "text">
	</div>
	<%for(Option option: currentPoll.getOptions().getList()){ %>
	<div class = "form-group">
		<label class = "form-label"><%=option.getTime().getDate()%> at <%=option.getTime().getTime()%> </label>
		<input  type = "checkbox" name="<%=option.getId()%>">
	</div>
	<% }%>
	<input type = "hidden" name = "id" value = "<%=pollID%>">
	<button type = "submit" class = "btn btn-success">Register</button>
</form>
<%} %>

<!-- Display poll information END -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
