<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<%@ page import="java.util.Date" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%
  // 컨테이너 범위 함수 정의
  java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yy/MM/dd");
  pageContext.setAttribute("currentDate", sdf.format(new java.util.Date()));
%>

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
<title>MyBookList</title>
<link rel="icon" href="/img/website/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<%@ include file ="./structure/header.jsp" %>

<style>

/* 위까지 헤더, footer 설정 */

 .h1_book {
  border-radius: 15px;
  width: 800px;
  margin: auto; 
  padding: 20px; 
  position: relative;
  
  text-align: center;
}

section {
  display: flex;
  justify-content: center;
  align-items: center;
}

.div_book {
  width: 800px;
  margin: auto;
  text-align: center;
  
  display: grid;
  grid-template-columns: 1.5fr 2fr 2fr 1fr 1fr;
  align-items: center;
  padding: 15px;
  border-bottom: 1px solid black;
}

.div_book2 {
  width: 800px;
  margin: auto;
  text-align: center;
  
  display: grid;
  grid-template-columns: 1.5fr 2fr 2fr 1fr 1fr;
  align-items: center;
  padding: 15px; 
  border-bottom: 1px solid black;
}

.div_book > span {
  padding: 4px;
  display: grid;
  align-items: center;
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
    background-color: rgb(0,0,0); 
    background-color: rgba(0,0,0,0.4); 
}

/* Modal Content/Box */
#review {
    background-color: #fefefe;
    margin: 15% auto; 
    padding: 20px;
    border: 1px solid #888;
    width: 40%; 
}

#content {
    width: 20em;
    height: 13em;
    border: 1px solid #ccc; 
    resize: none;
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

/* 페이지네이션 */
.page_nation {
    display: flex;
    justify-content: center;
}

</style>
<body>

<section>

