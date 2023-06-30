<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#notallowed{
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	width:600px;
	height:600px;
}
#notallowed img{

	width:80%;
	height:80%;
}
</style>
<body>
<%@ include file ="./structure/header.jsp" %> 
<div id="notallowed">
<h1>잘못된 접근입니다</h1>
<img src="/img/place_option/none.png">
</div>
</body>
</html>