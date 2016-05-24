<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet.css">
<title>Home Page</title>
</head>
<!-- <body background ="meeting.jpg">  -->
<body>

<%User currentUser = (User)session.getAttribute("currentUser");%>

<%if(currentUser != null) {%>
<p align="right">Welcome <%=currentUser.getFirstName()%></p>
<%}else{%>
<div align="right">
<form method="post" action="register.jsp">
<input type="submit" value="Register">
</form>
<form method="post" action="login.jsp">
<input type="submit" value="Login">
</form>
</div>
<%}%>

<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="table1.jpg" alt="table" width="460" height="345">
        <div class="carousel-caption">
          <h3>Meet up</h3>
          <p>The online meeting website</p>
        </div>
      </div>

      <div class="item">
        <img src="bppl.jpg" alt="people" width="460" height="345">
        <div class="carousel-caption">
          <h3>Organisation</h3>
          <p>Organise meetings with your fellow members</p>
        </div>
      </div>
    
      <div class="item">
        <img src="Doom.jpg" alt="" width="460" height="345">
        <div class="carousel-caption">
        <h3>Interaction</h3>
          <p>Interact with each other</p>
        </div>
      </div>

      <div class="item">
        <img src="img_flower2.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">      
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<footer class="container-fluid text-center" ">
	<div class = "col-sm-4">
	<h6>Copyright &copy 2016 Meeting Place</h6>
	</div>
	<div class = "col-sm-2">
	<h6>About Us</h6>
	<h6>Our Vision</h6>
	<h6>History</h6>
	</div>
	<div class = "col-sm-2">
	<h6>Contact Us</h6>
	<h6>Employment Opportunities</h6>
	<h6>Help</h6>
	</div>
	</div>
  </form>
</footer>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
