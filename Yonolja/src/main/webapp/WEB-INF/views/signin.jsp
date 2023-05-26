<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>회원가입페이지</title>
</head>
<style>
table{border-collapse:collapse;margin:0 auto;margin-top:15%;border:1px solid #ddd;}
#logo{width:300px}
#signin{width:300px}
</style>
<body>

<form action="/doSignin" method="post" id="fmt">
	<table>
		<tr><th colspan=2><a href="/main"><img id=logo src="/img/website/header_logo.png"></a></th></tr>
		<tr><th colspan=2><h2>회원가입</h2></th></tr>
			<tr>
			<td>아이디</td>
			<td><input name=user_id type=text></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input name=user_ps type=password></td>
		</tr>
		<tr>
			<td>비밀번호확인</td>
			<td><input name=user_ps_check type=password></td>
		</tr>
		<tr>
			<td>실명</td>
			<td><input name=user_name type=text></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input name=user_email type=text></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input name=user_mobile type=text></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				남자<input name=user_gender type=radio value='male'> &nbsp; 
				여자<input name=user_gender type=radio value='female'>
			</td>
		</tr>
		<tr>
			<td>회원유형</td>
			<td>
				고객<input name=user_type type=radio value='owner'> &nbsp; 
				업주<input name=user_type type=radio value='customer'>
			</td>
		</tr>
		<tr> 
			<td colspan=2><input id=signin type=submit value='등록'></td> 
		</tr>
	</table>
</form>
${guide}

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>


</script>
</html>