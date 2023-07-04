<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>main</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="icon" href="/img/website/favicon-16x16.png" type="image/x-icon" sizes="16x16">
</head>
<style>


 .adminPost{

 	cursor:pointer; 
 	transition:0.5s; 
 	background-color:#c0c1adfc;
 	
 }
 .adminPost:hover{
 	background-color:#ddd; 
 }
 .post{ */
	text-align:center; 
 	cursor:pointer; 
 	transition:0.5s; 
 } 
 .post:hover{ 
 	background-color:#ddd; 
 } 
 .post td{ 
/* 	  overflow:hidden; */
/*       text-overflow:ellipsis; */
/*       white-space:nowrap; */
/*       width:25%; */
 } 
 .page{ 
 	cursor:pointer; 
 	margin:5px; 
 } 
 
 .row.justify-content-center {
    justify-content: flex-end;
}
 
.grid-view .post,
.grid-view .adminPost {
    border: 0.1px solid #ddd;
    width: 100%;
    margin: 0.5%;
    display: inline-block;
    
    padding: 10px;
   
    
}






.grid-view {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); /* 이 부분은 grid 열의 크기를 조정합니다 */
    grid-gap: 10px;
}
 
 .adminPost-list-view {
    display: flex;
    flex-direction: column;
    width: 100%;
    height:auto;
    border: 1px solid black;
    margin: 0.5%;
    padding: 10px;
}
 
  .grid-view .adminPost,
  .adminPost-list-view {
    width: 100%;
    display: flex;
    flex-direction: row;
  }
.grid-view .adminPost {
    height: auto;
    margin-bottom: 10px;
    padding: 10px;
  }

	 .adminPost-list-view {
    display: flex;
    flex-direction: column;
    width: 100%;
    height: auto;
    border: 1px solid black;
    margin-bottom: 10px;
    padding: 10px;
  }
  
 .adminPost.notice-post {
/*      background-color: red;  */
    display: flex;
    flex-direction: column;
}


.banner-slider {
  position: relative;
  overflow: hidden;
  width: 100%;
}

.banner-container {
  display: flex;
  width: 300%;
  animation: slide 15s infinite;
}

.banner-container img {
  width: 33.333%;
  object-fit: cover;
}

@keyframes slide {
  0% {
    transform: translateX(0);
  }
  16.66% {
    transform: translateX(0);
  }
  33.33% {
    transform: translateX(0);
  }
  50% {
    transform: translateX(-100%);
  }
  66.66% {
    transform: translateX(-100%);
  }
  83.33% {
    transform: translateX(-100%);
  }
  100% {
    transform: translateX(0);
  }
}


.prev-button, .next-button {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  padding: 10px;
  font-size: 16px;
  background-color: #fff;
  border: none;
  cursor: pointer;
}

.prev-button {
  left: 10px;
}

.next-button {
  right: 10px;
}
 
</style>
<body>
<%@ include file ="./structure/header_placePage.jsp" %>
 
 
 
 


 
 
 
 
<section class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">
        
        
        
        
           <div class="banner-slider">
           
           
<!--   <h2 class="text-center">문의 게시판</h2> -->
  <div class="banner-container">
    <img src="https://yaimg.yanolja.com/v5/2023/05/24/13/646e100ad092c4.89080932.png" alt="Banner 1">
    <img src="https://yaimg.yanolja.com/v5/2023/06/16/20/648cc7768e3dc4.94186600.png" alt="Banner 2">
    <img src="https://yaimg.yanolja.com/v5/2023/06/16/17/648ca0ac4bd4a2.38321025.png" alt="Banner 3">
      <img src="https://yaimg.yanolja.com/v5/2023/06/22/17/649485e981fa00.70596094.png" alt="Banner 4">
        <img src="https://yaimg.yanolja.com/v5/2023/06/20/17/6491e6110bada9.53697753.png" alt="Banner 5">
  <img src="https://yaimg.yanolja.com/v5/2023/06/21/16/649323b4886ad0.01670379.png" alt="Banner 4">
  <img src="https://yaimg.yanolja.com/v5/2023/06/16/15/648c80b6a093e8.52969078.png" alt="Banner 4">
  <img src="https://yaimg.yanolja.com/v5/2023/05/31/14/64775deec257f7.80454624.png" alt="Banner 4">
  <img src="https://yaimg.yanolja.com/v5/2023/05/24/13/646e100ad092c4.89080932.png" alt="Banner 4">
  <img src="https://yaimg.yanolja.com/v5/2023/06/22/15/64946a9b6d4e18.42466979.png" alt="Banner 4">
  </div>
    <button class="prev-button"> < </button>
  <button class="next-button"> > </button>
