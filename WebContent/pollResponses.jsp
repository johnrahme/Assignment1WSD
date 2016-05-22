<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet.css">
<title>Poll responses</title>
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

<!-- Print responses START -->
<h2>Poll responses for the poll: <%=currentPoll.getTitle()%></h2>

<%for(Option o: currentPoll.getOptions().getList()){ %>
	<h4><%=o.getTime().getDate() %> at <%=o.getTime().getTime() %></h4>
	<ul>
	<%for(Participant p : o.getParticipants().getList()){
		if(p.isAvailable()){
	%>
		<li><%=p.getName()%></li>
	<%}} %>
	</ul>
<%} %>
<!-- Print responses END -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>