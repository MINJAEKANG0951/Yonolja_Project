<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

.admin_review_grid{
	display:grid;

}

</style>
<body>
<div class='admin_review'>
	<div class='admin_page_login'>
		<input type='hidden' id='adminCheck' value="${adcheck}">
	</div>
	<!--
		// 스타일 grid 
		.admin_review_grid{
			display:grid;
		
		}
	 
	<div class=admin_review_grid> 공부해서 해볼것 우선 테이블로 만들기
		<div class="item">번호</div>
		<div class="item">제목</div>
		<div class="item">날짜</div>
		<div class="item">숙소이름</div>
	</div>
 	-->
 	<table border="1px solid:black" id='admin_review_management'>
 		<tr>
 			<td>번호</td><td>숙소이름</td><td>제목</td><td>날짜</td><td>평점</td>
 		</tr>
 	</table>
 	<div class='paging'>
 		
 	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	/*if($('#adminCheck').val()!='3'){	관리자 인지 확인
	alert('잘못된 접근입니다')
}*/
})

function review_list(){
	$.ajax({url:'/review_list',
			data:{pageNumber:$('#pageNumber').val()},
			dataType:'json',
			type:'post',
			suecces:function(data){
				$('#admin_review_management tr:gt(0)').remove();
				let str='';
				for(i=0;i<data.lenght;i++){
					str+='<tr><td>'+data[i]['review_seq']+'</td><td>' // review table을 활용하여 정보를 가져온다
					+data[i]['place_name']+"</td><td>"//book_seq 를 활용하여 place_name 을 가져온다
 					+data[i]['review_content']+"</td><td>"
 					+data[i]['review_date']+"</td><td>"
 					+data[i]['review_star']+"</td></tr>"
 					
				}
				
			}
	})

}


</script>
</html>