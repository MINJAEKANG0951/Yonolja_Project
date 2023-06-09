<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<title>admin</title>
</head>
<style>
img {
    width: 50px;
    height: 50px;
  
}
</style>
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
				<td><a id=Yonolja_place_type>Yonolja_place_type</a></td>
				<td><a id=Yonolja_place_option>Yonolja_place_option</a></td>
			</tr>
		</table>
	</div>
	<div id=yonolja_place_type_dig style="display:none">
	
		<table>
		<tr>
			<td>
				<select id='yonolja_place_type_list' size=7></select>
			</td>
			<td>
				<table id='yonolja_place_type_table' border=1px;>
					<tr>
						<td>
							<a>호텔타입 이름</a>
						</td>
						<td>
							<input type=hidden id=type_seq value="">
							<input type=text id=type_name value="">
						</td>
					</tr>
					<tr>
						<td>
							<a>호텔타입 이미지</a>
						</td>
						<td>
							<input type="file" id=type_file value=""><br>
							<img id=type_img >
							
							
						</td>				
					</tr>
				</table>
				<input type='button' id='yonolja_place_type_add' value=추가/수정>
				<input type='button' id='yonolja_place_type_delete' value=삭제>
				<input type="button" id=reset value="비우기">
				
				</td>
			</tr>
		</table>
	</div>
	<div id=yonolja_place_option_dig style="display:none">
	
		<table>
		<tr>
			<td>
				<select id='yonolja_place_option_list' size=7></select>
			</td>
			<td>
				<table id='yonolja_place_option_table' border=1px;>
					<tr>
						<td>
							<a>호텔옵션 이름</a>
						</td>
						<td>
							<input type=hidden id=option_seq value="">
							<input type=text id=option_name value="">
						</td>
					</tr>
					<tr>
						<td>
							<a>호텔옵션 이미지</a>
						</td>
						<td>
							<input type="file" id=option_file value=""><br>
							<img id=option_img >
							
							
						</td>				
					</tr>
				</table>
				<input type='button' id='yonolja_place_option_add' value=추가/수정>
				<input type='button' id='yonolja_place_option_delete' value=삭제>
				<input type="button" id=reset_option value="비우기">
				
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)
.ready(function(){
	/*if($('#adminCheck').val()!='admin'){
		alert('잘못된 접근입니다')
	}*/
	type_list()
	option_list()
})

.on('click','#Yonolja_place_type',function(){
	
        $('#yonolja_place_type_dig').dialog({
            title: 'place_type',
            modal: true,
            width:650,
            beforeClose:function(){
               
            	type_list()


        	}
        })
        
})


.on('click','#yonolja_place_type_list',function(){
	type_list()
})


.on('click','#yonolja_place_type_list option:selected',function(){
	console.log($(this).val())
	console.log($(this).val().split(',')[1])
	$('#type_seq').val($(this).val().split(',')[0])
	$('#type_name').val($(this).text())
	$('#type_img').attr('src', $(this).val().split(',')[1]);

})

.on('change','#type_file',function(event){

	var file = event.target.files[0];
	  
	    var reader = new FileReader();
	    reader.onload = function(event) {
	      $('#type_img').attr('src', event.target.result);
	    };
	    reader.readAsDataURL(file);
	 
})


