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
<title>나의후기</title>
<link rel="icon" href="/img/website/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

</head>

<%@ include file ="./structure/header.jsp" %>

<style>

/* 위까지 헤더, footer 설정 */
 .h1_review {
	border-radius: 15px;
	width: 800px;
	margin: auto; 
	padding: 20px; 
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

.div_review {
	width: 800px;
	margin: auto;
	text-align: center;
	
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr 1fr 0.5fr 0.1fr 0.5fr;
	align-items: center;
	padding: 15px;
	border-bottom: 1px solid black;
	
	font-weight: bold;
    background-color: #e9e9e9;
}

.div_review2 {
	width: 800px;
	margin: auto;
	text-align: center;
	
	display: grid;
	grid-template-columns: 1fr 1fr 1fr 1fr 1fr 0.5fr 0.1fr 0.5fr;
	align-items: center;
	padding: 15px; 
	border-bottom: 1px solid black;
}


.div_review > span {
	padding: 4px;
	display: grid;
	align-items: center;

    justify-content: center;
} 

.review_link {
  cursor: pointer;

}

/* 모달창 띄우기 */
#review_modal {
    display: none; 
    position: fixed; 
    z-index: 1; 
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%; 
    overflow: auto; 
	background-color: rgba(0, 0, 0, 0.4);
	
	text-align: center;
}

/* Modal Content/Box */
#review {
    background-color: #fefefe;
    margin: 15% auto; 
    padding: 20px;
    border: 1px solid #888;
    width: 40%; 
    
    border-radius: 10px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); 
}

#modal-header {
  margin-top: 0;
  font-weight: bold;
}

#review_content {
    width: 20em;
    height: 13em;
    border: 1px solid #ccc;
    resize: none;
    padding: 0;
    text-align: start; /* 텍스트를 좌측 상단부터 시작 */
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

/* 리뷰 별 표시 */
.fa-star {
	color: gray;
}

.fa-star.checked {
	color: orange;
}

