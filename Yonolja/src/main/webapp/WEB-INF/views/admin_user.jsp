<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="amdin_user">
	<div class=admin_user_management>
		<h2>회원관리</h2>
		<table border="1px solid:black" id='admin_member_management_table'>
			<tr>
				<td>회원번호</td><td>이름</td><td>아이디</td><td>전화번호</td><td>성별</td><td>회원이메일</td><td>타입</td>
			</tr>
		</table>
		<div>
		<a>1</a>
		</div>
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	/*if($('#adminCheck').val()!='admin'){ 관리자 인지 확인
		alert('잘못된 접근입니다')
	}*/

	memberList()
})

function memberList(){
	$.ajax({
		url:"/member_list",
		data:{},
		dataType:'json',
		type:"post",
		success:function(data){
			;// 번호 이름 아이디 전화번호 성별 이메일 타입
			$('#admin_member_management_table tr:gt(0)').remove();
			for(i=0;i<data.length;i++){
				let str=''
				str+='<tr><td>'
				+data[i]['user_seq']+'</td><td>'
				+data[i]['user_name']+'</td><td>'
				+data[i]['user_id']+'</td><td>'
				+data[i]['user_mobile']+'</td><td>'
				+data[i]['user_gender']+'</td><td>'
				+data[i]['user_email']+'</td><td>'
				+data[i]['user_type']+'</td></tr>'
				
				$('#admin_member_management_table').append(str)
			}
			
		}
	})
}
</script>
</html>