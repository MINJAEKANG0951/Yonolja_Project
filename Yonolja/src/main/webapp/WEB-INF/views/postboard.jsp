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
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
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

/* .pagination { */
/*     display: flex; */
/*     justify-content: center; */
/*     margin-top: 20px; */
/* } */

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

.post_line{
cursor:pointer;
}

/* .pagination .write-post-btn { */
/*     background-color: #0d6efd; */
/*      color: white;  */
/*     border: 1px solid #0d6efd; */
/*     margin-left: 10px; */
/*     display:flex; */
/*     justify-content:right; */
/*      align-items:right;  */
/* } */

.pagination .write-post-btn:hover {
/*     background-color: #ddd; */
/*     color: black; */
}


.pagination a {
/*   margin: 0 5px; */
}

.pagination {
  display: flex;
   justify-content: center; 
   align-items: center; 
  margin-bottom: 10px;
}
.pagination .write-post-btn {
/* 	float:right; */
/* 	margin-left:300px; */
/* 	padding:1000px; */
/* 	text-align:right; */
/*    	background-color:red;  */
    
  }

#postCount {
        font-family: "Arial", sans-serif;
        font-size: 15px;
/*         color: #3366ff; */
        font-weight: bold;
    }




.grid-container {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr 1fr; /* Or use a different value that fits your needs */
    gap: 20px;
}
.card {
    border: 1px solid #ccc;
    padding: 20px;
}


   button img {
        border: none;
        outline: none;
    }

#listViewButton,
    #gridViewButton {
        width: 50px;
        height: 40px;
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
    <div class="container">
        <div class="heade"> 𝐁𝐨𝐚𝐫𝐝 </div>
           <p id="postCount">게시글 개수: </p>
           
           
           <select id="rowsPerPage" style="margin-bottom:20px;" onchange="updateRowsPerPage(this.value);">
    <option value="5">5개 보기</option>
    <option value="10" selected>10개 보기</option>
    <option value="15">15개 보기</option>
    <option value="30">30개 보기</option>
</select>
           
         <div style="display: flex; justify-content: flex-end;">
    <button id="listViewButton">
        <img src="/img/post_img/게시판 목록.jpg">list
    </button>

    <button id="gridViewButton">
        <img src="/img/post_img/게시판목록2.jpg">grid
    </button>
</div>


<!-- Grid View Container -->
<div id="gridContainer" class="grid-container" style="display: none;">
    <!-- Grid items will be populated here -->
</div>

           
           
           
           
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
          <tbody><!-- ${seq.post_seq} -->
             <c:forEach var="post" items="${posts}" >
                <tr class=post_line>
                    <th scope="row">${post.num}<input type=hidden value="${post.post_seq}"></th>
                    <td>${post.post_category}</td>
                    <td>${post.post_title}</td>
                    <td>${post.user_id }</td> 
                    <td>${post.post_date}</td>
                    <td hidden>${post.post_img}</td>
                    <c:if test="${post.post_comment!=null}">
                    	<td class="text-success">답변완료</td> 
                    </c:if>
                    <c:if test="${post.post_comment==null}">
                    	<td class="text-danger">답변대기</td> 
                    </c:if>
                </tr>
            </c:forEach>
            
          </tbody>
        </table>
        
        
        
        
<div class="pagination" id="pagination">

</div>        
        
        
        
        
        
        
        
        
 <div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <form action="/search" method="get">
                <div class="input-group">
                    <!-- Adding Dropdown Select for Search Category -->
                    <div class="col-2 pl-0">
                        <select class="form-control" id="searchCategory" name="searchCategory" style="width:87px;">
                            <option value="title">Title</option>
                            <option value="author">Author</option>
                        </select>
                    </div>
                    <div class="col-10 d-flex">
                        <input type="text" name="searchTerm" id="searchTerm" class="form-control" value="" placeholder="Search" style="width:200px;"></input>
                        <input class="btn btn-outline-secondary" id='searchButton'  name="keyword" type="button" value="Search" style="margin-left:0;"></input>
                    </div>
                </div>
            </form>
            <!-- Results will be placed here -->
            <div id="searchResults"></div>
        </div>
    </div> 
