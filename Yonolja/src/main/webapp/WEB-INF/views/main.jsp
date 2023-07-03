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
  height: 170px;
  width: 100%;
  background-color: white;
  border-top:1px solid #ddd;

  display: grid;
  grid-template-columns:1fr;
  grid-template-rows:1fr 1fr;
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
	opacity:1;
	
	position:relative;
}
#searchbar:hover{ box-shadow: 0px 0px 5px #444;transition:0.5s;}
.searchbar_item{display:flex;width:100%;height:100%;align-items:center; justify-content:center;}
.searchbar_item:nth-child(1){
	border-right:1px solid #ddd;
	/* 여기에 text-overflow 처리  */
	overflow:hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
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
.environmentBox {
	width:95%;
	height:80px;
	
	
	display:grid;
	grid-template-columns:1fr 30fr 1fr 2fr;
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


.environments{
	white-space:nowrap;
	overflow:hidden;
	display:flex;
	position:relative;
	height:100%;
	place-items:center;
	box-sizing: border-box;
 	border-style: solid;
	border:0px solid #ddd;
	border-left:0px solid #f1f1f1;
	border-right:0px solid #f1f1f1;
}
.environment{
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr auto;
	height:60%;
	width:110px;
	min-width:110px;
	max-width:111px;
	font-size:13px;
	text-align:center;
	color:gray;
	cursor:pointer;
	
	transition:0.5s;
}
.environment_selected{
	border-bottom:1px solid black;
	font-size:bold;
	color:black;
}
.environment_picture{
	height:30px;
}
.environment:hover{
	border-bottom:1px solid #ddd;
	font-size:bold;
	color:black;
}
.environment img{
	height:25px;
	width:25px;
	margin:0px;
}

.environment_left{
	border-radius:50% 50% 50% 50%;
	border:1px solid black;
	cursor:pointer;
	z-index:2;
	background-color:white;
	display:none;
}
.environment_left:hover{border:2px solid black;font-weight:bold}
.environment_right{
	border-radius:50% 50% 50% 50%;
	border:1px solid black;
	cursor:pointer;
	z-index:2;
	background-color:white;
	display:none;
}
.environment_right:hover{border:2px solid black;font-weight:bold}
.environmentBox:hover div button{display:block;}

section{
	
}
section.forList{
	padding-top: 155px; padding-bottom: 150px;
	margin-left:20px;
	margin-top:20px;
	display: grid;
    gap: 5px;
    grid-template-columns: repeat(auto-fill, 280px); /* 200px짜리 영역을 갯수만큼 만듬 */
    grid-auto-rows: 400px; /* 줄바꿈 될때마다 자동으로 200px 로우 생성 */
}
section.forMap{
	display:grid;
	grid-template-columns:1fr;
    grid-auto-rows: 1fr;
    place-items:center;
}

div[class*=portrait]{

}
div[class*=portrait]:hover{
	border-bottom:4px solid #ddd;
}

/*				modal css 부분 				*/


#modal{
	border:2px solid #ddd;
	border-radius:5% 5% 5% 5% / 50% 50% 50% 50%;
	background-color:white;
	height:60px;
	z-index:4;
	display:none;
	overflow:hidden;
	max-width:780px;
	
	position:relative;
}
#modal.show{
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	place-items:center;
	width:50%;
	min-width:600px;
}
.header_container2.hide{
	display:none;
}
#modal_background{
	top:0;
	left:0;
	position:fixed;
	width:100%;
	height:100%;
	background-color:rgb(0,0,0,0.2);
	z-index:3;
	display:none;
}
#modal_background.show{
	display:block;
}
#modal_content{
	display:grid;
	grid-template-columns:3fr 3fr 3fr 1fr; 
	grid-template-rows:1fr;
	place-items:center;
	width:100%;
	height:100%;
	font-size:16px;
}
.modal_cell:nth-child(-n+3){
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr 1fr;
	width:100%;
	height:100%;
	text-align:center;
	cursor:pointer;
}
.modal_cell:nth-child(4){
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	
	width:100%;
	height:100%;
	text-align:center;
	cursor:pointer;
	place-items:center;
}
.modal_cell div input{
	width:80%;
	border:0px;
}

.modal_cell:hover{
	background-color:#ddd;
}
.modal_cell:hover input{
	
}
.modal_cell input{
	cursor:pointer;
	height:20px;
}
.modal_cell{
	background-color:#ddd;
}
.modal_cell:nth-child(-n+2){
	border-right:1px solid #ddd;
}

.modal_cell.checked{
	background-color:white;
}
.modal_cell:nth-child(3).checked{
	background-color:white;
}
.modal_cell:nth-child(3).checked ~ .modal_cell{
	background-color:white;
}

#searchbar.hide{
	display:none;
}
#just_sentence{
	display:none;
}
#just_sentence.show{
	display:block;
}

#search{
	width:50px;
}
#search:hover{
	transition:0.1s;
	width:53px;
}
#modal_content2{
	position:fixed;
	top:170px;
	background-color:white;
	width:600px;
	height:500px;
	border:1px solid #ddd;
	border-radius:7% 7% 7% 7%;
	box-shadow: 0px 3px 9px rgba(0,0,0,.5);
	overflow:hidden;
}

