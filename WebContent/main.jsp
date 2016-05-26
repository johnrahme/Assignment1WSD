<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<c:import url="xsl/Polls.xsl" var="xslt"/>
<c:set var="xmltext">
<jsp:include page="pollsToXml.jsp">
        <jsp:param name="status" value="open"/>
</jsp:include>
</c:set>

<html>
	 <head>
	 <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	 <link rel="stylesheet" type="text/css" href="styleSheet.css">
		<title>Display Polls</title>
	</head>
	<body>
	<x:transform xml="${xmltext}" xslt="${xslt}"/>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	</body>
</html>
