<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<title> 이미지 업로드 test </title>
</head>
<style>
input[name=slide]{display:none;}
.portrait{border:1px solid black; width:300px;height:300px;}
.pictureBox{border:1px solid blue; width:100%;height:100%;font-size:0px}
.pictureList{
	border:1px solid red;
	width:100%;
	height:100%;
	padding:0px;
	white-space:nowrap;
}
.pictureList li{width:100%;list-style:none;display:inline-block;}
.pictureList li img{width:100%;height:100%;}
a{border:1px solid green;width:300px}
.left{position:absolute;width:30px;height:30px;top:150px;background-color:white;left:10px}
.right{position:absolute;width:30px;height:30px;top:150px;background-color:white;right:10px}
</style>
<body>

<form action="getImg" method="post" enctype="multipart/form-data">
	<input type="file" accept="image/*" name="img">
	<input type=submit value=send>
</form>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>


</script>
</html>