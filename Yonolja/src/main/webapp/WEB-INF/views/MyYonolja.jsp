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
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>MyYonolja</title>
<link rel="icon" href="/img/website/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</style>

</head>

<%@ include file ="./structure/header.jsp" %>

<style>


/* 위까지 헤더, footer 설정 */

a {
    text-decoration: none; /* a 요소의 밑줄 없애기 */
}

.mynolja {
    width: 800px; /* .nolja의 width와 동일하게 설정 */
    margin: auto; /* 가운데 정렬 */
    text-align: left; 
    padding-top: 30px; /* 헤더와의 간격 */
    position: relative;
    z-index: 1;
}

.nolja {
	border: 1px solid #ccc; /* 외부에 네모난 선 추가 */
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	border-radius: 15px;
	width: 800px;
	margin: auto; /* 가운데 정렬 */
	padding: 20px; /* 내부 패딩 추가 for better appearance */
	background-color: #lightblue;
	position: relative;
}

.myname, .mylist, .mypost, .myhotel {
    border: 1px solid #ccc;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    border-radius: 15px; 
    width: 700px;
    margin: auto;
    padding: 20px;
    background-color: #lightblue;
}

.myhotel {
	position: relative;
}

.place_name {
  position: absolute;
  bottom: 10px; /* 사진 하단과의 여백 조절 */
  left: 50%; /* 왼쪽 위치를 50%로 설정하여 가운데로 이동 */
  transform: translateX(-50%); /* 왼쪽으로 50%만큼 이동하여 가운데 정렬 */
  text-align: center; /* 내부 텍스트 가운데 정렬 */
  background-color: rgba(255, 255, 255, 0.8); /* 배경색 설정 */
  padding: 5px 10px; /* 내부 여백 설정 */
  border-radius: 5px; /* 테두리 둥글게 설정 */
  white-space: nowrap;
}

.myhotel img, .place_img {
	width: 205px; /* 너비 조절. */
	height: 205px; /* 높이 조절. */
	padding: 0px;
}

.myB {
	padding: 8px;
}


.s_con {
    position: relative;
    overflow: hidden;
    width: 100%;
    border-radius: 15px;
    background-color: #f9f9f9; 
}

.slider {
    display: flex;
    width: fit-content;
    transition: transform 0.3s ease-in-out;
    position: relative;
    z-index: 1;
}

.place_s {
    margin-right: 20px;
    position: relative;
    z-index: 1;
}

.s_control {
    margin-top: 10px;
    display: flex;
    justify-content: center;
    background-color: #f9f9f9; 
}

.s_prev,
.s_next {
    margin: 0 10px;
    padding: 5px 10px;
    cursor: pointer;
}

/* 이미지 내부 화살표 버튼 */

.image_container {
    position: relative;
    display: inline-block;
}

.arrow_prev,
.arrow_next {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    font-size: 1.5em;
    transition: background-color 0.3s;
    color: white;
    background-color: rgba(0, 0, 0, 0.5);
    padding: 0.5em;
    cursor: pointer;
    border-radius: 50%;
    width: 47px;
    height: 47px;
    display: none;  /* 기본적으로 숨김 처리 */
    align-items: center;
    justify-content: center;
    text-align: center; /* 텍스트를 가운데 정렬 */
    flex-direction: column; /* 수직 방향으로 정렬 */
    line-height: 23.5px;
}

.arrow_prev:hover,
.arrow_next:hover {
    background-color: rgba(0, 0, 0, 0.7); 
}

.arrow_prev {
    left: 0px;
}

.arrow_next {
    right: 0px;
}

.arrow_prev span,
.arrow_next span {
    display: flex;
    align-items: center;
    justify-content: center;
}


/* 모달창 비밀번호확인창 */

#passwordModal {
    display: none; 
    position: fixed; 
    z-index: 1; 
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%; 
    overflow: auto; 
    background-color: rgba(240, 240, 240, 0.5);
    border: 1px solid #ccc;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
}

#passwordInput {
    display: block;
    width: 100%;
    margin: 10px 0;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

#confirmButton {
    display: block;
    width: 100%;
    padding: 5px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: white;
}

/* Modal Content/Box */
#passwordModalContent {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 30%;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); 
}

/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

/* 페이지네이션 */
.page_nation {
    display: flex;
    justify-content: center;
}


</style>
<body>
<section>
<div class="mynolja">
	<span><h1><b>My 요놀자</b></h1></span>
</div><br>

