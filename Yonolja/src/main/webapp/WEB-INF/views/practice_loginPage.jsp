<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<title>
연습용 로그인페이지
</title>
</head>
<style>
#login_tb{ margin-left: auto; margin-right:auto;margin-top: 20%; border:1px solid black;}
#eee{border-bottom:1px solid black}
</style>
<body>

<table id=login_tb>
<thead>
	<tr> <th>아이디</th> <th><input id=user_id type=text></th> </tr>
	<tr> <th>비밀번호</th> <th><input id=user_ps type=password></th> </tr>
	<tr> 
		<th id=eee colspan=2>
			<button id=doLogin>로그인</button> &nbsp; <button id=cancel>취소</button>
		</th> 
	</tr>
</thead>

<tbody>
	<!-- 네이버 로그인 버튼 노출 영역 -->
	<tr> <td colspan=2>  <div id="naver_id_login"></div> </td> </tr>
	<!-- //네이버 로그인 버튼 노출 영역 -->
	
	<!-- 카카오 로그인 버튼 노출 영역 -->
	<tr> <td colspan=2><a href="javascript:kakaoLogin();" id=kakaoLogin><img src=/img/kakao_login_img.png></a></td> </tr>
	<!-- //카카오 로그인 버튼 노출 영역 -->
</tbody>
</table>



</body>

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naver_id_login = new naver_id_login("tafgzBhJFxE7ofgPD13T", "http://localhost:8081/practice_naverCallback");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.init_naver_id_login();
</script>
<!-- // 네이버 로그인 초기화 Script -->

<!-- 카카오 로그인 코드 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
window.Kakao.init("9205057ff16b5c3fa0c0df924cbb7156");

function kakaoLogin(){
	// scope 는 우리가 가져올 개인정보의 종류들
	window.Kakao.Auth.login({
		scope:'profile_nickname, account_email, gender, age_range',	
		success:function(authObj){	// 로그인이 일어났을 때 success callback 함수 실행, 파라미터로는 받아온 Obj Data
			console.log("받아온 data : " + authObj)	
			console.log(authObj)
			window.Kakao.API.request({ // 유저에대한정보가져오기
				url:'/v2/user/me',
				success: res => {
					const kakao_account = res.kakao_account; // 이렇게하면 account 받아오는거
					console.log(kakao_account);
					console.log(kakao_account.gender);
			
				}
			}); 
		}
	});
}
<!-- // 카카오 로그인 코드 -->
</script>

</html>