#modal_searchBox{
	width:100%;
	height:100%;
	
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	
	place-items:center;
}
.modal_search{
	display:none;
	width:90%;
	height:90%;
	overflow-y:auto;
}
.modal_search.reveal{
	display:block;	/* 첫번째,두번째,세번째 다 다르게. 여기부터 생각해서 하면됨.*/
	height:90%;
	
}



.modal_search h3{
	margin-left:20px;
}
.map{
	width:130px;
	height:150px;
	
	display:grid;
	grid-template-columns:130px;
	grid-template-rows:130px 20px;
	place-items:center;
	float:left;
	position:relative;
	margin:20px;
}
.map img{
	height:100%;
	width:100%;
	border:1px solid #ddd;
	border-radius:10px 10px 10px 10px;
	cursor:pointer;
}
.map img:hover{
	background-color:#ddd;
	border:1px solid black;
	transition:0.3s;
}

.setGuest{
	display:grid;
	grid-template-columns:1fr 1fr;
	grid-template-rows:1fr;
	text-align:center;
	margin:15px;
}
.setGuest span{
	font-size:25px;
	font-weight:bold;
}
.setGuest button{
	border:1px solid #ddd;
	font-size:20px;
	font-weight:bold;
	cursor:pointer;
}
.setGuest button:hover{
	background-color:#ddd;
}
.setGuest input{
	width:40px;
	height:30px;
	font-size:25px;
}
.setGuest input[type="number"]::-webkit-outer-spin-button,
.setGuest input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.howmanyGuest{
	border:1px solid #ddd;
}
#totalAmountOfGuest{
	width:90%;
	height:40px;
	text-align:center;
	border:0px;
	font-weight:bold;
	font-size:30px;
}

#searchResult{
	text-align:left;
	font-size:20px;
	color:gray;
}
#searchResult div{
	width:90%;
	text-indent:2em;
}

#searchResult span{
	font-size:25px;
	color:black;
}


/* 지도표시하기. 위에있는 class map 이랑 다르니깐 조심할것. */
#mapButton {
  position: fixed;
  bottom: 130px; 
  left: 50%; 
  transform:translateX(-50%);
  width:140px;
  height:50px;
  background-color: #222222;

  display: grid;
  grid-template-columns:1fr;
  grid-template-rows:1fr;
  place-items:center;
  z-index:2;

  border-radius:15% 15% 15% 15% / 50% 50% 50% 50%;
  color:white;
  font-weight:bold;
  font-size:14px;
  cursor:pointer;
  text-indent:-1.5em;
  border:0px;
}
#mapButton.hide{
	display:none;
}
#mapButton img{
	position:absolute;
	height:50%;
	right:10px;
	display:inline;
}
#mapButton:hover{
  width:144px;
  height:54px;
  font-size:15px;
  left: 50%; 
  transform:translateX(-50%);
  transition:0.2s;				/* 맵 클릭해서 나오는 지도에 ajax로 불러온 place 다 담으면 됨 */
}
#listButton {
  position: fixed;
  bottom: 130px; 
  left: 50%; 
  transform:translateX(-50%);
  width:125px;
  height:50px;
  background-color: #222222;

  display: grid;
  grid-template-columns:1fr;
  grid-template-rows:1fr;
  place-items:center;
  z-index:2;

  border-radius:15% 15% 15% 15% / 50% 50% 50% 50%;
  color:white;
  font-weight:bold;
  font-size:14px;
  cursor:pointer;
  text-indent:-1.5em;
  border:0px;
}
#listButton.hide{
	display:none;
}
#listButton img{
	position:absolute;
	height:40%;
	right:10px;
	display:inline;
}
#listButton:hover{
  width:130px;
  height:54px;
  font-size:15px;
  left: 50%; 
  transform:translateX(-50%);
  transition:0.2s;				
}



#map{
	position:fixed;
	top:175px;
	bottom:105px;
	width:97%;
	z-index:1;
	background-color:gray;
/*	max-width:2400px;
	max-height:1000px;	*/
	border:20px solid #ddd;
}

.place_customOverlay{
	background-color:white;
	border:0.3px solid black;
	color:black;
	font-weight:bold;
	font-size:14px;
	text-decoration:none;
	border-radius:15% 15% 15% 15% / 50% 50% 50% 50%;
	box-shadow: 0px 0px 5px #444;
	cursor:pointer;
}
.place_customOverlay:hover{
	background-color:#ddd;
	font-size:16px;
	transition:0.5s;
}


#calendar{
	border-collapse:collapse;
	border:1px solid black;
}


#filter{
	position:relative;
	width:80px;
	height:50px;
	background-color:white;
	border-radius:10% 10% 10% 10%;
	font-size:15px;
	font-weight:bold;
	border:1.5px solid #ddd;
	cursor:pointer;
	text-align:right;
}
#filter:hover{
	box-shadow: 0px 0px 5px #444;transition:0.3s;
	width:83px;
	height:53px;
}
#filter img{
	position:absolute;
	height:40%;
	left:10px;
}



