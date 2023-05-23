<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>
네이버 로그인시 콜백
</title>
</head>
<body>


<script type="text/javascript">
  var naver_id_login = new naver_id_login("tafgzBhJFxE7ofgPD13T", "http://localhost:8081/practice_naverCallback");
  // 접근 토큰 값 출력
  // document.write(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()"); // o
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  
  let info = [];
  function naverSignInCallback() {
	  
	id = naver_id_login.getProfileData('id');
	name = naver_id_login.getProfileData('name');
	age = naver_id_login.getProfileData('age');
	gender = naver_id_login.getProfileData('gender');
	  
	document.location = '/login_signin/' + id + '/' + name + '/' + age + '/' + gender
	  
	 /*
    document.write(naver_id_login.getProfileData('email')+ "<br>")    // o  > 이건 네이버 email 아니고, 네이버정보에 기입한 이메일임
    document.write(naver_id_login.getProfileData('nickname')+ "<br>"); // o
    document.write(naver_id_login.getProfileData('age')+ "<br>")      // o
    document.write(naver_id_login.getProfileData('gender')+ "<br>")    // o
    document.write(naver_id_login.getProfileData('id')+ "<br>")        // 이상한 문자열로 > 네이버id가 아닌 고유식별자임
    document.write(naver_id_login.getProfileData('name')+ "<br>")      // o
    document.write(naver_id_login.getProfileData('birthday')+ "<br>")  // o
   	document.write(naver_id_login.getProfileData('mobile')+ "<br>")    // 이건 수집안됨. 네이버가 안준다고함
    // 얘네들을 server 로 전달해서 그 값을 받고, 회원가입진행?
    		
    info.push({email:naver_id_login.getProfileData('email')})		
    info.push({nickname:naver_id_login.getProfileData('nickname')})	
    info.push({age:naver_id_login.getProfileData('age')})	
    info.push({gender:naver_id_login.getProfileData('gender')})	
    info.push({id:naver_id_login.getProfileData('id')})	
    info.push({name:naver_id_login.getProfileData('name')})	
    info.push({birthday:naver_id_login.getProfileData('birthday')})	
    info.push({mobile:naver_id_login.getProfileData('mobile')}) // 제공안해주고있으니 필요시 따로 수집하라고함.	
 
  	// 이렇게 받은정보 server 로 ajax 로 보내던지 formdata 로 보내던지 아니면 뭐어떻게 보내든지 하면될듯.
 	*/
   /*
  	$.ajax({url:'/login_signin',type:'post',
		
		data:{
			
			id:naver_id_login.getProfileData('id'),
			name:naver_id_login.getProfileData('name'),
			age:naver_id_login.getProfileData('age'),
			gender:naver_id_login.getProfileData('gender')
			
			
		},
		
		success:function(){
			
		},
		
		complete:function(){
			// 새로운창열면서 자기는 닫기 하면 되지않을까..?
			// window.close();		
			// document.location = "/practice_main"
			
			document
			
		}
		
	})
  	*/
  	
    
  }
	
  
  
  
</script>
</body>


</html>