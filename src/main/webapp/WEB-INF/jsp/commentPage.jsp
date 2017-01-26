<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name = "viewport" content = "width=device-width, initial-scale=1">
<title>Comment Page</title>
<link rel="stylesheet" href="css/bootstrap.min.css" >

</head>
<body>
<div class="container">

	<br>
	<h2>Comment Page</h2> 
	<table id = "tableSingleArticle" class="table table-bordered">
		<tr>
			<td>標題</td>
			<td>文章內容</td>
			<td>作者</td>
			<td>建立時間</td>
		</tr>
		<tr>
			<c:forEach var="article" items="${model}">
			<tr>
				<td>${article.tile}</td>
				<td>${article.article}</td>
				<td>${article.user_name}</td>
				<td>${article.create_date}</td>
			</tr>
			</c:forEach>
		</tr>
	</table>	
	
	<table id = "tableCommentList" class="table table-bordered">
		<tr>
			<td>回覆文章</td>
		</tr>
		<tr>
			<td>
				<form>
  					<div class="form-group">
    				<input type="text" class="form-control" id="inputComment" placeholder="回覆文章">
  					</div>
				</form>
			</td>
		</tr>
	
	</table>
	<input class="btn btn-default" type="submit" value="清除">	
	<input class="btn btn-default" type="submit" value="回覆">	
		
</div>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- <script src="js/jquery.validate.js"></script> -->
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
