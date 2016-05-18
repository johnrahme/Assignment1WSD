<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet.css">
<title>Home Page</title>
</head>
<!-- <body background ="meeting.jpg">  -->


<%
// code to go here

%>
<form action="pollPage.jsp" method="POST">
<table class = "login" align  = "right" cellpadding="10">
<tr><td>Email </td><td><input type="text" name="email"></td>
<td>Password </td><td><input type="password" name="password"></td>
<td><input type="submit" value="Login"></td>
<td></td></tr>

</table>

<div class = "text">
<p>Welcome <%//to person logged in %></p>


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
        <img src="Doom.jpg" alt="doom" width="460" height="345">
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
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
