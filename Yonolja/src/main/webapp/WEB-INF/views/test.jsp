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
<br>
<div class=portrait>
	
	<input type=radio name=slide id=picture01 checked>
	<input type=radio name=slide id=picture02>
	<input type=radio name=slide id=picture03>
	
	<div class=pictureBox>
		<ul class=pictureList>
			<li>
				<a href="#">	
					<label class=left><img src="img/test/left.png"> </label>
					<img name=picture src="/img/place_options/bathtub.png">
					<label class=right><img src="img/test/right.png"> </label>
				</a>
			</li>
			<li>
				<a href="#">
					<img name=picture src="/img/place_options/beach.png">
				</a>
			</li>
			<li>
				<a href="#">
					<img name=picture src="/img/place_options/city.png">
				</a>
			</li>	
		</ul>
	</div>
	
	
</div>



</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)
.ready(function(){
	
	str = ".portrait span"
//	$(str).css('background-color','blue');	// 이런식으로도 가능하네!
//	$('li').css('transform','translateX(300%)')	// 심지어 이거도 가능
})

</script>
</html>