</div>



        
     
        
        

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
.on('click','.post_line',function(){
	console.log("test_post_line")
	post_seq = $(this).find('th input').val();
	console.log(post_seq)
	
	document.location = "/postview/" + post_seq;
	return false;
})
// Pagination
 const table = document.getElementById('postTable');
    let rowsPerPage = 10;
    let currentPage = 0;

    function updateRowsPerPage(value) {
        rowsPerPage = parseInt(value);
        currentPage = 0;
        renderTable();
    }

    function changePage(page) {
        currentPage = page;
        renderTable();
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

    renderTable();

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



function renderPagination(totalPages) {
    const paginationDiv = document.getElementById('pagination');
    paginationDiv.innerHTML = '';

    const startPage = 5 * Math.floor(currentPage / 5);
    const endPage = Math.min(startPage + 5, totalPages);

    // 이전 버튼
    if (startPage > 0) {
        const prevButton = document.createElement('a');
        prevButton.href = '#';
        prevButton.textContent = 'Previous';
        prevButton.addEventListener('click', () => {
            changePage(startPage - 1);
        });
        paginationDiv.appendChild(prevButton);
    }

    // 페이지 링크
    for (let i = startPage; i < endPage; i++) {
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

    // 다음 버튼
    if (endPage < totalPages) {
        const nextButton = document.createElement('a');
        nextButton.href = '#';
        nextButton.textContent = 'Next';
        nextButton.addEventListener('click', () => {
            changePage(endPage);
        });
        paginationDiv.appendChild(nextButton);
    }
    
    // 글쓰기 버튼 추가
    const writePostButton = document.createElement('a');
    writePostButton.textContent = '글쓰기';
    writePostButton.className = 'write-post-btn';
    writePostButton.href = 'http://localhost:8081/postwrite';
    writePostButton.style.float = 'right';
    paginationDiv.appendChild(writePostButton);
}


// 페이지 변경 후 페이지네이션 렌더링 호출
function changePage(page) {
    currentPage = page;
    renderTable();
    renderPagination(Math.ceil(table.getElementsByTagName('tbody')[0].rows.length / rowsPerPage));
}


////// 게시글 검색




$(document).ready(function() {
    $('#searchButton').click(search); // 검색 버튼 클릭 이벤트 핸들러

    $('#searchTerm').keypress(function(e) {
        if (e.which === 13) { // Enter 키를 눌렀을 때
            e.preventDefault(); // 기본 동작 (폼 제출) 방지
            search(); // 검색 동작 수행
        }
    });

    function search() {
        var searchCategory = $('#searchCategory').val();
        var searchTerm = $('#searchTerm').val();

        $.ajax({
            url: '/search',
            type: 'GET',
            data: {
                searchCategory: searchCategory,
                keyword: searchTerm
            },
            success: function(response) {
                // 검색 결과를 처리하는 코드 작성
                // 예시: 검색 결과를 테이블에 표시
                var tableBody = $('#postTable tbody');
                tableBody.empty();
				
                for (var i = 0; i < response.length; i++) {
                    var post = response[i];
                    if (post.post_comment != null) {
                        comment = '<td class="text-success">' + '답변완료' + '</td>';
                    } else {
                        comment = '<td class="text-success">' + '답변안함' + '</td>';
                    }
                    var row = '<tr class=post_line>' +
                        '<th scope="row">' + post.num + '<input type="hidden" value="' + post.post_seq + '"></th>' +
                        '<td>' + post.post_category + '</td>' +
                        '<td>' + post.post_title + '</td>' +
                        '<td>' + post.user_id + '</td>' +
                        '<td>' + post.post_date + '</td>' + comment + '</tr>';

                    tableBody.append(row);
                }
                changePage(0);
            },
            error: function(xhr, status, error) {
                // 에러 처리
                console.error(xhr.responseText);
            }
        });
    }
});

// 게시글 개수 몇개인지 뜨는거

var postCount = document.getElementById("postTable").getElementsByTagName("tbody")[0].getElementsByTagName("tr").length;
document.getElementById("postCount").innerHTML += postCount;

// // // // // // // // // // // // // // // // // 

document.getElementById('listViewButton').addEventListener('click', function() {
    document.getElementById('postTable').style.display = '';
    document.getElementById('gridContainer').style.display = 'none';
});

document.getElementById('gridViewButton').addEventListener('click', function() {
	
    document.getElementById('postTable').style.display = 'none';
    document.getElementById('gridContainer').style.display = '';
 
    // Clear the grid container
    const gridContainer = document.getElementById('gridContainer');
    gridContainer.innerHTML = '';

    // Loop through all the posts and create grid items
    const rows = document.getElementById('postTable').getElementsByTagName('tbody')[0].rows;
    
    for (let i = 0; i < rows.length; i++) {
    	console.log('로오즈' + rows[i]);
        const gridItem = document.createElement('div');
        gridItem.className = 'grid-item';
        gridItem.innerHTML = rows[i].innerText; // You might want to format this differently
        gridItem.addEventListener('click', function() {
            // Navigate to the post view when the grid item is clicked
            document.location = "/postview/" + rows[i].getElementsByTagName('input')[0].value;
        });
        gridContainer.appendChild(gridItem);
    }
});

document.getElementById('gridViewButton').addEventListener('click', function() {
    const gridContainer = document.getElementById('gridContainer');
    gridContainer.innerHTML = '';

    const posts = document.querySelectorAll('#postTable tbody tr');

    posts.forEach(function(postRow) {
        const cells = postRow.querySelectorAll('td');

        const card = document.createElement('div');
        card.classList.add('card');

        const postImg = cells[0].querySelector('.post_img')?.getAttribute('src');

        const imgContainer = document.createElement('div');
        imgContainer.classList.add('image-container');

        if (postImg) {
            const imgElement = document.createElement('post_img');
            imgElement.src = postImg;
            imgElement.alt = 'Post Image';
            imgContainer.appendChild(imgElement);
        } else {
            const placeholderElement = document.createElement('span');
            placeholderElement.innerHTML = '<img src="' + cells[4].innerText + '" alt="사진이 안떠" style="max-width: 100%; height: 200px;;">';
            imgContainer.appendChild(placeholderElement);
        }

        console.log("post_img");
        console.log(cells[4].innerText);
        const contentContainer = document.createElement('div');
        contentContainer.classList.add('content-container');

        /* const titleElement = document.createElement('h2');
        titleElement.textContent = cells[2].innerText;
        contentContainer.appendChild(titleElement); */
	
        const categoryElement = document.createElement('h6');
        categoryElement.textContent = 'Category: ' + cells[1].innerText;
        contentContainer.appendChild(categoryElement);

        const authorElement = document.createElement('p');
        authorElement.textContent = 'Author: ' + cells[2].innerText;
        contentContainer.appendChild(authorElement);

        const dateElement = document.createElement('p');
        dateElement.textContent = 'Date: ' + cells[3].innerText;
        contentContainer.appendChild(dateElement);

        card.appendChild(imgContainer);
        card.appendChild(contentContainer);

        card.addEventListener('click', function() {
            const postSeq = postRow.querySelector('input').value;
            document.location = "/postview/" + postSeq;
        });

        // Insert the imgContainer at the top of the card
        card.insertBefore(imgContainer, card.firstChild);

        gridContainer.appendChild(card);
    });

    document.getElementById('postTable').style.display = 'none';
    gridContainer.style.display = 'grid';
});






</script>
</html>
