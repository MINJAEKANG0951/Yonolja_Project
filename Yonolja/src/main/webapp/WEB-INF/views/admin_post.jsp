<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<title>Insert title here</title>
</head>
<body>
<div id="admin_post_page">
	<h2><a id='admin_post_page_reset'>문의 관리 게시판</a></h2><a href='/admin'>관리자 페이지</a><input type=hidden id=admin_post_reset value=0>
	<table border=1px id=admin_post_page_table>
		<tr>
			<td>문의번호</td><td>문의분류</td><td>문의제목</td><td>아이디</td><td>문의일</td><td>문의상태</td><td>답변작성</td>
		</tr>
	</table>
	<div>
	
		<% if(session.getAttribute("search")==null){ %>
		<c:forEach var="i" begin="${start}" end="${end}">
			<li class="page-item " ><a id="paging${i }" class="page-link" onclick='post_list(${i })'>${i }</a></li>
			<li class="page-item " style="display:none"><a id="paging${i }" class="page-link" onclick='search_list(${i })'>${i }</a></li>
		</c:forEach> 
		<%} else{ %>
		<c:forEach var="i" begin="${search_page_start}" end="${search_page_end}">
			<li class="page-item " style="display:none"><a id="paging${i }" class="page-link" onclick='post_list(${i })'>${i }</a></li>
			<li class="page-item " ><a id="paging${i }" class="page-link" onclick='search_list(${i })'>${i }</a></li>
		</c:forEach> 
		<%} %>
        
	</div>
	<div>
		<select id=admin_post_search_select>
			<option value=0>통합검색
			<option value=1>제목
			<option value=2>아이디
			<option value=3>내용
		</select>
		<input type=hidden id=admin_post_select_hidden value="${select }">
		<input type=text id=admin_post_searchBar value="${search}">
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

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)
.ready(function(){
	/*if($('#adminCheck').val()!='admin'){	관리자 인지 확인
		alert('잘못된 접근입니다')
	}*/
	if($('#admin_post_searchBar').val()==""){
		
		post_list(1)
	} else{
		$('#admin_post_search_select').val($('#admin_post_select_hidden').val())
		console.log($('#admin_post_search_select').val())
		search_list(1,$('#admin_post_search_select').val())
		
	}
	
	
})

.on('click','.asbtn',function(){
	
	post_seq=$(this).parent().parent().find('td:eq(0)').text()
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
	console.log($('#post_admin_comment').text()+"text")
	console.log($('#post_admin_comment').val()+"val")
	console.log($('#dialog_post_seq_hidden').val()+"seq")
	console.log($('#post_admin_comment').val()+"val")
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

.on('click','#admin_post_search_btn',function(){
	console.log($('#admin_post_searchBar').val())
	console.log($('#admin_post_search_select').val())
	search_list(1,$('#admin_post_search_select').val())
	window.location.href = "http://localhost:8081/admin_post"
	
})

.on('click','#admin_post_page_reset',function(){
	reset()
})

function post_list(page){
	$('.page-item').removeClass("active");
	$('#paging_search'+ page).parent().addClass("active");
	
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

function search_list(page,select_val){
	$('.page-item').removeClass("active");
	$('#paging_search'+ page).parent().addClass("active");
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
function reset(){
	console.log('test reset')
	
	$.ajax({url:'/admin_post_reset',
		data:{},
		dataType:"text",
		type:"post",
		success:function(data){
			window.location.href = "http://localhost:8081/admin_post"
		}
	})
}




</script>
</html>