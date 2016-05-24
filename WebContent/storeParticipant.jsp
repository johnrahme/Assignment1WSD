<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Code for displaying a poll START -->
<jsp:useBean id="pollHand" class="database.PollHandler" scope="application">
</jsp:useBean>
<%
String pollID = request.getParameter("id");
String name = request.getParameter("name");
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

for(Option o: currentPoll.getOptions().getList()){
	Participant participant = null;
	if(request.getParameter(Integer.toString(o.getId()))!=null){
		participant = new Participant(name, true);	
	}
	else{
		participant = new Participant(name, false);
	}
	pollHand.addParticipant(Integer.parseInt(pollID), o.getId(), participant);
}
%>
<!-- Code for displaying a poll END -->
<%
	//Redirect back to response page
    String redirectURL = "pollResponsesXml.jsp?id="+pollID;
    response.sendRedirect(redirectURL);
%>
</body>
</html>