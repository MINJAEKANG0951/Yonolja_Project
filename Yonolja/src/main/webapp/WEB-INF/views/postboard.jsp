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
    box-shadow: 0px 0px 5px #444;
    transition:0.5s;
}
.header_item { width:100%;border:0px solid #ddd;}
.header_item:nth-child(2){    text-align:center; }
.header_item:nth-child(3){    text-align:right;  }
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
     /* justify-content: center; */
    /* align-items: center; */
    padding-bottom: 30px;
    padding-left: 20px;
    font-size: 40px;
/*     color: blue; */
}
.table-hover {
/*       border: 2px solid #0d6efd;  */
    }

.pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.pagination a {
    color: black;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color 0.3s;
    border: 1px solid #ddd;
    margin: 0 4px;
    cursor: pointer;
}

.pagination a.active {
    background-color: #0d6efd;
    color: white;
    border: 1px solid #0d6efd;
}

.pagination a:hover:not(.active) {
    background-color: #ddd;
}

.post_line{cursor:pointer;}

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
    <div class="container">
        <div class="heade"> 𝐁𝐨𝐚𝐫𝐝 </div>
        
        <table class="table table-hover" id="postTable">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">카테고리</th>
              <th scope="col">제목</th>
              <th scope="col">작성자</th>
              <th scope="col">작성일</th>
              <th scope="col">답변여부</th>
            </tr>
          </thead>
          <tbody>
             <c:forEach var="post" items="${posts}">
                <tr class=post_line>
                    <th scope="row">${post.post_seq}</th>
                    <td>${post.post_category}</td>
                    <td>${post.post_title}</td>
                    <td>${post.user_id }</td> 
                    <td>${post.post_date}</td>
                    <td class="text-success">답변 안함</td> 
                </tr>
            </c:forEach>
            
          </tbody>
        </table>
        
        
        
        
        <div class="pagination" id="pagination"></div>
        
        
        
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

<script>
$(document)
.on('click','#mypage_button',function(){
    
})
.on('click','.post_line',function(){
	
	post_seq = $(this).find('th').text();
	document.location = "/postview/" + post_seq;
	return false;
})
// Pagination
const table = document.getElementById('postTable');
const rowsPerPage = 10;
let currentPage = 0;

function changePage(page) {
    currentPage = page;
    renderTable();
    highlightActivePage();
}

function renderTable() {
    const rows = table.getElementsByTagName('tbody')[0].rows;
    const totalRows = rows.length;
    const totalPages = Math.ceil(totalRows / rowsPerPage);
    const startIndex = currentPage * rowsPerPage;
    const endIndex = Math.min(startIndex + rowsPerPage, totalRows);

    for (let i = 0; i < totalRows; i++) {
        if (i >= startIndex && i < endIndex) {
            rows[i].style.display = 'table-row';
        } else {
            rows[i].style.display = 'none';
        }
    }

    renderPagination(totalPages);
}

function renderPagination(totalPages) {
    const paginationDiv = document.getElementById('pagination');
    paginationDiv.innerHTML = '';

    for (let i = 0; i < totalPages; i++) {
        const pageNumber = i + 1;
        const link = document.createElement('a');
        link.href = '#';
        link.textContent = pageNumber;

        if (i === currentPage) {
            link.className = 'active';
        }

        link.addEventListener('click', () => changePage(i));
        paginationDiv.appendChild(link);
    }
}

function highlightActivePage() {
    const paginationLinks = document.getElementById('pagination').getElementsByTagName('a');

    for (let i = 0; i < paginationLinks.length; i++) {
        if (i === currentPage) {
            paginationLinks[i].classList.add('active');
        } else {
            paginationLinks[i].classList.remove('active');
        }
    }
}

renderTable();
</script>
</html>
