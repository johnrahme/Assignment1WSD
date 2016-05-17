<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet.css">

<title>Book your meeting</title>
</head>
<body>
<% String filePath = application.getRealPath("WEB-INF/users.xml"); %>
<jsp:useBean id="handler" class="database.UserHandler" scope="application">
    <jsp:setProperty name="handler" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>

<% User currentUser = handler.getUsers().login(request.getParameter("email"), request.getParameter("password"));
if(currentUser == null){%>
<p>Password incorrect. Click <a href="Welcome.jsp">here</a> to try again.</p>
<%}else{%>
<p>Login successful. Welcome <%currentUser.getFirstName();%>.</p>

<ul class="list-inline">

<ul class="dropdown-menu">
   <li><a href="#">Spiderman</a></li>
   <li><a href="#">Captain America</a></li>
   <li><a href="#">Iron Man</a></li>
</ul>


 <li><a href="#">Logout</a></li>
</ul>
<%}%>

<!-- date and time booking -->
<!--https://eonasdan.github.io/bootstrap-datetimepicker/-->
<div class="container">
    <div class="row">
        <div class='col-sm-6'>
            <div class="form-group">
                <div class='input-group date' id='datetimepicker1'>
                    <input type='text' class="form-control" />
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                    </span>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(function () {
                $('#datetimepicker1').datetimepicker();
            });
        </script>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
