<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Article List</title>
<link rel="stylesheet" href="css/bootstrap.min.css">

</head>

<body>
	<div class="container">
	
	<input class="btn btn-default" type="button" value="回登入頁面" onclick="location.href='login.do'">
	<input class="btn btn-default" type="button" value="全文導覽" onclick="location.href='articleListController.do'">
	<input class="btn btn-default" type="button" value="新增文章" onclick="location.href='createNewArticlePage.do'">
		
		<div class='divArticleList'>
			<h2>Article Page</h2>
			<table id="tableArticleList" class="table table-striped" border="2" cellpadding="4" >
			
		
			</table>
		</div>
		
		<div class='divCommentList'>
		<h2>Comment Page</h2>
		<table id="tableSingleArticle" class="table table-bordered" border="2" cellpadding="4" >
			
		
		</table>
		
		<table id="tableCommentList" class="table table-bordered" border="2" cellpadding="4" >
			
		
		</table>
		</div>
	
	</div>
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		bindEvents();
		articleList();
		
	});
	
	function bindEvents(){
// 		$('.btnRead').bind({
// 			click:showSingleArticle
// 		})
		
// 		$('.btnEdit')bind({
// 			click:articleList
// 		})
	}
	
	function articleList(){
		$('#divArticleList').html('')
// 		$('.divCommentList').html('')
		 $('#tableSingleArticle').html('')
		 $('#tableCommentList').html('')
		$.post('showArticleList.do').success(function(data){
			rowData = data['articleList'];
// 			console.log(rowData);
			$("#tableArticleList").append(
					"<tr>" +
					"<th align='center'>標題</th>" +
					"<th align='center'>內文</th>" +
					"<th align='center'>建立者</th>" +
					"<th align='center'>建立時間</th>" +
					"<th>閱讀及回文</th>" +
					"</tr>"
					);
			$.each(rowData, function(i, item){
				var date = new Date(rowData[i].create_date);
				$('#tableArticleList').append("<tr>" +
						              "<td>" + rowData[i].title   + "</td>" +
						              "<td>" + rowData[i].article    + "</td>" +
						              "<td>" + rowData[i].user_name + "</td>" +
						              "<td>" + date.toString() + "</td>" +				            
// 									  "<td><a class='btn btn-default' href='showSingleArticle/" + rowData[i].id + ".do' role='button'>閱讀並回文</a></td>" +
									  "<td><input class='btn btn-default btnRead'  type='button' data-id='"+ rowData[i].id + "' value='閱讀及回文'  ></td>" +
									  "<td><input class='btn btn-default btnEdit'  type='button' data-id='"+ rowData[i].id + "'user-id='" + rowData[i].user_id+ "' value='編輯'  ></td>" +
						              "</tr>");
				i++;
			})
			
			$('.btnRead').bind({
			click:showSingleArticle
			})
		})
		
	}
	
	function showSingleArticle(){
		 $('.divArticleList').html('')
		 $('#tableSingleArticle').html('')
		 $('#tableCommentList').html('')
		 var id = $(this).attr('data-id');
		 $.post("showSingleArticle.do",{
			 tempId : id,
	 		 }).success(function(data){
			rowData = data['articleList'];
			$("#tableSingleArticle").append(
					"<tr>" +
					"<th align='center'>標題</th>" +
					"<th align='center'>內文</th>" +
					"<th align='center'>建立者</th>" +
					"<th align='center'>建立時間</th>" +
					"<th>編輯及刪除</th>" +
					"</tr>"
					);
			$.each(rowData, function(i, item){
				var date = new Date(rowData[i].create_date);
				$('#tableSingleArticle').append("<tr>" +
						              "<td>" + rowData[i].title   + "</td>" +
						              "<td>" + rowData[i].article    + "</td>" +
						              "<td>" + rowData[i].user_name + "</td>" +
						              "<td>" + date.toString() + "</td>" +	
						              "<td><input class='btn btn-default btnEdit'  type='button' data-id='"+ rowData[i].id + "'user-id='" + rowData[i].user_id+ "' value='編輯'  >" +
						              	  "<input class='btn btn-default btnDelete'  type='button' data-id='"+ rowData[i].id + "'user-id='" + rowData[i].user_id+ "' value='刪除'  ></td>" +
						              "</tr>");
			    i++;
			})
			
			$('.btnEdit').bind({
				click:editSingleArticle
			})
			
			
			$('.btnDelete').bind({
				click:deleteSingleArticle
			})
			
		 })
		 
		 showCommentList();
		 
		 function showCommentList(){
			$.post("commentPageController.do",{
					tempArticleId : id,
			}).success(function(data){
				rowComment = data['commentList'];
				console.log(rowComment)
				$("#tableCommentList").append(
						"<tr>" +
						"<th align='center'>回覆文章</th>" +
						"<th align='center'>回覆者</th>" +
						"<th align='center'>建立時間</th>" +
						"</tr>"
						);
				if (rowComment.length != 0){
					$.each(rowComment, function(i, item){
					var date = new Date(rowComment[i].create_date);
					$('#tableCommentList').append("<tr>" +
				              			"<td>" + rowComment[i].comment   + "</td>" +
				              			"<td>" + rowComment[i].user_id    + "</td>" +
				              			"<td>" + date.toString() + "</td>" +
				              			"</tr>");
						i++;
					})
				}else{
					$('#tableCommentList').append("<tr>" +
										"<td colspan='3' align='center'>暫待回覆文章</td>" +
										"</tr>"
										);
				}
			})
		}
		 
		 function showCommentDialog(){
			 $.post("commentDialog.do",{
					tempArticleId : id,
			}).success(function(data){
				rowComment = data['commentList'];
					console.log(rowComment)
					$("#tableCommentList").append(
						"<tr>" +
						"<th align='center'>回覆文章</th>" +
						"<th align='center'>回覆者</th>" +
						"<th align='center'>建立時間</th>" +
						"</tr>"
						);
						$.each(rowComment, function(i, item){
						$('#tableCommentList').append("<tr>" +
				              			"<td>" + rowComment[i].comment   + "</td>" +
				              			"<td>" + rowComment[i].user_id    + "</td>" +
				              			"<td>" + rowComment[i].create_date + "</td>" +
				              			"</tr>");
							i++;
						})
			    	
			})
		 }
		 
	}
	
	function deleteSingleArticle(){
		var deleteArticleId = $(this).attr('data-id');
		var userId = $(this).attr('user-id')
		$.post("deleteSingleArticle.do",{
			deleteArticleId : deleteArticleId,
			userId : userId
		}).success(function(data){
			if(data == true){
				alert("刪除成功")
				window.location.href = 'articleListController.do'
			}else{
				alert("限此使用者操作")
				window.location.href = 'articleListController.do'
			}
		})
	}
	
	function editSingleArticle(){
		
	}
	
	