<div>
	<h1 class="h1_book"><span>예약내역</span></h1>
	<span><a href="#" id="mypage" style="float:right;">마이페이지</a></span>
	<div>		
	<!-- '예약대기' 섹션 -->
		<h2>예약대기</h2>
		<span>숙박 1일 전까지 취소 가능합니다.</span>
		<div class="div_book">
			<span>호텔명</span>
			<span>객실타입</span>
			<span>숙박일</span>
			<span>이용상태</span>	
			<span></span>
		</div>
		
		<div>
		 	<c:if test="${empty waitingList}">
	  			<p>예약내역이 없습니다</p>
			</c:if> 
		
			<c:forEach items="${waitingList}" var="book" varStatus="status">
				<c:if test="${book.checkin_date gt currentDate}">
					<!-- '이용전' 예약 정보 출력 -->
					<div class="div_book2">
						<span class="book_sp">${book.place_name}</span>
						<span class="book_sp">${book.roomtype_name}</span>
						<span class="book_sp">${book.checkin_date} ~ ${book.checkout_date}</span>
						<span class="book_sp">
						<c:choose>
							<c:when test="${book.checkin_date gt currentDate}">
								이용전
							</c:when>
							<c:when test="${book.checkin_date le currentDate and book.checkout_date ge currentDate}">
								이용가능
							</c:when>
							<c:otherwise>
								이용완료
							</c:otherwise>
						</c:choose>
						</span>
						<button class="btnX">예약취소</button>
						<input type="hidden" value="${book.book_seq}" id="seq_${book.book_seq}">
					</div> 
				</c:if>
			</c:forEach>
			
			<div class="page_nation">
				<c:if test="${waitingList.size() >= 1}">      	
					<ul class="pagination">
						<li class="page-item ${waitingPage == 1 ? 'disabled' : ''}">
							<a class="page-link" href="/MyYonolja_mybooklist?waitingPage=1&waitingSize=${waitingSize}&confirmedPage=${confirmedPage}&confirmedSize=${confirmedSize}">
								처음
							</a>
						</li>
						<li class="page-item ${waitingPage == 1 ? 'disabled' : ''}">
							<a class="page-link" href="/MyYonolja_mybooklist?waitingPage=${waitingPage-1}&waitingSize=${waitingSize}&confirmedPage=${confirmedPage}&confirmedSize=${confirmedSize}">
								이전
							</a>
						</li>
						
						<c:choose>
							<c:when test="${waitingTotalPages <= 5}">
								<c:forEach begin="1" end="${waitingTotalPages}" var="i">
									<li class="page-item ${waitingPage == i ? 'active' : ''}">
										<a class="page-link" href="/MyYonolja_mybooklist?waitingPage=${i}&waitingSize=${waitingSize}&confirmedPage=${confirmedPage}&confirmedSize=${confirmedSize}">
											${i}
										</a>
									</li>
								</c:forEach>
							</c:when>
							
							<c:when test="${waitingPage <= 2}">
								<c:forEach begin="1" end="5" var="i">
									<li class="page-item ${waitingPage == i ? 'active' : ''}">
										<a class="page-link" href="/MyYonolja_mybooklist?waitingPage=${i}&waitingSize=${waitingSize}&confirmedPage=${confirmedPage}&confirmedSize=${confirmedSize}">
											${i}
										</a>
									</li>
								</c:forEach>
								
								<li class="page-item disabled">
									<a class="page-link">...</a>
								</li>
							</c:when>
							
							<c:when test="${waitingPage >= waitingTotalPages - 1}">
								<li class="page-item disabled">
									<a class="page-link">...</a>
								</li>
								<c:forEach begin="${waitingTotalPages-4}" end="${waitingTotalPages}" var="i">
									<li class="page-item ${waitingPage == i ? 'active' : ''}">
										<a class="page-link" href="/MyYonolja_mybooklist?waitingPage=${i}&waitingSize=${waitingSize}&confirmedPage=${confirmedPage}&confirmedSize=${confirmedSize}">
											${i}
										</a>
									</li>
								</c:forEach>
							</c:when>
							
							<c:otherwise>
								<li class="page-item disabled">
									<a class="page-link">...</a>
								</li>
								<c:forEach begin="${waitingPage-1}" end="${waitingPage+2}" var="i">
									<li class="page-item ${waitingPage == i ? 'active' : ''}">
										<a class="page-link" href="//MyYonolja_mybooklist?waitingPage=${i}&waitingSize=${waitingSize}&confirmedPage=${confirmedPage}&confirmedSize=${confirmedSize}">
											${i}
										</a>
									</li>
								</c:forEach>
								
								<li class="page-item disabled">
									<a class="page-link">...</a>
								</li>
							</c:otherwise>
						</c:choose>
						
						<li class="page-item ${waitingPage == waitingTotalPages ? 'disabled' : ''}">
							<a class="page-link" href="/MyYonolja_mybooklist?waitingPage=${waitingPage+1}&waitingSize=${waitingSize}&confirmedPage=${confirmedPage}&confirmedSize=${confirmedSize}">
								다음
							</a>
						</li>
						
						<li class="page-item ${waitingPage == waitingTotalPages ? 'disabled' : ''}">
							<a class="page-link" href="/MyYonolja_mybooklist?waitingPage=${waitingTotalPages}&waitingSize=${waitingSize}&confirmedPage=${confirmedPage}&confirmedSize=${confirmedSize}">
								끝
							</a>
						</li>
					</ul>
				</c:if> 
			</div>
		</div><br>
		
		
		<!-- '예약확정' 섹션 -->
		<h2>예약확정</h2>
		<span>리뷰작성을 원하시는 경우, 해당하는 예약내역을 클릭하세요.</span>
		<div class="div_book">
			<span>호텔명</span>
			<span>객실타입</span>
			<span>숙박일</span>
			<span>이용상태</span>	
			<span>리뷰</span>
		</div>
		
		<div>	
			<c:if test="${empty confirmedList}">
	  			<p>예약내역이 없습니다</p>
			</c:if> 
		
			<c:forEach items="${confirmedList}" var="book" varStatus="status">
				<c:if test="${book.checkin_date le currentDate}">
					<!-- '이용가능' 또는 '이용완료' 예약 정보 출력 -->
					<div class="div_book2">
						<span class="book_sp" onclick="redirectToBookView(${book.book_seq}, '${book.review_status}', '${book.place_name}', '${book.roomtype_name}')">
						${book.place_name}
						</span>
						<span class="book_sp" onclick="redirectToBookView(${book.book_seq}, '${book.review_status}', '${book.place_name}', '${book.roomtype_name}')">
						${book.roomtype_name}
						</span>
						<span class="book_sp" onclick="redirectToBookView(${book.book_seq}, '${book.review_status}', '${book.place_name}', '${book.roomtype_name}')">
						${book.checkin_date} ~ ${book.checkout_date}
						</span>
						<span class="book_sp" onclick="redirectToBookView(${book.book_seq}, '${book.review_status}', '${book.place_name}', '${book.roomtype_name}')">
						<c:choose>
							<c:when test="${book.checkin_date gt currentDate}">
								이용전
							</c:when>
							<c:when test="${book.checkin_date le currentDate and book.checkout_date ge currentDate}">
								이용가능
							</c:when>
							<c:otherwise>
								이용완료
							</c:otherwise>
						</c:choose>
						</span>
						<span class="book_sp" onclick="redirectToBookView(${book.book_seq}, '${book.review_status}', '${book.place_name}', '${book.roomtype_name}')">${book.review_status}</span>
						<input type="hidden" value="${book.book_seq}" id="seq_${book.book_seq}">
					</div> 
				</c:if>
			</c:forEach>
			
			<div class="page_nation">
				<c:if test="${confirmedList.size() >= 1}">       	
					<ul class="pagination">
						<li class="page-item ${confirmedPage == 1 ? 'disabled' : ''}">
							<a class="page-link" href="/MyYonolja_mybooklist?confirmedPage=1&confirmedSize=${confirmedSize}&waitingPage=${waitingPage}&waitingSize=${waitingSize}">
								처음
							</a>
						</li>
						<li class="page-item ${confirmedPage == 1 ? 'disabled' : ''}">
							<a class="page-link" href="/MyYonolja_mybooklist?confirmedPage=${confirmedPage-1}&confirmedSize=${confirmedSize}&waitingPage=${waitingPage}&waitingSize=${waitingSize}">
								이전
							</a>
						</li>
						
						<c:choose>
							<c:when test="${confirmedTotalPages <= 5}">
								<c:forEach begin="1" end="${confirmedTotalPages}" var="i">
									<li class="page-item ${confirmedPage == i ? 'active' : ''}">
										<a class="page-link" href="/MyYonolja_mybooklist?waitingPage=${waitingPage}&waitingSize=${waitingSize}&confirmedPage=${i}&confirmedSize=${confirmedSize}">
											${i}
										</a>
									</li>
								</c:forEach>
							</c:when>
							
							<c:when test="${confirmedPage <= 2}">
								<c:forEach begin="1" end="5" var="i">
									<li class="page-item ${confirmedPage == i ? 'active' : ''}">
										<a class="page-link" href="MyYonolja_mybooklist?waitingPage=${waitingPage}&waitingSize=${waitingSize}&confirmedPage=${i}&confirmedSize=${confirmedSize}">
											${i}
										</a>
									</li>
								</c:forEach>
								
								<li class="page-item disabled">
									<a class="page-link">...</a>
								</li>
							</c:when>
							
							<c:when test="${confirmedPage >= confirmedTotalPages - 1}">
								<li class="page-item disabled">
									<a class="page-link">...</a>
								</li>
								<c:forEach begin="${confirmedTotalPages-4}" end="${confirmedTotalPages}" var="i">
									<li class="page-item ${confirmedPage == i ? 'active' : ''}">
										<a class="page-link" href="/MyYonolja_mybooklist?waitingPage=${waitingPage}&waitingSize=${waitingSize}&confirmedPage=${i}&confirmedSize=${confirmedSize}">
											${i}
										</a>
									</li>
								</c:forEach>
							</c:when>
							
							<c:otherwise>
								<li class="page-item disabled">
									<a class="page-link">...</a>
								</li>
								<c:forEach begin="${confirmedPage-1}" end="${currentPage2+2}" var="i">
									<li class="page-item ${confirmedPage == i ? 'active' : ''}">
										<a class="page-link" href="/MyYonolja_mybooklist?waitingPage=${waitingPage}&waitingSize=${waitingSize}&confirmedPage=${i}&confirmedSize=${confirmedSize}">
											${i}
										</a>
									</li>
								</c:forEach>
								
								<li class="page-item disabled">
									<a class="page-link">...</a>
								</li>
							</c:otherwise>
						</c:choose>
						
						<li class="page-item ${confirmedPage == confirmedTotalPages ? 'disabled' : ''}">
							<a class="page-link" href="/MyYonolja_mybooklist?confirmedPage=${confirmedPage+1}&confirmedSize=${confirmedSize}&waitingPage=${waitingPage}&waitingSize=${waitingSize}">
								다음
							</a>
						</li>
						
						<li class="page-item ${confirmedPage == confirmedTotalPages ? 'disabled' : ''}">
							<a class="page-link" href="/MyYonolja_mybooklist?confirmedPage=${confirmedTotalPages}&confirmedSize=${confirmedSize}&waitingPage=${waitingPage}&waitingSize=${waitingSize}">
								끝
							</a>
						</li>
					</ul>
				</c:if> 
			</div>
		</div>

	</div>		
