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
    text-align: left; /* 텍스트를 왼쪽 정렬 */
    padding-top: 150px; /* 헤더의 높이와 동일한 값으로 설정 */
    position: relative;
    z-index: 1;
}

.nolja {
  border: 1px solid black; /* 외부에 네모난 선 추가 */
  /*width: fit-content;  요소의 너비를 내용에 맞춤 */
  border-radius: 15px;
  width: 800px;
  margin: auto; /* 가운데 정렬 */
  padding: 20px; /* 내부 패딩 추가 for better appearance */
  position: relative;
}

.myname {
  border: 1px solid black;
  border-radius: 15px; /* 테두리를 둥글게 */
  width: 700px;
  margin: auto;
  padding: 20px;
}

.mylist {
  border: 1px solid black;
  border-radius: 15px; /* 테두리를 둥글게 */
  width: 700px;
  margin: auto;
  padding: 20px;
}

.mypost {
  border: 1px solid black;
  border-radius: 15px; /* 테두리를 둥글게 */
  width: 700px;
  margin: auto;
  padding: 20px;
}

.myhotel {
  border: 1px solid black;
  border-radius: 15px; /* 테두리를 둥글게 */
  width: 700px;
  margin: auto;
  padding: 20px;
}

.myhotel img, .place_img {
    width: 200px; /* 너비 조절. */
    height: 200px; /* 높이 조절. */
    padding: 8px;
}

.myB {
	padding: 8px;
}


.s_con {
    position: relative;
    overflow: hidden;
    width: 100%;
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
    font-size: 1em;
    color: white;
    background-color: rgba(0, 0, 0, 0.5);
    padding: 0.5em;
    cursor: pointer;
}

.arrow_prev {
    left: -5px;
}

.arrow_next {
    right: -5px;
}

/* 모달창 비밀번호확인창 */
#passwordModal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
#passwordModalContent {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 30%; /* Could be more or less, depending on screen size */
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


</style>
<body>
<%-- <jsp:include page="./structure/all.jsp"></jsp:include> --%>
<%-- <jsp:include page="main.jsp"></jsp:include> --%>

<section>
<div class="mynolja">
	<span><h1><b>My 요놀자</b></h1></span>
</div><br>

<div class="nolja">
	<div class="myname">
		<span>${user_name}</span><br>
		<span>${user_type}</span><br>
		<a href="#" id="myinfo">내정보 관리</a>
		<input type="hidden" value="${user_password}" class="user_ps">
<%-- 		<span>${user_email}</span> --%>
	</div><br>
	
	<div class="mylist">
		<span><b>후기</b></span><br>
		<a href="#" id="myreviews">나의후기</a><br>
		
		<span><b>예약</b></span><br>
		<a href="#" id="mybooks">예약내역조회</a><br>
		
		<span><b>찜</b></span><br>
		<a href="#" id="mylikes">찜한 호텔</a><br>
	</div><br>
	
	<c:if test="${user_type eq 'admin' or user_type eq 'owner'}">
		<div class="myhotel">
		<span class="myB"><b>My Business</b></span><br>
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
											<div class="arrow_prev">&lt;</div>
											<div class="arrow_next">&gt;</div>
										</div>
									<div><span>${place.place_name}</span></div>
									<input type="hidden" value="${place.place_seq}" class="place_seq">
									</div>
								</c:when>
								<c:otherwise>
									<div class="place_s">
										<div class="image_container">
											<img src="${imagePaths[0]}" alt="Image" class="place_img">
										</div>
										<div>
										<span>${place.place_name}</span>
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
						<div class="s_control">
							<button class="addH">업장추가</button>
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
								<div class="s_control">
									<button class="addH">업장추가</button>
								</div>
							</c:when>
							<c:otherwise>
							<div class="s_control">
								<button class="s_prev">이전</button>
								<button class="s_next">다음</button>
								<button class="addH">업장추가</button>
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
        <label for="passwordInput">비밀번호를 입력해주세요:</label>
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
	  }

	  $(".s_prev").click(function() {
	    if (currentSlide > 0) {
	      currentSlide--;
	      updateSlider();
	      showSlides();
	    }
	  })

	  $(".s_next").click(function() {
	    if (currentSlide < Math.ceil(totalSlides / 3) - 1) {
	      currentSlide++;
	      updateSlider();
	      showSlides();
	    }
	  })

	  showSlides();
	})

/* .on("click", "#myinfo", function() {
	var password = prompt("비밀번호를 입력해주세요.");
	var user_ps = $(".user_ps").val();

		if (password === user_ps) {
			window.location.href = '/MyYonolja_myinfo';
		} else {
			alert('비밀번호가 일치하지 않습니다.');
		}
}) */

$(document)
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
	window.location.href="/postboard";
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
    // 이미지의 크기를 조정합니다.
/*     prevImage.css('width', '150px');
    prevImage.css('height', '150px'); */
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
    // 이미지의 크기를 조정합니다.
/*     nextImage.css('width', '150px');
    nextImage.css('height', '150px'); */
})
 

</script>
</html>

