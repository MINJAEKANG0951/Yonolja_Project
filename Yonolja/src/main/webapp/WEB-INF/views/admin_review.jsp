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
 	<div>
 		<h2>리뷰 관리 게시판</h2><a href='/admin'>관리자 페이지</a>
 	</div>
 	<table border="1px solid:black" id='admin_review_management'>
 		<tr>
 			<td>번호</td><td>숙소이름</td><td>제목</td><td>날짜</td><td>평점</td>
 		</tr>
 	</table>
 	<div id="admin_page_controller" class='paging'>
 		
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

.on('click','#admin_page_controller>a',function(){
	console.log($(this).text())
	review_list($(this).text())
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
					str+='<tr><td>'+data[i]['review_seq']+'</td><td>' // review table을 활용하여 정보를 가져온다
					+data[i]['place_name']+"</td><td>"//book_seq 를 활용하여 place_name 을 가져온다
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

</script>
</html>