<div class="nolja">
	<div class="myname">
		<span>${user_name}</span><br>
		<span>${user_type}</span><br>
		<a href="#" id="myinfo">내정보관리</a>
		<input type="hidden" value="${user_password}" class="user_ps">
<%-- 		<span>${user_email}</span> --%>
	</div><br>
	
	<div class="mylist">
		<span><b>후기</b></span><br>
		<a href="#" id="myreviews">나의후기</a><br>
		
		<span><b>예약</b></span><br>
		<a href="#" id="mybooks">예약내역조회</a><br>
		
<!-- 		<span><b>찜</b></span><br>
		<a href="#" id="mylikes">찜한 호텔</a><br> -->
		
	</div><br>
	
	<c:if test="${user_type eq 'admin' or user_type eq 'owner'}">
		<div class="myhotel">
		   <span class="myB"><b>My Business</b>&nbsp;<a href="#" id="newHotel" style="float:right;">업장추가</a></span><br>  		   
		
			<div class="s_con">
				<div class="slider">
					<c:forEach items="${placeList}" var="place" varStatus="loop">
						<c:if test="${place.user_seq eq sessionScope.user_seq}">
							<c:set var="imagePaths" value="${place.place_imgs.split(',')}" />
							<c:choose>
								<c:when test="${fn:length(imagePaths) > 1}">
									<div class="place_s">
										<div class="image_container">
											<div class="slide_container">
												<c:forEach items="${imagePaths}" var="imagePath" varStatus="imageLoop">
													<img src="${imagePath}" alt="Image" class="place_img ${imageLoop.index == 0 ? 'active' : ''}" style="${imageLoop.index > 0 ? 'display: none' : ''}">
												</c:forEach>
											</div>
											<div class="arrow_prev">
												<span>&lt;</span>
											</div>
											<div class="arrow_next">
												<span>&gt;</span>
											</div>
										</div>
									<div><span class="place_name">${place.place_name}</span></div>
									<input type="hidden" value="${place.place_seq}" class="place_seq">
									</div>
								</c:when>
								<c:otherwise>
									<div class="place_s">
										<div class="image_container">
										
										                <c:choose>
                    <c:when test="${empty imagePaths[0] or imagePaths[0].equals('')}">
                        <!-- 여기에 이미지가 없을 경우를 대비한 텍스트 또는 이미지를 추가하세요 -->
                        <img src="/img/place_img/이미지없음.png" alt="No image available" class="place_img">
                    </c:when>
                    <c:otherwise>
										
											<img src="${imagePaths[0]}" alt="Image" class="place_img">
											
											</c:otherwise>
											</c:choose>
											
										</div>
										<div>
										<span class="place_name">${place.place_name}</span>
										</div>
										<input type="hidden" value="${place.place_seq}" class="place_seq">
									</div>
								</c:otherwise>
							</c:choose>						
						</c:if>						
					</c:forEach>
				</div>
				
				<c:choose>
					<c:when test="${empty placeList}">
						<div class="s_control">
							<h3>등록된 업장 정보가 없습니다.</h3>
						</div> 
					</c:when>
					<c:otherwise>
						<c:set var="userExists" value="false" />
						<c:forEach items="${placeList}" var="place">
							<c:if test="${place.user_seq eq sessionScope.user_seq}">
								<c:set var="userExists" value="true" />
							</c:if>
						</c:forEach>
						
						<c:choose>
							<c:when test="${not userExists}">
								<div class="s_control">
									<h3>등록된 업장 정보가 없습니다.</h3>
								</div>
							</c:when>
							<c:otherwise>
							
							<div class="page_nation">
								<c:if test="${placeList.size() >= 1}">       	
									<ul class="pagination">
										<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
											<a class="page-link" href="/mypage?page=1&size=${size}">
												처음
											</a>
										</li>
										<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
											<a class="page-link" href="/mypage?page=${currentPage-1}&size=${size}">
												이전
											</a>
										</li>
										
										<c:choose>
											<c:when test="${totalPages <= 5}">
												<c:forEach begin="1" end="${totalPages}" var="i">
													<li class="page-item ${currentPage == i ? 'active' : ''}">
														<a class="page-link" href="/mypage?page=${i}&size=${size}">
															${i}
														</a>
													</li>
												</c:forEach>
											</c:when>
											
											<c:when test="${currentPage <= 2}">
												<c:forEach begin="1" end="5" var="i">
													<li class="page-item ${currentPage == i ? 'active' : ''}">
														<a class="page-link" href="/mypage?page=${i}&size=${size}">
															${i}
														</a>
													</li>
												</c:forEach>
												
												<li class="page-item disabled">
													<a class="page-link">...</a>
												</li>
											</c:when>
											
											<c:when test="${currentPage >= totalPages - 1}">
												<li class="page-item disabled">
													<a class="page-link">...</a>
												</li>
												<c:forEach begin="${totalPages-4}" end="${totalPages}" var="i">
													<li class="page-item ${currentPage == i ? 'active' : ''}">
														<a class="page-link" href="/mypage?page=${i}&size=${size}">
															${i}
														</a>
													</li>
												</c:forEach>
											</c:when>
											
											<c:otherwise>
												<li class="page-item disabled">
													<a class="page-link">...</a>
												</li>
												<c:forEach begin="${currentPage-1}" end="${currentPage+2}" var="i">
													<li class="page-item ${currentPage == i ? 'active' : ''}">
														<a class="page-link" href="/mypage?page=${i}&size=${size}">
															${i}
														</a>
													</li>
												</c:forEach>
												
												<li class="page-item disabled">
												  <a class="page-link">...</a>
												</li>
											</c:otherwise>
										</c:choose>
										
										<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
											<a class="page-link" href="/mypage?page=${currentPage+1}&size=${size}">
												다음
											</a>
										</li>
										
										<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
											<a class="page-link" href="/mypage?page=${totalPages}&size=${size}">
												끝
											</a>
										</li>
									</ul>
								</c:if> 
							</div>

							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
		</div><br>
	</c:if>	
	<div class="mypost">
		<span><b>고객센터</b></span><br>
		<a href="#" id="post">문의하러가기</a><br>
		<a href="#" id="mypostlist">나의문의</a><br>
	</div>
