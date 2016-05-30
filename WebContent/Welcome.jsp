<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- All pages include bootstrap library -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet.css">
<style>
.carousel-inner img {
  margin: auto;
}
p{
	color:black;
	text-shadow: 1px 1px #FFFFFF;
}
h3{
	color:black;
	text-shadow: 2px 2px #FFFFFF;
}
</style>
<title>Home Page</title>
</head>
<body>
<!-- Display Nav Bar -->
<jsp:include page="NavBar.jsp">
        <jsp:param name="active" value="home"/>
</jsp:include>
<div class="container clear-top" style="box-shadow: 0px 0px 5px 2px #888888; background-color: #fff; padding: 18px">
<%User currentUser = (User)session.getAttribute("currentUser");%>
<div class = "row">
	<div class = "col-md-2">
	</div>
	<div class = "col-md-8">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
      <!-- image taken from http://previews.123rf.com/images/coramax/coramax1209/coramax120900193/15298016-3d-people-men-person-at-conference-table-Business-meeting-Stock-Photo.jpg(resized) -->
        <img src="table.jpg" alt="table">
        <div class="carousel-caption">
          <h3>Meet up</h3>
          <p>The online meeting website</p>
        </div>
      </div>

      <div class="item">
        <img src="people.jpg" alt="people dicussion"">
        <!-- image taken from http://meetingadvantage.com/wp-content/uploads/2015/04/meeting-planning-1.jpg(resized) -->
        <div class="carousel-caption">
          <h3>Organisation</h3>
          <p>Organise meetings with your fellow members</p>
        </div>
      </div>
    
      <div class="item">
        <img src="interaction.jpg" alt="Interaction">
        <!-- image taken from https://thesocialtrainer.files.wordpress.com/2012/12/social-interaction.jpg (resized) -->
        <div class="carousel-caption">
        <h3>Interaction</h3>
          <p>Interact with each other</p>
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
	</div>
</div>
	
</div>
<!-- Display footer -->
<jsp:include page="footer.jsp"/>
<!-- All pages include jquery and minified bootstrap libraries-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
