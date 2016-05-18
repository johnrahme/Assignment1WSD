<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Store poll</title>
</head>
<body>
<%
String title =  request.getParameter("title");
String description =  request.getParameter("description");
String location =  request.getParameter("location");
String [] times = request.getParameterValues("times");
boolean open = false;
if(request.getParameter("open")!=null){
	open = true;
}


String filePath = application.getRealPath("WEB-INF/polls.xml");

%>
<jsp:useBean id="pollHandler" class="database.PollHandler" scope="application">
</jsp:useBean>

<%
try{
	pollHandler.setFilePath(filePath);
}
catch(Exception e){
	out.println(e.toString());
}
Poll p = pollHandler.getPollFromInput(title, "Creator not set", description, location, open, times);
pollHandler.addPoll(p);

%>
<h1>Poll has been saved!</h1>
</body>
</html>