/*     여기부터는 filter modal css    */
#filterModal{
	position:fixed;
	left:50%;
	top:50%;
	transform:translate(-50%,-50%);
	border:1px solid black;
	border-radius:10px 10px 10px 10px;
	box-shadow: 0px 3px 9px rgba(0,0,0,.5);
	background-color:white;
	
	/* 크기는 나중에 없앨거, 안에있는 애들 크기에 맞게 알아서 커지게*/
	width:600px;
	height:90%;
	
	overflow:auto;
	scrollbar-width: thin;
	scrollbar-color: #999999 #f0f0f0;
	
	display:grid;
	/* place type 검색, place options 검색, 가격검색 가능해야함 그리므로 row 가 3개정도. 제목까지해서 4개 */
	grid-template-rows:35px 150px auto auto 100px;
	place-items:center;
	z-index:5;
	
	-ms-overflow-style: none;
}
#filterModal::-webkit-scrollbar{
  display:none;
}
#filterModal_background{
	position:fixed;
	left:0;
	top:0;
	width:100%;
	height:100%;
	background-color:rgb(0,0,0,0.2);
	z-index:4;
	display:none;
}
#filterModal div{
	border-top:1px solid #ddd;
	border-bottom:1px solid #ddd;
	width:90%;
	height:100%;
}
#filterModal div:nth-child(1){
	text-align:center;
	font-weight:bold;
	font-size:25px;
}

#filterModal div:nth-child(2){
	font-weight:bold;
}
#filterModal div:nth-child(2) input{
	height:50px; width:180px; font-size:23px;
	text-align:center;
}
#filterModal div:nth-child(2) input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
#filterModal div:nth-child(2) label{
	font-size:15px; font-weight:bold;
	color:gray;
}
#filterModal div:nth-child(2) button{
	border-radius:50% 50% 50% 50%;
	background-color:white;
	width:25px;
	height:25px;
	cursor:pointer;
}
#filterModal div:nth-child(2) button:hover{
	width:27px;
	height:27px;
	background-color:#ddd;
	transition:0.3s;
}
#filterModal div:nth-child(3){
	font-size:20px; font-weight:bold;
}
#filterModal div:nth-child(3) input{
	width:20px;
	height:15px;
}

#filterModal div:nth-child(4){
	font-size:20px; font-weight:bold;
}
#filterModal div:nth-child(4) input{
	width:20px;
	height:15px;
}
#filterModal div:nth-child(5) {
	display:grid;
	grid-template-columns:1fr 1fr;
	grid-template-rows:1fr;
	place-items:center;
}
#filterModal div:nth-child(5) button{
	width:120px;
	height:50px;
	background-color:#222222;
	color:white;
	border:0px solid black;
	border-radius:15% 15% 15% 15% / 50% 50% 50% 50%;
	font-size:20px;
	font-weight:bold;
	cursor:pointer;
}
#filterModal div:nth-child(5) button:hover{
	width:123px;
	height:53px;
	font-size:23px;
	transition:0.2s;
}

.bak{
	color:gray;
	font-size:12px;
}
</style>
<div id=modal_background></div>
<body>

<button id=mapButton>
	지도 표시하기<img src="/img/website/map2.png">
</button>

<button id=listButton class=hide>
	목록 보기<img src="/img/website/list2.png">
</button>

<header>
<div class=header_container>
		<div class=header_item>
			<a href="/main"><img id=logo src="/img/website/header_logo.png"></a>
		</div>
		<div class=header_item>
			<button id=searchbar>
				<div class=searchbar_item id=searchbar_where>어디든지</div>
				<div class=searchbar_item id=searchbar_when>언제든지</div>
				<div class=searchbar_item id=searchbar_howmanypeople>게스트추가</div>
				<div class=searchbar_item><img id=search_img src="/img/website/search2.png"></div>
			</button>
			<div id=just_sentence><h1 style="min-width:350px">카테고리 검색</h1></div>
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

<div id="modal">
		<div id="modal_content">
			<div class="modal_cell">
				<div><b>여행지</b></div>	
				<div><input id=where type=text placeholder="여행지입력" style="width:80px;"></div>
			</div>
			<div class="modal_cell">
				<div><b>날짜</b></div>
				<div>
					<input id=when_checkin type=text placeholder="체크인" style="width:70px;text-align:center;" readonly> - 
					<input id=when_checkout type=text placeholder="체크아웃" style="width:70px;text-align:center;" readonly>
				</div>
			</div>
			<div class="modal_cell">
				<div><b>인원수</b></div>
				<div><input id=howmanypeople type=text placeholder="인원수" style="width:60px;text-align:center" readonly></div>
			</div>
			<div class="modal_cell" id="category_search">
				<div><img id=search src="/img/website/search2.png"></div>
			</div>
		</div>
		
		<div id="modal_content2">
			<div id="modal_searchBox">
			
				<div class="modal_search" id="location_search">
					<h3>지역으로 검색하기</h3>
					<div class=map>
						<div><img src="/img/cities/서울.png" name="서울"></div>
						<div><h5>서울</h5></div>
					</div>
					<div class=map>
						<div><img src="/img/cities/부산.png" name="부산"></div>
						<div><h5>부산</h5></div>
					</div>
					<div class=map>
						<div><img src="/img/cities/대전.png" name="대전"></div>
						<div><h5>대전</h5></div>
					</div>
					<div class=map>
						<div><img src="/img/cities/대구.png" name="대구"></div>
						<div><h5>대구</h5></div>
					</div>
					<div class=map>
						<div><img src="/img/cities/광주.png" name="광주"></div>
						<div><h5>광주</h5></div>
					</div>
					<div class=map>
						<div><img src="/img/cities/제주.png" name="제주"></div>
						<div><h5>제주</h5></div>
					</div>
					
				</div>
				
				
				<div class="modal_search" id="date_search">
					
					
				</div>
				
				
				<div class="modal_search" id="howmanypeople_search">
					<h3>인원수 정하기</h3>
					<div class="setGuest">
						<div><span>어른</span></div>
						<div>
							<button class=minus_guest>-</button>
							<input type=number class=howmanyGuest id=howmanyAdults value=1 min=1 readonly>
							<span>명</span>
							<button class=plus_guest>+</button>	
						</div>
					</div>
					<div class="setGuest">
						<div><span>어린이</span></div>
						<div>
							<button class=minus_guest>-</button>
							<input type=number class=howmanyGuest id=howmanyChildren value=0 min=0 readonly>
							<span>명</span>
							<button class=plus_guest>+</button>	
						</div>
					</div>
					<h3>총 인원수</h3>
						<div class=totalAmountOfGuest><input type=text id=totalAmountOfGuest placeholder="아직 정하지 않음" readonly></div>
					<h3>검색내역 종합</h3>
						<div id=searchResult>
							<!--  
							<div><span>부산</span>에서</div>
							<div>2023.07.15 - 2023.07.23 동안</div>
							<div>13명이 </div>
							<div>지낼곳을 찾습니다.</div>
							-->
						</div>
				</div>
				
				
			</div>
		</div>
