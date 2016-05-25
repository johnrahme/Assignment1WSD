<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
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
<%if(currentPoll == null){
	String redirectURL = "dispAllPollsXml.jsp";
    response.sendRedirect(redirectURL);
}%>
<!-- Code for displaying a poll END -->
<!-- Create the XML START-->
<!-- Create the XML END-->
<c:set var="xmltext">
<options>
	<%for(Option o: currentPoll.getOptions().getList()){ %>
            <option id="<%=o.getId()%>">
                <time>
                    <date><%=o.getTime().getDate()%></date>
                    <time><%=o.getTime().getTime()%></time>
                </time>
                <participants>
                <%for(Participant p: o.getParticipants().getList()){ 
                	if(p.isAvailable()){
                %>
                    <participant>
                        <name><%=p.getName() %></name>
                        <available>true</available>
                    </participant>
                    <%}}%>
                </participants>
            </option>
     <%} %>
  </options>
</c:set>
<!-- Create the XML END-->
<c:import url="xsl/Options.xsl" var="xslt"/>
<html>
	 <head>
	 <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="styleSheet.css">
		<title>Poll Responses</title>
	</head>
	<body>
	<h2>Poll responses for the poll: </h2>
	<x:transform xml="${xmltext}" xslt="${xslt}"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	</body>
</html>