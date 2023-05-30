<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>slideImgTest</title>
</head>
<style>

.portrait{
	border:1px solid black;
	width:300px;
}
.pictureBox{
	border:1px solid green;		
	white-space:nowrap;
	overflow:hidden;
	width:100%;
	font-size:0px;
	position:relative;
}
.pictureBox img{
	width:100%;
}
input[name=slide_radio]:nth-child(1):checked ~ .pictureBox img{
	transform:translateX(0%);
	transition:0.5s;
}
input[name=slide_radio]:nth-child(2):checked ~ .pictureBox img{
	transform:translateX(-100%);
	transition:0.5s;
}
input[name=slide_radio]:nth-child(3):checked ~ .pictureBox img{
	transform:translateX(-200%);
	transition:0.5s;
}
.left{
	position:absolute;
	top:45%;
	left:5%;
	z-index:1;
	border-radius:50% 50% 50% 50%;
	cursor:pointer;
	display:none;
}
.right{
	position:absolute;
	top:45%;
	right:5%;
	z-index:1;
	border-radius:50% 50% 50% 50%;
	cursor:pointer;
	display:none;
}
.pictureBox:hover button{
	display:block;
}
.pictureBox button{
	background-color:white;
	border:1px solid black;
}



</style>
<body>


<h1>SlideImgTest</h1>
<hr>

<div class=portrait>
		<input type=radio name=slide_radio id=tortoise01 checked>
		<input type=radio name=slide_radio id=tortoise02>
		<input type=radio name=slide_radio id=tortoise03>
	<div class=pictureBox>
		<button class=left> < </button>
		<button class=right> > </button>
		<img src="img/test/거북이1.png">
		<img src="img/test/거북이2.png">
		<img src="img/test/거북이3.png">
	</div>
</div>


</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>

$(document)
.on('click','.right',function(){
	index = $('input[name=slide_radio]:checked').index('input[name=slide_radio]');
	index = index+1;
	if( index==$('input[name=slide_radio]').length ){index=0}
	$('input[name=slide_radio]:eq('+ index +')').prop('checked',true);
})
.on('click','.left',function(){
	index = $('input[name=slide_radio]:checked').index('input[name=slide_radio]');
	index = index-1;
	$('input[name=slide_radio]:eq('+ index +')').prop('checked',true);
})

// 하나로는 괜찮은데, 두개, 세개 이상할때도 똑같이 적용될 코드가 필요할듯.

</script>
</html>
