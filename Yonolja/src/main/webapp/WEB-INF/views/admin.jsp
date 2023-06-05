<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
</head>
<body>
<div class='admin_page'>
	<div class='admin_page_login'>
		<input type='hidden' id='adminCheck' value="${adcheck}">
	</div>
	<div class='admin_review'>
		<a href="admin_review">고객리뷰관리</a>
	</div>
	<div class='admin_post'>
		<a href="admin_post">고객센터 관리</a>
	</div>
	<div class='admin_user'>
		<a href="admin_user">회원관리</a>
	</div>
	<div class='admin_place_option'>
		<a href="admin_place_option">호텔 옵션 관리</a>
	</div>

	<div id=admin_place_option_and_type>
		<table>
			<tr>
				<td>Yonolja_place_type</td>
				<td>Yonolja_place_option</td>
			</tr>
		</table>
	</div>
	<div id=yonolja_place_type>
		<select id='yonolja_place_type_list'></select>
		<table id='yonolja_place_type_table' border=1px;>
			<tr>
				<td>
					<a>호텔타입 이름</a>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td>
					<a>호텔타입 이미지</a>
				</td>
				<td>
				</td>				
			</tr>
		</table>
		<input type='button' id='yonolja_place_type_add' value=추가/수정>
		<input type='button' id='yonolja_place_type_delete' value=삭제>
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	/*if($('#adminCheck').val()!='admin'){
		alert('잘못된 접근입니다')
	}*/
})

.on('click','#yonolja_place_type_list',function(){
	$.ajax({
		url:'/yonolja_place_type_list',
		data:{},
		dataType:'json'
		type:'post',
		success:function(data){
			if(data!=''){
				str=''
				for(i=0;i<data.length;i++){
					str+='<option value='data[i]['hotel_seq']'>'+data[i]['hotel_name']
				}
			$('#yonolja_place_type_list').append(str)
				
			}
		}
	
	})
})
</script>
</html>