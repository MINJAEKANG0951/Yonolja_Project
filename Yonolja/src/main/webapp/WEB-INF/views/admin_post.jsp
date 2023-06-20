<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<title>Insert title here</title>
</head>

<style>
.admin_post_page {
 text-align: center;
}
body{
display: block;
/* padding-left:210px;
padding-top:150px; */
}
#post_delete{
 margin-left:900px;
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

<div class=admin_post_page id="admin_post_page">
	<h2><a id='admin_post_page_reset'>문의 관리 게시판</a></h2><input type=hidden id=admin_post_reset value=0>
	<div id=post_delete_div>
		<input type=button id=post_delete value=삭제>
		
	</div>
	
	<table border=1px class="table table-striped" id=admin_post_page_table style="width: 1000px; margin-left: auto;margin-right: auto;">
		
		<tr>
			<td><input type="checkbox" id=checkList></td><td>문의번호</td><td>문의분류</td><td>문의제목</td><td>아이디</td><td>문의일</td><td>문의상태</td><td>답변작성</td>
		</tr>
		
	</table>
	<div id=admin_post_controller>

	</div>
	<div>
		<select id=admin_post_search_select>
			<option value=0>통합검색</option>
			<option value=1>제목</option>
			<option value=2>아이디</option>
			<option value=3>내용</option>
		</select>
		
		<input type=text id=admin_post_searchBar value="">
		<input type=button id=admin_post_search_btn value=검색>
	</div>
</div>

<div id="typeDlg" style="display:none" >
   <table border="1px solid black">
   
	    <tr>
	        <td>
	        	<a>Title</a><input type=hidden id=dialog_post_seq_hidden value=''>
	    	</td>	    	
		    <td colspan=3>		      
		    	<input type='text' id=dialog__post_title readonly>
		    </td>   
		</tr>

		<tr>
			<td>
	        	<a>Hits</a>
	    	</td>	    
		    <td>
	        	<input type=text id=dialog__post_view_count readonly>
	    	</td>
	        <td>
	        	<a>Writer</a>
	    	</td>	    	
		    <td>		      
		    	<input type='text' id=dialog__post_id readonly>
		    </td>			
		</tr>
		<tr>
	        <td colspan=4>
	        	<a>content</a>
	    	</td>
	    </tr>
	    <tr> 	
		    <td colspan=4>		      
		    	<textarea rows="20" cols="65" id=dialog_post_contents maxlength="500" readonly></textarea>
		    </td>   
		</tr>
		<tr>
			<td colspan=4>
				<a>관리자 답변</a>
			</td>
		</tr>
		<tr>
			<td colspan=4>
				<textarea rows="10" cols="65" maxlength="500" id=post_admin_comment></textarea>
			</td>
		</tr>
		<tr>
			<td colspan=4><input type=button id=post_admin_comment_btn value="등록"></td>
		</tr>
    </table>
</div>

<div id=admin_post_list_diolog_text style="display:none">
	   <table border="1px solid black">
	    <tr>
	        <td>
	        	<a>Title</a><input type=hidden id=dialog_post_seq_hidden_view value=''>
	    	</td>	    	
		    <td colspan=3>		      
		    	<input type='text' id=dialog__post_title_view readonly>
		    </td>   
		</tr>
		<tr>
			<td>
	        	<a>Hits</a>
	    	</td>	    
		    <td>
	        	<input type=text id=dialog__post_view_count_view readonly>
	    	</td>
	        <td>
	        	<a>Writer</a>
	    	</td>	    	
		    <td>		      
		    	<input type='text' id=dialog__post_id_view readonly>
		    </td>			
		</tr>
		<tr>
	        <td colspan=4>
	        	<a>content</a>
	    	</td>
	    </tr>
	    <tr> 	
		    <td colspan=4>		      
		    	<textarea rows="20" cols="65" id=dialog_post_contents_view maxlength="500" readonly></textarea>
		    </td>   
		</tr>
		<tr>
			<td colspan=4>
				<a>관리자 답변</a>
			</td>
		</tr>
		<tr>
			<td colspan=4>
				<textarea rows="10" cols="65" maxlength="500" id=post_admin_comment_view></textarea>
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
	/*if($('#adminCheck').val()!='admin'){	관리자 인지 확인
		alert('잘못된 접근입니다')
	}*/
		
		post_paging()
		post_list(1)

	
})

