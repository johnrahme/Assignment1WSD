<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!-- Code for displaying a poll START -->
<jsp:useBean id="pollHand" class="database.PollHandler" scope="application">
</jsp:useBean>
<%
String pollID = request.getParameter("id");
Poll currentPoll = null;
if(pollID!=null){
	String filePathPoll = application.getRealPath("WEB-INF/polls.xml");
	try{
		pollHand.setFilePath(filePathPoll);
	}
	catch(Exception e){
		out.println(e.toString());
	}
	
	
	currentPoll = pollHand.getPoll(Integer.parseInt(pollID));
}
if(currentPoll != null){

%>
<!-- Code for displaying a poll END -->
<!-- Create the XML START-->
<!-- Create the XML END-->
<c:set var="xmltext">
<poll id="<%=currentPoll.getId()%>">
        <title><%=currentPoll.getTitle()%></title>
        <creator><%=currentPoll.getCreator()%></creator>
        <description><%=currentPoll.getDescription()%></description>
        <location><%=currentPoll.getLocation()%></location>
        <createdAt>
            <date><%=currentPoll.getCreatedAt().getDate()%></date>
            <time><%=currentPoll.getCreatedAt().getTime()%></time>
        </createdAt>
        <open><%=currentPoll.isOpen()%></open>
        <options>
        <%for(Option o:currentPoll.getOptions().getList()){ %>
            <option>
            	<id><%=o.getId()%></id>
                <timeslot>
                    <date><%=o.getTime().getDate()%></date>
                    <time><%=o.getTime().getTime()%></time>
                </timeslot>
                <participants>
                	<%for(Participant p:o.getParticipants().getList()){ %>
                    <participant>
                        <name><%=p.getName() %></name>
                        <available><%=p.isAvailable()%></available>
                    </participant>
                    <%} %>
                </participants>
            </option>
        <%} %>
        </options>
    </poll>
</c:set>
<!-- Create the XML END-->
<c:import url="xsl/Poll.xsl" var="xslt"/>
<html>
	 <head>
	 <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="styleSheet.css">
		<title>Display Poll</title>
	</head>
	<body>
	<jsp:include page="NavBar.jsp">
        <jsp:param name="active" value="main"/>
	</jsp:include>
	<div class="container clear-top" style="box-shadow: 0px 0px 5px 2px #888888; background-color: #fff; padding: 18px">
	
	<ol class="breadcrumb">
	  <li><a href="index.jsp">Home</a></li>
	  <li><a href="main.jsp">View polls</a></li>
	  <li class="active"><%=currentPoll.getTitle()%></li>
	</ol>
	
	<!-- Content of page goes here -->
	<x:transform xml="${xmltext}" xslt="${xslt}"/>
	<!-- Content of page ends here -->
	</div>
	<jsp:include page="footer.jsp"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	</body>
</html>
<% }
else {
	String redirectURL = "main.jsp";
    response.sendRedirect(redirectURL);
}%>
