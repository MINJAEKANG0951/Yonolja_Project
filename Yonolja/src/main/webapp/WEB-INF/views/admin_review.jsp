<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<%@ include file ="./structure/header.jsp" %>
<style>
body{
display: block;
padding-left:210px;
padding-top:150px;
}
.admin_review_grid{
	display:grid;

}
#admin_review_delete{
 margin-left:900px;
}
.admin_review{
	text-align: center;
}
table{

border-left: none;
border-right: none;
}

tr:first-child{
border: 1px;
}
</style>
<body>
<%@ include file ="./structure/admin_side.jsp" %>
<div class='admin_review'>
	<div class='admin_page_login'>
		<input type='hidden' id='adminCheck' value="${adcheck}">
		
	</div>

 	<div id=admin_review_title>
 		<h2>리뷰 관리 게시판</h2>
 		<input type=button id=admin_review_delete value=삭제>
 	</div>
 	<table border="1px solid:black" class="table table-striped" id='admin_review_management' style="width: 1000px; margin-left: auto;margin-right: auto;">
 		<tr>
 			<td><input type=checkbox id=checkbox_list></td><td>리뷰번호</td><td>숙소이름</td><td>작성자</td><td>내용</td><td>날짜</td><td>평점</td>
 		</tr>
 	</table>
 	<div id="admin_page_controller" class='paging'>
 		
 	</div>
 	<div id="admin_page_search_controller" class='paging'>
 		
 	</div>
 	<div id="admin_review_search_div">
 		<select id=admin_review_select>
 			<option value=0>통합검색</option>
 			<option value=1>숙소이름</option>
 			<option value=2>제목</option>
 		</select>
 		<input type=text id=admin_review_search>
 		<input type=button id=admin_review_btn value="검색">
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
	console.log("hi")
//	review_list()
    paging()
        .then(function() {
            console.log($('#pagenum1').attr('value'));
            review_list($('#pagenum1').attr('value'));	

	
        })
        .catch(function(error) {
            console.error(error);
        });
	console.log("hello")
	
})
.on('click','#admin_review_title',function(){
	document.location='/admin_review'
})
.on('click','#admin_page_controller>a',function(){
	console.log($(this).text())
	review_list($(this).text())
	 $(this).css('font-weight', 'bold');

    // 나머지 a 태그의 글자 굵기 초기화
    $('#admin_page_controller>a').not(this).css('font-weight', 'normal');
})
.on('click','#admin_page_search_controller>a',function(){
	console.log($(this).text())
	search_list($(this).text())
	 $(this).css('font-weight', 'bold');

    // 나머지 a 태그의 글자 굵기 초기화
    $('#admin_page_search_controller>a').not(this).css('font-weight', 'normal');
})

.on('click','#admin_review_delete',function(){
	var checkedValues = [];
	$('.check_service:checked').each(function() {
	  checkedValues.push($(this).parent().parent().find('td:eq(1)').text());
	});
	console.log(checkedValues.join(','));
	$.ajax({
		url:"/review_delete_service",
		data:{seq:checkedValues.join(',')},
		dataType:'text',
		type:'post',
		beforeSend:function(){
			if(confirm('정말로 삭제하시겠습니까?')){
				if(checkedValues.join(',')==""){
					alert('선택된 게시글이 없습니다.')
					return false;
				}
				
			} else{
				alert("정지하였습니다")
				return false;
			}
		},
		success:function(data){
			console.log(data)
			if(data=="ok"){
				alert("삭제되었습니다")
				document.location="/admin_review"
			}else{
				alert("실패하였습니다")
			}
		}
			
	})
})

.on('click','#checkbox_list',function(){
	var checked = $('#checkbox_list').is(':checked');
	
	if(checked){
		$('input:checkbox').prop('checked',true);
	} else {
		$('input:checkbox').prop('checked',false);
	}
			
})

