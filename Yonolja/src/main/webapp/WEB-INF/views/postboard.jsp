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
</head>
<style>


/* section{	 */
/* 	display:grid; */
/* 	grid-template-columns:1fr; */
/* 	grid-template-rows:50px 30px auto; */
/* 	width:90%; */
/* 	margin:0 auto; */
/* 	margin-top:100px; */
/* } */
/* section div{ */
/* 	border:1px solid #ddd; */
/* } */

/* #boardTitleBox span{ */
/* 	font-size:40px; */
/* 	font-weight:bold; */
/* 	font-family:cursive; */
/* } */

/* #postTB{ */
/* 	width:100%; */
/* 	border-collapse:collapse; */
/* 	table-layout: fixed; */
/* 	min-width:600px; */
/* } */


/* #postTB tfoot tr:nth-child(1) td{ */
/* 	text-align:center; */
/* 	border-top:1px solid #ddd; */
/* 	border-bottom:1px solid #ddd; */
/* } */

/* #postTB tfoot tr:nth-child(2) td{ */
/* 	text-align:center; */
/* 	border-top:1px solid #ddd; */
/* 	border-bottom:1px solid #ddd; */
/* } */

/* #postTB tfoot tr:nth-child(3) td{ */

/* 	text-align:right; */
/* 	border-top:1px solid #ddd; */
/* 	border-bottom:1px solid #ddd; */
/* } */
 .adminPost{

 	cursor:pointer; 
 	transition:0.5s; 
 	background-color:#E6E6E6;
 	
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
 





 
 
</style>
<body>
<%@ include file ="./structure/header_placePage.jsp" %>

<section class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <h2 class="text-center">Board</h2>
            <div class="form-group mt-4">
            
			 <div class="view-buttons d-flex justify-content-end">
                    <button id="list-view-btn" class="btn btn-primary btn-sm">List View</button>
                    <button id="grid-view-btn" class="btn btn-primary btn-sm">Grid View</button>
                </div>
                <label for="howmanyPosts"></label>
                
                <select id="howmanyPosts" class="form-control">
                    <option value=5>5</option>
                    <option value=10>10</option>
                    <option value=20>20</option>
                    <option value=30>30</option>
                </select>
            </div>
            <div class="table-responsive">
                <table id="postTB" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>글번호</th>
                            <th>글제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>답변여부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- AJAX로 추가됨 -->
                    </tbody>
                    <tfoot>
                        <tr>
                            <td id="pageNumbers" colspan="7">
                        <!-- AJAX로 추가됨 -->
                            </td>
                        </tr>
                        <tr id="searchbarBox">
                            <td colspan="7">
                                <div class="input-group mb-3">
                                    <select id="keyword_select" class="form-control" style=width:20px;>
                                        <option value="post_title" >제목</option>
                                        <option value="post_content">내용</option>
                                        <option value="user_id">작성자</option>
                                    </select>
                                    <input type="text" id="keyword_input" class="form-control" placeholder="Keyword">
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

$(document).ready(function() {
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
});

///////////////////////////////// global variables ///////////////////////////////////
let currentPage = 1;
let keyword = null;

///////////////////////////////// function ///////////////////////////////////
function loadPosts() {
    console.log('loadPosts activated');
    $('#postTB tbody').empty();

    $.ajax({
        url: '/getPosts',type: 'post',dataType: 'json', 
        	data: {
            keyword_select: $('#keyword_select option:selected').val(),
            keyword: keyword,
            howmanyposts: $('#howmanyPosts option:selected').val(),
            pageNum: currentPage
        },
        success: function(posts) {
            for (i = 0; i < posts.length; i++) {
                post = posts[i];
                commented = '아니오';
                if (post.comment != null && post.comment != '') {
                    commented = '예';
                }
                
                str = '';
                
                if(post.category==1){
                    str = '<tr class=adminPost>';
                    str += '<td class=post_seq>' + post.seq + '</td>';
                    str += '<td class=post_title>(공지)' + post.title + '</td>';
                    str += '<td>' + post.user_id + '</td>';
                    str += '<td>' + post.date + '</td>';
                    str += '<td>' + commented + '</td>';
                    str += '</tr>';
                    $('#postTB tbody').append(str);
                } else {
                    str = '<tr class=post>';
                    str += '<td class=post_seq>' + post.seq + '</td>';
                    str += '<td class=post_title>' + post.title + '</td>';
                    str += '<td>' + post.user_id + '</td>';
                    str += '<td>' + post.date + '</td>';
                    str += '<td>' + commented + '</td>';
                    str += '</tr>';
                    $('#postTB tbody').append(str);
                }
               
            }
        }
    });
}

function loadPageNums() {
    $('#pageNumbers').empty();
    $.ajax({
        url: '/getPageNums',type: 'post', dataType: 'text',
        data: {
            keyword_select: $('#keyword_select option:selected').val(),
            keyword: keyword,
            howmanyposts: $('#howmanyPosts option:selected').val()
        },
        success: function(howmanyPages) {
            str = '';
            for (i = 0; i < parseInt(howmanyPages); i++) {
                if ((i + 1) == currentPage) {
                    str += '<span class=page style="font-weight:bold;text-decoration:underline;font-size:18px;">' + (i + 1) + '</span>';
                } else {
                    str += '<span class=page>' + (i + 1) + '</span>';
                }
            }
            $('#pageNumbers').append(str);
        }
    });
}
</script>
</html>
