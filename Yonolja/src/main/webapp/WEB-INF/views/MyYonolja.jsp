<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>MyYonolja</title>
</head>
<style>
header {
  position: fixed;
  top: 0; left: 0;
  height: 150px;
  width: 100%;
  background-color: white;
  border:1px solid #ddd;

  display: grid;
  grid-template-columns:1fr;
  grid-template-rows:1fr 1fr;
  place-items:center;
}
.header_container {
	display:grid;
	grid-template-columns:1fr  1fr  1fr;
	grid-template-rows:1fr;
    place-items: center;
    width:95%;
    position: relative;
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
#logo{height:50px;z-index:1;}
#user_profile{width:100%}
#searchbar{
	width:350px;
	height:50px;
	border-radius:5% 5% 5% 5% / 50% 50% 50% 50%;
	background-color:white;
	border:2px solid #ddd;
	cursor:pointer;
	font-size:15px;
	font-weight:bold;
	display:grid;
	grid-template-columns:4fr 4fr 4fr 1fr;
	grid-template-rows:1fr;
	place-items: center;
}
#searchbar:hover{ box-shadow: 0px 0px 5px #444;transition:0.5s;}
.searchbar_item{width:100%}
.searchbar_item:nth-child(1){border-right:1px solid #ddd;}
.searchbar_item:nth-child(2){border-right:1px solid #ddd;}
.searchbar_item:nth-child(3){
	font-weight:lighter;
	color:gray;
}
#search_img{width:30px;display:inline-block}

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
		min-width:120px;
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

footer {
  position: fixed;
  bottom: 0; left: 0;
  height: 100px;
  width: 100%;
  background-color: white;
  border:1px solid #ddd;
  display:grid;
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
section {
  padding-top: 150px; padding-bottom: 150px;
}

.sub{
	display:none;
	position:absolute;
	border-radius:10% 10% 10% 10%;
	right:40px;
	border:1px solid #ddd;
	
	grid-template-columns:1fr;
	grid-template-rows:1fr 1fr 1fr;
	background-color:white;
	z-index:1000;
}
.sub_item{
	cursor:pointer;
	width:100%;
	height:25px;
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
	border-top:1px solid #ddd;
	width:100%;
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	place-items:center;
}
.optionBox {
	width:95%;
	height:80px;
	
	
	display:grid;
	grid-template-columns:1fr 30fr 1fr 3fr;
	grid-template-rows:1fr;
	place_items:center;

}

.btnBox{
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	place-items:center;
}

#leftBtnBox{
	text-align:right;
	margin:auto 0;
}
#rightBtnBox{
	text-align:left;
	margin:auto 0;
}

#filter{
	width:80px;
	height:50px;
	background-color:white;
	border-radius:10% 10% 10% 10%;
	font-size:15px;
	font-weight:bold;
	border:0.5px solid black;
	cursor:pointer;
}
#filter:hover{
	box-shadow: 0px 0px 5px #444;transition:0.5s;
}

.options{
	white-space:nowrap;
	overflow:hidden;
	display:flex;
	position:relative;
	height:100%;
	place-items:center;
	box-sizing: border-box;
 	border-style: solid;
	border:0px solid #ddd;
	border-left:1px solid #f1f1f1;
	border-right:1px solid #f1f1f1;
}
.option{
	
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr auto;
	height:90%;
	width:150px;
	min-width:150px;
	max-width:151px;
	font-size:13px;
	text-align:center;
	cursor:pointer;
	
	transition:0.5s;

}

.option:hover{
	background-color:#ddd;
	font-size:bold;
}

.option img{
	height:40px;
}

.option_left{
	border-radius:50% 50% 50% 50%;
	border:1px solid black;
	cursor:pointer;
	z-index:900;
}
.option_left:hover{border:2px solid black;font-weight:bold}
.option_right{
	border-radius:50% 50% 50% 50%;
	border:1px solid black;
	cursor:pointer;
	z-index:900;
}
.option_right:hover{border:2px solid black;font-weight:bold}

