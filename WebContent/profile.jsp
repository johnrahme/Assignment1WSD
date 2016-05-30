<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<%
	String filePath = application.getRealPath("WEB-INF/users.xml");
%>
<jsp:useBean id="handler" class="database.UserHandler"
	scope="application">
	<jsp:setProperty name="handler" property="filePath"
		value="<%=filePath%>" />
</jsp:useBean>
<%
	User currentUser = (User) session.getAttribute("currentUser");
	if (currentUser == null)
		currentUser = handler.getUsers().login(request.getParameter("email"), request.getParameter("password"));
	if (currentUser == null) {
%>
<p>
	Password incorrect. Click <a href="login.jsp">here</a> to try again.
</p>
<%
	} else {
		session.setAttribute("currentUser", currentUser);
%>
<!-- Create the XML START-->
<c:import url="xsl/userProfile.xsl" var="xslt" />
<c:set var="xmlOpen">
	<jsp:include page="pollsToXml.jsp">
		<jsp:param name="user" value="<%=currentUser.getEmail()%>" />
		<jsp:param name="status" value="open" />
	</jsp:include>
</c:set>
<c:set var="xmlClosed">
	<jsp:include page="pollsToXml.jsp">
		<jsp:param name="user" value="<%=currentUser.getEmail()%>" />
		<jsp:param name="status" value="closed" />
	</jsp:include>
</c:set>
<!-- Create the XML END-->
<title>Profile</title>
</head>
<body>
	<jsp:include page="NavBar.jsp">
		<jsp:param name="active" value="profile" />
	</jsp:include>
	<div class="container clear-top"
		style="box-shadow: 0px 0px 5px 2px #888888; background-color: #fff; padding: 18px">

		<h2>
			Welcome
			<%=currentUser.getFirstName()%>!
		</h2>

		<div class="row">
			<div class="col-md-4">
				<div class="panel panel-default">
					<div class="panel-body" style="padding-top: 0">
						<div class="page-header"
							style="margin-top: 7px; margin-bottom: 7px">
							<h4 class="text-center">Profile</h4>
						</div>
						<div id="firstNameP">
							<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							<%=currentUser.getFirstName()%>
							<%=currentUser.getLastName()%><br> <span
								class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
							<%=currentUser.getEmail()%></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-body" style="padding-top: 0">
						<div class="page-header"
							style="margin-top: 7px; margin-bottom: 7px">
							<h4 class="text-center">Polls</h4>
						</div>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist">
							<li role="presentation" class="active"><a href="#open"
								aria-controls="open" role="tab" data-toggle="tab">Open</a></li>
							<li role="presentation"><a href="#closed"
								aria-controls="closed" role="tab" data-toggle="tab">Closed</a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="open">
								<x:transform xml="${xmlOpen}" xslt="${xslt}" />
							</div>
							<div role="tabpanel" class="tab-pane" id="closed">
								<x:transform xml="${xmlClosed}" xslt="${xslt}" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
			}
		%>
	</div>
	<jsp:include page="footer.jsp" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>