</div>



<div class=header_container2>

	<div class=environmentBox>
		<div id=leftBtnBox> <button class=environment_left> < </button> </div>
		<div class=environments>

		
	
		</div>
		<div id=rightBtnBox> <button class=environment_right> > </button> </div>
		<div class=btnBox>
			<button id=filter><img src="/img/website/filter_img.png"> 필터</button>
		</div>
	</div>
</div>
</header>




<section>

	
	
</section>



<!--  modal for filter  -->
<div id=filterModal_background>
	<div id=filterModal>
		<div>필터</div>
		<div>
			<h3>가격범위</h3>
			<button id=priceMinus>-</button> 
			<input type=text id=highest placeholder="(가격입력)" min=10000 value=100,000 readonly>
			<button id=pricePlus>+</button>
			&nbsp;￦ 이하
			<label> &nbsp; 의 방을 찾습니다.</label>
		</div>
		<div id=placetype_checkboxes>
			<h3>건물유형</h3>
		</div>
		<div id=placeoptions_checkboxes>
			<h3>편의시설</h3>
		</div>
		<div>
			<button id=filterInfoSave> 저장하기 </button> <button id=filterCancel> 나가기 </button>
		</div>
	</div>
</div>


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
<script type="text/javascript" src="/js/calendarMaker.js"></script>
<script type="text/javascript" src="/js/portraitMaker2.js"></script>
<script>


/////////////////////////////////////////// cookie ////////////////////////////////////////////////////
// 쿠키 삭제

document.cookie = "checkin= ; expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "checkout= ; expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "howmanyChildren= ; expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "howmanyAdults= ; expires=Tue, 19 Jan 2000 03:14:07 GMT;"








////////////////////////////////////  javascript /////////////////////////////////////////



searchbar =  document.getElementById('searchbar');
modal = document.getElementById('modal');
header_container2 = document.getElementsByClassName('header_container2')[0];
modal_background = document.getElementById('modal_background');
just_sentence = document.getElementById('just_sentence');
modal_cells_where = document.getElementsByClassName('modal_cell')[0];
modal_cells_when = document.getElementsByClassName('modal_cell')[1];
modal_cells_howmanypeople = document.getElementsByClassName('modal_cell')[2];
category_search = document.getElementById('category_search');

searchbar.addEventListener('click',function(event){
	
	if(! (header_container2.classList.contains('hide') && modal.classList.contains('show') ))
	{
		header_container2.classList.add('hide');
		modal.classList.add('show');
		modal_background.classList.add('show');
		this.classList.add('hide');
		just_sentence.classList.add('show');
		
		if(event.target.id=='searchbar_where'){
			show_where();			
		} else if(event.target.id=='searchbar_when'){
			show_when();
		} else if(event.target.id=='searchbar_howmanypeople'){
			show_howmanyPeople();
			searchResult();
		} else {
			show_where();
		}
		
	} 
})


// 이거 나중에 여유되면, jquery 로 해서 filter modal 처럼 애니메이션 줘보기. 가능할듯.
document.addEventListener('click',function(event){
	console.log(event.target.id);
	if( event.target.id === 'modal_background' ){
		header_container2.classList.remove('hide');
		modal.classList.remove('show');
		modal_background.classList.remove('show');
		searchbar.classList.remove('hide');
		just_sentence.classList.remove('show');
	}
	
	else if(event.target.id==='filterModal_background'){
		$('#filterModal').fadeOut(200,function(){
			$('#filterModal_background').css('display','none')
			$('body').css('overflow','auto');
		})
	}
})




// 그냥 modal_cell jquery 대신 javascript 로 해봄.
modal_cells_where.addEventListener('click',function(){
	show_where();
})
modal_cells_when.addEventListener('click',function(){
	show_when();
})
modal_cells_howmanypeople.addEventListener('click',function(){
	show_howmanyPeople();
	searchResult();
})


