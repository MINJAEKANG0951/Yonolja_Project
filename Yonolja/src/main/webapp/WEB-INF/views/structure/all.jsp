<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9205057ff16b5c3fa0c0df924cbb7156&libraries=services"></script>
<title>main</title>
</head>
<style>
.movingHeader{border-bottom:1px solid #ddd;}
header {
  position: fixed;
  top: 0; left: 0;
  height: 85px;
  width: 100%;
  background-color: white;
  border-top:1px solid #ddd;
 
  display: grid;
  grid-template-columns:1fr;
  grid-template-rows:1fr;
  place-items:center;
  z-index:3;
}
.header_container {
	display:grid;
	background-color:white;
	grid-template-columns:1fr  1fr  1fr;
	grid-template-rows:1fr;
    place-items: center;
    width:95%;
    z-index:5;
}
#mypage_button{
	border:2px solid #ddd;
	background-color:white;
	width:85px;
	height:45px;
	border-radius:45% 45% 45% 45%;
	cursor:pointer;
	overflow:hidden;
}
#mypage_button:hover{ 
	box-shadow: 0px 0px 5px #444;transition:0.5s;
}
.header_item { width:100%;border:0px solid #ddd;}
.header_item:nth-child(2){	text-align:center; }
.header_item:nth-child(3){  text-align:right;  }
#logo{height:50px;z-index:2;}
#user_profile{width:100%}

.header_item:nth-child(3){
	display:grid;
	grid-template-columns:4fr 1fr 1fr;
	grid-template-rows:1fr;
	place-items:center;
}
.last_header_item_item{
	
}
.last_header_item_item:nth-child(1){
	text-align:right;font-weight:bold;font-size:14px;cursor:pointer;
		border-radius:5% 5% 5% 5% / 50% 50% 50% 50%;
		min-width:200px;
}
.last_header_item_item:nth-child(1):hover{background-color:#ddd;transition:0.5s;}
.last_header_item_item:nth-child(2){
	width:35px;
	height:35px;
	border-radius:50% 50% 50% 50%;
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	place-items:center;
}
.last_header_item_item:nth-child(2):hover{
	background-color:#ddd;transition:1s;
}
.last_header_item_item:nth-child(3){

}
#world_img{width:24px;cursor:pointer;}
.sub{
	display:none;
	position:absolute;
	border-radius:10% 10% 10% 10%;
	right:40px;
	border:1px solid #ddd;
	
	grid-template-columns:1fr;
	grid-template-rows:1fr 1fr 1fr;
	background-color:white;
	z-index:2;
}
.sub_item{
	cursor:pointer;
	width:100%;
	height:100%;
	font-weight:bold;
	font-size:17px;
	text-indent:1em;
	text-align:left;
}
.sub_item:hover{
	background-color:#ddd;
}
.sub_item:nth-child(n+2){
	border-top:1px solid #ddd;
}
.header_container2{
	background-color:white;
	border-top:1px solid #ddd;
	width:100%;
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	place-items:center;
} 



footer {
  position: fixed;
  bottom: 0; left: 0;
  height: 100px;
  width: 100%;
  background-color: white;
  border:1px solid #ddd;
  display:grid;
  z-index:3;
}
.footer_container{
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr 1fr;
    place-items: center;
    width:100%;
    height:100%;
}
.footer_item {
	width:95%;
	height:100%;
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	place-items:center;
}
.footer_item:nth-child(1){
	border-bottom:1px solid #ddd;
	font-size:15px;
	min-width:1056px;
}
.footer_item:nth-child(2){
	font-size:5px;
}
</style>

<body>
<header>
<div class=header_container>
		<div class=header_item>
			<a href="/main"><img id=logo src="/img/website/header_logo.png"></a>
		</div>
		<div class=header_item>
			<!-- 본인이 넣고싶은거 -->
		</div>
		<div class=header_item>
			<div class=last_header_item_item title="향후개발예정"> 당신의 공간을 Yonolja하세요</div>
			<div class=last_header_item_item title="향후개발예정"><img id=world_img src="/img/website/earth.png"></div>
			<div class=last_header_item_item>
				<button id=mypage_button><img id=user_profile src="/img/website/user-profile.png"></button>
				<div class=sub>
				<% if( session.getAttribute("user_type")==null ){ %>
					<div class=sub_item onclick="location.href='/login'">로그인</div>
					<div class=sub_item onclick="location.href='/signin'">회원가입</div>
					<div class=sub_item onclick="location.href='/post_board'">고객문의 게시판</div>
				<% } else if(session.getAttribute("user_type").equals("customer")){ %>
					<div class=sub_item onclick="location.href='/mypage'">마이페이지</div>
					<div class=sub_item onclick="location.href='/logout'">로그아웃</div>
					<div class=sub_item onclick="location.href='/post_board'">고객문의 게시판</div>
				<% } else if(session.getAttribute("user_type").equals("owner")){ %>
					<div class=sub_item onclick="location.href='/mypage'">마이페이지</div>
					<div class=sub_item onclick="location.href='/logout'">로그아웃</div>
					<div class=sub_item onclick="location.href='/post_board'">고객문의 게시판</div>
				<% } else if(session.getAttribute("user_type").equals("admin")){ %>
					<div class=sub_item onclick="location.href='/admin'">관리자페이지</div>
					<div class=sub_item onclick="location.href='/logout'">로그아웃</div>
					<div class=sub_item onclick="location.href='/post_board'">고객문의 게시판</div>
				<% } %>
				</div>
			</div>
		</div>
</div>
</header>

<footer>
<div class=footer_container>
	<div class=footer_item>
		<div>
			© 2023 Waterbnb, Inc. · 개인정보 처리방침 · 이용약관 · 사이트맵 · 한국의 변경된 환불 정책 · 회사 세부정보
			&nbsp;&nbsp;&nbsp;&nbsp;
			<b>언어 : 한국어(KR) 
			통화 : \ won</b>
		</div>
	</div>
	<div class=footer_item>
		<div>
			지원 및 참고 자료
			웹사이트 제공자: Waterbnb continent KR, public limited company, 
			boosung street 1 82, cheonan | ceo : YT,HS,HY,MJ,TH | VAT 번호: x**4$123$0vv15 | 
			사업자 등록 번호: AB 5*****7 | 연락처: blueie2@naver.com, 웹사이트, 010-2952-0951 | 
			호스팅 서비스 제공업체: 아마존 웹서비스 | 
			워터비앤비는 통신판매 중개자로 워터비앤비 플랫폼을 통하여 게스트와 호스트 사이에 이루어지는 통신판매의 당사자가 아닙니다.
			워터비앤비 플랫폼을 통하여 예약된 숙소, 체험, 호스트 서비스에 관한 의무와 책임은 해당 서비스를 제공하는 호스트에게 있습니다.
		</div>
	</div>
</div>
</footer>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
//내정보버튼 drop down
$('html').click(function(e){
	clicked = $(e.target).attr('id');
	if(clicked=='user_profile'||clicked=='mypage_button'){
		if( $('.sub').css('display')=='none'  ){ $('.sub').css('display','block')} 
		else { $('.sub').css('display','none')}
	} else { $('.sub').css('display','none') }
})
$(window).scroll(function(){
    if($(document).scrollTop() > 0) {
        $('.header').addClass('movingHeader');
    } else {
        $('.header').removeClass('movingHeader');
    }
});
</script>
</html>


