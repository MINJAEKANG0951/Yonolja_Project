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
	padding-top: 150px; padding-bottom: 150px;
	margin-left:30px;
	margin-top:30px;
	display: grid;
    gap: 15px;
    grid-template-columns: repeat(auto-fill, 300px); /* 200px짜리 영역을 갯수만큼 만듬 */
    grid-auto-rows: 400px; /* 줄바꿈 될때마다 자동으로 200px 로우 생성 */
    &__card { /* 카드의 크기는 각 grid 영역으로 잡음 */
      width: 100%;
      height: 100%;
      background-color: #fff;
      box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.07);
      border-radius: 8px;
      padding:20px;
      font-size:1.4rem;
      display:flex;
      flex-direction: column;
      justify-content: space-between;
	}  

}
section.forMap{
	display:grid;
	grid-template-columns:1fr;
    grid-auto-rows: 1fr;
    place-items:center;
}

div[class*=portrait]{
	margin:10px;
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
.modal_cell.checked input{
	/*outline: none;*/
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

#search_img2{
	width:50px;
}
#modal_content2{
	position:fixed;
	top:170px;
	background-color:white;
	width:600px;
	height:500px;
	border:1px solid #ddd;
	border-radius:7% 7% 7% 7%;
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
	border:2px solid black;
	color:black;
	font-weight:bold;
	font-size:14px;
	text-decoration:none;
	border-radius:15% 15% 15% 15% / 50% 50% 50% 50%;
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
					<input id=when_checkin type=text placeholder="체크인" style="width:60px;text-align:center;" readonly> - 
					<input id=when_checkout type=text placeholder="체크아웃" style="width:60px;text-align:center;" readonly>
				</div>
			</div>
			<div class="modal_cell">
				<div><b>인원수</b></div>
				<div><input id=howmanypeople type=text placeholder="인원수" style="width:60px;text-align:center" readonly></div>
			</div>
			<div class="modal_cell" id="category_search">
				<div><img id=search_img2 src="/img/website/search2.png"></div>
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
					<h3>체크인/체크아웃 날짜 정하기</h3>
					
						<table id=calendar>
							<thead>
								<tr> <th colspan=7><input id=year type=text>년 <input id=month type=text>월 </th>	</tr>
								<tr> <th>일</th> <th>월</th> <th>화</th> <th>수</th> <th>목</th> <th>금</th> <th>토</th> </tr>
							</thead>
							<tbody>
								<tr> 
									<td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> 
								</tr>
								<tr> 
									<td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> 
								</tr>
								<tr> 
									<td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> 
								</tr>
								<tr> 
									<td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> 
								</tr>
								<tr> 
									<td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> 
								</tr>
								<tr> 
									<td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> 
								</tr>
							</tbody>
						</table>
					
				</div>
				
				
				<div class="modal_search" id="howmanypeople_search">
					<h3>인원수 정하기</h3>
					<div class="setGuest">
						<div><span>어른</span></div>
						<div>
							<button class=minus_guest>-</button>
							<input type=number class=howmanyGuest id=howmanyAdults value=0 min=0 readonly>
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
			<button id=filter>필터</button>
		</div>
	</div>
</div>
</header>




<section>

	
	
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

document.addEventListener('click',function(event){
	console.log(event.target.id);
	if( event.target.id === 'modal_background' ){
		header_container2.classList.remove('hide');
		modal.classList.remove('show');
		modal_background.classList.remove('show');
		searchbar.classList.remove('hide');
		just_sentence.classList.remove('show');
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
	if(parseInt(formerNumber-1)<0){return false;}
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
function getPlaces(keyword){
	
	$.ajax({url:'/getPlaces', type:'post', dataType:'json', 
		data:{
			keyword:keyword,
			selected_environment:selected_environment,
			where:$('#where').val(),
			when_checkin:$('#when_checkin').val(),
			when_checkout:$('#when_checkout').val(),
			howmanypeople:$('#howmanypeople').val()
		},
		success:function(data){
			placesToShow = [];
			for(i=0;i<data.length;i++){
				
				data[i].place_seq;
				data[i].place_name;
				data[i].place_address;
				data[i].place_imgs;
				data[i].place_reviewRate;
				
				a_place = {
						'seq':data[i].place_seq,
						'name':data[i].place_name,
						'address':data[i].place_address,
						'imgs':data[i].place_imgs,
						'reviewRate':data[i].place_reviewRate
						// 나중에 다른 data 필요하면 그때 보고서 담기.
				}
				
				placesToShow.push(a_place);
				
				
				/*
				portrait = makeStructure();
				portrait.setMoveToUrl("/place/"+data[a].place_seq);
				portrait.setBody(data[a].place_name,"★" + data[a].place_reviewRate ,data[a].place_address, '');
				
				imgsArray = data[a].place_imgs.split(",");
				for(b=0;b<imgsArray.length;b++){
					portrait.add_picture(imgsArray[b]);
				}
				
				cssStr = portrait.getPortraitCss();
				tagStr = portrait.getPortrait();
				
				$('body').append(cssStr)
				$('section').append(tagStr)
				*/
			}
		},
		complete:function(){
			showPlaceList();
		}
	})		// placePrice 는 나중에 db join 해서 1박기준 알아와야할듯.. 아니면 그냥 빈칸으로두던가
}

function showPlaceList(){	// placeToShow 에 담긴 places 들을 list 로 만들어 section 에 표시하는 함수
	$('section').empty();
	if(!$('section').hasClass('forList')){$('section').addClass('forList');}
	if($('section').hasClass('forMap')){$('section').removeClass('forMap');}
	for(j=0;j<placesToShow.length;j++){
		
		place = placesToShow[j];
		
		portrait = makeStructure();
		portrait.setMoveToUrl("/place/"+ place.seq);
		portrait.setBody(place.name , "★" + place.reviewRate , place.address, '');
		
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
function showPlaceMap(){	// placeToShow 에 담긴 places 들을 list 로 만들어 section 에 표시하는 함수
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
					content:'<a href="/place/'+ place.seq +'" class=place_customOverlay>&nbsp;'+ place.name +'&nbsp;</a>'
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
/*
function getPlacesToMap(keyword){
	
	section = document.getElementsByTagName('section')[0];	
	section.classList.remove('forList');
	$('section').empty();
	

	// 지도생성
	
	places = [];
	
	$.ajax({url:'/getPlaces', type:'post', dataType:'json',
		data:{
			keyword:keyword,
			selected_environment:selected_environment,
			where:$('#where').val(),
			when_checkin:$('#when_checkin').val(),
			when_checkout:$('#when_checkout').val(),
			howmanypeople:$('#howmanypeople').val()
		},
		success:function(data){
			for(i=0;i<data.length;i++){
				place = {
						seq:data[i].place_seq,
						name:data[i].place_name,
						address:data[i].place_address,
						imgs:data[i].place_imgs
				};
				places.push(place);
			}
		}, 
		complete:function(){
			
			$('section').append('<div id=map></div>')
			let container = document.getElementById('map'); 
			let options = { 
				center: new kakao.maps.LatLng(33.450701, 126.570667), 
				level: 3 
			};
			let map = new kakao.maps.Map(container, options); 
			// 지도만들기 
			
			// 이제 주소를 이용해 좌표로 변환하면서, 그 좌표를가지고 customoverlay 를 형성함 
			   
			for(i=0;i<places.length;i++){
	
				let place = places[i];
				
				address = place.address.split(",")[1];
				
				var geocoder = new kakao.maps.services.Geocoder();
				geocoder.addressSearch(address, function(result,status){
					if(status===kakao.maps.services.Status.OK){
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						coordinates.push(coords);
						var customOverlay = new kakao.maps.CustomOverlay({
							position:coords,
							content:'<button>'+ place.name +'</button>'
						});
						customOverlay.setMap(map); // customOverlay 를 지도에 찍음
					} else {console.log("making place-customoverlay > fail")}
				})
			}
			/////////////////////////// 콜백함수  필요 ////////////////////////////////////
			// 이건 임시방편이고 실제로 callback 함수를 만들어야함.
			var bounds = new kakao.maps.LatLngBounds();
			setTimeout(function(){
				console.log(coordinates);
				for(i=0;i<coordinates.length;i++){
					bounds.extend(coordinates[i]);
				}
				
				map.setBounds(bounds);
			},500);
			

		}
	})		
}
*/


// getPlacesByKeyWord => 이건 안쓰는거라 나중에 지워도 될듯?
/*
function getPlacesByKeyword(keyword){
	
	$('section').empty();
	
	$.ajax({url:'/getPlaces', type:'post', dataType:'json', 
		
		data:{keyword:keyword},
		
		success:function(data){
		
			for(a=0;a<data.length;a++){
				
				seq = data[a].place_seq;
				name = data[a].place_name;
				price = data[a].place_price;
				address = data[a].place_address;
				imgs = data[a].place_imgs;
				reviewRate = data[a].place_reviewRate;
				
				portrait = makeStructure();
				portrait.setMoveToUrl("/place/"+seq);
				portrait.setBody(name,"★" + reviewRate ,address,''); //마지막꺼 price
				
				imgsArray = imgs.split(",");
				for(b=0;b<imgsArray.length;b++){
					portrait.add_picture(imgsArray[b]);
				}
				
				cssStr = portrait.getPortraitCss();
				tagStr = portrait.getPortrait();
				
				$('body').append(cssStr)
				$('section').append(tagStr)
				

			}		
			
		}
	
	})		// placePrice 는 나중에 db join 해서 1박기준 알아와야할듯.. 아니면 그냥 빈칸으로두던가
}
*/
// portrait-maker function
function makeStructure(){

    uuid = self.crypto.randomUUID();
    uuid = "a" + uuid.substring(0,10);

    portraitStructure = {
		
        test:function(){console.log('makeStructure for portrait')},
        
        moveToUrl:null,
        setMoveToUrl:function(data){this.moveToUrl=data;},

        portrait_code:uuid+ "-portrait",
        portrait_style:'text-align:center;width:250px;height:400px;',
        // portrait_width:'300px',
        // portrait_height:'400px',
        set_portrait_width:function(data){this.portrait_width=data;},

        radio_code: uuid + '-slide',
        radio_id  : uuid + '-radio',
        radio_name: uuid + "-slide",

        head_code:uuid+ "-head",
        head_style:'width:100%;height:250px;position:relative;',
        // head_height:"300px",
        set_head_height:function(data){this.head_height=data;},

        pictureList_code:uuid+ "-pictureList",
        pictureList_style:'width:100%;height:100%;white-space:nowrap;overflow:hidden;padding:0px;font-size:0px;border:1px solid #ddd;border-radius:10% 10% 10% 10%;cursor:pointer;',
        pictureList_elements:[],    // 사용자입력 

        add_picture:function(data){this.pictureList_elements.push(data)},
        pictureList_li_code:uuid+ "-pictureList",
        pictureList_li_style:'list-style:none; display:inline-block; width:100%; height:100%; transition:0.5s;',

        control_code:uuid+ "-control",
        control_style:'font-weight:bold;',

        left_code:uuid+"-left",
        left_style:'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);left:10px;width:30px;height:30px;',
        left_img:"/img/test/left.png",

        right_code:uuid+"-right",
        right_style:'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);right:10px;width:30px;height:30px;',   
        right_img:"/img/test/right.png",

        body_code:uuid+ "-body",
        body_style:	'display:grid;grid-template-columns:3fr 1fr;grid-template-rows:0.5fr 1fr 1fr;height:100px;padding:0px;cursor:pointer;',
        // body_height:'100px',
		
        body_element_name:null,
        body_element_review:null,
        body_element_address:null,
        body_element_price:null,

        setBody:function(name,review,address,price){
            this.body_element_name = name;
            this.body_element_review = review;
            this.body_element_address = address;
            this.body_element_price = price;
        },     

        getPortrait:function(){
            
            if(this.pictureList_elements.length==0){console.log('portrait에 사진을 넣어주세요');return false;}

            radiostr = '';
            imgstr = '';
            controlstr = '';

            for(i=0;i<this.pictureList_elements.length;i++){
                
                if(i==0){
                    radiostr += '<input type=radio class=' + this.radio_code + ' id='+ this.radio_id + i + ' name='+ this.radio_name + ' style="display:none" checked>'
                } else {
                    radiostr += '<input type=radio class=' + this.radio_code + ' id='+ this.radio_id + i + ' name='+ this.radio_name +' style="display:none">'
                }
               
                
                imgstr += '<li class=' + this.pictureList_li_code + ' style="' + this.pictureList_li_style + '">'
                imgstr += '<img src="' + this.pictureList_elements[i] + '">'
                imgstr += '</li>'

                if(i==0){
                    controlstr += '<div class=' + this.control_code + i + ' style="'+ this.control_style +'">';
                    controlstr += '<label class=' + this.left_code + ' for=' + this.radio_id + (this.pictureList_elements.length-1) +' style='+ this.left_style +'>'
                    controlstr += '<img src="' + this.left_img +'" style="'+ this.left_style +'"></label>';
                    controlstr += '<label class=' + this.right_code + ' for=' + this.radio_id + (i+1) +' style='+ this.right_style +'>'
                    controlstr += '<img src="' + this.right_img +'" style="'+ this.right_style +'"></label>';
                    controlstr += '</div>'
                } else if(i==this.pictureList_elements.length-1){
                    controlstr += '<div class=' + this.control_code + i + ' style="'+ this.control_style +'">';
                    controlstr += '<label class=' + this.left_code + ' for=' + this.radio_id + (i-1) +' style='+ this.left_style +'>'
                    controlstr += '<img src="' + this.left_img +'" style="'+ this.left_style +'"></label>';
                    controlstr += '<label class=' + this.right_code + ' for=' + this.radio_id + (0) +' style='+ this.right_style +'>'
                    controlstr += '<img src="' + this.right_img +'" style="'+ this.right_style +'"></label>';
                    controlstr += '</div>'
                } else {
                    controlstr += '<div class=' + this.control_code + i + ' style="'+ this.control_style +'">';
                    controlstr += '<label class=' + this.left_code + ' for=' + this.radio_id + (i-1) +' style='+ this.left_style +'>'
                    controlstr += '<img src="' + this.left_img +'" style="'+ this.left_style +'"></label>';
                    controlstr += '<label class=' + this.right_code + ' for=' + this.radio_id + (i+1) +' style='+ this.right_style +'>'
                    controlstr += '<img src="' + this.right_img +'" style="'+ this.right_style +'"></label>';
                    controlstr += '</div>'
                }
            }

            portraitStr = "";
                                // 여기 sectionItem 임시로 전체클래스 준거임. 나중에 고치던가하셈
            portraitStr += '<div class=' + this.portrait_code + ' style="' + this.portrait_style +'">';
                portraitStr += radiostr;

                portraitStr += '<div class=' + this.head_code + ' style="' + this.head_style + '">'
                    
                    portraitStr += '<ul class=' + this.pictureList_code + ' style="' + this.pictureList_style + '" onclick=\'location.href="'+ this.moveToUrl +'"\'>' 
                        portraitStr += imgstr;
                    portraitStr += '</ul>'
                    
                    portraitStr += '<div class=' + this.control_code + '>';
                        portraitStr += controlstr;
                    portraitStr += '</div>'

                portraitStr += '</div>';

                portraitStr += '<div class=' + this.body_code + ' style="'+ this.body_style + '" onclick=\'location.href="'+ this.moveToUrl +'"\'>' 
                    portraitStr += '<div></div> <div></div>'
                    portraitStr += '<div style="text-align:left;font-weight:bold;">' + this.body_element_name + '</div>'
                    portraitStr += '<div style="text-align:right">' + this.body_element_review + '</div>'
                    portraitStr += '<div style="text-align:left;color:gray;">' + this.body_element_address + '</div>'
                    portraitStr += '<div></div>'
                 	 portraitStr +='<div style="text-align:left">' + this.body_element_price + '</div>'
                    portraitStr += '<div></div>' 
                portraitStr += '</div>';
            portraitStr += '</div>'

            return portraitStr;
        },

        getPortraitCss:function(){
            
            cssStr1 = '';
            cssStr2 = '';
            cssStr3 = '.' + this.head_code + " img{width:100%;height:100%}\n";
            cssStr4 = '.' + this.left_code + "{display:none;}\n";
            cssStr5 = '.' + this.right_code + "{display:none;}\n";

            for(i=0;i<this.pictureList_elements.length;i++){

                cssStr1 += "." + this.radio_code + ":nth-child(" + (i+1) + "):checked ~ ." + 
                            this.head_code + " ul li{transform:translateX(" + (i*(-100)) + "%);}\n" 
                
                if(this.pictureList_elements.length==1){
                	
                } else if(i==0){
                	cssStr2 += '.' + this.portrait_code + ":hover ." + this.radio_code +":nth-child(" + (i+1) + 
                    "):checked ~ ." + this.head_code + " div div:nth-child(" + (i+1) + ") ." + this.right_code +
                    "{display:block;}\n" 
                } else if(i==this.pictureList_elements.length-1){
                	cssStr2 += '.' + this.portrait_code + ":hover ." + this.radio_code +":nth-child(" + (i+1) + 
                    "):checked ~ ." + this.head_code + " div div:nth-child(" + (i+1) + ") ." + this.left_code +
                    "{display:block;}\n" 
                } else {
                	  cssStr2 += '.' + this.portrait_code + ":hover ." + this.radio_code +":nth-child(" + (i+1) + 
                      "):checked ~ ." + this.head_code + " div div:nth-child(" + (i+1) + ") label" +
                      "{display:block;}\n" 
                }
             
            }
            
            portraitCssStr = '<style>' + cssStr1 + cssStr2 +  cssStr3 + cssStr4 + cssStr5 + "</style>";

            return portraitCssStr;
        }

    }
    return portraitStructure;
}

// 인원수 변경될때 총 인원수/modal_cell 인원수에 값이 전달되는 code

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
	console.log(width);
	console.log(height);
	$('#map').width( width );
	$('#map').height( height );
	MAP.relayout();

}

/////////////////////////////////////////////////////////////////////////////////////////





</script>
</html>