</div>


<div id="review_modal">
    <div id="review">
        <span class="close">&times;</span>
        
        <h2 id="modal_title" style="font-weight:bold;"></h2>
        <hr>
        
        <label>리뷰 내용을 입력해주세요.</label><br>
        <!-- <input type="text" id="content"><br> -->
        <textarea id="content"></textarea><br>
        <input type="hidden" id="book_seq"><br>
        <div id="stars">
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
            <span class="fa fa-star"></span>
        </div>
        <button id="review_ok">확인</button>
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

// 예약내역 예약삭제 버튼
.on("click", ".btnX", function() {
    //console.log("삭제");
    
    // data-review-seq 속성에서 review_seq 값을 가져옴
    var book_seq = $(this).siblings('input').val();
    console.log(book_seq);
    
  if(!confirm("해당 리뷰를 삭제하시겠습니까?")) return false;

     $.ajax({
        url: '/myBook_Bye',
        type: 'post',
        data: {book_seq: book_seq
              },
        success: function(data) {

            if(data=="ok") {
                alert("삭제되었습니다.");
                location.reload();
            } else {
                
            }
            
        }
    }) 
})

.on("click", ".close", function() { 
    //$("#book_seq").val(''); // 추가된 부분: 비밀번호 입력 필드 초기화
    $('#review_c').trigger('click');
	$("#review_modal").hide();
})

