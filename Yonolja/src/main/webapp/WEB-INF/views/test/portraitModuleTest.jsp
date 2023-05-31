<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<title> portrait module test </title>
</head>
<style>


.portrait{
	border:1px solid black;
	width:300px;
	text-align:center;
}
.head{
	width:100%;
	position:relative;
}
.head ul{
	width:100%;
	white-space:nowrap;
}
.head li{
	list-style:none;
	display:inline-block;
	width:100%
}
.head img{
	width:100%;
}
.pictureList{
	padding:0px;
}

.left{
	position:absolute;
	width:30px;
	height:30px;
	cursor:pointer;
	top:45%;
	left:10px;
}
.right{
	position:absolute;
	width:30px;
	height:30px;
	cursor:pointer;
	top:45%;
	right:10px;
}



</style>
<body>
<h1> portrait module test</h1>
<hr>
<button id=getPlaces>가져오기</button>
<section>
	
<div class=portrait> 
	<div class=head>

			<ul class=pictureList>
				<li>
					<label class=left for="radio3"><img src="/img/test/left.png"></label>
					<img src="/img/test/거북이1.png">
					<label class=right for="radio2"><img src="/img/test/right.png"></label>
				</li>
				
				<li>
					<img src="/img/test/거북이2.png">
				</li>
				
				<li>
					<img src="/img/test/거북이3.png">
				</li>
			</ul>

	</div>
	
	<div class=body>
		여기에 이름, 가격, 평점 등등 넣으면 됨.
	</div>
</div>
	
	
</section>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>

$(document)
.ready(function(){
	
})
.on('click','#getPlaces',function(){
	
	getPlaces();
	
})

function getPlaces(){
	
	
	$('section').empty(); // section 한 번 비우고 시작.
	
	$.ajax({url:'/getPlaces',type:'post', dataType:'json',
		
		success:function(data){
			
			// class 같은거 다 정해가지고 만드셈 
			// 일단 portrait 구조부터 알아야할듯.
			
			// div 로 tag 들 조합하고 class 당 css 적용해서 하나하나 section 에 
			// 쌓아서 넣을 수 있으면 됨.
			

		}
	
	})
	
}


</script>
</html>