header, footer {
  z-index: 9999;
}

/* 위까지 헤더, footer 설정 */

a {
    text-decoration: none; /* a 요소의 밑줄 없애기 */
}

.mynolja {
    width: 800px; /* .nolja의 width와 동일하게 설정 */
    margin: auto; /* 가운데 정렬 */
    text-align: left; /* 텍스트를 왼쪽 정렬 */
    padding-top: 150px; /* 헤더의 높이와 동일한 값으로 설정 */
    position: relative;
    z-index: 1;
}

.nolja {
  border: 1px solid black; /* 외부에 네모난 선 추가 */
  /*width: fit-content;  요소의 너비를 내용에 맞춤 */
  border-radius: 15px;
  width: 800px;
  margin: auto; /* 가운데 정렬 */
  padding: 20px; /* 내부 패딩 추가 for better appearance */
  position: relative;
}
.myname {
  border: 1px solid black;
  border-radius: 15px; /* 테두리를 둥글게 */
  width: 700px;
  margin: auto;
  padding: 20px;
}
.mylist {
  border: 1px solid black;
  border-radius: 15px; /* 테두리를 둥글게 */
  width: 700px;
  margin: auto;
  padding: 20px;
}
.mypost {
  border: 1px solid black;
  border-radius: 15px; /* 테두리를 둥글게 */
  width: 700px;
  margin: auto;
  padding: 20px;
}
.myhotel {
  border: 1px solid black;
  border-radius: 15px; /* 테두리를 둥글게 */
  width: 700px;
  margin: auto;
  padding: 20px;
}

.s_con {
    position: relative;
    overflow: hidden;
    width: 100%;
}

.slider {
    display: flex;
    width: fit-content;
    transition: transform 0.3s ease-in-out;
    position: relative;
    z-index: 1;
}

.place_s {
    margin-right: 20px;
    position: relative;
    z-index: 1;
}

.s_control {
    margin-top: 10px;
    display: flex;
    justify-content: center;
}

.s_prev,
.s_next {
    margin: 0 10px;
    padding: 5px 10px;
    cursor: pointer;
}


</style>
<body>
<%-- <jsp:include page="./structure/all.jsp"></jsp:include> --%>
<%-- <jsp:include page="main.jsp"></jsp:include> --%>

<header>
<div class=header_container>
		<div class=header_item>
			<a href="/main"><img id=logo src="/img/website/header_logo.png"></a>
		</div>
		<div class=header_item>
			<button id=searchbar>
				<div class=searchbar_item>어디든지</div>
				<div class=searchbar_item>언제든지</div>
				<div class=searchbar_item>게스트추가</div>
				<div class=searchbar_item><img id=search_img src="/img/website/search.png"></div>
			</button>
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
					<div class=sub_item onclick="location.href='/board'">고객문의 게시판</div>
				<% } else if(session.getAttribute("user_type").equals("customer")){ %>
					<div class=sub_item onclick="location.href='/mypage'">마이페이지</div>
					<div class=sub_item onclick="location.href='/logout'">로그아웃</div>
					<div class=sub_item onclick="location.href='/board'">고객문의 게시판</div>
				<% } else if(session.getAttribute("user_type").equals("owner")){ %>
					<div class=sub_item onclick="location.href='/mypage'">마이페이지</div>
					<div class=sub_item onclick="location.href='/logout'">로그아웃</div>
					<div class=sub_item onclick="location.href='/board'">고객문의 게시판</div>
				<% } else if(session.getAttribute("user_type").equals("admin")){ %>
					<div class=sub_item onclick="location.href='/admin'">관리자페이지</div>
					<div class=sub_item onclick="location.href='/logout'">로그아웃</div>
					<div class=sub_item onclick="location.href='/board'">고객문의 게시판</div>
				<% } %>
				</div>
			</div>
		</div>