</div>

           
            
            
            <div class="form-group mt-4">
            
			 <div class="view-buttons d-flex justify-content-end">
                    <button id="list-view-btn" class="btn btn-primary btn-sm">List View</button>
                    <button id="grid-view-btn" class="btn btn-primary btn-sm">Grid View</button>
                </div>
                <label for="howmanyPosts"></label>
                
                <select id="howmanyPosts" class="form-control" style=width:8%;>
                    <option value=5>5</option>
                    <option value=10>10</option>
                    <option value=20>20</option>
                    <option value=30>30</option>
                </select>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered">
                   <thead>
    <tr >
        <th style="width: 7%;">번호</th>
        <th style="width: 54%;">글제목</th>
        <th style="width: 10%;">작성자</th>
        <th style="width: 13.5%;">작성일</th>
        <th style="width: 15.5%;">답변여부</th>
    </tr>
</thead>

                    </table>
             
                    <table id="postTB" class="table table-bordered" style="width: 900px; ">
					<tbody >
					                        <!-- AJAX로 추가됨 -->
                    </tbody>
                    <tfoot>
                        <tr>
       <td colspan="7">
           <nav aria-label="Page navigation example">
               <ul id="pagination" class="pagination justify-content-center">
                   <!-- AJAX로 추가됨 -->
               </ul>
           </nav>
       </td>
   </tr>
                        <tr id="searchbarBox">
                            <td colspan="7">
                                <div class="input-group mb-3">
                                    <select id="keyword_select" class="form-control" style=width:20%;>
                                        <option value="post_title"  >제목</option>
                                        <option value="post_content">내용</option>
                                        <option value="user_id">작성자</option>
                                    </select>
                                    <input type="text" id="keyword_input" class="form-control" style=width:60%; placeholder="Keyword">
                                    <div class="input-group-append">
                                        <button id="search" class="btn btn-outline-secondary" type="button">검색</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <a href="postwrite" class="btn btn-primary float-right">글쓰기</a>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</section>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
