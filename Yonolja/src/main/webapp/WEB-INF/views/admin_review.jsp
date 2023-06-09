<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<title>관리자 리뷰관리</title>
<br><br><br>
</head>
 
<style>
body{
display: block;
/* padding-left:210px;
padding-top:150px; */
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
	table-layout:fixed;
    border-left: none;
	border-right: none;   
}

tr:first-child{
border: 1px;
}
td:first-child{
width: 40px;
}
td{
	
	white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;	

}
#admin_review_diolog{
text-align: center;

}
</style>
<body>

<div class='admin_review'>


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

 		</select>
 		<input type=text id=admin_review_search>
 		<input type=button id=admin_review_btn value="검색">
 	</div>
</div>

<div id=admin_review_diolog style=display:none;>
	   <table class=dlg_style_control border="1px solid black">
	    <tr>
	        <td>
	        	<a>리뷰번호</a>
	    	</td>	    	
		    <td>		      
		    	<a id=admin_review_diolog_review_seq></a>
		    </td>
		    <td>
	        	<a>등록일</a>
	    	</td>	    	
		    <td>		      
		    	<a id=admin_review_diolog_review_date></a>
		    </td>   
		</tr>
		<tr>
			<td>
	        	<a>숙소명칭</a>
	    	</td>	    
		    <td>
	        	<a id=admin_review_diolog_place_name></a>
	    	</td>
	        <td>
	        	<a>작성자</a>
	    	</td>	    	
		    <td>		      
		    	<a id=admin_review_diolog_user_name></a>
		    </td>			
		</tr>
		<tr>
	        <td colspan=4>
	        	<a style="display: block; text-align: left;">content</a>
	    	</td>
	    </tr>
	    <tr> 	
		    <td colspan=4>		      
		    	<textarea rows="10" cols="50" id=dialog_review_view maxlength="500" readonly></textarea>
		    </td>   
		</tr>

    </table>
</div>


</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)
.ready(function(){

	

    paging()
.then(function() {
    console.log($('#pagenum1').attr('value'));
    review_list($('#pagenum1').attr('value'));	


})
.catch(function(error) {
    console.error(error);
});
 

	
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

.on('click','.user_review_dig',function(){
	seq=$(this).parent().find('td:eq(1)').text()
	console.log(seq)
	$.ajax({url:'/admin_review_dig',
		data:{seq:seq},
		dataType:'json',
		type:'post',
		beforeSend:function(){
			
		},
		success:function(data){
			console.log(data!=null)
			console.log(data)
			if(data!=null || data!=''){
				$('#admin_review_diolog').dialog({
		            title: '리뷰상세내역',
		            modal: true,
		            width:500,
		            height:450,
		            focus:function(){
		            	
		              	$('#admin_review_diolog_review_seq').text(data[0]['review_seq'])
		            	$('#admin_review_diolog_place_name').text(data[0]['place_name'])
						$('#admin_review_diolog_review_date').text(data[0]['review_date'])
						$('#admin_review_diolog_user_name').text(data[0]['user_id'])
						$('#dialog_review_view').text(data[0]['review_content'])
						
						
		        	},
		        	close: function(){
		        		
		        	}
				/*,beforeClose:function(){  다이얼로그 종료시 작동할 동장 필요시 사용
        		if($('#post_admin_comment').text()==null || $('#post_admin_comment').text()=="" ){
        			alert("값이 있습니다")
        		}
        	}*/
		        })
			}
			
		}
	})

	
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
	return new Promise(function(resolve, reject) {
	console.log('why?')
	$.ajax({url:'/admin_review_list',
			data:{number:a},
			dataType:'json',
			type:'post',
			success:function(data){
				console.log(data)
				if(data!=""){
					$('#admin_review_management tr:gt(0)').remove();
					console.log("test")
					let str='';
					console.log(data.length)
					for(i=0;i<data.length;i++){
						str+='<tr><td><input class=check_service type=checkbox id=checkboxid'+i+'></td><td>'+data[i]['review_seq']+'</td><td>' // review table을 활용하여 정보를 가져온다
						+data[i]['place_name']+"</td><td>"//book_seq 를 활용하여 place_name 을 가져온다
						+data[i]['user_id']+"</td><td class=user_review_dig>"
	 					+data[i]['review_content']+"</td><td>"
	 					+data[i]['review_date']+"</td><td>"
	 					+data[i]['review_star']+"</td></tr>"
	 					
					}
	
					$('#admin_review_management').append(str);
					resolve();
				}else{
					 reject("No data available");
				}
					 
			},
			      error: function(xhr, status, error) {
				        reject(error);
			}
		})
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
					+data[i]['user_id']+"</td><td class=user_review_dig>"
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