// 	function showSingleArticle(){
// 		 $('#tableArticleList').html('')
// 		 var tempId = $(this).attr('data-id');
// 		 console.log(tempId)
// 		 $.get('showSingleArticle.do',{
// // 			 id : tempId
// 		 }).success(function(data){
// 			rowData = data['articleList'];
// 			$.each(rowData, function(i, item){
// 				$('#tableSingleArticle').append("<tr>" +
// 						              "<td>" + rowData[i].title   + "</td>" +
// 						              "<td>" + rowData[i].article    + "</td>" +
// 						              "<td>" + rowData[i].user_name + "</td>" +
// 						              "<td>" + rowData[i].create_date + "</td>" +				            
// 						              "</tr>");
// 				i++;
// 			}) 
// 		 })
// 	}
	
	
// 	function showSingleArticle(){
// 		$.ajax({
// 		    url : "showSingleArticle.do",
// 		    type: "POST",
// 		    dataType:"text",
// 		    success: function(data, textStatus, jqXHR)
// 		    {
		    	
// 		    },
// 		    error: function (jqXHR, textStatus, errorThrown)
// 		    {
// 		 	console.log(jqXHR);
// 		 	console.log(textStatus);
// 		    }
// 		});
		
// 	}
	
	
// 	 function showSingleArticle(){
// 		console.log('+++++++++++');
// 		  var id = $(this).attr('name'); 
// 		  alert("delete successfully"); 
// 		 $.post('showSingleArticle.do',{
// // 			 id : id,
// 		 }).success(function(data){
// 			 alert(data);
			 
// // 				$('.test').load(commnetPage.jsp);
// // 				$(location).attr('href','http://localhost:8080/Dev_Forum/commentPageController.do')
// // 				window.location.href = 'http://localhost:8080/Dev_Forum/commentPageController.do'
// 			  window.location.replace('${path}/commentPageController.do')
			 
// 		 })
// 	} 

</script>

</html>