function show_where(){
	
	formerChecked = document.getElementsByClassName('checked')[0];
	if(formerChecked!=null){formerChecked.classList.remove('checked');}
	modal_cells_where.classList.add('checked');
	
	$('#where').trigger('focus');	// 걍몰라서 jquery 로 씀.
	
	formerReveal = document.getElementsByClassName('reveal')[0];
	if(formerReveal != null){formerReveal.classList.remove('reveal');}
	document.getElementById('location_search').classList.add('reveal');
	
}

function show_when(){
	
	formerChecked = document.getElementsByClassName('checked')[0];
	if(formerChecked!=null){formerChecked.classList.remove('checked');}
	modal_cells_when.classList.add('checked');
	
	formerReveal = document.getElementsByClassName('reveal')[0];
	if(formerReveal != null){formerReveal.classList.remove('reveal');}
	document.getElementById('date_search').classList.add('reveal');
	
}

function show_howmanyPeople(){
	
	formerChecked = document.getElementsByClassName('checked')[0];
	if(formerChecked!=null){formerChecked.classList.remove('checked');}
	modal_cells_howmanypeople.classList.add('checked');
	
	formerReveal = document.getElementsByClassName('reveal')[0];
	if(formerReveal != null){formerReveal.classList.remove('reveal');}
	document.getElementById('howmanypeople_search').classList.add('reveal');
	
	
}

////////////////////////////////////  jquery	//////////////////////////////////////////
$(document)
.ready(function(){
	getPlaceEnvironments();
	getPlaces();
	calendar = calendarMaker();
	$('#date_search').append( calendar.getTag() );
	$('body').append( calendar.getCss() );
	calendar.fillCalendar();
	calendar.setAim('when_checkin','when_checkout')
	fill_placeType_checkBoxes();
	fill_placeOption_checkBoxes();
})
.on('click','.environment_left',function(){
	$('.environments').animate({scrollLeft:$('.environments').scrollLeft()-350},250)
})
.on('click','.environment_right',function(){
	$('.environments').animate({scrollLeft:$('.environments').scrollLeft()+350},250)
})

// environment 클릭시 그 환경을 가진 places 만 출력 
.on('click','.environment',function(){
	
	$('.environment_selected').removeClass('environment_selected');
	
	seq = $(this).attr('id');
	$(this).addClass('environment_selected');
	selected_environment = seq;
	getPlaces('environment');
})
.on('click','#category_search',function(){
	console.log('검색'); // 여기에다가 ajax 로 server data 보내고 검색결과에따라 place List 받아오는거 해야함
})
.on('click','.map img',function(){
	cityName = $(this).attr('name');
	$('#where').val(cityName);
	show_when();
	$('#where').trigger('blur')
})

// 어른 어린이 인원수 +,- 하는거
.on('click','.plus_guest',function(){
	formerNumber = $(this).parent().find('input').val()
	$(this).parent().find('input').val( (parseInt(formerNumber)+1 ));
	if( $('#howmanyAdults').val()==0 && $('#howmanyChildren').val()!=0){
		$('#howmanyAdults').val(1);
	}
	setTheAmountOfGuest();
	searchResult();
})
.on('click','.minus_guest',function(){
	formerNumber = $(this).parent().find('input').val()
	
	if($(this).parent().find('input').attr('id')=='howmanyAdults'){
		if(parseInt(formerNumber-1)<1){return false;}
	}
	else if(parseInt(formerNumber-1)<0){return false;}
	
	$(this).parent().find('input').val( (parseInt(formerNumber)-1 ));
	if( $('#howmanyAdults').val()==0 && $('#howmanyChildren').val()!=0){
		$('#howmanyAdults').val(1);
	}
	setTheAmountOfGuest();
	searchResult();
})

// 지도버튼 클릭시 지도생성

.on('click','#mapButton',function(){
	showPlaceMap();
	$(this).addClass('hide');
	$('#listButton').removeClass('hide');
})
.on('click','#listButton',function(){
	showPlaceList();
	$(this).addClass('hide');
	$('#mapButton').removeClass('hide');
})
// search
.on('click','#search',function(){
	
	destination_decided = $('#where').val()
	checkin_decided = $('#when_checkin').val();
	checkout_decided = $('#when_checkout').val();
	howmanyAdults_decided = parseInt( $('#howmanyAdults').val() );
	howmanyChildren_decided = parseInt( $('#howmanyChildren').val() );
	
	$('#modal_background').trigger('click');
	getPlaces();
	
})



