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
<title>MyPost</title>
<link rel="icon" href="/img/website/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<%@ include file ="./structure/header.jsp" %>

<style>

/* 위까지 헤더, footer 설정 */

.h1_post {
  border-radius: 15px;
  width: 800px;
  margin: auto; /* 가운데 정렬 */
  padding: 20px; /* 내부 패딩 추가 for better appearance */
  position: relative;
  
  text-align: center;
}

section {
  display: flex;
  justify-content: center;
  align-items: center;
}

.div_post {
  width: 800px;
  margin: auto;
  text-align: center;
  
  display: grid;
  grid-template-columns: 1fr 3fr 1fr 1fr;
  align-items: center;
  padding: 15px; /* 수정된 부분 */
  border-bottom: 1px solid black;
}

.div_post2 {
  width: 800px;
  margin: auto;
  text-align: center;
  
  display: grid;
  grid-template-columns: 1fr 3fr 1fr 1fr;
  align-items: center;
  padding: 15px; /* 수정된 부분 */
  border-bottom: 1px solid black;
}


.div_post > span {
  padding: 4px;
  display: grid;
  align-items: center;
}


</style>

<body>

<section>

<div>
	<h1 class=h1_post><span>나의문의</span></h1>
	<div class="div_post">
		<span>#</span>
		<span>제목</span>
		<span>작성일</span>
		<span>답변여부</span>		
	</div>
	<div class="post_click">
	
	<c:forEach items="${mypost}" var="post" varStatus="status">
		<div class="div_post2">
			<span class="post_link" onclick="redirectToPostView(${post.post_seq})">${post.post_seq}</span>
			<span class="post_link" onclick="redirectToPostView(${post.post_seq})">${post.post_title}</span>
			<span class="post_link" onclick="redirectToPostView(${post.post_seq})">${post.post_date}</span>
			<span class="post_link" onclick="redirectToPostView(${post.post_seq})">
				<c:choose>
	                <c:when test="${post.post_comment == null}">답변 안함</c:when>
	                <c:otherwise>답변 완료</c:otherwise>
            	</c:choose>
			</span>
			<input type="hidden" value="${post.post_seq}" id="seq_${post.post_seq}">
		</div>
	</c:forEach>

		
	</div>
</div>

</section>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)


/* .on('click', '.post_link', function() {
	var post_seq = $('#seq').val(); 
	window.location.href = '/postview/' + post_seq;
	}) */
	
/*  	.on('click', '.post_link', function() {
	    var post_seq = $(this).prev().prev().prev().text();
	    var seq_input = $(this).next();
	    seq_input.val(post_seq);
	    var seq_value = seq_input.val();
	    window.location.href = '/postview/' + seq_value;
	})  */
	
	
</script>
</html>