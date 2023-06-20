<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사이드바 테스트</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<%@ include file ="./structure/header.jsp" %> 
<style>
    #layoutSidenav_nav{
        position: absolute;
        left:0px;
        top:85px;
        width: 170px;
        height: 828px;

 
    }
.admin_img_inform {
    width: 50px;
    height: 50px;
  
}
.modal{
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
</style>
<body>

    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading" id="admin_manager">회원관리</div>
                    <a class="nav-link" id="admin_user_select" href="#" >
                        <div class="sb-nav-link-icon" ><i class="fas fa-tachometer-alt"></i></div>
                        회원관리
                    </a>

                    <div class="sb-sidenav-menu-heading">게시글/리뷰 관리</div>

                    <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                        <!--      <a class="nav-link" href="layout-static.html">Static Navigation</a>
                            <a class="nav-link" href="layout-sidenav-light.html">Light Sidenav</a> -->
                        </nav>
                    </div>
                    <a class="nav-link collapsed"  data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                        <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                        게시글/리뷰
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages" >
                            <a class="nav-link collapsed" id="admin_post_select" href="#" >
                            <!--  이동 안되는 건데왜 안되는지 모르겟음 우선 지워서 되는지는 확인이 됨<a class="nav-link collapsed" href="/admin_post" data-bs-toggle="collapse" data-bs-target="#pagesCollapseAuth" aria-expanded="true" aria-controls="pagesCollapseAuth"> -->
                                게시글
                            </a>
                            <a class="nav-link collapsed" id="admin_review_select"href="#" >
                            <!--이동 안되는 건데왜 안되는지 모르겟음 우선 지워서 되는지는 확인이 됨 <a class="nav-link collapsed" href="/admin_review" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="true" aria-controls="pagesCollapseError"> -->
                                리뷰                            
                            </a>

                        </nav>
                    </div>
                    <div class="sb-sidenav-menu-heading">숙박업체 옵션/타입</div>
                    <a class="nav-link" id=Yonolja_place_type>
                        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                        숙박업체 타입
                    </a>
                    <a class="nav-link"id=Yonolja_place_option >
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        숙박업체 옵션
                    </a>
                </div>
            </div>
            <div class="sb-sidenav-footer">
                yonolja_admin
            </div>
        </nav>
    </div>
    <!-- 타입 -->
    <div class="modal" id="type_model">
 		<div class="modal-dialog" style="width: 700px;height: 400px" >
    		<div class="modal-content">
          <!-- Modal Header -->
      			<div class="modal-header">
        			<h4 class="modal-title">place type test</h4>
        			<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      			</div>
			<div id=yonolja_place_type_dig >
	
				<table>
					<tr>
						<td>
							<select id='yonolja_place_type_list' size=6></select>
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
										<img class=admin_img_inform id=type_img >
										
										
									</td>				
								</tr>
							</table>
							<input type='button' id='yonolja_place_type_add' value=추가/수정>
							<input type='button' id='yonolja_place_type_delete' value=삭제>
							<input type="button" id=type_reset value="비우기">
							
							</td>
					</tr>
				</table>
			</div>
          <!-- Modal footer -->
	      	<div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
	     	</div>
    		</div>
  		</div>
	</div>
<!-- 옵션  -->
	<div class="modal" id="option_model">
	  <div class="modal-dialog">
	    <div class="modal-content">
	          <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">place option test</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	
		 <div id=yonolja_place_option_dig>
		
			<table>
			<tr>
				<td>
					<select id='yonolja_place_option_list' size=6></select>
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
								<img class=admin_img_inform id=option_img >
								
								
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
	          <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 에러시 다이얼로그로 수정용 -->
	<!-- <div id=yonolja_place_type_dig style="display:none">
	
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
	 -->
	<!-- <div id=yonolja_place_option_dig style="display:none">
	
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
	 -->
<!-- <section> -->
	<div id=iframe_controller class="d-flex float-end">
		<iframe id=selected_admin_page src="/admin_user" style="width: 1200px; height: 900px;"></iframe>
	</div>
<!-- </section> -->    
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
// model 사이즈 변경이 필수적 화면 출력 간 버튼 색상 변경 필요해 보임
$(document)
.ready(function(){
	/* if($('#adminCheck').val()!='admin'){
		alert('잘못된 접근입니다')
	}*/
	type_list()
	option_list()
})
.on('click','#admin_user_select',function(){
	$('#selected_admin_page').attr('src','/admin_user')
	
})
.on('click','#admin_post_select',function(){
	$('#selected_admin_page').attr('src','/admin_post')
	
})
.on('click','#admin_review_select',function(){
	$('#selected_admin_page').attr('src','/admin_review')
	
})


.on('click','#Yonolja_place_type',function(){
	  $('#type_model').modal('show');
        /*$('#yonolja_place_type_dig').dialog({
            title: 'place_type',
            modal: true,
            width:650,
            beforeClose:function(){
               
            	type_list()


        	}
        })*/
        
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
	  console.log(file)
	   /* var reader = new FileReader();
	    reader.onload = function(event) {
	      $('#type_img').attr('src', event.target.result);
	    };
	    reader.readAsDataURL(file);*/
	 if(file!=null){
		    var reader = new FileReader();
		    reader.onload = function(event) {
		      $('#type_img').attr('src', event.target.result);
		    };
		    reader.readAsDataURL(file);		 
	 }else{
		 console.log("check img")
		  $("#type_img").remove()
		    
		 $('#yonolja_place_type_table tr:eq(1) td:eq(1)').append("<img class=admin_img_inform id=type_img>")
		    
	 }
	 
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
									type_reset()
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
											type_reset()
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
				if($('#type_seq').val()==""){
					alert("목록을 선택해주세요")
					return false;
				}
			}else{
				alert('취소합니다')
			}
		},
		success:function(data){
			if(data=="ok"){
				alert('삭제되었습니다')
				type_list()
				type_reset()
			}else{
				alert('데이터를 다시 확인해 주세요')
			}
		}
	})
})
.on('click','#type_reset',function(){
	type_reset()
})

// 호텔 옵션 관리 시작
.on('click','#yonolja_place_option_list',function(){
	option_list()
})

.on('click','#Yonolja_place_option',function(){
	/*
        $('#yonolja_place_option_dig').dialog({
            title: 'place_option',
            modal: true,
            width:650,
            beforeClose:function(){
               
            	option_list()


        	}
        })
        */
	 $('#option_model').modal('show');
        
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
	  
/*	    var reader = new FileReader();
	    reader.onload = function(event) {
	      $('#option_img').attr('src', event.target.result);
	    };
	    reader.readAsDataURL(file);*/
		 if(file!=null){
			    var reader = new FileReader();
			    reader.onload = function(event) {
			      $('#option_img').attr('src', event.target.result);
			    };
			    reader.readAsDataURL(file);		 
		 }else{
		
			  $("#option_img").remove()
			    
			 $('#yonolja_place_option_table tr:eq(1) td:eq(1)').append("<img class=admin_img_inform id=option_img>")
			    
		 }
	    
	 
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
				if($('#option_seq').val()==""){
					alert("목록을 선택해주세요")
					return false;
				}	
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
	$('#yonolja_place_option_table tr:eq(1) td:eq(1)').append("<img class=admin_img_inform id=option_img>")
}	


function type_reset(){
	$("#type_seq").val("")
	$("#type_name").val("")
	$("#type_img").remove()
	$("#type_file").val("")
	$('#yonolja_place_type_table tr:eq(1) td:eq(1)').append("<img class=admin_img_inform id=type_img>")
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