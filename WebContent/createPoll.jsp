<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel = "stylesheet" type = "text/css" href = "css/bootstrap-datetimepicker.css">
<link rel="stylesheet" type="text/css" href="styleSheet.css">

<title>Insert title here</title>
</head>
<body>
<div class = "container">
asd
<div class="row">
        <div class='col-sm-5' id = "times">
            <div class = "row time">
        	     <div class = "col-sm-8">
        			<div class="form-group">
		                <div class='input-group date'>
		                    <input type='text' class="form-control" name = 'times[]'/>
		                    <span class="input-group-addon">
		                        <span class="glyphicon glyphicon-calendar"></span>
		                    </span>
		               
		                </div>
	            	</div>
        		</div>
        		<div class = "col-sm-4">
	        		<button class = "btn btn-danger" id = "remove_time">Remove</button>
        		</div>
        	</div>
        </div>
        <div class = "col-sm-2">
        <button class = "btn btn-success" id = "addTime">Add time</button>
        </div>
        <div class = "col-sm-5">
        rest of form goes here
        </div>
    </div>

</div>

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
                	$("#times").append("<div class = 'row time'><div class = 'col-sm-8'><div class='form-group'><div class='input-group date'><input type='text' class='form-control' name = 'times[]'/><span class='input-group-addon'><span class='glyphicon glyphicon-calendar'></span></span></div></div></div><div class = 'col-sm-4'><button class = 'btn btn-danger' id ='remove_time'>Remove</button></div></div>");
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