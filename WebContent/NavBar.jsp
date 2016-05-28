<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%User currentUser = (User)session.getAttribute("currentUser");

if(currentUser != null){%>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">The Meeting Room</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="main.jsp">Home</a></li>
	</ul>
	<ul class="nav navbar-nav navbar-right">
	  <a href="logout.jsp" class = "btn btn-default btn-lg" role="button">Log out</a>
    </ul>
  </div>
</nav>
<%}else{%>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">The Meeting Room</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="main.jsp">Home</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
		  <a href="register.jsp" class = "btn btn-default btn-lg" role="button">Register</a>
		  <a href="login.jsp" class = "btn btn-default btn-lg" role="button">Login</a>
	    </ul>
	  </div>
</nav>
<%}%>

</html>