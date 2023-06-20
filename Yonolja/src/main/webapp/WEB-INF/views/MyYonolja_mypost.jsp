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
<title>나의문의</title>
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
  font-size: 28px;
  font-weight: bold;
  margin-bottom: 20px;
}

section {
  display: flex;
  justify-content: center;
  align-items: center; 
  margin-bottom: 40px;
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
 
  font-weight: bold;
  background-color: #e9e9e9;
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
  align-items: center;
  
  padding: 4px;
  display: flex;
  justify-content: center;
}

.post_link {
  cursor: pointer;
}

/* 페이지네이션 */
 .page_nation {
    display: flex;
    justify-content: center;
    
    margin-top: 20px;
} 

.page-item {
  margin: 0 5px;
}

.page-link {
  color: black;
  text-decoration: none;
  padding: 8px 12px;
  border: 1px solid #ccc;
  border-radius: 5px;
  cursor: pointer;
}

.page-link:hover {
  background-color: #f2f2f2;
}

.active .page-link {
  background-color: #555;
  color: white;
}

</style>

<body>

<section>

<div>
	<h1 class=h1_post><span>나의문의</span></h1>
	<span class="r" style="display: block; text-align: center;">문의페이지로 이동하고 싶으면 리뷰를 클릭하세요.</span> 
	<span><a href="#" id="mypage" style="float:right;">마이페이지</a></span>
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

	<div class="page_nation">
	<c:if test="${mypost.size() >= 1}">       	
		<ul class="pagination">
			<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
				<a class="page-link" href="/MyYonolja_mypost?page=1&size=${size}">
					처음
				</a>
			</li>
			<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
				<a class="page-link" href="/MyYonolja_mypost?page=${currentPage-1}&size=${size}">
					이전
				</a>
			</li>
			
			<c:choose>
				<c:when test="${totalPages <= groupSize}">
					<!-- 전체 페이지 수가 그룹 크기보다 작거나 같을 경우, 모든 페이지 번호를 출력 -->
					<c:forEach begin="1" end="${totalPages}" var="i">
						<li class="page-item ${currentPage == i ? 'active' : ''}">
							<a class="page-link" href="/MyYonolja_mypost?page=${i}&size=${size}">
								${i}
							</a>
						</li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<!-- 그룹의 첫 페이지 번호와 마지막 페이지 번호를 계산 -->
					<c:set var="groupStartPage" value="${currentGroup * groupSize + 1}" />
					<c:set var="groupEndPage" value="${Math.min((currentGroup + 1) * groupSize, totalPages.longValue())}" />
					
					<c:if test="${currentGroup > 0}">
						<!-- 현재 그룹이 첫번째 그룹이 아니라면 이전 그룹으로 가는 링크를 출력 -->
						<li class="page-item">
							<a class="page-link" href="/MyYonolja_mypost?page=${groupStartPage - 1}&size=${size}">
								...
							</a>
						</li>
					</c:if>
					
					<!-- 현재 그룹의 페이지 번호를 출력 -->
					<c:forEach begin="${groupStartPage}" end="${groupEndPage}" var="i">
						<li class="page-item ${currentPage == i ? 'active' : ''}">
							<a class="page-link" href="/MyYonolja_mypost?page=${i}&size=${size}">
								${i}
							</a>
						</li>
					</c:forEach>
					
					<c:if test="${groupEndPage < totalPages}">
						<!-- 현재 그룹이 마지막 그룹이 아니라면 다음 그룹으로 가는 링크를 출력 -->
						<li class="page-item">
							<a class="page-link" href="/MyYonolja_mypost?page=${groupEndPage + 1}&size=${size}">
								...
							</a>
						</li>
					</c:if>
				</c:otherwise>
			</c:choose>
			
			<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
				<a class="page-link" href="/MyYonolja_mypost?page=${currentPage+1}&size=${size}">
					다음
				</a>
			</li>
			
			<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
				<a class="page-link" href="/MyYonolja_mypost?page=${totalPages}&size=${size}">
					끝
				</a>
			</li>
		</ul>
	</c:if> 
</div>

		
	</div>
</div>

</section>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)
// 마이페이지로 돌아가기
.on('click', '#mypage', function() {
	window.location.href = "/mypage";
})

function redirectToPostView(postSeq) {
  window.location.href = "/postview/" + postSeq;
}
	
</script>
</html>