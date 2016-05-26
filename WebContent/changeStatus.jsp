<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<jsp:useBean id="pollHand" class="database.PollHandler" scope="application">
</jsp:useBean>
<%
String id = request.getParameter("id");
String status = request.getParameter("status");
String filePath = application.getRealPath("WEB-INF/polls.xml");
try{
	pollHand.setFilePath(filePath);
}
catch(Exception e){
	out.println(e.toString());
}
if(status.equals("true")){
	pollHand.setOpen(Integer.valueOf(id), false);
}
else if(status.equals("false")){
	pollHand.setOpen(Integer.valueOf(id), true);
}

	//Redirect back to response page
    String redirectURL = "profile.jsp";
    response.sendRedirect(redirectURL);
%>