</div>

<div id="passwordModal">
    <div id="passwordModalContent">
        <span class="close">&times;</span>
        <label for="passwordInput">비밀번호를 입력해주세요</label>
        <input type="password" id="passwordInput">
        <button id="confirmButton">확인</button>
    </div>
</div>

</section>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>

$(document).ready(function() {
	var slider = $(".slider");
	var scrollAmount = $(".place_s").outerWidth(true);
	var totalSlides = slider.find(".place_s").length;
	var currentSlide = 0;

	function updateSlider() {
		slider.animate({ scrollLeft: scrollAmount * currentSlide }, 500);
	}

	function showSlides() {
		var start = currentSlide * 3;
		var end = start + 3;
		slider.find(".place_s").hide().slice(start, end).show();
		updateArrowButtons();
	}

	function updateArrowButtons() {
		var isFirstImage = slider.find(".place_s").eq(currentSlide * 3).find(".place_img").first().hasClass("active");
		var isLastImage = slider.find(".place_s").eq(currentSlide * 3).find(".place_img").last().hasClass("active");
		var isFirstSlide = currentSlide === 0;
		var isLastSlide = currentSlide === Math.ceil(totalSlides / 3) - 1;
		
		slider.find(".arrow_prev").toggle(!isFirstImage && !isLastSlide);
		slider.find(".arrow_next").toggle(!isFirstImage || currentSlide === 0);
		
		// 마지막 사진인 경우 '>' 버튼 숨김 처리
		slider.find(".arrow_next").toggle(!isLastImage);
	}

	function resetArrowButtons() {
		slider.find(".arrow_prev").hide();
		slider.find(".arrow_next").hide();
	}

	$(".s_prev").click(function() {
		if (currentSlide > 0) {
			currentSlide--;
			updateSlider();
			showSlides();
			updateArrowButtons();
		}
	});

	$(".s_next").click(function() {
		if (currentSlide < Math.ceil(totalSlides / 3) - 1) {
			currentSlide++;
			updateSlider();
			showSlides();
			updateArrowButtons();
		}
	});

  showSlides();
  resetArrowButtons();

	$(".place_s").mouseenter(function() {
		var isFirstImage = $(this).find(".place_img").first().hasClass("active");
		$(this).find(".arrow_prev").toggle(!isFirstImage);
		$(this).find(".arrow_next").toggle(true);
	});

	$(".place_s").mouseleave(function() {
		resetArrowButtons();
	});

	$(".place_s").on("click", ".arrow_prev", function(e) {
		e.stopPropagation();
		var container = $(this).siblings(".slide_container");
		var images = container.find(".place_img");
		var activeImage = images.filter(".active");
		var prevImage = activeImage.prev(".place_img");
	
		if (prevImage.length === 0) {
			prevImage = images.last();
		}
		
		activeImage.removeClass("active").hide();
		prevImage.addClass("active").show();
		$(this).siblings(".arrow_next").show();
		updateArrowButtons();
		
		var isFirstImage = prevImage.index() === 0;
		var isLastSlide = container.find(".place_img").last().hasClass("active");
		
		$(this).toggle(!isFirstImage || !isLastSlide);
		$(this).closest(".place_s").siblings(".place_s").find(".arrow_next").hide();
		
		// 첫 번째 사진인 경우 '<' 버튼 숨김 처리
		$(this).closest(".place_s").find(".arrow_prev").toggle(!isFirstImage);
	});

  $(".place_s").on("click", ".arrow_next", function(e) {
	  e.stopPropagation();
	  var container = $(this).siblings(".slide_container");
	  var images = container.find(".place_img");
	  var activeImage = images.filter(".active");
	  var nextImage = activeImage.next(".place_img");
	
	  if (nextImage.length === 0) {
	  	nextImage = images.first();
	  }
	
	  activeImage.removeClass("active").hide();
	  nextImage.addClass("active").show();
	  $(this).siblings(".arrow_prev").show();
	  updateArrowButtons();
	
	  var isFirstImage = container.find(".place_img").first().hasClass("active");
	  var isLastImage = nextImage.index() === images.length - 1;
	
	  // 첫 번째 사진인 경우 '<' 버튼 숨김 처리
	  $(this).closest(".place_s").find(".arrow_prev").toggle(!isFirstImage);
	
	  // 마지막 사진인 경우 '>' 버튼 숨김 처리
	  $(this).toggle(!isLastImage);
	
	  // 다른 사진들의 '>' 버튼 숨김 처리
	  $(this).closest(".place_s").siblings(".place_s").find(".arrow_next").hide();
	});
});

