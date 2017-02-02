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
		
		<!--  form submit version -->
<%-- 		<form method="POST" action="uploadFile.do" enctype="multipart/form-data"> --%>
<!-- 		File to upload: <input type="file" name="file"> -->
 
<!-- 		Name: <input type="text" name="name"> -->
 
<!-- 		<input type="submit" value="Upload"> Press here to upload the file! -->
<%-- 		</form>	 --%>
		
		<br>
		
		<!-- JQuery版： -->
        <form id="form_jquery" action="#" enctype="multipart/form-data">
<!--             <input name="fileDescription" type="text" required/> -->
            <input name="fileData" type="file"/>
<!--             <input type="submit" onclick="submitForm_jquery(); return false;"/> -->
        </form>
        
        <br>
<!--        <div> -->
<!--         	<input type="file" name="UploadFile" id="upload" multiple/>         -->
<!--     	</div>   -->
    	
<%--     	<form name="form" action="" method="POST" enctype="multipart/form-data"> --%>
<!--     		<input name="fileToUpload" type="file" id="fileToUpload"> -->
<!--     		<input id="uploadfile" type="button" value="upload" onclick="ajaxFileUpload();return false;">  -->
<%-- 		</form> --%>
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
	
// 	function submitNewArticle(){
// 		var inputTitle = $('#inputTitle').val();
// 		var inputArticle = $('#inputArticle').val();
// 		//file
// 		var form_jquery = document.getElementById("form_jquery");
// 	    var formData = new FormData(form_jquery);
	    
// 		$.post('createNewArticle.do',{
// 			    title : inputTitle,
// 				article : inputArticle,
				
// 			}).success(function(data){
// 				clearText()
// 				window.location.href = 'articleListController.do'
// 		})
		
// 	}
	
	function submitNewArticle(){
		var inputTitle = $('#inputTitle').val();
		var inputArticle = $('#inputArticle').val();
		
		//file
		var form_jquery = document.getElementById("form_jquery");
	    var formData = new FormData(form_jquery);
	    
	    formData.append("title",inputTitle);
	    formData.append("article",inputArticle);
	    $.ajax({
	        url: "createNewArticle.do",
	        method: "POST",
	      	data: formData,
	        processData: false, // 告訴JQuery不要去處理發送的數據，不然會把data
	                            //設置的物件轉換成查詢字符串以配合預設的application/x-www-form-urlencoded
	                            
	        contentType: false, // 告訴JQuery不要去設置Content-Type請求Header
	                            //Header會自動適情況加上multipart/form-data
	        success: function (response) {
// 	            console.log("OK_upload");
	            clearText()
				window.location.href = 'articleListController.do'
	        },
	        error: function (jqXHR, textStatus, errorMessage) {
	            console.log(errorMessage);
	        }
	    });
		
	}
	
	function submitForm_jquery() {
	    var form_jquery = document.getElementById("form_jquery");
	    var formData = new FormData(form_jquery);
	    $.ajax({
	        url: "uploadFileByAjax.do",
	        method: "POST",
	        data: formData,
	        processData: false, // 告訴JQuery不要去處理發送的數據，不然會把data
	                            //設置的物件轉換成查詢字符串以配合預設的application/x-www-form-urlencoded
	                            //
	        contentType: false, // 告訴JQuery不要去設置Content-Type請求Header，
	                            //Header會自動適情況加上multipart/form-data
	        success: function (response) {
	            console.log("OK_upload");
	        },
	        error: function (jqXHR, textStatus, errorMessage) {
	            console.log(errorMessage);
	        }
	    });
	}
	


	
</script>

</html>
