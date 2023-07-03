<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title> 이메일 인증 </title>
</head>
<style>

</style>
<body>

<table>
	<tr> <td><input type=text id=email_address></td> <td><button id=sendEmail>이메일전송</button></td> </tr>
	<tr> <td><input type=text id=code></td> <td><button id=confirmCode>확인</button></td> </tr>
</table>



</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>

$(document)
.on('click','#sendEmail',function(){
	$.ajax({url:'/sendEmail',type:'post',dataType:'text', 
		
		data:{emAddress:$('#email_address').val()},
		success:function(data){
			alert(data)
		}
	})
})
.on('click','#confirmCode',function(){
	$.ajax({url:'/confirmCode',type:'post',dataType:'text', 
		
		data:{code:$('#code').val()},
		success:function(data){
			alert(data);
			if(data=='이메일 인증 완료'){
				document.location = "/signin";
			}
		}
	})
})

</script>
</html>