$(document)
	.on("mouseenter", ".place_s", function() {
		var isFirstImage = $(this).find(".place_img").first().hasClass("active");
		$(this).find(".arrow_prev").toggle(!isFirstImage);
	})
	.on("mouseleave", ".place_s", function() {
		$(this).find(".arrow_prev").hide();
	})

.on("click", "#myinfo", function() {
    $("#passwordModal").show();
})

.on("click", ".close", function() {
    $("#passwordModal").hide();
    $("#passwordInput").val(''); // 추가된 부분: 비밀번호 입력 필드 초기화
})

.on("click", "#confirmButton", function() {
    var password = $("#passwordInput").val();
    var user_ps = $(".user_ps").val();

    if (password === user_ps) {
        window.location.href = '/MyYonolja_myinfo';
    } else {
        alert('비밀번호가 일치하지 않습니다.');
        $("#passwordInput").val('');
        return false;
    }
    $("#passwordModal").hide();
    $("#passwordInput").val(''); // 추가된 부분: 비밀번호 입력 필드 초기화
})




.on("click", ".place_img", function() {
    var place_seq = $(this).closest(".place_s").find(".place_seq").val();
    console.log("place_seq: " + place_seq);
    window.location.href = '/host_managePlace/' + place_seq;
})

.on("click", "#post", function() {
	console.log("post click!");
	window.location.href="/post_board";
})

.on("click", "#mypostlist", function() {
	window.location.href ="/MyYonolja_mypost";
})

.on("click", ".addH", function() {
	window.location.href = "/host_addPlace";
})

.on("click", "#mybooks", function() {
	window.location.href = "/MyYonolja_mybooklist";
})

.on("click", "#myreviews", function() {
	window.location.href = "/MyYonolja_myreview";
})

.on("click", "#newHotel", function() {
	window.location.href = "/host_addPlace"
})

//

.on("click", ".arrow_prev", function(e) {
    e.stopPropagation();
    var container = $(this).siblings(".slide_container");
    var images = container. find(".place_img");
    var activeImage = images.filter(".active");
    var prevImage = activeImage.prev(".place_img");

    if (prevImage. length === 0) {
        prevImage = images.last();
    }

    activeImage.removeClass("active").hide();
    prevImage.addClass("active").show();
})

.on("click", ".arrow_next", function(e) {
    e.stopPropagation();
    var container = $(this).siblings(".slide_container");
    var images = container. find(".place_img");
    var activeImage = images.filter(".active");
    var nextImage = activeImage.next(".place_img");

    if (nextImage.length === 0) {
        nextImage = images.first();
    }

    activeImage.removeClass("active").hide();
    nextImage.addClass("active").show();
})
 

</script>
</html>

