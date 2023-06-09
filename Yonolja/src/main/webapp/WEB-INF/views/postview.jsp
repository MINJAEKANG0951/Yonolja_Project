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
<link rel="icon" href="/img/website/favicon-16x16.png" type="image/x-icon" sizes="16x16">
</head>

<style>


.write{
  display: flex;
  justify-content: center;
  flex-direction: column; 
  align-items: center;  
  
}


  table{
    /* background-color: purple; */
    /* width:1000px; */
  }
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

    .post-info {
  display: flex;
  justify-content: flex-start; /* Align items to the start, reducing the gap */
  align-items: center;
  margin-bottom: 20px;
}

.post-info input {
  flex: 1;
  margin: 0 10px;
  width: 90%; /* Increase the width of input fields */
}

    td {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

label {
  width: 20%;
}

.form-control {
  width: 80%;
}

.Postwrite1{
	padding-bottom:50px;
}

.content-container {
  display: flex;
  align-items: center;
}
.text-content {
  margin-left: 10px;
}

/* .text-content{ */
/* height:500px; */
/* width:500px; */
/* } */

 .button5 { 
    display: flex; 
    justify-content: space-between; 
    
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
</header>

<section>
  <div class="write">
    <div class="Postwrite1">
      <h3 class="mt-3 mb-3">𝐏𝐨𝐬𝐭 𝐖𝐫𝐢𝐭𝐞</h3>
      <br>
    </div>
    <form action="postview" method="post">
    
    <div class="form-group">
      <div class="post-info">
        𝑇𝑖𝑡𝑙𝑒 &nbsp;&nbsp;
        <input class="form-control" type="text" value="${post_title}" id="post_title" name="post_title" readonly>
      </div>
      <div class="post-info">    
        𝑊𝑟𝑖𝑡𝑒𝑟
        <input class="form-control" type="text" id="user_id" name="user_id" value="${post_writer}" style="width:45%" readonly>
      </div>
    </div>

  <div class="form-group" style="display: flex; align-items: center;">
    <label for="Bcontent" style="margin-right: 10px;">𝑐𝑜𝑛𝑡𝑒𝑛𝑡</label>
    <div class="form-control" id="post_content" name="post_content" readonly>
        <div class="content-container">
            <div class="text-content" >
                ${post_content}
                <img src="${post_img}" alt="im1a123ge" style="max-height: 100%; max-width: 100%;">
            </div>
            
        </div>
    </div>
</div>


    <div class="form-group">
      <label for="B_Create_date">𝐷𝑎𝑡𝑒&nbsp;𝐶𝑟𝑒𝑎𝑡𝑒𝑑</label>
      <input class="form-control" type="text" id="post_date" name="post_date" value="${post_date}" style="width:90%" readonly>
    </div>

    <div class="form-group">
      <label for="revision_Update_date">𝑟𝑒𝑣𝑖𝑠𝑖𝑜𝑛&nbsp;𝑑𝑎𝑡𝑒</label>
      <input class="form-control" type="text" id="B_Update_date" name="B_Update_date" value="${b_update_date}" style="width:90%" readonly>
    </div>

    <input type="hidden" id="board_num" value="${board_num}" name="board_num">

    <br>

    <div class="button5">
      <div style="margin-left: auto; margin-right: auto;">
        <input class="btn btn-danger" type="button" value="삭제" id="btnDelete" data-post_seq="${post_seq}">
        <input class="btn btn-success" type="button" value="수정" id="btnModify">
        <input class="btn btn-primary" type="button" value="목록" id="btnShow">
      </div>
    </div>
    </form>
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
			boosung street 1 82,  | ceo : | VAT 번호: x**4$123$0vv15 | 
			사업자 등록 번호: AB 5*****7 | 연락처: @naver.com, 웹사이트, 010 | 
			호스팅 서비스 제공업체: 아마존 웹서비스 | 
			워터비앤비는 통신판매 중개자로 워터비앤비 플랫폼을 통하여 게스트와 호스트 사이에 이루어지는 통신판매의 당사자가 아닙니다.
			워터비앤비 플랫폼을 통하여 예약된 숙소, 체험, 호스트 서비스에 관한 의무와 책임은 해당 서비스를 제공하는 호스트에게 있습니다.
		</div>
	</div>
</div>
</div>
</footer>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document)
.on('click','#mypage_button',function(){
	
})
.on("click","#btnSave",function(){
	
	update()
})
//목록보기
document.getElementById("btnShow").addEventListener("click", function() {
    window.location.href = "http://localhost:8081/postboard";
});

// var dropzone = document.getElementById('dropzone');
//     var fileInput = document.getElementById('file-input');

//     function readAndPreview(file) {
//       var reader = new FileReader();
//       reader.onload = function(event) {
//         var imgElement = document.createElement('img');
//         imgElement.src = event.target.result;
//         dropzone.innerHTML = '';
//         dropzone.appendChild(imgElement);
//       };
//       reader.readAsDataURL(file);
//     }

//     dropzone.ondragover = function() {
//       this.classList.add('bg-light');
//       return false;
//     };

//     dropzone.ondragleave = function() {
//       this.classList.remove('bg-light');
//       return false;
//     };

//     dropzone.ondrop = function(e) {
//       e.preventDefault();
//       this.classList.remove('bg-light');

//       var file = e.dataTransfer.files[0];
//       readAndPreview(file);
//     };

//     fileInput.onchange = function(e) {
//       var file = e.target.files[0];
//       readAndPreview(file);
//     };


//  게시판 delete
$('#btnDelete').click(function() {
    var post_seq = $(this).data('post_seq');  
    $.ajax({
        url: '/postview/' + post_seq, 
        type: 'post', 
        success: function(result) {
        	
        	
        	alert("삭제되었습니다.");
            window.location.href="/postboard";
        }
    });
});

// 게시판 update
// 수정 가능 상태로 변경 버튼 클릭 이벤트
$('#btnModify').click(function() {
    // 모든 input 필드의 readonly 상태를 해제
    $('input').removeAttr('readonly');

    // 혹은 특정 input 필드만 선택하여 readonly 상태를 해제
    $('#post_title').removeAttr('readonly');
    $('#post_content').removeAttr('readonly');
    // 기타 필요한 필드들도 추가

    // 사용자에게 알림
    alert("수정 가능 상태로 변경되었습니다. 수정이 완료되면 '수정 완료' 버튼을 눌러주세요.");
    
    $('#btnModify').removeAttr('id', 'btnModify');
    
    $('.btn-success').attr('id','btnSave');
});

function update(){
		
		var post_seq = $('#btnDelete').data('post_seq');
		console.log(post_seq)
	    var updated_title = $('#post_title').val();
	    var updated_content = $('.text-content').text();
// 	    console.log("수정될 내용: "+updated_content)

	  $.ajax({
	        url: '/postview/' + post_seq,
	        type: 'put', 
	        data: {
	            post_title: updated_title,
	            post_content: updated_content
	        },
	        beforeSend:function(){
	        	console.log("수정될 제목:" + updated_title+"수정될 내용: "+updated_content)
	        },
	        success: function(result) {
	            // input 필드를 다시 readonly 상태로 변경
	            $('input').attr('readonly', 'readonly');

	            $('#post_title').val(result.updatedTitle); 
	            $('#post_content').val(result.updatedContent); 
	            alert("수정되었습니다.");
	        }
	    });
}





</script>
</html>

