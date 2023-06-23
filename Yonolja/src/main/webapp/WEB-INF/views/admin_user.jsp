<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<title>관리자 유저관리</title>
<br><br><br>
</head>

<style>
body{
display: block;
/* padding-left:210px;
padding-top:150px; */
}
.amdin_user{
	text-align: center;
	white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
ul{
justify-content: center;

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
</style>
<body>

<div class="amdin_user">
	<div class=admin_user_management>
		
		<h2 id=user_management_title>회원관리</h2>
		<br>
		<!-- 0614 추가한것 테이블 크기 고정, 테이블 중앙, 페이징 처리에 bootstrap 추가(이건 전거와 지금거 차이 보고 다시정할것) -->
		<table border="1px solid:black" id='admin_member_management_table' class="table table-striped" style="width: 1000px; margin-left: auto;margin-right: auto;">
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
			<!--  <ul id=boot_pagination class=pagination>
			</ul>  -->
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
paging_num=1;
search_paging_num=1;
search_max_page=1;
$(document)
.ready(function(){
	/*if($('#adminCheck').val()!='admin'){ 관리자 인지 확인
		alert('잘못된 접근입니다')
	}*/
	paging()
	memberlist(1)


})


.on('click','#user_management_title',function(){
	document.location='/admin_user'
})

.on('click','#pagenumber>a',function(){

	search_list($(this).text())
    $(this).css('font-weight', 'bold');
    // 나머지 a 태그의 글자 굵기 초기화
    $('#pagenumber>a').not(this).css('font-weight', 'normal');
})
.on('click','#member_pagenumber>a',function(){
	console.log($(this).text())
	console.log($(this).children('a').text())
	memberlist($(this).text())
   $(this).css('font-weight', 'bold');

     //나머지 a 태그의 글자 굵기 초기화
    $('#member_pagenumber>a').not(this).css('font-weight', 'normal');
  
  	
})

.on('click','.next_page',function(){
	console.log($('#pagenum_max').val());
	paging_num+=1;
	css_num=paging_num;
	console.log("css_num="+css_num)
	memberlist(paging_num)
	    .then(function() {
	    	console.log("why?")
	    	
	      return paging();
	    })
	    .then(function() {
	    	console.log("chekc")
	      $('#member_pagenumber>a').css('font-weight', 'normal');
	      console.log("test="+$('#member_pagenumber>a'));
	      console.log("check="+$('#member_pagenumber>a').eq(0).text());
	    $('#member_pagenumber>a').eq(0).css('font-weight', 'bold')

	    })
	    .catch(function(error) {
	      console.error("An error occurred:", error);
	    });

})

.on('click','.before_page',function(){
	console.log($('#pagenum_min').val())
	if(paging_num%5==0){
		paging_num-=9
		paging()
	    .then(function() {
		      return memberlist(paging_num);
		    })
		    .then(function() {
		    	console.log("check css 0")
		      $('#member_pagenumber>a').css('font-weight', 'normal');
		      console.log($('#member_pagenumber>a'));
		      console.log($('#member_pagenumber>a').eq(4).text());
		    $('#member_pagenumber>a').eq(4).css('font-weight', 'bold')

		    })
		    .catch(function(error) {
		      console.error("An error occurred:", error);
		    });
		
	}else{
		remain=paging_num%5
		console.log("remain"+remain)
		paging_num-=(remain+4)
		console.log(paging_num)
		paging()
	    .then(function() {
		      return memberlist(paging_num);
		    })
		    .then(function() {
		    	console.log("check css 5")
		      $('#member_pagenumber>a').css('font-weight', 'normal');

		    $('#member_pagenumber>a').eq(4).css('font-weight', 'bold')

		    })
		    .catch(function(error) {
		      console.error("An error occurred:", error);
		    });
	}
		
		
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
	 return new Promise(function(resolve, reject) {
		$.ajax({
			url:'/member_list_paging',
			data:{},
			dataType:'text',
			type:'post',
			success:function(data){
				if(data!=0){
					let str="";
					if(paging_num>5){
						str+= "<input type=hidden id=pagenum_min value="+paging_num+"><input type=button class=before_page id=before_page_"+paging_num+" value='<<'>&nbsp&nbsp"
					}
						for(paging_num;paging_num<=data;paging_num++){
							str+=" <a id=admin_user_page"+paging_num+" value="+paging_num+">"+paging_num+"</a>"
							if(paging_num%5==0){
								str+="&nbsp&nbsp<input type=hidden id=pagenum_max value="+paging_num+"><input type=button class=next_page id=next_page_"+paging_num+" value='>>'>"
								break;
							}
						}
					
						console.log(str)
						$('#member_pagenumber').empty()
						
						$('#member_pagenumber').append(str)
	
						$('#admin_user_page1').css('font-weight', 'bold');
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

function memberlist(page){
	 return new Promise(function(resolve, reject) {
		$.ajax({url:"/member_list",
				data:{page:page},
				dataType:"json",
				type:"post",
				success:function(data){
					if(data!=""){
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