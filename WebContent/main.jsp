<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<% String sortBy =request.getParameter("sort");
	if(sortBy == null){
		sortBy = "";
	}
%>
<c:import url="xsl/Polls.xsl" var="xslt"/>
<c:set var="xmltext">
<jsp:include page="pollsToXml.jsp">
        <jsp:param name="status" value="open"/>
        <jsp:param name="sort" value="<%=sortBy%>"/>
</jsp:include>
</c:set>


<html>
	 <head>
	 <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="styleSheet.css">
		<title>Display Polls</title>
	</head>
	<body>
	<jsp:include page="NavBar.jsp">
        <jsp:param name="active" value="main"/>
	</jsp:include>
	<div class="container clear-top" style="box-shadow: 0px 0px 5px 2px #888888; background-color: #fff; padding: 18px">
	<!-- Print message START -->
	<%if(session.getAttribute("message")!=null){%>
	<div class="alert alert-<%=session.getAttribute("messageType")%>">
	  	<%=session.getAttribute("message")%>
	</div>
	<%
		session.removeAttribute("message");
		session.removeAttribute("messageType");
	} %>
	<!-- Print message END -->
	<x:transform xml="${xmltext}" xslt="${xslt}"/>
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
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<jsp:include page="footer.jsp"/>
	</body>
	
</html>