.on('click','#yonolja_place_type_add',function(){

	if($('#type_seq').val()==""){
	
		var formData = new FormData();
		var mainfiles = $('#type_file')[0].files[0];
		formData.append('file', mainfiles);

		$.ajax({url:'/type_img', type:'post', dataType:'text', data:formData,        
			   enctype:'multipart/form-data',
			   contentType:false,
			   processData:false,
			   beforeSend:function(){
				   if($('#type_name').val()==""){
					   alert('이름을 등록해 주세요')
					   return false;
				   }else if($('#type_file').val()==""){
					   alert('이미지를 등록해주세요')
					   return false;
				   }
			   },
			   success:function(data) {
				   //return false;
				   if(data=="ok"){
					   $.ajax({
						url:"/yonolja_place_type_add",
						data:{name:$('#type_name').val()},
						dataType:'text',
						type:'post',
						success:function(data){
							if(data=="ok"){
								alert('추가되었습니다')
									type_list()
									reset()
							}else {
								alert('실패하였습니다')
							}
						}
		
			
					})
				  }else{
					  alert('등록에 실패하였습니다')
				  }
				   
			   }
		})
		
	}else{
		if(confirm('내용을 변경하시겠습니까?')){
			if($('#type_file').val()==""){
				$.ajax({
					url:"/update_type_name",
					data:{name:$('#type_name').val(),seq:$('#type_seq').val()},
					dataType:'text',
					type:'post',
					beforeSend:function(){
						   if (confirm('이미지를 변경하지 않으시겠습니까?.')) {
							      alert('업데이트가 진행됩니다.');
							   }
							   else {
							      alert('이미지를 변경해주세요.');
							   }
					},
					success:function(data){
						if(data=="ok"){
							alert("완료되었습니다")
							type_list()
						}else{
							alert("??")
						}
					}
				})
			}else{
				var formData = new FormData();
				var mainfiles = $('#type_file')[0].files[0];
				formData.append('file', mainfiles);
	
				$.ajax({url:'/update_type_img', type:'post', dataType:'text', data:formData,        
					   enctype:'multipart/form-data',
					   contentType:false,
					   processData:false,
					   beforeSend:function(){
						   if($('#type_name').val()==""){
							   alert('이름을 등록해 주세요')
							   return false;
						   }
					   },
					   success:function(data) {
						   //return false;
						   if(data=="ok"){
							   $.ajax({
								url:"/yonolja_place_type_update",
								data:{seq:$('#type_seq').val(),name:$('#type_name').val()},
								dataType:'text',
								type:'post',
								success:function(data){
									if(data=="ok"){
										alert('변경되었습니다')
											type_list()
											reset()
									}else {
										alert('실패하였습니다')
									}
								}
				
					
							})
						  }else{
							  alert('등록에 실패하였습니다')
						  }
						   
					   }
				})
			}
		}else{
			alert('변경을 취소합니다');
		}
		
	}
})
.on('click','#yonolja_place_type_delete',function(){
	$.ajax({
		url:'/place_type_delete',
		data:{seq:$('#type_seq').val()},
		dataType:'text',
		type:'post',
		beforeSend:function(){
			if(confirm('정말로 삭제하시겠습니까?')){
				
			}else{
				alert('취소합니다')
			}
		},
		success:function(data){
			if(data=="ok"){
				alert('삭제되었습니다')
				type_list()
				reset()
			}else{
				alert('데이터를 다시 확인해 주세요')
			}
		}
	})
})
.on('click','#reset',function(){
	reset()
})

// 호텔 옵션 관리 시작
.on('click','#yonolja_place_option_list',function(){
	option_list()
})

.on('click','#Yonolja_place_option',function(){
	
        $('#yonolja_place_option_dig').dialog({
            title: 'place_option',
            modal: true,
            width:650,
            beforeClose:function(){
               
            	option_list()


        	}
        })
        
})

.on('click','#yonolja_place_option_list option:selected',function(){
	console.log($(this).val())
	console.log($(this).val().split(',')[1])
	$('#option_seq').val($(this).val().split(',')[0])
	$('#option_name').val($(this).text())
	$('#option_img').attr('src', $(this).val().split(',')[1]);

})

.on('change','#option_file',function(event){

	var file = event.target.files[0];
	  
	    var reader = new FileReader();
	    reader.onload = function(event) {
	      $('#option_img').attr('src', event.target.result);
	    };
	    reader.readAsDataURL(file);
	 
})


