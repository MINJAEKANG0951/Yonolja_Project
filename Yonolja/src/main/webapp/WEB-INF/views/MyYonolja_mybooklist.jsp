<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
// 세션 만료 여부 확인
if (session.getAttribute("user_id") == null) {
    // 세션 만료 시 /main으로 이동
    response.sendRedirect("/main");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyBookList</title>
<link rel="icon" href="/img/website/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

 .h1_book {
  border-radius: 15px;
  width: 800px;
  margin: auto; 
  padding: 20px; 
  position: relative;
  
  text-align: center;
}

section {
  display: flex;
  justify-content: center;
  align-items: center;
}

.div_book {
  width: 800px;
  margin: auto;
  text-align: center;
  
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
  align-items: center;
  padding: 15px;
  border-bottom: 1px solid black;
}

.div_book2 {
  width: 800px;
  margin: auto;
  text-align: center;
  
  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
  align-items: center;
  padding: 15px; 
  border-bottom: 1px solid black;
}


.div_book > span {
  padding: 4px;
  display: grid;
  align-items: center;
} 


/* 모달창 띄우기 */
#review_modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
#review {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 30%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

/* 리뷰 별 표시 */
.fa-star {
  color: gray;
}

.fa-star.checked {
  color: orange;
}



</style>
<body>
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
<div>
	<h1 class="h1_book"><span>예약내역</span></h1>
	<div class="div_book">
		<span>호텔명</span>
		<span>객실타입</span>
		<span>숙박일</span>
		<span>이용상태</span>	
		<span>리뷰</span>
	</div>
	<div>

	<c:if test="${empty mybook}">
	  <p>예약 내역이 없습니다</p>
	</c:if> 
	
   	<c:forEach items="${mybook}" var="book" varStatus="status">
		<div class="div_book2">
			<%-- <span class="book_link" onclick="redirectToBookView(${book.book_seq})">${book.place_name}</span> --%>
			<span class="book_sp" onclick="redirectToBookView(${book.book_seq})">${book.place_name}</span>
			<span class="book_sp" onclick="redirectToBookView(${book.book_seq})">${book.roomtype_name}</span>
			<span class="book_sp" onclick="redirectToBookView(${book.book_seq})">${book.checkin_date}</span>
			<span class="book_sp" onclick="redirectToBookView(${book.book_seq})">이용전</span>
			<span class="book_sp" onclick="redirectToBookView(${book.book_seq})">미등록</span>
			<input type="text" value="${book.book_seq}" id="seq_${book.book_seq}">
		</div>
	</c:forEach>   
	</div>
</div>

<div id="review_modal">
    <div id="review">
        <span class="close">&times;</span>
        <label>리뷰를 입력해주세요.</label>
        <input type="text" id="content"><br>
        <input type="text" id="book_seq"><br>
        <div id="stars">
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
        </div>
        <button id="review_ok">확인</button>
        <button id="review_c">취소</button>       
    </div>
</div>


</section>

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
$(document)
.ready(function(){
	fillPlaceOptions();
})
.on('click','.option_left',function(){
	$('.options').animate({scrollLeft:$('.options').scrollLeft()-350},250)
})
.on('click','.option_right',function(){
	$('.options').animate({scrollLeft:$('.options').scrollLeft()+350},250)
})
.on('click','.option',function(){
	seq = $(this).attr('id');
	console.log(seq);

})
// 내정보버튼 drop down
$('html').click(function(e){
	clicked = $(e.target).attr('id');
	if(clicked=='user_profile'||clicked=='mypage_button'){
		if( $('.sub').css('display')=='none'  ){ $('.sub').css('display','block')} 
		else { $('.sub').css('display','none')}
	} else { $('.sub').css('display','none') }
})
function fillPlaceOptions(){
	
	$('#options').empty();
	
	$.ajax({url:'/getPlaceOptions', type:'post', dataType:'json', 
		
		success:function(data){
			
			for(i=0;i<data.length;i++){
				seq = data[i].seq;
				name = data[i].name;
				img = data[i].img;
				
				
				option_str = '<div class=option id='+ seq +'>';
				option_str += '<div class=option_picture>'
				option_str += "<img src='" + img + "'>"
				option_str += '</div>'
				option_str += '<div class=option_name>' + name + '</div>'
				option_str += '</div>'
				$('.options').append(option_str);
			}
			option_scroll_coor_max = (data.length*150);
		}
	})
}

//
$(document)
/* .on("click", "#myinfo", function() {
    $("#review_modal").show();
})*/

.on("click", ".close", function() {
    $("#review_modal").hide();
    $("#book_seq").val(''); // 추가된 부분: 비밀번호 입력 필드 초기화

})

.on("click", "#review_c", function() {
    var book_seq = $("#book_seq").val();
    var content = $("#content").val();
    
    // 모든 별의 'checked' 클래스 제거하고 별점 초기화
    document.querySelectorAll('.fa-star').forEach(item => {
        item.classList.remove('checked');
    });
    starRating = 0;    
    
    $("#book_seq").val("");
    $("#content").val("");
    
    $("#review_modal").hide();
    
})

.on("click", "#review_ok", function() {
    var book_seq = $("#book_seq").val();
    var content = $("#content").val();
	
    console.log("book_seq: ", book_seq, "별점: ",starRating, "content: ", content);
    
    if(content=="") {
    	console.log("내용을 입력해주세요.");
    	alert("내용을 입력해주세요.");
    	return false;
    }
    
    if(starRating==0) {
    	console.log("1개 이상의 별점을 선택해주세요.");
    	alert("1개 이상의 별점을 선택해주세요.");
    	return false;
    }

/*
    // 모든 별의 'checked' 클래스 제거하고 별점 초기화
     document.querySelectorAll('.fa-star').forEach(item => {
        item.classList.remove('checked');
    });
    starRating = 0;    
    
    $("#book_seq").val("");
    $("#content").val("");

	$("#review_modal").hide(); 
	*/
     
    // 리뷰 insert 리뷰등록
 	$.ajax({
		url: '/book_review_insert',
		type: 'post',
		data: {review_content: content,
			   review_star: starRating,
			   book_seq: book_seq
			  },
		success: function(data) {
			console.log("content: ", content,  "별점: ",starRating, "book_seq: ", book_seq);
			
			/* $('#review_c').trigger('click'); */
			if(data=="ok") {
				$('#review_c').trigger('click');
				alert("등록되었습니다.");
				location.reload();
			} else {
				
			}
			
		}
	})  
    
    
})

let starRating = 0;

document.querySelectorAll('.fa-star').forEach((item, index) => {
  item.addEventListener('click', event => {
    // 별 모두 기본색으로 변경
    document.querySelectorAll('.fa-star').forEach(item => {
      item.classList.remove('checked');
    });
    // 클릭한 별까지 색 변경
    event.target.classList.add('checked');
    let target = event.target;
    while (target.previousElementSibling != null) {
      target = target.previousElementSibling;
      target.classList.add('checked');
    }
    // 별점 저장 (index는 0부터 시작하므로 1을 더해줌)
    starRating = index + 1;
  })
})

// 별점을 AJAX 요청에 포함시키려면 다음과 같이 사용할 수 있습니다.
/*
$.ajax({
  url: '/some-url',
  type: 'post',
  data: {
    rating: starRating,
    // other data...
  },
  success: function(response) {
    // handle success...
  }
});
*/


  
  function redirectToBookView(bookSeq) {
	    // ID 값으로 각 book_seq에 해당하는 input 태그를 찾아서, 그 값을 읽어옵니다.
	    var bookSeqValue = document.getElementById("seq_" + bookSeq).value;
	    
	    // review_modal에서의 input 필드에 해당 값을 설정합니다.
	    document.getElementById("book_seq").value = bookSeqValue;
	    
	    // 그 다음에 모달을 보여줍니다.
	    $("#review_modal").show();
	}
	

</script>
</html>