// 필터버튼을 눌렀을 때, 작동하는 코드 
.on('click','#filter',function(){
	
	// 만약에 저장된 정보가 있으면, 그대로 채워주고,
	// 체크박스 눌러만놓고 나갔으면, 그냥 초기화
	if(price_decided!=null){ $('#highest').val( parseInt(price_decided).toLocaleString() ) }
	else{ $('#highest').val('10,000') }
	
	if(placeTypes_decided!=null){
		checkedTypes = placeTypes_decided.split(",");
		for(i=0;i<$('.placeType_checkbox').length;i++){
			eachVal = $('.placeType_checkbox:eq('+i+')').val();
			if(checkedTypes.includes(eachVal)){
				$('.placeType_checkbox:eq('+i+')').prop('checked',true);
			}
		}
	} else {
		for(i=0;i<$('.placeType_checkbox').length;i++){
			$('.placeType_checkbox:eq('+i+')').prop('checked',false);
		}
	}
	
	if(roomtypeOptions_decided!=null){
		checkedOptions = roomtypeOptions_decided.split(",");
		for(i=0;i<$('.placeOption_checkbox').length;i++){
			eachVal = $('.placeOption_checkbox:eq('+i+')').val();
			if(checkedOptions.includes(eachVal)){
				$('.placeOption_checkbox:eq('+i+')').prop('checked',true);
			}
		}
	} else {
		for(i=0;i<$('.placeOption_checkbox').length;i++){
			$('.placeOption_checkbox:eq('+i+')').prop('checked',false);
		}
	}
	
	$('body').css('overflow','hidden');
	$('#filterModal').fadeOut(0)
	$('#filterModal_background').css('display','block')
	$('#filterModal').fadeIn(300);
	
	
})
/*
 
위에 document click 하는거 있어서 거기서 했음
.on('click','document',function(event){
	console.log(event.target.id)
	if(event.target.id=='filterModal_background'){
		$('#filterModal').fadeOut(200,function(){
			$('#filterModal_background').css('display','none')
		})
	}
})
*/

// 어떤가격 이하 방 찾을때 버튼
.on('click','#pricePlus',function(){
	
	currentPrice = parseInt( $('#highest').val().replace(",","") );
	$('#highest').val( (currentPrice + 10000).toLocaleString() );
	
})
.on('click','#priceMinus',function(){
	currentPrice = parseInt( $('#highest').val().replace(",", "") );
	if(currentPrice-10000 < 10000){ return false; }
	$('#highest').val( (currentPrice - 10000).toLocaleString() );
})


.on('click','#filterInfoSave',function(){
	
	priceStr = $('#highest').val().replace(",","");
	
	placeTypeStr = '';
	for(i=0;i<$('.placeType_checkbox:checked').length;i++){
		if(i==0){
			placeTypeStr += $('.placeType_checkbox:checked:eq('+i+')').val();
		} else {
			placeTypeStr += "," + $('.placeType_checkbox:checked:eq('+i+')').val();
		}
	}
	
	placeOptionStr = '';
	for(i=0;i<$('.placeOption_checkbox:checked').length;i++){
		if(i==0){
			placeOptionStr += $('.placeOption_checkbox:checked:eq('+i+')').val();
		} else {
			placeOptionStr += "," + $('.placeOption_checkbox:checked:eq('+i+')').val();
		}
	}
	
	
	price_decided = priceStr;
	placeTypes_decided = placeTypeStr;
	roomtypeOptions_decided = placeOptionStr;
	
	$('#filterModal_background').trigger('click');
	getPlaces();
	showPlaceList();
	
})
.on('click','#filterCancel',function(){
	$('#filterModal_background').trigger('click');
})


/////////////////////////////////// 여기서 roomtype url 처리 /////////////////////////////////////////////////////

// url 은 roomtype/checkin/checkout/howmanypeople 로 하자.

.on('click','.place_customOverlay',function(){
	placeSeq = $(this).attr('id');
	
	if(checkin_decided!=null && checkout_decided!=null){
		document.cookie = "checkin=" + checkin_decided;
		document.cookie = "checkout=" + checkout_decided;
	}
	
	if(howmanyAdults_decided!=null){
		document.cookie = "howmanyAdults=" + howmanyAdults_decided;
	}
	if(howmanyChildren_decided!=null){
		document.cookie = "howmanyChildren=" + howmanyChildren_decided;
	}
	
	document.location = "/place/" + placeSeq;
	return false;
})

.on('click','ul[class*=pictureList]',function(){
	
	placeSeq = $(this).attr('name') 
	
	if(checkin_decided!=null && checkout_decided!=null){
		document.cookie = "checkin=" + checkin_decided;
		document.cookie = "checkout=" + checkout_decided;
	}
	
	if(howmanyAdults_decided!=null){
		document.cookie = "howmanyAdults=" + howmanyAdults_decided;
	}
	if(howmanyChildren_decided!=null){
		document.cookie = "howmanyChildren=" + howmanyChildren_decided;
	}
	
	document.location = "/place/" + placeSeq;
	return false;
})
.on('click','div[class*=portrait] div[class*=body]',function(){
	
	placeSeq = $(this).attr('name') 
		
	if(checkin_decided!=null && checkout_decided!=null){
		document.cookie = "checkin=" + checkin_decided;
		document.cookie = "checkout=" + checkout_decided;
	}
	
	if(howmanyAdults_decided!=null){
		document.cookie = "howmanyAdults=" + howmanyAdults_decided;
	}
	if(howmanyChildren_decided!=null){
		document.cookie = "howmanyChildren=" + howmanyChildren_decided;
	}
	
	document.location = "/place/" + placeSeq;
	return false;
})





// 윈도우창을 늘이거나 줄일때 지도의 사이즈를 재설정하기 
window.addEventListener('resize',function(){
	if($('section').hasClass('forMap')){
		showPlaceMap();
		console.log('지도크기 조정')
	}
})

