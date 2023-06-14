<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<%@ include file ="./structure/header.jsp" %>
<style>
div{
text-align: center;

}
ul{
justify-content: center;

}
</style>
<body>
<div class="amdin_user">
	<div class=admin_user_management>
		
		<h2 id=user_management_title>회원관리</h2>
		<a href='/admin'>관리자 페이지</a>
		<table border="1px solid:black" id='admin_member_management_table' class="table table-striped">
			<tr>
				<td>회원번호</td>
				<td>이름</td>
				<td>아이디</td>
				<td>전화번호</td>
				<td>성별</td>
				<td>회원이메일</td>
				<td>회원유형</td>
			</tr>
		</table>
		<div id=member_pagenumber>
			<ul id=boot_pagination class=pagination>
			</ul> 
		</div>
		<div id=pagenumber>

		</div>
		<div >
			<select id=admin_user_search_type>
				<option value=0>통합검색</option>
				<option value=1>이름</option>
				<option value=2>아이디</option>
			</select>
			<input type=text id=admin_user_search >
			<input type=button id=admin_user_search_btn value=검색>
		</div>
		<!-- <div>
		  <ul class="pagination">
		    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item active"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item"><a class="page-link" href="#">Next</a></li>
		  </ul>
		</div> -->
	</div>
</div>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
$(document)
.ready(function(){
	/*if($('#adminCheck').val()!='admin'){ 관리자 인지 확인
		alert('잘못된 접근입니다')
	}*/
	paging()
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

.on('click','#user_management_title',function(){
	document.location='/admin_user'
})

.on('click','#pagenumber>a',function(){

	search_list($(this).text())
    $(this).css('font-weight', 'bold');
    // 나머지 a 태그의 글자 굵기 초기화
    $('#pagenumber>a').not(this).css('font-weight', 'normal');
})
.on('click','#boot_pagination>li',function(){
	console.log($(this).val())
	console.log($(this).children('a').text())
	memberlist($(this).children('a').text())
    //$(this).css('font-weight', 'bold');

     //나머지 a 태그의 글자 굵기 초기화
   // $('#member_pagenumber>a').not(this).css('font-weight', 'normal');
  
  	
 	$('#boot_pagination>li').addClass('active')
 	$('#boot_pagination>li').not(this).removeClass('active')  
})

.on('click','#admin_user_search_btn',function(){
	console.log($('#admin_user_search').val())
	$.ajax({
		url:'/admin_user_search_paging',
		data:{search:$('#admin_user_search').val(),searchVal:$('#admin_user_search_type').val()},
		dataType:'text',
		type:'post',
		success:function(data){
				
			if(data!=0){
				console.log(data)
				str=""
				for(i=1;i<=data;i++){

					str+="<a id=admin_search_page"+i+" value="+i+">"+i+"</a>&nbsp"
				
					
				}
				console.log(str)
				
				
				$('#member_pagenumber').empty()
				$('#pagenumber').empty()
				$('#pagenumber').append(str)
				$('#admin_search_page1').css('font-weight', 'bold');
				search_list(1)
				
			}else{
				
				alert('검색 결과가 없습니다.')
			}
			
		}
	})
	
	
	// 페이징 번호
	

})

function paging(){
	$.ajax({
		url:'/member_list_paging',
		data:{},
		dataType:'text',
		type:'post',
		success:function(data){
			if(data!=0){
				let str="";
					for(i=1;i<=data;i++){
						//str+=" <a id=admin_user_page"+i+" value="+i+">"+i+"</a>"
						str+=" <li class=page-item id=page_item"+i+" ><a class=page-link id=admin_user_page"+i+" value="+i+">"+i+"</a></li>"
						
					}
				
					console.log(str)
					//$('#member_pagenumber').empty()
					$('#boot_pagination').empty()
					//$('#member_pagenumber').append(str)
					$('#boot_pagination').append(str)
					$('#page_item1').addClass('active')
					//$('#admin_user_page1').css('font-weight', 'bold');
					
			}
		}
	
	})
}

function memberlist(page){

	$.ajax({url:"/member_list",
			data:{page:page},
			dataType:"json",
			type:"post",
			success:function(data){
				
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

function search_list(num,searchVal){
	console.log($('#admin_user_search_type').val())
	console.log($('#admin_user_search').val())
	$.ajax({
		url:'/admin_user_search',
		data:{search:$('#admin_user_search').val(),number:num,searchVal:$('#admin_user_search_type').val()},
		dataType:'json',
		type:'post',
		beforeSend:function(){
			if($('#admin_user_search').val()==""){
				alert('검색창에 입력해주세요')
				return false;
			}
		},
		success:function(data){
			console.log(data)
			console.log("data="+data.length)
			if(data!=''){
				console.log('test')
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
			
			}else{
				$('#admin_member_management_table tr:gt(0)').remove();
				let val='<tr><td colspan=7>검색 된 내역이 없습니다</td></tr>'
					$('#admin_member_management_table').append(val)
				
				
			}
			
			
		}
	
	})
}
</script>
</html>