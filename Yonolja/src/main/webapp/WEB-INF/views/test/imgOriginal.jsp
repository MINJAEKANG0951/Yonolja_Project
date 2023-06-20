

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>이미지 미리보기</title>
</head>

<style>

#pictures{
	border:1px solid black;
	min-width:300px;
	min-height:300px;
}
.img{
	width:100px;
	height:100px;
	border:1px solid black;
	margin:10px;
	cursor:pointer;
}
.img:hover{
	border:3px solid black;
}

.frame{

	position:relative;
	width:300px;
	height:300px;
	border:1px solid black;
	
}
.photo{
	
	position:absolute;
	width:100%;
	height:100%;

}
.xButton{

	position:absolute;
	width:10%;
	height:10%;
	right:3px;
	top:3px;
	cursor:pointer;
}
.xButton:hover{
	
	transition:0.5s;
	width:13%;
	height:13%;
}
</style>
<body>

<hr>
<button id=addFile> 파일추가하기 </button><br><br>
<button id=reset> 비우기 </button><br><br>
<input type="file" id=imgInput name="img" accept="image/*" ><br><br>

<hr>
<h1>미리보기</h1>
<div id="pictures">
  <div class="frame">
    <!-- 이미지와 xButton을 동적으로 추가할 위치 -->
  </div>
</div>



<hr>

<!-- <div class=frame> -->
<!-- 	<img src="/img/test/거북이1.png" class="photo"> -->
<!-- 	<img src="/img/website/xButton.png" class="xButton"> -->
<!-- </div> -->


</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>

$(document)
.ready(function(){
	refreshImgs();
})
.on('click','#addFile',function(){
	$('#imgInput').trigger('click');
})
.on('click','#reset',function(){
	$('#imgInput').val(null);
})
.on('input','#imgInput',function(){
	
	
	imgfile = $(this)[0].files[0];
	
	formData = new FormData();
	formData.append('img', imgfile);
	
	$.ajax({url:'/addImg', type:'post',
		
		processData:false,
		contentType:false,
		data:formData,
		success:function(){
			
			refreshImgs();
			
		}
		
		
	})
	
})
.on('click','.img',function(){
	src =  "," + $(this).attr('src');
	
	$.ajax({url:'/deleteImg', type:'post', 
		
		data:{src:src},
		success:function(){
			refreshImgs();
		}
	})
	
	
})


////////////////원래 민재 코드 /////////////////
function refreshImgs(){
	
	$('#pictures').empty();
	$.ajax({url:'/getImgs', type:'post', dataType:'text',
	
		success:function(data){
			
			$('#pictures').empty();
			if(data!='-'){
				imgs = data.split(",");
				for(i=0;i<imgs.length;i++){
					if(i==0){
						str = '<img class=img src="' + imgs[i] + '" style="display:none">'
						$('#pictures').append(str);
					} else {
						str = '<img class=img src="' + imgs[i] + '">'
						$('#pictures').append(str);
					}
	
				}
			}
			
		}
	
	})
	
}
///////////////////////////////gpt 코드 /////////////////////////////

// function refreshImgs() {
//   $('#pictures').empty();
//   $.ajax({
//     url: '/getImgs',
//     type: 'post',
//     dataType: 'text',
//     success: function(data) {
//       $('#pictures').empty();
//       if (data != '-') {
//         imgs = data.split(",");
//         for (i = 0; i < imgs.length; i++) {
//           str = '<div class="frame img-container"><img class="img" src="' + imgs[i] + '"><img src="/img/website/xButton.png" class="xButton"></div>';
//           $('#pictures .frame').append(str);
//         }

//         $('.xButton').on('click', function() {
//           var imgContainer = $(this).closest('.img-container');
//           var imgSrc = imgContainer.find('.img').attr('src');

//           // 이미지 삭제를 위한 Ajax 요청 등의 처리 수행
//           // ...

//           imgContainer.remove();
//         });

//         $('.img').on('mouseenter', function() {
//           $(this).siblings('.xButton').show();
//         }).on('mouseleave', function() {
//           $(this).siblings('.xButton').hide();
//         });
//       }
//     }
//   });
// }
////////잠깐 클립보드 
// style="display:none"


</script>
</html>