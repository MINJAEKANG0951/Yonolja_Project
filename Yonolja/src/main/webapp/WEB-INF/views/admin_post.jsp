<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="admin_post_page">
	<h3>문의 관리 게시판</h3>
	<table border=1px id=admin_post_page_table>
		<tr>
			<td>문의번호</td><td>문의분류</td><td>문의제목</td><td>아이디</td><td>문의일</td><td>문의상태</td><td>답변작성</td>
		</tr>
	</table>
	
</div>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	/*if($('#adminCheck').val()!='admin'){	관리자 인지 확인
		alert('잘못된 접근입니다')
	}*/
	post_list()
})
/* 
.on('click','#admin_post_page_table',function(){
	
	
	

})*/
function post_list(){
	$.ajax({url:'/post_list',
		data:{},
		dataType:"json",
		type:'post',
		success:function(data){
			$('#admin_post_page_table tr:gt(0)').remove();
			if(data!=null || data!=""){
				let str=""
				
				for(let i=0;i<data.length;i++){
					let test="test_comment"
					if(data[i]['post_comment']=="답변대기"){
						test="비어있습니다";
					}
				str +='<tr><td>'
						+data[i]['post_seq']+'</td><td>'
						+data[i]['post_category']+'</td><td>' //추후에 물어보고 할것
						+data[i]['post_title']+'</td><td>'		// user_seq 사용
						+data[i]['user_id']+'</td><td>'
						+data[i]['post_date']+'</td><td>'
						+data[i]['post_comment']+'</td><td>'
						+test+'</td></tr>'
					
				}
				$('#admin_post_page_table').append(str)	
			}
				
		}
	})
}

</script>
</html>