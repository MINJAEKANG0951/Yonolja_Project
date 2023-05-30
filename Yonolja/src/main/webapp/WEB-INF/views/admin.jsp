<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
</head>
<body>
<div class='admin_page'>
	<div class='admin_page_login'>
		<input type='hidden' id='adminCheck' value="${adcheck}">
	</div>
	<div class='admin_review'>
		<a href="admin_review">고객리뷰관리</a>
	</div>
	<div class='admin_post'>
		<a href="admin_post">고객센터 관리</a>
	</div>
	<div class='admin_user'>
		<a href="admin_user">회원관리</a>
	</div>

</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	/*if($('#adminCheck').val()!='admin'){
		alert('잘못된 접근입니다')
	}*/
})
</script>
</html>