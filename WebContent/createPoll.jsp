<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "database.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel = "stylesheet" type = "text/css" href = "css/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css" href="styleSheet.css">


<%User currentUser = (User)session.getAttribute("currentUser");
if(currentUser == null){
	String redirectURL = "login.jsp";
    response.sendRedirect(redirectURL);
}

%>

<style>
.spaceButton {
    margin-bottom: 10px; 
}
</style>
<title>Create poll</title>
</head>
<body background = "meeting.jpg">
<jsp:include page="NavBar.jsp">
        <jsp:param name="active" value="create"/>
</jsp:include>
<div class="container clear-top" style="box-shadow: 0px 0px 5px 2px #888888; background-color: #fff; padding: 18px">

<ol class="breadcrumb">
  <li><a href="index.jsp">Home</a></li>
  <li class="active">Create poll</li>
</ol>
<h2>Add a poll!</h2>
<div class="row">
	<form method = "POST" action = "storePoll.jsp">
	<div class = "col-sm-7">
        	<div class = "form-group">
        		<label for = "title" class = "control-label">Title: </label>
        		<input type = "text" class = "form-control" name = "title" id = "title" required>
        	</div>
        	<div class = "form-group">
        		<label for = "description" class = "control-label">Description: </label>
        		<textarea class = "form-control" name = "description" id = "description" required></textarea>
        	</div>
        	<div class = "form-group">
        		<label for = "location" class = "control-label">Location: </label>
        		<input class = "form-control" name = "location" id = "location" required></input>
        	</div>
        	<div class = "form-group">
        		<label for = "open" class = "control-label">Open: </label>
        		<input type = "checkbox" name = "open" id = "open">
        	</div>
        	<button class = "btn btn-primary spaceButton" type = "submit">Submit</button>
        </div>
		<div class = 'col-sm-5'>
		    <div id = "times">
		        <label for = "times[]" class = "control-label">Times: </label>
		            <div class = "row time">
		        	     <div class = "col-sm-8">
		        			<div class="form-group">
				                <div class='input-group date'>
				                    <input type='text' class="form-control" name = 'times' required/>
				                    <span class="input-group-addon">
				                        <span class="glyphicon glyphicon-calendar"></span>
				                    </span>
				               
				                </div>
			            	</div>
		        		</div>
		        	</div>
		        </div>
		        <button class = "btn btn-success spaceButton" id = "addTime">Add time</button>
	    </div>
    </form>
</div>

</div>
<jsp:include page="footer.jsp"/>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src = "js/moment.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src = "js/bootstrap-datetimepicker.min.js"></script>

        <script type="text/javascript">
        //This script checks adds and removes datetimepicker elements   
        function updateDP(){
        	$('.input-group.date').each(function(){
            	$(this).datetimepicker({
                    format: 'DD/MM/YYYY HH:mm',
                });
            });
        }
            $(document).ready(function(){
            	$('#addTime').click(function(e){
                    e.preventDefault();
                	$("#times").append("<div class = 'row time'><div class = 'col-sm-8'><div class='form-group'><div class='input-group date'><input type='text' class='form-control' name = 'times' required/><span class='input-group-addon'><span class='glyphicon glyphicon-calendar'></span></span></div></div></div><div class = 'col-sm-4'><button class = 'btn btn-danger spaceButton' id ='remove_time'>Remove</button></div></div>");
                	updateDP();
            	});
	            $("#times").on("click","#remove_time", function(e){ //user click on remove text
	                e.preventDefault();
	                $(this).parents('div.time').remove();
	                //x--;
	            });
	            updateDP();
            });
            
        </script>
 
</body>
</html>