.on('click','#yonolja_place_option_add',function(){

	if($('#option_seq').val()==""){
	
		var formData = new FormData();
		var mainfiles = $('#option_file')[0].files[0];
		formData.append('file', mainfiles);

		$.ajax({url:'/option_img', type:'post', dataType:'text', data:formData,        
			   enctype:'multipart/form-data',
			   contentType:false,
			   processData:false,
			   beforeSend:function(){
				   if($('#option_name').val()==""){
					   alert('이름을 등록해 주세요')
					   return false;
				   }else if($('#option_file').val()==""){
					   alert('이미지를 등록해주세요')
					   return false;
				   }
			   },
			   success:function(data) {
				   //return false;
				   if(data=="ok"){
					   $.ajax({
						url:"/yonolja_place_option_add",
						data:{name:$('#option_name').val()},
						dataType:'text',
						type:'post',
						success:function(data){
							if(data=="ok"){
								alert('추가되었습니다')
									option_list()
									reset_option()
							}else {
								alert('실패하였습니다')
							}
						}
		
			
					})
				  }else{
					  alert('등록에 실패하였습니다')
				  }
				   
			   }
		})
		
	}else{
		if(confirm('내용을 변경하시겠습니까?')){
			if($('#option_file').val()==""){
				$.ajax({
					url:"/update_option_name",
					data:{name:$('#option_name').val(),seq:$('#option_seq').val()},
					dataType:'text',
					type:'post',
					beforeSend:function(){
						   if (confirm('이미지를 변경하지 않으시겠습니까?.')) {
							      alert('업데이트가 진행됩니다.');
							   }
							   else {
							      alert('이미지를 변경해주세요.');
							   }
					},
					success:function(data){
						if(data=="ok"){
							alert("완료되었습니다")
							option_list()
						}else{
							alert("??")
						}
					}
				})
			}else{
				var formData = new FormData();
				var mainfiles = $('#option_file')[0].files[0];
				formData.append('file', mainfiles);
	
				$.ajax({url:'/update_option_img', type:'post', dataType:'text', data:formData,        
					   enctype:'multipart/form-data',
					   contentType:false,
					   processData:false,
					   beforeSend:function(){
						   if($('#option_name').val()==""){
							   alert('이름을 등록해 주세요')
							   return false;
						   }
					   },
					   success:function(data) {
						   //return false;
						   if(data=="ok"){
							   $.ajax({
								url:"/yonolja_place_option_update",
								data:{seq:$('#option_seq').val(),name:$('#option_name').val()},
								dataType:'text',
								type:'post',
								success:function(data){
									if(data=="ok"){
										alert('변경되었습니다')
											option_list()
											reset_option()
									}else {
										alert('실패하였습니다')
									}
								}
				
					
							})
						  }else{
							  alert('등록에 실패하였습니다')
						  }
						   
					   }
				})
			}
		}else{
			alert('변경을 취소합니다');
		}
		
	}
})
.on('click','#yonolja_place_option_delete',function(){
	$.ajax({
		url:'/place_option_delete',
		data:{seq:$('#option_seq').val()},
		dataType:'text',
		type:'post',
		beforeSend:function(){
			if(confirm('정말로 삭제하시겠습니까?')){
				
			}else{
				alert('취소합니다')
			}
		},
		success:function(data){
			if(data=="ok"){
				alert('삭제되었습니다')
				option_list()
				reset_option()
			}else{
				alert('데이터를 다시 확인해 주세요')
			}
		}
	})
})
.on('click','#reset_option',function(){
	reset_option()
})

function reset_option(){
	$("#option_seq").val("")
	$("#option_name").val("")
	$("#option_img").remove()
	$("#option_file").val("")
	$('#yonolja_place_option_table tr:eq(1) td:eq(1)').append("<img id=option_img>")
}	


function reset(){
	$("#type_seq").val("")
	$("#type_name").val("")
	$("#type_img").remove()
	$("#type_file").val("")
	$('#yonolja_place_type_table tr:eq(1) td:eq(1)').append("<img id=type_img>")
}	

function type_list(){
	$.ajax({
		url:'/yonolja_place_type_list',
		data:{},
		dataType:'json',
		type:'post',
		success:function(data){
			if(data!=''){
				str=''
					$('#yonolja_place_type_list').empty();
				for(i=0;i<data.length;i++){
					str+='<option value="'+data[i]['seq']+','+ data[i]['img']+'">'
					+data[i]['name']+
					" </option>"
					//str += '<input type=hidden" id="type_img' + i + '" value="' + data[i]['img'] + '">';
				}
			$('#yonolja_place_type_list').append(str)
			
			}
		}
	
	})
}
function option_list(){
	$.ajax({
		url:'/yonolja_place_option_list',
		data:{},
		dataType:'json',
		type:'post',
		success:function(data){
			if(data!=''){
				str=''
					$('#yonolja_place_option_list').empty();
				for(i=0;i<data.length;i++){
					str+='<option value="'+data[i]['seq']+','+ data[i]['img']+'">'
					+data[i]['name']+
					" </option>"
					//str += '<input type=hidden" id="option_img' + i + '" value="' + data[i]['img'] + '">';
				}
			$('#yonolja_place_option_list').append(str)
			
			}
		}
	
	})
}

</script>
</html>