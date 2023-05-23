<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kakao Login page</title>
</head>
<style>
</style>
<body>
	<a href="javascript:kakaoLogin();" id=kakaoLogin><img src=/img/kakao_login_img.png></a>
	<a href="#" id=kakaoLogout>logout</a>
</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script> 
	//9205057ff16b5c3fa0c0df924cbb7156 
	window.Kakao.init("9205057ff16b5c3fa0c0df924cbb7156"); // 여기다가 우리가 받은 키를 넣어서 실행시킴	
	
	function kakaoLogout(){
		window.Kakao.Auth.logout()
		  .then(function(response) {
		    console.log(Kakao.Auth.getAccessToken()); // null
		  })
		  .catch(function(error) {
		    console.log('Not logged in.');
		  });
	}
	
	function kakaoLogin(){
		// 우리가 받아올 정보들을 scope 에 넣음.
		window.Kakao.Auth.login({
			scope:'profile_nickname, account_email, gender, age_range',	
			success:function(data){	// 로그인이 일어났을 때 success callback 함수 실행, 파라미터로는 받아온 Obj Data
				console.log("받아온 data : " + data)	
				console.log(data)
				window.Kakao.API.request({ // 유저에대한정보가져오기
					url:'/v2/user/me',
					success: res => {
						const kakao_account = res.kakao_account; // 이렇게하면 account 받아오는거
						console.log(kakao_account);
						console.log(kakao_account.gender);
					// 해서 document location 으로 url 보내기 서버로.
					}
				}); 
			}
		});
	}
	
	
$(document)
.on('click','#kakaoLogin',function(){
	kakaoLogin();
})
.on('click','#kakaoLogout',function(){
	kakaoLogout();
})


/* 
  
  카카오 api 동작구조( Javascript SDK(software development kit)/ REST API ) 
  : 권한접근 -> 토큰발급 -> 토큰을 이용한 정보수집    방식으로 작동함.
  
  
  JavaScript SDK 를 사용한 kakao api 예제
  
  필수선언
  
  kakao.init('api를 사용할 자신의 javascript 키값');
  kako.Auth.자기자신이 사용할 옵션();  // authorize, login, loginForm, createLoginButton 등 
  kako.API.request();           // 토큰이 존재할 때 
  
  
  
  
  
  
 
*/













</script>
</html>

