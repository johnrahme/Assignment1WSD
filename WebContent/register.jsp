<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="styleSheet.css">
<title>Register</title>
</head>
<body>
<jsp:include page="NavBar.jsp">
        <jsp:param name="active" value="home"/>
</jsp:include>
<div class="container clear-top" style="box-shadow: 0px 0px 5px 2px #888888; background-color: #fff; padding: 18px">
	<form method="post" action="login.jsp">
	<h1 align="center">Register</h1>
		<div class = "row">
			<div class = "col-md-4">
			</div>
			<div class = "col-md-4">
				<div class = "form-group">
	        		<label for = "title" class = "control-label">First Name</label>
	        		<input class = "form-control" type="text" name="firstName" required>
				</div>
			</div>
		</div>
		<div class = "row">
			<div class = "col-md-4">
			</div>
			<div class = "col-md-4">
				<div class = "form-group">
	        		<label for = "lastName" class = "control-label">Last Name</label>
	        		<input class = "form-control" type="text" name="lastName" required>
				</div>
			</div>
		</div>
		<div class = "row">
			<div class = "col-md-4">
			</div>
			<div class = "col-md-4">
				<div class = "form-group">
	        		<label for = "email" class = "control-label">Email</label>
	        		<input class = "form-control" type="email" name="email" required>
				</div>
			</div>
		</div>
		<div class = "row">
			<div class = "col-md-4">
			</div>
			<div class = "col-md-4">
				<div class = "form-group">
	        		<label for = "email" class = "control-label">Password</label>
	        		<input class = "form-control" type="password" name="password" required>
				</div>
			</div>
		</div>
		<div class = "row">
			<div class = "col-md-4">
			</div>
			<div class = "col-md-4">
				<div class = "form-group">
	        		<button class = "btn btn-success" type = "submit">Register</button>
				</div>
			</div>
		</div>
	</form>
</div>
<jsp:include page="footer.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>