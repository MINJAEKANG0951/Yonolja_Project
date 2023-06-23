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
<title>관리자 게시글 관리</title>
<br><br><br>
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
	table-layout:fixed;
    border-left: none;
	border-right: none;   
}

tr:first-child{
border: 1px;
}
td{
	
	white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;	
}
td:first-child{
width: 40px;
}
.dlg_style_control input{
width:150px;
}
#post_admin_comment_btn{
width: 50px;
}
.img_size_control{
width: 60px;
height: 60px;
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
   <table class=dlg_style_control border="1px solid black">
   
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
		    	<textarea rows="10" cols="30" id=dialog_post_contents maxlength="500" readonly></textarea>
		    </td>   
		</tr>
		<tr>
			<td colspan=4>
				<a>관리자 답변</a>
			</td>
		</tr>
		<tr>
			<td colspan=4>
				<textarea rows="10" cols="30" maxlength="500" id=post_admin_comment></textarea>
				
			</td>
		</tr>
		<tr>
			<td colspan=4><input type=button id=post_admin_comment_btn value="등록"></td>
		</tr>
    </table>
</div>

<div id=admin_post_list_diolog_text style="display:none">
	   <table class=dlg_style_control id=diolog_table_name border="1px solid black">
	    <tr>
	        <td>
	        	<a>Title</a><input type=hidden id=dialog_post_seq_hidden_view value=''>
	    	</td>	    	
		    <td colspan=3>		      
		    	<input type='text' id=dialog__post_title_view  readonly>
		    </td>   
		</tr>
		<tr>
    
	        <td colspan=2>
	        	<a>Writer</a>
	    	</td>	    	
		    <td colspan=2>		      
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
		    	<textarea rows="10" cols="45" id=dialog_post_contents_view maxlength="500" readonly></textarea><br>
		    	
		    </td>   
		</tr>
		<tr>
			<td colspan=4>
				<a>관리자 답변</a>
			</td>
		</tr>
		<tr>
			<td colspan=4>
				<textarea rows="10" cols="45" maxlength="500" id=post_admin_comment_view></textarea>
			</td>
		</tr>

    </table>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
paging_num=1;
search_paging_num=1;
search_max_page=1;
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
		            width:500,
		            height:800,
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
		            width:500,
		            focus:function(){
		            	
		              	$('#dialog__post_title_view').val(data['post_title'])
		            	$('#dialog__post_id_view').val(data['user_id'])

						$('#dialog_post_contents_view').text(data['post_content'])
						$('#dialog_post_seq_hidden_view').val(data['post_seq'])
						$('#post_admin_comment_view').val(data['post_comment'])
						if(data['post_img']!=null){
							$('#diolog_table_name tr:eq(3) td:eq(0)').append('<img class=img_size_control src='+data['post_img']+'>')
						}
							
						
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
	
.on('click','.next_page',function(){
	console.log($('#pagenum_max').val());
	paging_num+=1;
	css_num=paging_num;
	console.log("css_num="+css_num)
	post_list(paging_num)
	    .then(function() {
	      return post_paging();
	    })
	    .then(function() {
	      $('#admin_post_controller>a').css('font-weight', 'normal');
	      console.log($('#admin_post_controller>a'));
	      console.log($('#admin_post_controller>a').eq(0).text());
	    $('#admin_post_controller>a').eq(0).css('font-weight', 'bold')

	    })
	    .catch(function(error) {
	      console.error("An error occurred:", error);
	    });

})

.on('click','.before_page',function(){
	console.log($('#pagenum_min').val())
	if(paging_num%5==0){
		paging_num-=9
		post_paging()
	    .then(function() {
		      return post_list(paging_num);
		    })
		    .then(function() {
		      $('#admin_post_controller>a').css('font-weight', 'normal');
		      console.log($('#admin_post_controller>a'));
		      console.log($('#admin_post_controller>a').eq(4).text());
		    $('#admin_post_controller>a').eq(4).css('font-weight', 'bold')

		    })
		    .catch(function(error) {
		      console.error("An error occurred:", error);
		    });
		
	}else{
		remain=paging_num%5
		console.log("remain"+remain)
		paging_num-=(remain+4)
		console.log(paging_num)
		post_paging()
	    .then(function() {
		      return post_list(paging_num);
		    })
		    .then(function() {
		      $('#admin_post_controller>a').css('font-weight', 'normal');
		      console.log($('#admin_post_controller>a'));
		      console.log($('#admin_post_controller>a').eq(4).text());
		    $('#admin_post_controller>a').eq(4).css('font-weight', 'bold')

		    })
		    .catch(function(error) {
		      console.error("An error occurred:", error);
		    });
	}
		
		
})
.on('click','.search_next_page',function(){
	console.log($('#pagenum_max').val())
	search_paging_num+=1
	if(search_paging_num>5){
		str+= "<input type=hidden id=search_pagenum_min value="+search_paging_num+"><input type=button class=search_before_page id=before_page_"+search_paging_num+" value='<<'>&nbsp&nbsp"
	}
	for(search_paging_num;search_paging_num<=search_max_page;search_paging_num++){
		str+= "<a id=pagenum" + search_paging_num + " value=" + search_paging_num + ">" + search_paging_num + "</a>&nbsp";
		if(search_paging_num%5==0){
			str+="&nbsp&nbsp<input type=hidden id=search_pagenum_max value="+search_paging_num+"><input type=button class=search_next_page id=next_page_"+search_paging_num+" value='>>'>"
			break;
		}
	}
	  $('#admin_post_controller').append(str);
})

.on('click','.search_before_page',function(){
	console.log($('#pagenum_min').val())
	str="";

	if(search_paging_num%5==0){
		search_paging_num-=9
		if(search_paging_num>5){
				str+= "<input type=hidden id=search_pagenum_min value="+search_paging_num+"><input type=button class=search_before_page id=before_page_"+search_paging_num+" value='<<'>&nbsp&nbsp"
		}
		for(search_paging_num;search_paging_num<=search_max_page;search_paging_num++){
			str+= "<a id=pagenum" + search_paging_num + " value=" + search_paging_num + ">" + search_paging_num + "</a>&nbsp";
			if(search_paging_num%5==0){
				str+="&nbsp&nbsp<input type=hidden id=search_pagenum_max value="+search_paging_num+"><input type=button class=search_next_page id=next_page_"+search_paging_num+" value='>>'>"
			}
		}
		  $('#admin_post_controller').append(str);
		
	}else{
		remain=search_paging_num%5
		console.log("remain"+remain)
		search_paging_num-=(remain+4)
		if(search_paging_num>5){
			str+= "<input type=hidden id=search_pagenum_min value="+search_paging_num+"><input type=button class=search_before_page id=before_page_"+search_paging_num+" value='<<'>&nbsp&nbsp"
		}
		console.log(search_paging_num)
		for(search_paging_num;search_paging_num<=search_max_page;search_paging_num++){
			str+= "<a id=pagenum" + search_paging_num + " value=" + search_paging_num + ">" + search_paging_num + "</a>&nbsp";
			if(search_paging_num%5==0){
				str+="&nbsp&nbsp<input type=hidden id=search_pagenum_max value="+search_paging_num+"><input type=button class=search_next_page id=next_page_"+search_paging_num+" value='>>'>"
				break;
			}
		}
		  $('#admin_post_controller').append(str);
	}
		
		
})
.on('click','#admin_post_search_btn',function(){
console.log($('#admin_post_searchBar').val())
	$.ajax({
		url:"/admin_post_search_paging",
		data:{search:$('#admin_post_searchBar').val(),searchVal:$("#admin_post_search_select").val()},
		dataType:'text',
		type:'post',
		beforeSend:function(){
			if($('#admin_post_searchBar').val()==''){
				alert('검색란에 내용을 적어주세요')
				return false
			}
		},
		success:function(data){
			console.log("pagetest="+data)
			if(data!=0){
				str="";
				
				$('#admin_post_controller').empty()

				for(search_paging_num;search_paging_num<=data;search_paging_num++){
					str+= "<a id=pagenum" + search_paging_num + " value=" + search_paging_num + ">" + search_paging_num + "</a>&nbsp";
					if(search_paging_num%5==0){
						str+="&nbsp&nbsp<input type=hidden id=search_pagenum_max value="+search_paging_num+"><input type=button class=search_next_page id=next_page_"+search_paging_num+" value='>>'>"
					}
					
				}
				search_max_page=data
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
	 return new Promise(function(resolve, reject) {
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
				resolve();
			}else {
		          reject("No data available");
	        }
	      },
	      error: function(xhr, status, error) {
	        reject(error);
	      }
				
	})
	})
}
function post_paging(){
	 return new Promise(function(resolve, reject) {
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
				if(paging_num>5){
					str+= "<input type=hidden id=pagenum_min value="+paging_num+"><input type=button class=before_page id=before_page_"+paging_num+" value='<<'>&nbsp&nbsp"
				}
				for(paging_num;paging_num<=data;paging_num++){

					str+= "<a id=pagenum" + paging_num + " value=" + paging_num + ">" + paging_num + "</a>&nbsp";
					if(paging_num%5==0){
						str+="&nbsp&nbsp<input type=hidden id=pagenum_max value="+paging_num+"><input type=button class=next_page id=next_page_"+paging_num+" value='>>'>"
						break;
					}
				}
				$('#admin_post_controller').append(str);
				$('#pagenum1').css('font-weight', 'bold');
				resolve();
			}else {
		          reject("No data available");
	        }
	      },
	      error: function(xhr, status, error) {
	        reject(error);
	      }	

		})
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