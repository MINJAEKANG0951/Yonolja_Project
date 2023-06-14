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
<title>myinfo</title>
<link rel="icon" href="/img/website/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<%@ include file ="./structure/header.jsp" %>

<style>

/* 위까지 헤더, footer 설정 */

a {
    text-decoration: none; /* a 요소의 밑줄 없애기 */
}

</style>

<body>

<section>

<div class="user_change">
	<span>아이디 ${user_id}</span><input type=hidden value="${user_id}" readonly id="id"><br>
	<span>이메일 </span><input type=text value="${user_email}" id="email"><br>
	<span>비밀번호 </span><input type=text id="ps1"><br>
	<span>비밀번호확인 </span><input type=text id="ps2"><br>
	<span>실명 ${user_name}</span><input type=hidden value="${user_name}" readonly id="name"><br>
	<span>전화번호 </span><input type=text value="${user_mobile}" id="mobile"><br>
	<span>성별 ${user_gender}</span><input type=hidden value="${user_gender}" readonly id="gender"><br><br>
	<button class="btnO">수정</button>
	<button class="btnC">취소</button><br><br>
	<a href="#" class="yoBye">탈퇴하기</a>
	<input type=hidden value="${user_seq}" id=user_seq>
</div>

</section>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)

// 수정 버튼 눌렀을 때
.on("click", ".btnO", function() {
    var ps1 = $("#ps1").val();
    var ps2 = $("#ps2").val();
    var email = $("#email").val();
    var mobile = $("#mobile").val();
    var seq = $("#user_seq").val();
    
    if(ps1==""||ps2==""||email==""||mobile=="") {
    	alert("빈 칸을 모두 채워주세요.");
    	console.log("비었음");
    }
    else if(ps1==ps2) {
    	console.log("동일함");
    	
    	$.ajax({
    	    url:"/updateUserNolja",
    	    type: "post",
    	    data: {user_seq:seq, 
    	    	   user_email:email, 
    	    	   user_password:ps1, 
    	    	   user_mobile:mobile},
    	    dataType:"text",
    	    success:function(data) {
    	        console.log("updateUserNolja data=", data);
    	        if(data=="ok") {
    	            alert("수정되었습니다.");
    	            window.location.href='/mypage';
    	        }
    	    }
    	})
    	
    	
    } else {
    	alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
    	console.log("틀림");
    }
    //console.log(ps1);
})

// 취소 버튼 눌렀을 때
.on("click", ".btnC", function() {
	window.location.href='/mypage';
})

// 탈퇴 눌렀을 때
.on("click", ".yoBye", function() {
	console.log("Bye");
	
	var seq = $("#user_seq").val();
	
	if(!confirm("정말로 탈퇴하시겠습니까?")) return false;
	
	$.ajax({
		url:"/YonoljaBye",
		data: {user_seq:seq},
		type:"post",
		dataType:"text",
		success:function(data) {
			console.log("YonoljaBye data=", data);
			
			if(data=="ok") {
				alert("탈퇴되었습니다.");
				window.location.href='/logout';
			}
		}
	})
	return false;
	
})
 

</script>

</html>