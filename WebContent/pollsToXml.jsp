<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "database.*"%>
    
<jsp:useBean id="pollHand" class="database.PollHandler" scope="application">
</jsp:useBean>
<%
String filePath = application.getRealPath("WEB-INF/polls.xml");
try{
	pollHand.setFilePath(filePath);
}
catch(Exception e){
	out.println(e.toString());
}

String email = request.getParameter("user");
String status = request.getParameter("status");
String sortBy = request.getParameter("sort");

Polls polls = pollHand.getPolls();
if(email != null){
	polls = pollHand.getPolls(email);
}
if(status.equals("open")){
	polls.filterOpenClosed(true);
}
else if(status.equals("closed")){
	polls.filterOpenClosed(false);
}
if(sortBy != null){
	pollHand.getPolls().sortBy(sortBy);
}

%>

<polls>
<%for(Poll currentPoll:polls.getList()){ %>
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
 <% }%>
 </polls>