/* 리뷰 말 줄임표(content) */
.div_review2 > span.review_link {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
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
	<h1 class="h1_review"><span>나의후기</span></h1>
	
	<span class="r" style="display: block; text-align: center;">호텔페이지로 이동하고 싶으면 리뷰를 클릭하세요.</span> 
	<span><a href="#" id="mypage" style="float:right;">마이페이지</a></span>
	
	<div class="div_review">
		<span>호텔명</span>
		<span>객실타입</span>
		<span>숙박일</span>
		<span>내용</span>
		<span>작성일</span>	
	</div>
 	<div>

 	<c:if test="${empty myreview}">
	  <p>작성된 리뷰가 없습니다</p>
	</c:if> 
	
   	<c:forEach items="${myreview}" var="review" varStatus="status">
		<div class="div_review2">
		
			<span class="review_link" onclick="goToPlacePage(${review.place_seq})">${review.place_name}</span>
			<span class="review_link" onclick="goToPlacePage(${review.place_seq})">${review.roomtype_name}</span>
			<span class="review_link" onclick="goToPlacePage(${review.place_seq})">${review.checkin_date}</span>
			<span class="review_link" onclick="goToPlacePage(${review.place_seq})">${review.review_content}</span>
			<span class="review_link" onclick="goToPlacePage(${review.place_seq})">${review.review_date}</span>
			
			<!-- onclick="redirectToReviewView(${review.review_seq})" -->
			
			<button id="btnUp" class="btn">수정</button>
			&nbsp;
			<button id="btnD" class="btn" data-review-seq="${review.review_seq}">삭제</button>

			<input type="hidden" value="${review.review_seq}" id="seq_${review.review_seq}">
			<input type="hidden" value="${review.review_star}" id="seq_${review.review_seq}_star">
			<input type="hidden" value="${review.review_content}" id="seq_${review.review_seq}_content">
			<input type="hidden" value="${review.place_seq}" id="seq_${review.place_seq}">
			<input type="hidden" value="${review.place_name}" id="seq_${review.review_seq}_place_name">
			<input type="hidden" value="${review.roomtype_name}" id="seq_${review.review_seq}_roomtype_name">

		</div>
	</c:forEach>  
	
	<div class="page_nation">
	<c:if test="${myreview.size() >= 1}">       	
		<ul class="pagination">
			<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
				<a class="page-link" href="/MyYonolja_myreview?page=1&size=${size}">
					처음
				</a>
			</li>
			<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
				<a class="page-link" href="/MyYonolja_myreview?page=${currentPage-1}&size=${size}">
					이전
				</a>
			</li>
			
			<c:choose>
				<c:when test="${totalPages <= groupSize}">
					<!-- 전체 페이지 수가 그룹 크기보다 작거나 같을 경우, 모든 페이지 번호를 출력 -->
					<c:forEach begin="1" end="${totalPages}" var="i">
						<li class="page-item ${currentPage == i ? 'active' : ''}">
							<a class="page-link" href="/MyYonolja_myreview?page=${i}&size=${size}">
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
							<a class="page-link" href="/MyYonolja_myreview?page=${groupStartPage - 1}&size=${size}">
								...
							</a>
						</li>
					</c:if>
					
					<!-- 현재 그룹의 페이지 번호를 출력 -->
					<c:forEach begin="${groupStartPage}" end="${groupEndPage}" var="i">
						<li class="page-item ${currentPage == i ? 'active' : ''}">
							<a class="page-link" href="/MyYonolja_myreview?page=${i}&size=${size}">
								${i}
							</a>
						</li>
					</c:forEach>
					
					<c:if test="${groupEndPage < totalPages}">
						<!-- 현재 그룹이 마지막 그룹이 아니라면 다음 그룹으로 가는 링크를 출력 -->
						<li class="page-item">
							<a class="page-link" href="/MyYonolja_myreview?page=${groupEndPage + 1}&size=${size}">
								...
							</a>
						</li>
					</c:if>
				</c:otherwise>
			</c:choose>
			
			<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
				<a class="page-link" href="/MyYonolja_myreview?page=${currentPage+1}&size=${size}">
					다음
				</a>
			</li>
			
			<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
				<a class="page-link" href="/MyYonolja_myreview?page=${totalPages}&size=${size}">
					끝
				</a>
			</li>
		</ul>
	</c:if> 
</div>
	 
	</div> 
</div>

<div id="review_modal">
    <div id="review">
        <span class="close">&times;</span>
        
        <h2 id="modal-header"></h2>
        <hr>
        
        <label>리뷰 내용을 입력해주세요.</label><br>
        <!-- <input type="text" id="review_content"><br> -->
        <textarea id="review_content"></textarea><br>
        <input type="hidden" id="review_seq">
        <div id="stars">
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
        </div>
        <br>
        <button id="review_up">수정</button>
        <button id="review_c">취소</button>       
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

// 수정 버튼 눌렀을 때 모달창 띄우기
.on("click", "#btnUp", function() {
    var reviewSeq = $(this).parent().find('input').first().val();
    redirectToReviewView(reviewSeq);
})

// 삭제 버튼 눌렀을 때

.on("click", "#btnD", function() {
    console.log("삭제");
    if(!confirm("해당 리뷰를 삭제하시겠습니까?")) return false;
    
    // data-review-seq 속성에서 review_seq 값을 가져옴
    var review_seq = $(this).data("review-seq");
    
    console.log(review_seq);

    $.ajax({
        url: '/myReview_Bye',
        type: 'post',
        data: {review_seq: review_seq
              },
        success: function(data) {

            if(data=="ok") {
                $('#review_c').trigger('click');
                alert("삭제되었습니다.");
                location.reload();
            } else {
                
            }
            
        }
    })
})


// 모달창 닫기 버튼(X버튼)
.on("click", ".close", function() {
    //$("#book_seq").val('');
    $('#review_c').trigger('click');
 	$("#review_modal").hide();
})

// 모달창 취소 버튼
.on("click", "#review_c", function() {
    var book_seq = $("#book_seq").val();
    var content = $("#review_content").val();
    
    // 모든 별의 'checked' 클래스 제거하고 별점 초기화
    document.querySelectorAll('.fa-star').forEach(item => {
        item.classList.remove('checked');
    });
    starRating = 0;    
    
    $("#book_seq").val("");
    $("#review_content").val("");
    
    $("#review_modal").hide();
    
})

// 모달창 수정 버튼
.on("click", "#review_up", function() {
    var review_seq = $("#review_seq").val();
    var content = $("#review_content").val();
    
    console.log("review_seq: ", review_seq, "별점: ",starRating, "content: ", content);
    
    if(content=="") {
        console.log("내용을 입력해주세요.");
        alert("내용을 입력해주세요.");
        return false;
    }
    
    if(starRating==0) {
        console.log("1개 이상의 별점을 선택해주세요.");
        alert("1개 이상의 별점을 선택해주세요.");
        return false;
    }

    // 입력한 내용과 별점이 원래의 내용과 별점과 동일한지 체크
    if(starRating == originalStarRating && content == originalContent) {
        var isClose = confirm("변경된 사항이 없습니다. 창을 닫겠습니까?");
        if(isClose) {
            // 사용자가 Yes를 선택하면 창을 닫음
            $("#review_modal").hide();
        }
        return false;
    }

 	$.ajax({
		url: '/myReview_update',
		type: 'post',
		data: {review_seq: review_seq,
			   review_content: content,
			   review_star: starRating
			  },
		success: function(data) {
			console.log("content: ", content,  "별점: ",starRating, "review_seq: ", review_seq);

			if(data=="ok") {
				$('#review_c').trigger('click');
				alert("수정되었습니다.");
				location.reload();
			} else {
				
			}
			
		}
	})      
})

let starRating = 0;

document.querySelectorAll('.fa-star').forEach((item, index) => {
  item.addEventListener('click', event => {
    // 별 모두 기본색으로 변경
    document.querySelectorAll('.fa-star').forEach(item => {
      item.classList.remove('checked');
    });
    // 클릭한 별까지 색 변경
    event.target.classList.add('checked');
    let target = event.target;
    while (target.previousElementSibling != null) {
      target = target.previousElementSibling;
      target.classList.add('checked');
    }
    // 별점 저장 (index는 0부터 시작하므로 1을 더해줌)
    starRating = index + 1;
  })
})

function goToPlacePage(placeSeq) {
    var placeSeqValue = document.getElementById("seq_" + placeSeq).value;
    
    var confirmResult = confirm("호텔 페이지로 이동하시겠습니까?");

    if(confirmResult){
        window.location.href = 'place/' + placeSeqValue;
    }
}

var originalStarRating;
var originalContent;

function redirectToReviewView(reviewSeq) {
	
	var placeName = document.getElementById("seq_" + reviewSeq + "_place_name").value; // 호텔명을 가져오기 위한 코드
    var roomtypeName = document.getElementById("seq_" + reviewSeq + "_roomtype_name").value; // 객실타입을 가져오기 위한 코드
	
    var reviewSeqValue = document.getElementById("seq_" + reviewSeq).value;

    // review_star 값 받아오기
    var reviewStar = document.getElementById("seq_" + reviewSeq + "_star").value;

    // review_content ID 값을 가진 요소에서 value를 가져옴
    var reviewContent = document.getElementById("seq_" + reviewSeq + "_content").value;

    // 원래의 별점과 내용을 저장
    originalStarRating = parseInt(reviewStar);
    originalContent = reviewContent;

    // review_modal에서의 input 필드에 해당 값을 설정
    document.getElementById("modal-header").innerHTML = "<b>" + placeName + " - " + roomtypeName + "</b>"; // 모달창의 헤더에 호텔명과 객실타입을 표시
    document.getElementById("review_seq").value = reviewSeqValue;
    document.getElementById("review_content").value = reviewContent;

    // 별점 설정
    document.querySelectorAll('.fa-star').forEach((item, index) => {
        // DB에 저장된 review_star 값만큼 별 표시
        if(index < reviewStar) {
            item.classList.add('checked');
        } else {
            item.classList.remove('checked');
        }
    });

    // starRating 값 설정
    starRating = parseInt(reviewStar);

    // 모달창 생성
    $("#review_modal").show();
}

</script>
</html>