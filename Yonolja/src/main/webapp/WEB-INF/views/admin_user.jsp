<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<a href='/admin'>관리자 페이지</a>
		<table border="1px solid:black" id='admin_member_management_table'>
			<tr>
				<td>회원번호</td><td>이름</td><td>아이디</td><td>전화번호</td><td>성별</td><td>회원이메일</td>
				<td>
					<select id=post_user_type>
						<option value=0>전체</option>	
					</select>
				</td>
			</tr>
		</table>
		<div>
			<c:forEach var="i" begin="${start}" end="${end}">
				<li class="page-item "><a id="paging${i }" class="page-link" onclick='memberlist(${i })'>${i }</a></li>
            </c:forEach>
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

	memberlist(1)
})
/*
.on('click','#post_user_type',function(){
	$.ajax({
		url:'/admin_user_type',
		data:{},
		dataType:'json',
		type:'post',
		success:function(data){
			if(data){
				str=""
				for(var i=1;data.lenght;i++){
					str+='<option value=select_data'+i+'>'+data[i]['one']+'</option>'
					+<
					
				}
				$('#admin_user_type').append(str)
			}
		}
		
	})
})
*/
//function memberList(){
//	$.ajax({
//		url:"/member_list",
//		data:{},
	//	dataType:'json',
//		type:"post",
//		success:function(data){
//			;// 번호 이름 아이디 전화번호 성별 이메일 타입
//			$('#admin_member_management_table tr:gt(0)').remove();
//			for(i=0;i<data.length;i++){
//				let str=''
//				str+='<tr><td>'
//				+data[i]['user_seq']+'</td><td>'
//				+data[i]['user_name']+'</td><td>'
/* 				+data[i]['user_id']+'</td><td>'
				+data[i]['user_mobile']+'</td><td>'
				+data[i]['user_gender']+'</td><td>'
				+data[i]['user_email']+'</td><td>'
				+data[i]['user_type']+'</td></tr>'
				
				$('#admin_member_management_table').append(str)
			}
			
		}
	})
}*/
function memberlist(page){
	$('.page-item').removeClass("active");
	$('#paging'+ page).parent().addClass("active");
	

	$.ajax({url:"/member_list",
			data:{page:page},
			dataType:"json",
			type:"post",
			success:function(data){
				let str="";
				$('#admin_member_management_table tr:gt(0)').remove();
				for(var i=0;i<data.length;i++){
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