</div>
<div class=header_container2>
	<div class=optionBox>
		<div id=leftBtnBox> <button class=option_left> < </button> </div>
		<div class=options>
	
		</div>
		<div id=rightBtnBox> <button class=option_right> > </button> </div>
		<div class=btnBox>
			<button id=filter>필터</button>
		</div>
	</div>
</div>
</header>

<section>
<div class="mynolja">
	<span><b>My 요놀자</b></span>
</div><br>

<div class="nolja">
	<div class="myname">
		<span>${user_name}</span><br>
		<span>${user_type}</span><br>
		<a href="#" id="myinfo">내정보 관리</a>
	</div><br>
	
	<div class="mylist">
		<span><b>후기</b></span><br>
		<a href="#" id="myreviews">나의후기</a><br>
		
		<span><b>예약</b></span><br>
		<a href="#" id="mybooks">예약내역조회</a><br>
		
		<span><b>찜</b></span><br>
		<a href="#" id="mylikes">찜한 호텔</a><br>
	</div><br>
	
	<c:if test="${user_type eq 'admin' or user_type eq 'owner'}">
		<div class="myhotel">
		    <span><b>나의 비즈니스</b></span><br>
		    <div class="s_con">
		        <div class="slider">
		            <c:forEach items="${placeList}" var="place" varStatus="loop">
		            	<c:if test="${place.user_seq eq sessionScope.user_seq}">
		            		<c:set var="imagePaths" value="${place.place_imgs.split(',')}" />
		            		<c:forEach items="${imagePaths}" var="imagePath">
				                <div class="place_s" style="display: ${loop.index<3? 'block': 'none'}">
				                    <img src="${imagePath}" alt="Image" class="place_img">
				                    <input type="text" value="${place.place_seq}" class="place_seq">
				                </div>
			                </c:forEach>
		                </c:if>
		            </c:forEach>
		        </div>
		        
		        
            <c:choose>
                <c:when test="${not empty placeList}">
                    <div class="s_control">
                        <button class="s_prev">이전</button>
                        <button class="s_next">다음</button>
                        <button>호텔 추가</button>
                    </div>
                </c:when>
                <c:otherwise>
                    <span>등록된 호텔 정보가 없습니다.</span><br><br>
                    <button>호텔 등록</button>
                </c:otherwise>
            </c:choose>
            
		    </div>
		</div><br>
	</c:if>
	
	<div class="mypost">
		<span><b>고객센터</b></span><br>
		<a href="#" id="post">문의하러가기</a><br>
		<a href="#" id="mypostlist">나의문의</a><br>
	</div>

</div>
</section>

<footer>
</footer>



</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>


$(document).ready(function() {
	  var slider = $(".slider");
	  var scrollAmount = $(".place_s").outerWidth(true);
	  var totalSlides = slider.find(".place_s").length;
	  var currentSlide = 0;

	  function updateSlider() {
	    slider.animate({ scrollLeft: scrollAmount * currentSlide }, 500);
	  }

	  function showSlides() {
	    var start = currentSlide * 3;
	    var end = start + 3;
	    slider.find(".place_s").hide().slice(start, end).show();
	  }

	  $(".s_prev").click(function() {
	    if (currentSlide > 0) {
	      currentSlide--;
	      updateSlider();
	      showSlides();
	    }
	  })

	  $(".s_next").click(function() {
	    if (currentSlide < Math.ceil(totalSlides / 3) - 1) {
	      currentSlide++;
	      updateSlider();
	      showSlides();
	    }
	  })

	  showSlides();
	})

.on("click", "#myinfo", function() {
var password = prompt("비밀번호를 입력해주세요.");

	if (password === '123') {
		window.location.href = '/MyYonolja_myinfo';
	} else {
		alert('비밀번호가 틀렸습니다.');
	}
})
.on("click", ".place_img", function() {
  var place_seq = $(this).next("input[type='text']").val();
  console.log("place_seq: " + place_seq);
  window.location.href = '/host_managePlace/' + place_seq;
})


 

</script>
</html>

