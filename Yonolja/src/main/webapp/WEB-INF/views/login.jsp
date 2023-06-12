<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>로그인페이지</title>
</head>

<style>

table{border-collapse:collapse;margin:0 auto;margin-top:15%;border:1px solid #ddd;}
tr:nth-child(1){
	border-bottom:1px solid #ddd;
	border-top:1px solid white;
	border-right:1px solid white;
	border-left:1px solid white;
}
tr:nth-child(7){text-align:right}
#login{width:80%}
#login:not(.child){text-align:center}
#logo{width:300px}
</style>
<body>

<form action="/doLogin" method="post" id="fmt">
	<table>
		<tr><th colspan=2><a href="/main"><img id=logo src="/img/website/header_logo.png"></a></th></tr>
		<tr><th colspan=2><h2>로그인</h2></th></tr>
		<tr><td>&nbsp;아이디</td><td><input name=login_id type=text></td></tr>
		<tr><td>&nbsp;비밀번호</td><td><input name=login_ps type=password></td></tr>
		<tr>
			<td colspan=2 style="text-align:center"><br><input id=login type=submit value='로그인'></td>
		</tr>
		<tr><td colspan=2>&nbsp;</td></tr>
		<tr><td colspan=2><a href="/signin">회원가입</a> &nbsp;</td></tr>
	</table>
</form>
${guide}
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>


</script>
</html>