.on('click','#admin_review_btn',function(){
	$.ajax({
		url:'/admin_review_search_paging',
		data:{search:$('#admin_review_search').val()},
		dataType:'text',
		type:'post',
		beforeSend:function(){
			if($('#admin_review_search').val()==""){
				alert("검색할 내용을 적어주세요")
				return false;
			}
		},
		success:function(data){
			console.log(data)

			  if (data != 0) {
				  	search_list(1)
				  	console.log("test list_ok?");
					$('#admin_page_controller').empty();
					$('#admin_page_search_controller').empty();                    
                    let str = "";
                    for (let i = 1; i <= data; i++) {
                        str += "<a id=pagenum" + i + " value=" + i + ">" + i + "</a>&nbsp";
                    }
                    $('#admin_page_search_controller').append(str);
                    $('#pagenum1').css('font-weight', 'bold');
                    
			} else{
				alert("검색된 내용이 없습니다")
				return false;
			}
			
		}
	})
		
	
})



function review_list(a){
	console.log('why?')
	$.ajax({url:'/admin_review_list',
			data:{number:a},
			dataType:'json',
			type:'post',
			success:function(data){
				console.log(data)
				$('#admin_review_management tr:gt(0)').remove();
				console.log("test")
				let str='';
				console.log(data.length)
				for(i=0;i<data.length;i++){
					str+='<tr><td><input class=check_service type=checkbox id=checkboxid'+i+'></td><td>'+data[i]['review_seq']+'</td><td>' // review table을 활용하여 정보를 가져온다
					+data[i]['place_name']+"</td><td>"//book_seq 를 활용하여 place_name 을 가져온다
					+data[i]['user_name']+"</td><td>"
 					+data[i]['review_content']+"</td><td>"
 					+data[i]['review_date']+"</td><td>"
 					+data[i]['review_star']+"</td></tr>"
 					
				}

				$('#admin_review_management').append(str);	
			}
	})

}
function paging() {
    return new Promise(function(resolve, reject) {
        $.ajax({
            url: '/admin_review_paging',
            data: {},
            dataType: 'text',
            type: 'post',
            success: function(data) {
                if (data != "") {
                    console.log(data);
                    let str = "";
                    for (let i = 1; i <= data; i++) {
                        str += "<a id=pagenum" + i + " value=" + i + ">" + i + "</a>&nbsp";
                    }
                    $('#admin_page_controller').append(str);
                    $('#pagenum1').css('font-weight', 'bold');
                    resolve(); // 프라미스를 성공(resolve) 상태로 변경
                } else {
                    console.warn("No data"); // 데이터가 없을 경우 경고 출력
                    resolve(); // 프라미스를 성공(resolve) 상태로 변경
                }
            },
            error: function(xhr, status, error) {
                console.error(error); // AJAX 요청이 실패할 경우 오류 출력
                reject(error); // 프라미스를 거부(reject) 상태로 변경
            }
        });
    });
}

function search_list(num){
	$.ajax({
		url:'/admin_review_search',
		data:{search:$('#admin_review_search').val(),number:num},
		dataType:'json',
		type:'post',
		success:function(data){
			if(data!=""){
				$('#admin_review_management tr:gt(0)').remove();
				console.log("test")
				let str='';
				console.log(data.length)
				for(i=0;i<data.length;i++){
					str+='<tr><td><input class=check_service type=checkbox id=checkboxid'+i+'></td><td>'+data[i]['review_seq']+'</td><td>' // review table을 활용하여 정보를 가져온다
					+data[i]['place_name']+"</td><td>"//book_seq 를 활용하여 place_name 을 가져온다
					+data[i]['user_name']+"</td><td>"
					+data[i]['review_content']+"</td><td>"
					+data[i]['review_date']+"</td><td>"
					+data[i]['review_star']+"</td></tr>"
						
				}

				$('#admin_review_management').append(str);	
			}else{
				
				return false;
			}
				
		}
		
	})
	
}
</script>
</html>