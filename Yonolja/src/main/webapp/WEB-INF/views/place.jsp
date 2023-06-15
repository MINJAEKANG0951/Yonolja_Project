<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>place</title>
</head>
<style>

section{
	position:absolute;
	width:100%;
	display:grid;
	grid-template-column:1fr;
	grid-template-rows:1fr;
	place-items:center;
}
#section{
	position:relative;
	width:800px;
	height:100vw;
	border:1px solid #ddd;
	background-color:#ddd;
}
#frame{
	position:relative;
	width:500px;
	height:500px;
	left:50%;
	transform:translateX(-50%);
}
#title{
	background-color:blue;
	width:100%;
	min-height:100px;
}
#optionBox{
	background-color:green;
	width:100%;
	min-height:100px;
}
#tabBox{
	background-color:orange;
	width:100%;
	min-height:100px;
}

#box{
	border:1px solid black;
	width:300px;
	height:300px;
}
</style>
<body>
<%@ include file ="./structure/header_placePage.jsp" %>
<input type=hidden id=place_seq value="${place_seq}" readonly>
 
<section>
<div id=section>

	<div id=frame>
		
	</div>
	<div id=title>
	
	</div>
	<div id=optionBox>
	
	</div>
	<div id=tabBox>
	
	</div>
</div>
</section>




</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="/js/frameMaker.js"></script>
<script>
$(document)
.ready(function(){
	loadPage();
})

/*
frame = makeFrame();
frame.addPhoto("/img/test/거북이1.png")
frame.addPhoto("/img/test/거북이2.png")
frame.addPhoto("/img/test/거북이3.png")
tagstr = frame.getTagStr();
cssstr = frame.getCssStr();
$('body').append(cssstr);
$('#frame').append(tagstr)
*/

//////////////////////////////////// variables ///////////////////////////////////////////


//////////////////////////////////// functions ///////////////////////////////////////////

function loadPage(){	// ajax 를 통해서 page 에 표시할 data 들을 가져옴.
	
	place_seq = parseInt( $('#place_seq').val() );
	
	$.ajax({url:'/getPlace', type:'post', dataType:'json', 
		
		data:{place_seq:place_seq},
		success:function(data){
			
		},
		complete:function(){
			
		}
	
	})
	
	
}



























</script>
</html>
