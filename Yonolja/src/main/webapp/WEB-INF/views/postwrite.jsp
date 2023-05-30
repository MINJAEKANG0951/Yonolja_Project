<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<style>
header {
  display: grid;
  place-items:center;
  position: fixed;
  top: 0; left: 0;
  height: 100px;
  width: 100%;
  background-color: white;
  border:1px solid #ddd;
}
.header_container {
	display:grid;
	grid-template-columns:1fr  1fr  1fr;
	grid-template-rows:1fr;
    place-items: center;
    width:95%;
    height:100%;
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
.heade{
    display: flex; 
     justify-content: center;
    /* align-items: center; */
    padding-bottom: 30px;
}

.dropzone {
      width: 100%;
      height: 150px;
      border: 2px dashed #BBBBBB;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 15px;
    }
    .dropzone img {
      max-width: 100%;
      max-height: 100%;
    }

    .write{
        padding-left: 300px;
        padding-right: 300px;
    }

</style>
<body>
<div class="center">
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
			</div>
		</div>
</div>
</div>
</header>

<section>
  <div class="write">
    <h3 class="mt-3 mb-3">𝐏𝐨𝐬𝐭 𝐖𝐫𝐢𝐭𝐞</h3>
    <br>

    <form action="/submit" method="post">
      <div class="form-group">
        <label for="title">𝑇𝑖𝑡𝑙𝑒</label>
        <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
      </div>
      <div class="form-group">
        <label for="content">𝑐𝑜𝑛𝑡𝑒𝑛𝑡</label>
        <textarea class="form-control" id="content" name="content" rows="3" placeholder="내용을 입력하세요"></textarea>
      </div>
      <div class="form-group">
        <label for="category">𝐶𝑎𝑡𝑒𝑔𝑜𝑟𝑖𝑒</label>
        <select class="form-control" id="category" name="category">
          <option>일반</option>
          <option>공지</option>
        </select>
      </div>
      <div class="form-group">
        <label>이미지 첨부</label>
        <input type="file" id="file-input" name="image" style="display:none;">
        <button type="button" class="btn btn-secondary mb-2" onclick="document.getElementById('file-input').click()">파일 선택</button>
        <div id="dropzone" class="dropzone">드래그 앤 드롭으로 이미지를 첨부하세요</div>
      </div>
      <button type="submit" class="btn btn-primary" style="margin-top:20px;">작성하기</button>
    </form>
  </div>
</section>


<footer>
  <div class="footer_container">
    <div class="footer_item">
      <div>
        © 2023 Waterbnb, Inc. · 개인정보 처리방침 · 이용약관 · 사이트맵 · 한국의 변경된 환불 정책 · 회사 세부정보
        &nbsp;&nbsp;&nbsp;&nbsp;
        <b>언어 : 한국어(KR) 통화 : \ won</b>
      </div>
    </div>
    <div class="footer_item">
      <div>
        지원 및 참고 자료
        웹사이트 제공자: Waterbnb continent KR, public limited company,
        boosung street 1 82, | ceo: | VAT 번호: x**4$123$0vv15 |
        사업자 등록 번호: AB 5*****7 | 연락처: @naver.com, 웹사이트, 010 |
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
.on('click','#mypage_button',function(){
	
})


var dropzone = document.getElementById('dropzone');
    var fileInput = document.getElementById('file-input');

    function readAndPreview(file) {
      var reader = new FileReader();
      reader.onload = function(event) {
        var imgElement = document.createElement('img');
        imgElement.src = event.target.result;
        dropzone.innerHTML = '';
        dropzone.appendChild(imgElement);
      };
      reader.readAsDataURL(file);
    }

    dropzone.ondragover = function() {
      this.classList.add('bg-light');
      return false;
    };

    dropzone.ondragleave = function() {
      this.classList.remove('bg-light');
      return false;
    };

    dropzone.ondrop = function(e) {
      e.preventDefault();
      this.classList.remove('bg-light');

      var file = e.dataTransfer.files[0];
      readAndPreview(file);
    };

    fileInput.onchange = function(e) {
      var file = e.target.files[0];
      readAndPreview(file);
    };

</script>
</html>