.on('click','.asbtn',function(){
	
	post_seq=$(this).parent().parent().find('td:eq(1)').text()
	//alert(post_seq)
	$.ajax({url:'/admin_post_comment',
		data:{post_date:post_seq},
		dataType:'json',
		type:'post',
		beforeSend:function(){
			
		},
		success:function(data){

			if(data!=null || data!=''){
				$('#typeDlg').dialog({
		            title: '고객문의관리',
		            modal: true,
		            width:625,
		            focus:function(){
		            	
		              	$('#dialog__post_title').val(data[0]['post_title'])
		            	$('#dialog__post_id').val(data[0]['user_id'])

						$('#dialog_post_contents').text(data[0]['post_content'])
						$('#dialog_post_seq_hidden').val(data[0]['post_seq'])
						
						
		        	},
		        	close: function(){
		        		$('#post_admin_comment').val("")
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

.on('click','#post_admin_comment_btn',function(){

	var str_commit=$('#post_admin_comment').val();
	if($('#post_admin_comment').val()!=null && $('#post_admin_comment').val()!="" ){
		$.ajax({url:'/admin_comment_registration',
			data:{admin_comment:$('#post_admin_comment').val(),post_seq:$('#dialog_post_seq_hidden').val()},
			dataType:'text',
			type:'post',
			beforeSend:function(){
				if(str_commit.trim()==""){
					alert('입력을 확인해주세요')
					return false;
				} else{
					if(confirm("답변을 등록하시겠습니까?")) {
				        // 확인(예) 버튼 클릭 시 이벤트

				    } else {
				        // 취소(아니오) 버튼 클릭 시 이벤트
				        alert('답변을 취소합니다')
				        return false;
				    }
					
					
				}
			},
			success:function(data){
				if(data=="ok"){
					alert('관리자 답변을 등록하였습니다')
					window.location.href = "http://localhost:8081/admin_post"
				} else{
					alert('실패하였습니다')
				}
			
					
			}
		})
	}
})

.on('click','.admin_post_diolog',function(){
	console.log($(this).text())
	post_seq=$(this).parent().find('td:eq(1)').text()
	$.ajax({url:'/admin_post_list_diolog',
		data:{seq:post_seq},
		dataType:'json',
		type:'post',
		success:function(data){

			if(data!=null || data!=''){
				$('#admin_post_list_diolog_text').dialog({
		            title: '고객문의관리',
		            modal: true,
		            width:625,
		            focus:function(){
		            	
		              	$('#dialog__post_title_view').val(data['post_title'])
		            	$('#dialog__post_id_view').val(data['user_id'])

						$('#dialog_post_contents_view').text(data['post_content'])
						$('#dialog_post_seq_hidden_view').val(data['post_seq'])
						$('#post_admin_comment_view').val(data['post_comment'])
						
		        	},
		        	/*close: function(){
		        		$('#post_admin_comment').val("")
		        	}*/
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

.on('click','#checkList',function(){
		var checked = $('#checkList').is(':checked');
		
		
		
		if(checked){
			$('input:checkbox').prop('checked',true);
		} else {
			$('input:checkbox').prop('checked',false);
		}
			
})
.on('click','#post_delete',function(){
	var checkedValues = [];
	$('.check_service:checked').each(function() {
	  checkedValues.push($(this).parent().parent().find('td:eq(1)').text());
	});

	console.log(checkedValues.join(','));
	$.ajax({
		url:"/post_delete_service",
		data:{seq:checkedValues.join(',')},
		dataType:'text',
		type:'post',
		beforeSend:function(){
			if(confirm('정말로 삭제하시겠습니까?')){
				
				
			} else{
				alert("정지하였습니다")
				return false;
			}
		},
		success:function(data){
			console.log(data)
			if(data=="ok"){
				alert("삭제되었습니다")
				document.location="/admin_post"
			}else{
				alert("실패하였습니다")
			}
		}
			
	})
})


.on('click','#admin_post_controller>a',function(){
	post_list($(this).text())
    $(this).css('font-weight', 'bold');
    // 나머지 a 태그의 글자 굵기 초기화
    $('#admin_post_controller>a').not(this).css('font-weight', 'normal');
})
	

.on('click','#admin_post_search_btn',function(){
console.log($('#admin_post_searchBar').val())
	$.ajax({
		url:"/admin_post_search_paging",
		data:{search:$('#admin_post_searchBar').val(),searchVal:$("#admin_post_search_select").val()},
		dataType:'text',
		type:'post',
		success:function(data){
			console.log("pagetest="+data)
			if(data!=0){
				str="";
				$('#admin_post_controller').empty()
				for(let i=1;i<=data;i++){
					str+= "<a id=pagenum" + i + " value=" + i + ">" + i + "</a>&nbsp";
				}
				  $('#admin_post_controller').append(str);
				  $('#pagenum1').css('font-weight', 'bold'); 
				  search_list(1,$('#admin_post_search_select').val())
			}else{
				alert('검색결과가 없습니다')
				return false;
			}
		}
	})
	
	
	
})

.on('click','#admin_post_page_reset',function(){
	post_reset()
})

function post_list(page){

	$.ajax({url:'/post_list',
		data:{page:page},
		dataType:"json",
		type:'post',
		success:function(data){
			$('#admin_post_page_table tr:gt(0)').remove();
			if(data!=null || data!=""){
				let str=""
				
				for(let i=0;i<data.length;i++){
					let test='<input class=asbtn type=button id=post_comment_btn'+i+' value=답변달기>'
					if(data[i]['post_comment']=="답변완료"){
						test="";
					}
				str +='<tr><td><input class=check_service type=checkbox id=checkboxid'+i+'></td><td>'
						+data[i]['post_seq']+'</td><td>'// 내일 오면 게시글 삭제 seq 히든으로 넣어줄것
						+data[i]['post_category']+'</td><td class=admin_post_diolog>' //추후에 물어보고 할것
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
function post_paging(){
	$.ajax({
		url:"/admin_post_paging",
		data:{},
		dataType:'text',
		type:'post',
		success:function(data){
			console.log("data="+data)
			if(data!=0){
				str="";
				$('#admin_post_controller').empty()
				console.log(data)
				for(let i=1;i<=data;i++){
					str+= "<a id=pagenum" + i + " value=" + i + ">" + i + "</a>&nbsp";
				}
				$('#admin_post_controller').append(str);
				$('#pagenum1').css('font-weight', 'bold');  
			}
			
		}
	})
	
}

function search_list(page,select_val){

	console.log($('#admin_post_search_select').val())
	$.ajax({
		url:'/post_search',
		data:{admin_post_searchBar:$('#admin_post_searchBar').val(),
			admin_post_search_select:select_val,
			page:page},
		dataType:'json',
		type:'post',
		beforeSend:function(){
			if($('#admin_post_searchBar').val()==''){
				alert('검색란에 내용을 적어주세요')
				return false
			}
		},
		success:function(data){
	
		
			$('#admin_post_page_table tr:gt(0)').remove();
			if(data!=null || data!=""){
				let str=""
				
				for(let i=0;i<data.length;i++){
					let test='<input class=asbtn type=button id=post_comment_btn'+i+' value=답변달기>'
					if(data[i]['post_comment']=="답변완료"){
						test="";
					}
					str +='<tr><td><input class=check_service type=checkbox id=checkboxid'+i+'></td><td>'
						+data[i]['post_seq']+'</td><td>'
						+data[i]['post_category']+'</td><td class=admin_post_diolog>' //추후에 물어보고 할것
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
function post_reset(){
			window.location.href = "http://localhost:8081/admin_post"
	
}




</script>
</html>