// 내정보버튼 drop down
$('html').click(function(e){
	clicked = $(e.target).attr('id');
	if(clicked=='user_profile'||clicked=='mypage_button'){
		if( $('.sub').css('display')=='none'  ){ $('.sub').css('display','block')} 
		else { $('.sub').css('display','none')}
	} else { $('.sub').css('display','none') }
})
// 스크롤시 header 에 효과주기 
$(window).scroll(function(){
    if($(document).scrollTop() > 0) {
        $('.header_container2').addClass('movingHeader');
    } else {
        $('.header_container2').removeClass('movingHeader');
    }
});

// modal_cell 입력시 다음으로 넘어가기
$('#where').keydown(function(key){
	if(key.keyCode == 13){ //키가 13이면 실행 (엔터는 13)
		show_when();
		$('#where').trigger('blur')
    }
})








/////////////////////////////////////////////////////////////////////////////////////////



/////////////////////////////////// global variables ////////////////////////////////////
let selected_environment = null;
let destination_decided = null;
let checkin_decided = null;
let checkout_decided = null;
let howmanyAdults_decided = null;
let howmanyChildren_decided = null;
let price_decided = null;
let placeTypes_decided = null;
let roomtypeOptions_decided = null;

let placesToShow = [];
let coordinates = [];
let MAP = null;
/////////////////////////////////////////////////////////////////////////////////////////




/////////////////////////////////////// functions ////////////////////////////////////// 

// place-environments 를 채우는 function
function getPlaceEnvironments(){
	$('.environments').empty();
	
	$.ajax({url:'/getPlaceEnvironments', type:'post', dataType:'json', 
		
		success:function(data){
			
			for(i=0;i<data.length;i++){
				seq = data[i].seq;
				name = data[i].name;
				img = data[i].img;
				
				
				environment_str = '<div class=environment id='+ seq +'>';
				environment_str += '<div class=environment_picture>'
				environment_str += "<img src='" + img + "'>"
				environment_str += '</div>'
				environment_str += '<div class=environment_name>' + name + '</div>'
				environment_str += '</div>'
				$('.environments').append(environment_str);
			}
		}
	})
}

// 가져온 places 들을 places array 에 하나하나의 object element 로 담는 method
function getPlaces(){

	
	if(destination_decided==null || destination_decided=='')
	{ $('#searchbar_where').text('어디든지') }
	else { 
		if(destination_decided.length>=6){
			newstr = destination_decided.substring(0,4) + "..";
			$('#searchbar_where').text(newstr);
		} else {
			$('#searchbar_where').text(destination_decided);
		}
	}
	
	if(checkin_decided==null || checkin_decided=='')
	{ $('#searchbar_when').text('언제든지') }
	else { $('#searchbar_when').text(checkin_decided + "-" + checkout_decided);}
	
	if(howmanyAdults_decided==null || howmanyAdults_decided==0)
	{ $('#searchbar_howmanypeople').text('게스트추가') }
	else{ $('#searchbar_howmanypeople').text( (howmanyAdults_decided + howmanyChildren_decided)+'명' ) }
	
	$.ajax({url:'/getPlaces', type:'post', dataType:'json', 
		data:{

			selected_environment:selected_environment,
			destination_around:destination_decided,
			checkin:checkin_decided,
			checkout:checkout_decided,
			howmanypeople:(howmanyAdults_decided + howmanyChildren_decided),
			price:price_decided,
			placeTypes:placeTypes_decided,
			roomtype_options:roomtypeOptions_decided

		},
		success:function(data){
			placesToShow = [];
			for(i=0;i<data.length;i++){
				
				data[i].place_seq;
				data[i].place_name;
				data[i].place_address;
				data[i].place_imgs;
				data[i].roomtype_price;
				data[i].place_review;
				
				a_place = {
						'seq':data[i].place_seq,
						'name':data[i].place_name,
						'address':data[i].place_address,
						'imgs':data[i].place_imgs,
						'price':data[i].roomtype_price,
						'reviewRate':data[i].place_review
				}
				placesToShow.push(a_place);
			}
		},
		complete:function(){
			$('#listButton').trigger('click')
		}
	})		
}







