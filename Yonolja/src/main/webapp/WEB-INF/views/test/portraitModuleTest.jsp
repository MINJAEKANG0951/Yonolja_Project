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
/*
section{
	display:flex;
}
*/
.portrait{
	text-align:center;
	
	width:300px;
	height:300px;
	border:1px solid black;
}
.slide{display:none;}
.head{	width:100%;height:100%; position:relative;}
.pictureList{ width:100%;height:100%; white-space:nowrap;overflow:hidden;  padding:0px; font-size:0px;}
.pictureList_li{ list-style:none; display:inline-block; width:100%; height:100%; transition:0.5s; }
.head img{ width:100%; height:100%;}
/* .pictureList img{ width:100%; height:100%;} 이렇게하면 버튼이 개커짐. 왜그런지는 모르겠음 */

.left{
	position:absolute;
	cursor:pointer;
	top:45%;
	left:10px;
	transition:100s;
	display:none;
	
	width:30px;					
	height:30px;
	
}
.right{
	position:absolute;
	cursor:pointer;
	top:45%;
	right:10px;
	transition:100s;
	display:none;
	
	width:30px;
	height:30px;

}

.body{
	border:1px solid black;
	display:grid;
	grid-template-columns:1fr 3fr;
	grid-template-rows:1fr 1fr 1fr;
	
}
.body div{
	text-align:right;
}

.slide:nth-child(1):checked ~ .head ul li{transform:translateX(0%);}
.slide:nth-child(2):checked ~ .head ul li{transform:translateX(-100%);}
.slide:nth-child(3):checked ~ .head ul li{transform:translateX(-200%);}


/* 아래서 script 로 append 해서 성공함!! */
.portrait:hover .slide:nth-child(1):checked ~ .head div div:nth-child(1) label{display:block; }
.portrait:hover .slide:nth-child(2):checked ~ .head div div:nth-child(2) label{display:block; }
.portrait:hover .slide:nth-child(3):checked ~ .head div div:nth-child(3) label{display:block; }



/* 굳이 모듈을 쓰지않고 이걸 한번에 할 방법도 있지 않을까?  그냥 class 상하관계로. airbnb place 생성되는거
	보니깐 그런느낌이 듬
	
	근데 div 이름이 각자 랜덤한거 보니깐 module 을 쓴거같기도 함.
	일단 그럼 module 먼저 써보자.
	
	module 을 넣어서 flex 로 차곡차곡 넣는듯?
*/

</style>
<body>
<h1> portrait module test</h1>
<hr>
<button id=getPlaces>가져오기</button>
<section>
	
<div class=portrait> 
	<input type=radio name=slide class=slide id="radio1" checked>
	<input type=radio name=slide class=slide id="radio2">
	<input type=radio name=slide class=slide id="radio3">
	<div class=head>
			<ul class=pictureList onclick="location.href='/place/seq'" style="cursor:pointer;">
				<li class=pictureList_li>
					<img src="/img/test/거북이1.png">
				</li>
				
				<li class=pictureList_li>
					<img src="/img/test/dd.png">
				</li>
				
				<li class=pictureList_li>
					<img src="/img/test/거북이3.png">
				</li>
			</ul>
			
			<div class="control">
				<div class=control1>
					<label class=left for="radio3"><img src="/img/test/left.png"></label>
					<label class=right for="radio2"><img src="/img/test/right.png"></label>
				</div>
				
				<div class=control1>
					<label class=left for="radio1"><img src="/img/test/left.png"></label>
					<label class=right for="radio3"><img src="/img/test/right.png"></label>
				</div>
				
				<div class=control1>
					<label class=left for="radio2"><img src="/img/test/left.png"></label>
					<label class=right for="radio1"><img src="/img/test/right.png"></label>
				</div>
			</div>
	</div>
	<div class=body>
		<div class=placeName>이름 / 평점</div>
		<div class=placeAddress>주소</div>
		<div class=placePrice>1박 가격</div>
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
	
	//getPlaces();

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
/*
$('body').append('<style>.body{background-color:black}<style>') 
// 된다!!!!!!!!!!!!!!!!!! 
$('body').append('<style>.portrait:hover .slide:nth-child(1):checked ~ .head div div:nth-child(1) label{display:block;}.portrait:hover .slide:nth-child(2):checked ~ .head div div:nth-child(2) label{display:block;}.portrait:hover .slide:nth-child(3):checked ~ .head div div:nth-child(3) label{display:block;}<style>')
$('body').append('<style>.slide:nth-child(1):checked ~ .head ul li{transform:translateX(0%);}.slide:nth-child(2):checked ~ .head ul li{transform:translateX(-100%);}.slide:nth-child(3):checked ~ .head ul li{transform:translateX(-200%);}</style>')
*/
</script>
</html>