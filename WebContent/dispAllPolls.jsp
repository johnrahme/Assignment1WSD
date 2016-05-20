<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet.css">
<title>Insert title here</title>
</head>
<body>
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

pollHand.getPolls().filterOpenClosed(true);
String sortBy = request.getParameter("sort");
if(sortBy != null){
	pollHand.getPolls().sortBy(sortBy);
}

%>
<form action = "pollPage.jsp" method="GET">
	<table class="table table-striped table-bordered">
		<thead><tr><th>Title</th><th>Creator</th><th>Created at</th><th>View Details</th>
		</thead>
		<tbody>
		<%for(Poll p:pollHand.getPolls().getList()){ %>
			<tr class="searchable">
				<td><%=p.getTitle()%></td><td><%=p.getCreator() %></td><td><%=p.getCreatedAt().getDate()+" at "+p.getCreatedAt().getTime()%></td><td><button type = "submit" id = "viewDetails"class = "btn btn-primary" onclick="return setId(<%=p.getId()%>)">View</button></td>
			</tr>
			<%} %>
		</tbody>
	</table>
	<input id="idInput" type = "hidden" value = "0" name = "id">
</form>
<form method = "GET">
	<div class = "form-group">
		<label for= "sort" class = "form-label">Sort by</label>
		<select name = "sort">
			<option value = "Title">Title</option>
			<option value = "Creator">Creator</option>
			<option value = "Creation">Creation date</option>
		</select>
	</div>
	<button class = "btn btn-primary" type = "submit">Sort</button>
</form>

<script>
function setId(id){
	$("#idInput").val(id);
	
	return true;
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>