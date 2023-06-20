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
<title>내정보관리</title>
<link rel="icon" href="/img/website/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>

<%-- <%@ include file ="./structure/header.jsp" %> --%>

<style>

/* 위까지 헤더, footer 설정 */

a {
    text-decoration: none; /* a 요소의 밑줄 없애기 */
}

.user_change {
    text-align: center;
    margin: 0 auto;
    margin-top: 0px;
    width: 500px;
    padding: 20px;
    border: 1px solid #ccc;
    display: flex; 
    flex-direction: column;
    align-items: center; 
}

.user_change span {
    display: inline-block;
    width: 100px;
    text-align: right;
    margin-right: 10px;
}

.user_change input {
    display: inline-block;
    width: 180px;
    margin-bottom: 5px;
    padding: 5px;
    box-sizing: border-box;
}

.user_change .fix {
    display: inline-block;
    width: 180px;
    padding: 5px;
    box-sizing: border-box;
    text-align: left;
}

.user_change .btnO,
.user_change .btnC {
    display: inline-block;
    width: 100px;
    margin-right: 10px;
    padding: 5px 10px;
    text-align: center;
    background-color: #007bff;
    color: #fff;
    border: none;
    cursor: pointer;
}

.user_change .btnO:hover,
.user_change .btnC:hover {
    background-color: #0056b3;
}

.user_change .yoBye {
    color: #dc3545;
    text-decoration: underline;
    cursor: pointer;
}



.user_change .btnO,
.user_change .btnC {
    display: inline-block;
    width: 100px;
    margin-right: 10px;
    padding: 5px 10px;
    text-align: center;
    background-color: #007bff;
    color: #fff;
    border: none;
    cursor: pointer;
}

.user_change .button_container {
    display: flex; 
    justify-content: space-between;
    width: 220px;
}

.user_change .btnO:hover,
.user_change .btnC:hover {
    background-color: #0056b3;
}

.user_change .yoBye {
    color: #dc3545;
    text-decoration: underline;
    cursor: pointer;
}

.logo-container {
    text-align: center;
    margin-top: 100px;
}

#logo {
    max-width: 300px;
    height: auto;
}

.user_change div.field {
    display: flex;
    justify-content: flex-start;
    align-items: center;
}

.user_change div.field span {
    display: inline-block;
    width: 100px;
    text-align: left;
    margin-right: 10px;
}

.user_change div.field input {
    margin-bottom: 5px;
    padding: 5px;
    box-sizing: border-box;
}

.user_change div.field .fix {
    display: inline-block;
    width: 180px;
    padding: 5px;
    box-sizing: border-box;
    text-align: left;
    vertical-align: middle;
}


</style>

<body>

<section>

<div class="logo-container">

<a href="/main"><img id=logo src="/img/website/header_logo.png"></a>

</div>

<div class="user_change">
	<h2><b>My INFO</b></h2>
	
    <div class="field">
    	<span>아이디 </span>
    	<span class="fix">${user_id}</span>
    	<input type=hidden value="${user_id}" readonly id="id">
    </div>
    <div class="field">
    	<span>이메일 </span>
    	<input type=text value="${user_email}" id="email">
    </div>
    <div class="field">
    	<span>비밀번호 </span>
    	<input type=password id="ps1">
    </div>
    <div class="field">
    	<span>비밀번호확인 </span>
    	<input type=password id="ps2">
    </div>
    <div class="field">
    	<span>실명 </span>
    	<span class="fix">${user_name}</span>
    	<input type=hidden value="${user_name}" readonly id="name">
    </div>
    <div class="field">
    	<span>전화번호 </span>
    	<input type=text value="${user_mobile}" id="mobile">
    </div>
    <div class="field">
    	<span>성별 </span>
    	<span class="fix">${user_gender}</span>
    	<input type=hidden value="${user_gender}" readonly id="gender">
    </div><br>
    <div class="field">
    	<div class="button_container">
			<button class="btnO">수정</button>
			<button class="btnC">취소</button>
		</div>
	</div>
	<br>
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