///////////////////////////////// jQuery /////////////////////////////////////
$(document).ready(function(){
    // 기존의 global variables
    let currentPage = 1;
    let currentPageSet = 1;
    const pageSize = 10;
    let keyword = null;

    // 페이지가 로드되면 게시물과 페이지 번호를 불러옵니다.
    loadPosts();
    loadPageNums();

    $('#howmanyPosts').on('change', function() {
        currentPage = 1;
        loadPosts();
        loadPageNums();
    });

    $('#search').on('click', function() {
        keyword = $('#keyword_input').val();
        currentPage = 1;
        loadPosts();
        loadPageNums();
    });

    $(document).on('click', '.post', function() {
        seq = $(this).find('.post_seq').text();
        document.location = "/postview/" + seq;
    });
    
    $(document).on('click', '.adminPost', function() {
        seq = $(this).find('.post_seq').text();
        document.location = "/postview/" + seq;
    });
    
    $(document).on('click', '.page', function() {
        currentPage = parseInt($(this).text());
        loadPosts();
        loadPageNums();
    });
    
    $('#grid-view-btn').on('click', function() {
        $('#postTB tbody').removeClass('list-view').addClass('grid-view');
//           $('#postTB th').hide();
        loadPosts();
    });

    
    
    
    $('#list-view-btn').on('click', function() {
        $('#postTB tbody').removeClass('grid-view').addClass('list-view');
        loadPosts();
    });

    $(document).on('click', '#pagination .page-item a', function(e) {
        e.preventDefault();
        if ($(this).parent().attr('id') == 'prev') {
            if(currentPageSet > 1) {
                currentPageSet--;
                currentPage = (currentPageSet - 1) * pageSize + 1;
            }
        } else if ($(this).parent().attr('id') == 'next') {
            currentPageSet++;
            currentPage = (currentPageSet - 1) * pageSize + 1;
        } else {
            currentPage = parseInt($(this).text());
        }
        loadPosts();
        loadPageNums();
    });

    function loadPosts() {
        console.log('loadPosts activated');
        $('#postTB tbody').empty();

        $.ajax({
            url: '/getPosts',
            type: 'post',
            dataType: 'json', 
            data: {
                keyword_select: $('#keyword_select option:selected').val(),
                keyword: keyword,
                howmanyposts: $('#howmanyPosts option:selected').val(),
                pageNum: currentPage
            },
            success: function(posts) {
                let str = '';
                
                if ($('#postTB tbody').hasClass('grid-view')) {
                    for (i = 0; i < posts.length; i++) {
                        post = posts[i];
                        commented = '아니오';
                        if (post.comment != null && post.comment != '') {
                            commented = '예';
                        }

                        if (post.category == 1) { // 공지사항
                        	
                            str += '<div class="adminPost notice-post list-view">';
                            
                            str += '<div class="post_seq">' + post.seq + '</div>';
//                             str += '<div class="post_image"><img src="' + "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAxMThfNTgg%2FMDAxNjc0MDQ5NjIxNjcw.a8-em3T9ehX9tKcbO9w5S-sS2bvwVwTowCdSUcFwvlwg.cSO9oy1TN8cDsYJ--nfZat7_eSNME4I5sRbLixaQvtsg.JPEG.happppy_%2F076b496d6716aea28e3a0ef6c4e00ecb.jpg&type=a340" + '" style="width: 200px; height: 200px;" alt="post image"></div>';
							str += '<div class="post_image"><img src="' + post.img + '" style="width: 200px; height: 200px;" alt="post image" onerror="this.parentNode.removeChild(this)"></div>'; // 이미지 추가

                            str += '<div class="post_title">(공지)' + post.title + '</div>';
                            str += '<div>' + "작성자:"+ post.user_id + '</div>';
                            str += '<div>' +"작성일:"+ post.date + '</div>';
//                             str += '<div>' + commented + '</div>';
                            str += '</div>';
                            
                        } else { // 일반 게시물
                            str += '<div class="post grid-view">';
                            str += '<div class="post_seq">' + post.seq + '</div>';
                            str += '<div class="post_image"><img src="' + post.img + '" style="width: 200px; height: 200px;" onerror="this.style.display=\'none\'"></div>';
                            str += '<div class="post_title">' + post.title + '</div>';
                            str += '<div>' + "작성자:"+post.user_id + '</div>';
                            str += '<div>' +"작성일:"+ post.date + '</div>';
                            str += '<div>'+"답변여부:" + commented + '</div>';
                            str += '</div>';
                        }

                    }
                }
 else {
                    for (i = 0; i < posts.length; i++) {
                        post = posts[i];
                        commented = '<div class=no style=color:red;>'+'답변대기'+'</div>';
                        if (post.comment != null && post.comment != '') {
                            commented = '<div class=no style=color:green;>'+'답변완료'+'</div>';
                        }
                        
                        if (post.category == 1) {
                            str += '<tr class="adminPost">';
                            str += '<td class="post_seq">' + post.seq + '</td>';
                            str += '<td class="post_title">(공지)' + post.title + '</td>';
                            str += '<td>' + post.user_id + '</td>';
                            str += '<td>' + post.date + '</td>';
                            str += '<td>' + commented + '</td>';
                            str += '</tr>';
                        } else {
                            str += '<tr class="post">';
                            str += '<td class="post_seq">' + post.seq + '</td>';
                            str += '<td class="post_title">' + post.title + '</td>';
                            str += '<td>' + post.user_id + '</td>';
                            str += '<td>' + post.date + '</td>';
                            str += '<td>' + commented + '</td>';
                            str += '</tr>';
                        }
                    }
                }
                
                $('#postTB tbody').append(str);
     }
  });
}
    function loadPageNums() {
        $('#pagination').empty();
        $.ajax({
            url: '/getPageNums',
            type: 'post',
            dataType: 'text',
            data: {
                keyword_select: $('#keyword_select option:selected').val(),
                keyword: keyword,
                howmanyposts: $('#howmanyPosts option:selected').val()
            },
            success: function(howmanyPages) {
                let totalPageNum = parseInt(howmanyPages);
                let startPage = (currentPageSet - 1) * pageSize + 1;
                let endPage = startPage + pageSize - 1;
                if (endPage > totalPageNum) {
                    endPage = totalPageNum;
                }
                let str = '';

                str += '<li class="page-item" id="prev"><a class="page-link">이전</a></li>';
                for (let i = startPage; i <= endPage; i++) {
                    if (i == currentPage) {
                        str += '<li class="page-item active"><a class="page-link">' + i + '</a></li>';
                    } else {
                        str += '<li class="page-item"><a class="page-link">' + i + '</a></li>';
                    }
                }
                str += '<li class="page-item" id="next"><a class="page-link">다음</a></li>';
                
                $('#pagination').append(str);
            }
        });
    }
});



///

const prevButton = document.querySelector('.prev-button');
const nextButton = document.querySelector('.next-button');
const bannerContainer = document.querySelector('.banner-container');

prevButton.addEventListener('click', () => {
  bannerContainer.style.animationPlayState = 'paused';
  bannerContainer.insertBefore(bannerContainer.lastElementChild, bannerContainer.firstElementChild);
  bannerContainer.style.animationPlayState = 'running';
});

nextButton.addEventListener('click', () => {
  bannerContainer.style.animationPlayState = 'paused';
  bannerContainer.appendChild(bannerContainer.firstElementChild);
  bannerContainer.style.animationPlayState = 'running';
});

const API_KEY = 'd2be0a8d2b68e6a62cf1be34efc53499';
const city = 'Seoul';

$('#getWeather').on('click', function() {
    $.ajax({
        url: `http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${API_KEY}`,
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            $('#weatherInfo').html(`The temperature in ${city} is ${data.main.temp} K.`);
        },
        error: function(error) {
            console.log(error);
        },
    });
});


</script>

</html>