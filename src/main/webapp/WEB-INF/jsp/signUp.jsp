<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>Login Page</title>
<link rel="stylesheet" href="css/bootstrap.min.css">

</head>
<body>
<div class="container">
	
	<br>
	<h2>Login Page</h2> 
		
		
		<form:form class="form-horizontal" action="tryLogin.do"  method="post">
			<fieldset>
			<legend>Member Sign In</legend>
			
			<div class="form-group">
				<label for="inputAccount" class="col-sm-2 control-label">Account:</label>
				<div class="col-sm-10">
					<input type="text" minlength="2" class="form-control" id="inputAccount" name="account"
						placeholder="Account" required autofocus>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="col-sm-2 control-label">Password:</label>
				<div class="col-sm-10">
					<input type="password" minlength="5" class="form-control" id="inputPassword" name="password"
						placeholder="Password" required>
				</div>
			</div>
			
			<div class="form-group">
				<label for="inputUserName" class="col-sm-2 control-label">User Name:</label>
				<div class="col-sm-10">
					<input type="text" minlength="2" class="form-control" id="inputUserName" name="username"
						placeholder="User Name" required>
				</div>
			</div>
			<div class="form-group">
				<label for="inputEmail" class="col-sm-2 control-label">Email:</label>
				<div class="col-sm-10">
					<input type="email" minlength="2" class="form-control" id="inputEmail" name="email"
						placeholder="Email" required>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default" id="btnSignIn">Sign in</button>
				</div>
			</div>
			</fieldset>
		</form:form>
		
		<br>
		
	
</div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
// 		bindEvents();
		
	});
	
// 	function bindEvents(){
// 		$('#btnSignIn').bind({
// 			click:loginByAccountAndPassword
// 		})
// 	}

</script>

</html>
