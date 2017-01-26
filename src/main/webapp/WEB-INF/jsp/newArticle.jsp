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
	<input class="btn btn-default" type="button" value="回登入頁面" onclick="location.href='login.do'">
	<input class="btn btn-default" type="button" value="全文導覽" onclick="location.href='articleListController.do'">
	<br>
		
		<form:form class="form-horizontal">
			<fieldset>
			<legend>新增文章</legend>
			<div class="form-group">
				<label  class="col-sm-2 control-label">標題</label>
				<div class="col-sm-10">
					<input minlength="5" maxlength="100" class="form-control" id="inputTitle" 
						placeholder="標題" required autofocus>
				</div>
			</div>
			<div class="form-group">
				<label for="inputArticle1" class="col-sm-2 control-label">標題</label>
				<div class="col-sm-10">
					<textarea id='inputArticle' minlength="5" maxlength="250" class="form-control" rows="5"  placeholder="輸入回覆文章" required>
			
					</textarea>
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input class="btn btn-default btnClear" type="button" value='清除'>
					<input class="btn btn-default btnSubmit" type="button" value='發送'>
<!-- 					<button type="submit" class="btn btn-default btnSubmit" id="btnSubmit">發送</button> -->
				</div>
			</div>
			</fieldset>
		</form:form>
		<br>
		
		<form method="POST" action="uploadFile.do" enctype="multipart/form-data">
		File to upload: <input type="file" name="file">
 
		Name: <input type="text" name="name">
 
		<input type="submit" value="Upload"> Press here to upload the file!
		</form>	
</div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		bindEvents();
		clearText();
	});
	
	function bindEvents(){
		$('.btnSubmit').bind({
			click:submitNewArticle
		})
		
		$('.btnClear').bind({
			click:clearText
		})
	}
	
	function clearText(){
		$('#inputTitle').val('')
		$('#inputArticle').val('')
	}
	
	function submitNewArticle(){
		var inputTitle = $('#inputTitle').val();
		var inputArticle = $('#inputArticle').val();
		console.log(inputTitle);
		$.post('createNewArticle.do',{
			    title : inputTitle,
				article : inputArticle,
				
			}).success(function(data){
				clearText();
				window.location.href = 'articleListController.do'
		})
		
	}
	
</script>

</html>
