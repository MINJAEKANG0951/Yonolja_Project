<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/css_roomtype.css" type="text/css">
<title>roomtype</title>
</head>
<style>




</style>
<body>
<%@ include file ="./structure/header_placePage.jsp" %>
<!-- rest api 방식으로 jsp 파일을 출력할때, 그냥 url에 있는거 그대로 쓸 수 있음. model 에 안실어도 -->
<input type=hidden id=roomtype_seq value="${roomtype_seq}" readonly>





<section>
<div id=section>

	<div id=frame>
		
	</div>
	<div id=title>
		
	</div>
	<div id=optionBox>
	
	</div>
	
	

	<div id=footer>
		<div id=footerLogo>
			<img src="/img/website/footerLogo.png/">
		</div>
		<div id=terms><span>
			객실사진의 경우 객실별 대표사진으로 실제 배정받는 객실과 상이할 수 있습니다.
			(주)요놀자는 통신판매 중개자로서 통신판매의 당사자가 아니며 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.
			숙박업소는 법적으로 청소년 고용과 혼숙이 금지되어 있습니다. 따라서 청소년 혼숙으로 인한 입실거부는 정당하며, 이에 대한 법적 제재는 이용 당사자가 책임져야 합니다.
		</span></div>
	</div>
</div>
</section>











</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="/js/frameMaker.js"></script>
<script type="text/javascript" src="/js/calendarMaker2.js"></script>
<script>
////////////////////////////////////////// global variables ///////////////////////////////////////////////////

checkin = null;
checkout = null;
howmanyChildren = null;
howmanyAdults = null;


roomtypeOptions = null;

/////////////////////////////////////////////// cookies ////////////////////////////////////////////////////
// 여기서 쿠키사용
console.log(document.cookie)

cookies = document.cookie.split("; ")

for(ck=0;ck<cookies.length;ck++){
	cookie = cookies[ck];
	
	if(cookie.includes('=')){
	
		key = cookie.split("=")[0]; 
		value = cookie.split("=")[1]; 
		
		if(key==='howmanyAdults' && value!=""){ howmanyAdults = parseInt(value); }
		else if(key==='howmanyChildren' && value!=""){ howmanyChildren = parseInt(value); }
		else if(key==='checkin' && value!=""){ checkin=value; }
		else if(key==='checkout' && value!=""){ checkout=value; }
		
	} 
}

// 그 후 바로 삭제
document.cookie = "checkin= ; path=/roomtype; expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "checkout= ; path=/roomtype;expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "howmanyChildren= ; path=/roomtype;expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "howmanyAdults= ; path=/roomtype;expires=Tue, 19 Jan 2000 03:14:07 GMT;"

console.log(document.cookie)
console.log(checkin + ":" + checkout + ":" + howmanyChildren + ":" + howmanyAdults);

///////////////////////////////////////////// jquery /////////////////////////////////////////////////////

$(document)
.ready(function(){
	loadPage()
})
.on('click','.toPlace',function(){
	
	document.location = "/place/" + $(this).attr('id');
})


//////////////////////////////////////////// functions ///////////////////////////////////////////////////

function loadPage(){ // roomtype 에 관한 전반적인 정보들을 불러옴
	
	
	roomtype_seq = parseInt( $('#roomtype_seq').val() );
	
	$.ajax({url:'/getRoomType', type:'post', dataType:'json', 
		
		data:{roomtype_seq:roomtype_seq},
		success:function(roomtype){
			
			/*
				
				(roomtype.place_seq)
				roomtype.place_name
				roomtype.seq
				roomtype.name
				roomtype.imgs
				roomtype.capacity
				roomtype.price
				roomtype.options
				roomtype.guide
			
			
			*/
			
			
			
			// 1. roomtypeImg 넣기
			
			imgs = roomtype.imgs.split(",");
			
			frame = makeFrame();
			frame.left_img = "/img/website/place_left.png"
			frame.right_img = "/img/website/place_right.png"
			frame.left_style = 'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);left:10px;width:80px;height:150px;'
			frame.right_style = 'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);right:10px;width:80px;height:150px;'
			
			for(i=0;i<imgs.length;i++){
				frame.addPhoto(imgs[i]);
			}
			tagstr = frame.getTagStr();
			cssstr = frame.getCssStr();
			$('body').append(cssstr);
			$('#frame').append(tagstr);
			
			
			
			
			// 2. title 에 roomtype 이름, place 이름넣기
			
			titlestr = ''
			titlestr +='<div>' + roomtype.name + '</div>'
			titlestr +='<div><span class=toPlace id='+ roomtype.place_seq +'>' + roomtype.place_name + '></span></div>'
			$('#title').append(titlestr);
			
			
			
			// 3. roomtypeOptions -> 변수에 저장만하고 다른함수로 불러오기
			
			
		},
		complete:function(){
			
		}
	
	})
	
}








</script>
</html>