.on("click", "#review_c", function() {
    var book_seq = $("#book_seq").val();
    var content = $("#content").val();
    
    // 모든 별의 'checked' 클래스 제거하고 별점 초기화
    document.querySelectorAll('.fa-star').forEach(item => {
        item.classList.remove('checked');
    });
    starRating = 0;    
    
    $("#book_seq").val("");
    $("#content").val("");
    
    $("#review_modal").hide();
    
})

.on("click", "#review_ok", function() {
    var book_seq = $("#book_seq").val();
    var content = $("#content").val();
	
    console.log("book_seq: ", book_seq, "별점: ",starRating, "content: ", content);
    
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
     
    // 리뷰 insert 리뷰등록
 	$.ajax({
		url: '/book_review_insert',
		type: 'post',
		data: {review_content: content,
			   review_star: starRating,
			   book_seq: book_seq
			  },
		success: function(data) {
			console.log("content: ", content,  "별점: ",starRating, "book_seq: ", book_seq);

			if(data=="ok") {
				$('#review_c').trigger('click');
				alert("등록되었습니다.");
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

function redirectToBookView(bookSeq, reviewStatus, placeName, roomtypeName) { // placeName, roomtypeName 인자 추가
    // 리뷰가 이미 등록된 경우 알림을 표시하고 함수를 종료
    if (reviewStatus === '등록') {
        alert('이미 등록된 리뷰가 있습니다.');
        return false;
    }

    // ID 값으로 각 book_seq에 해당하는 input 태그를 찾아서, 그 값을 읽어옴
    var bookSeqValue = document.getElementById("seq_" + bookSeq).value;
    
    // review_modal에서의 input 필드에 해당 값을 설정
    document.getElementById("book_seq").value = bookSeqValue;

    // 모달 제목에 호텔명과 객실타입 설정
    document.getElementById("modal_title").innerText = placeName + " - " + roomtypeName;

    // 모달 띄우기
    $("#review_modal").show();
}




/* function redirectToBookView(bookSeq, reviewStatus) {
    // 리뷰가 이미 등록된 경우 알림을 표시하고 함수를 종료
    if (reviewStatus === '등록') {
        alert('이미 등록된 리뷰가 있습니다.');
        return false;
    }

    // ID 값으로 각 book_seq에 해당하는 input 태그를 찾아서, 그 값을 읽어옴
    var bookSeqValue = document.getElementById("seq_" + bookSeq).value;
    
    // review_modal에서의 input 필드에 해당 값을 설정
    document.getElementById("book_seq").value = bookSeqValue;
    
    // 모달 띄우기
    $("#review_modal").show();
} */
	

</script>
</html>