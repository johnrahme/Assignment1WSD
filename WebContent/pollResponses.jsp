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
            <option>
            	<id><%=o.getId()%></id>
                <timeslot>
                    <date><%=o.getTime().getDate()%></date>
                    <time><%=o.getTime().getTime()%></time>
                </timeslot>
                <participants>
                <%for(Participant p: o.getParticipants().getList()){ 
                	if(true){
                %>
                    <participant>
                        <name><%=p.getName() %></name>
                        <available><%=p.isAvailable() %></available>
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
	<jsp:include page="NavBar.jsp">
        <jsp:param name="active" value="main"/>
	</jsp:include>
	<div class="container clear-top" style="box-shadow: 0px 0px 5px 2px #888888; background-color: #fff; padding: 18px">
	<ol class="breadcrumb">
	  <li><a href="index.jsp">Home</a></li>
	  <li><a href="main.jsp">View polls</a></li>
	  <li><a href="pollPage.jsp?id=<%=currentPoll.getId()%>"><%=currentPoll.getTitle()%></a></li>
	  <li class="active">Responses</li>
	</ol>
	<h3>Poll responses for the poll: <%=currentPoll.getTitle()%> </h3>
	<x:transform xml="${xmltext}" xslt="${xslt}"/>
	</div>
	<jsp:include page="footer.jsp"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	</body>
</html>
