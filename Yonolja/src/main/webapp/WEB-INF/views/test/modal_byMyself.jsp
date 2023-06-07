<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modalTest</title>
</head>
<style>

.modal_background{
	display:none;
	background-color:rgb(0,0,0,0.4);
	position:fixed;
	left:0;
	top:0;
	z-index:1;
	width:100%;
	height:100%;
}
.show {
	display:block;
}
.modal_content{
	background-color:white;
	position:fixed;
	top:30px;
	left:50%;
	transform:translateX(-50%);
	transition:1s;
	padding:20px;
	width:80%;
}
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
}
.close:hover{
	color: black;
}
</style>
<body>

<button id="show">show</button>

<div class=modal_background id=modal_background>
	<div class=modal_content id=modal_content>
		<span class=close>&times;</span>
		<h1>title</h1>
		<span> content </span>
	</div>
</div>

</body>
<script>
document.getElementById('show').addEventListener('click',function(){
	modal_background = document.getElementById('modal_background');
	modal_background.classList.add('show');
	modal_content = document.getElementById('modal_content');
})
document.getElementsByClassName('close')[0].addEventListener('click',function(){
	modal_background = document.getElementById('modal_background');
	modal_background.classList.remove('show');
})


</script>
</html>