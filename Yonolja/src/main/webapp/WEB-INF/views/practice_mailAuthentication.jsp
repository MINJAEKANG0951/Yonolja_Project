<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<title>
이메일 인증 test 
</title>
</head>
<style>
table{border:1px solid black;}
</style>
<body>

<table>
<tr><td colspan=3><h1>이메일 인증</h1> </td></tr>
<tr>
	<td>이메일인증</td> 
	<td> <input id=email type=text> </td> 
	<td><button id=send>전송</button></td> 
</tr>
<tr>
	<td colspan=2><input id=code type=text placeholder=인증번호></td>  
	<td><button id=check>확인</button></td> 
</tr>
</table>




</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>

let code = ''
$(document)
.on('click','#send',function(){
	
	$.ajax({url:'/sendCode', type:'post', 
		
		data:{id:$('#email').val()},
		success:function(){
			alert('보냄')
		}
	
	})
})
.on('click','#check',function(){
	
	$.ajax({url:'/checkCode', type:'post', dataType:'text',
		
		data:{id:$('#email').val(), code:$('#code').val()},
		success:function(data){
			alert(data)
		}
	
	})
})

</script>
</html>