function showPlaceList(){	// placeToShow 에 담긴 places 들을 list 로 만들어 section 에 표시하는 함수
	$('section').empty();
	if(!$('section').hasClass('forList')){$('section').addClass('forList');}
	if($('section').hasClass('forMap')){$('section').removeClass('forMap');}
	for(j=0;j<placesToShow.length;j++){
		
		place = placesToShow[j];
		
		portrait = makeStructure();
		rvRate = '리뷰없음'
		if(place.reviewRate!=null && place.reviewRate!=''){
			rvRate = "★ " + place.reviewRate.toFixed(1)
		}
		portrait.setBody(place.seq ,place.name , rvRate , place.address, place.price.toLocaleString() + '원 <span class=bak>(1박)</span>');
		
		if(place.imgs=="" || place.imgs==null){
			
			portrait.add_picture("/img/website/noimg.png");
			
			
			cssStr = portrait.getPortraitCss();
			tagStr = portrait.getPortrait();
			
			$('body').append(cssStr)
			$('section').append(tagStr)
		} else {
			imgsArray = place.imgs.split(",");
			for(b=0;b<imgsArray.length;b++){
				portrait.add_picture(imgsArray[b]);
			}
			
			cssStr = portrait.getPortraitCss();
			tagStr = portrait.getPortrait();
			
			$('body').append(cssStr)
			$('section').append(tagStr)
		}
		
		
	}
	
}
function showPlaceMap(){	// placeToShow 에 담긴 places 들을 kakao map 에 표시하는 함수
	$('section').empty();
	if(!$('section').hasClass('forMap')){$('section').addClass('forMap');}
	if($('section').hasClass('forList')){console.log('forlist');$('section').removeClass('forList');}
	
	// map 생성
	$('section').append('<div id=map></div>')
	let container = document.getElementById('map'); 
	let options = { center: new kakao.maps.LatLng(33.450701, 126.570667), level: 3 };
	let map = new kakao.maps.Map(container, options); 
	map.setMaxLevel(14);
	MAP = map;
	// placesToShow 로부터 address 가져와서 좌표로 변환 후, 그 좌표에 customoverlay 형성, 그리고 지도범위 재설정 
	
	var geocoder = new kakao.maps.services.Geocoder();
	var bounds = new kakao.maps.LatLngBounds();
	placesToShow.forEach(function(place){
		
		address = place.address.split(",")[1];
		geocoder.addressSearch(address,function(result,status){
			
			if(status === kakao.maps.services.Status.OK){
				
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				var customOverlay = new kakao.maps.CustomOverlay({
					position:coords,
					content:'<div id='+ place.seq +' class=place_customOverlay>&nbsp;&nbsp;'+ place.name +'&nbsp;&nbsp;</div>'
				});
				customOverlay.setMap(map); // customOverlay 를 지도에 찍음
				bounds.extend(coords);
				setBounds();	
				
			}
		})
	})
	function setBounds(){
		map.setBounds(bounds);
	}
}

function setTheAmountOfGuest(){
	total = 0;
	for(i=0;i<$('.howmanyGuest').length;i++){
		num = $('.howmanyGuest:eq('+i+')').val();
		num = parseInt( num );
		total = total + num;
	}
	if(total==0){
		$('#howmanypeople').val(null);
		$('#totalAmountOfGuest').val(null);
	} else {
		$('#howmanypeople').val(total + '명')
		$('#totalAmountOfGuest').val(total + '명');
	}

}

// 검색내역 종합을 표시하는 code 
function searchResult(){
	str = '';
	flag = 0;
	if( $('#where').val()!=null && $('#where').val()!='' ){
		str += '<div><span>' + $('#where').val() + '</span>에서</div>'
		flag++;
	}
	if( $('#when_checkin').val()!=null && $('#when_checkout').val()!=null && 
			$('#when_checkin').val()!='' && $('#when_checkout').val()!=''
	){
		str += '<div><span>' + $('#when_checkin').val() + '</span> - '
		str += '<span>' + $('#when_checkout').val() + '</span> 동안</div>'
		flag++;
	}
	if( $('#howmanypeople').val()!=null && $('#howmanypeople').val()!=''  ){
		str += '<div><span>' + $('#howmanypeople').val() + '</span>이</div>'
		flag++;
	}
	
	if(flag==0){str += '<div>아직 정해진 조건이 없습니다.</div>';}
	else {str += '<div>지낼곳을 찾습니다</div>';}
	$('#searchResult').empty();
	$('#searchResult').append(str);
}

function resizeMap(width,height){
	$('#map').width( width );
	$('#map').height( height );
	MAP.relayout();
}


// placetype checkboxes 와 placeoption(roomtype options) checkboxes 를 채워넣는 method.
function fill_placeType_checkBoxes(){
	
	// 초기화부분은 아직선언안함. 사실초기화 안해두되긴함, 맨처음에 ready 만 쓰일 method 라서.
	
	$.ajax({url:'/getPlaceTypes', type:'post', dataType:'json', 
		
		success:function(data){

			str = '<table>';
			
			for(i=0;i<data.length;i++){
				str += '<td><input type=checkbox class=placeType_checkbox value=' + data[i].type_seq + '> ' ;
				str += data[i].type_name + '&nbsp;&nbsp;&nbsp;</td>'
				if((i+1)%3==0){
					str = '<tr>' + str;
					str = str + '</tr>';
				}
			}
			str += '</table>'
			$('#placetype_checkboxes').append(str);
			
			
		}
		
	})
	
	
}
function fill_placeOption_checkBoxes(){
	
	// 초기화부분은 아직선언안함. 사실초기화 안해두되긴함, 맨처음에 ready 만 쓰일 method 라서.
	
	$.ajax({url:'/getPlaceOptions', type:'post', dataType:'json', 
		
		success:function(data){
			str = '<table>';
			
			for(i=0;i<data.length;i++){
				str += '<td><input type=checkbox class=placeOption_checkbox value=' + data[i].option_seq + '> ' ;
				str += data[i].option_name + '&nbsp;&nbsp;&nbsp;</td>'
				if((i+1)%3==0){
					str = '<tr>' + str;
					str = str + '</tr>';
				}
			}

			str += '</table>'
			$('#placeoptions_checkboxes').append(str);
			
		}
		
	})
	
	
}

/////////////////////////////////////////////////////////////////////////////////////////







</script>
</html>

