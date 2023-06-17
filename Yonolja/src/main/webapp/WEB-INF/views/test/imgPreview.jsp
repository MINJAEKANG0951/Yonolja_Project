<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>이미지 미리보기</title>
  <style>
    #pictures {
      border: 1px solid black;
      min-width: 300px;
      min-height: 300px;
      display: flex;
      flex-wrap: wrap;
    }
    .img {
      width: 250px;
      height: 250px;
      border: 1px solid black;
      margin: 10px;
      cursor: pointer;
      position: relative;
    }
    .img:hover {
      border: 3px solid black;
    }
    .frame {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      border: 1px solid black;
      display: none;
    }
    .img:hover .frame {
      display: block;
    }
    .photo {
      width: 100%;
      height: 100%;
    }
    .xButton {
      position: absolute;
      top: 3px;
      right: 3px;
      width: 20%;
      height: 20%;
      cursor: pointer;
    }
    .xButton:hover {
      transition: 0.5s;
      width: 13%;
      height: 13%;
    }
  </style>
</head>
<body>
  <hr>
  <button id="addFile"> 파일추가하기 </button><br><br>
  <button id="reset"> 비우기 </button><br><br>
  <input type="file" id="imgInput" name="img" accept="image/*" ><br><br>
  <hr>
  <h1>미리보기</h1>
  <div id="pictures">
    <!-- 이미지와 xButton을 동적으로 추가할 위치 -->
  </div>
  <hr>
  <script src="https://code.jquery.com/jquery-latest.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
    $(document).ready(function() {
      refreshImgs();
    });

    $(document)
    .on('click', '#addFile', function() {
      $('#imgInput').trigger('click');
    })
    .on('click', '#reset', function() {
      $('#imgInput').val(null);
    })
    .on('input', '#imgInput', function() {
      var imgfile = $(this)[0].files[0];
      var formData = new FormData();
      formData.append('img', imgfile);

      $.ajax({
        url: '/addImg',
        type: 'post',
        processData: false,
        contentType: false,
        data: formData,
        success: function() {
          refreshImgs();
        }
      })
    })
//     on('click', '.xButton', function() {
//       var imgContainer = $(this).closest('.img');
//       var imgSrc = imgContainer.find('img.photo').attr('src');

//       // 이미지 삭제를 위한 Ajax 요청 등의 처리 수행
//       // ...
//               원래 화면상으로 작동했던 코드 
//       imgContainer.remove();
//     });
    
   .on('click', '.xButton', function() {
	   
	   
	   var imgContainer = $(this).closest('.img');
	   var src = "," + imgContainer.find('img.photo').attr('src');
       
//        console.log(imgContainer);
//        imgContainer.remove();

	   $.ajax({url:'/deleteImg', type:'post', 
    			
    			data:{src:src},
    			success:function(){
    				refreshImgs();
    			}
    		})
    		
     });

    function refreshImgs() {
      $('#pictures').empty();
      $.ajax({
        url: '/getImgs',
        type: 'post',
        dataType: 'text',
        success: function(data) {
          $('#pictures').empty();
          if (data != '-') {
            imgs = data.split(",");
//             for (i = 0; i < imgs.length; i++) {
//               var str = '<div class="img"><img class="photo" src="' + imgs[i] + '"><img src="/img/website/xButton.png" class="xButton"></div>';
//               $('#pictures').append(str);
//             }
        	for(i=0;i<imgs.length;i++){
			
				   str = '<div class="img"><img class="photo" src="' + imgs[i] + '"><img src="/img/website/xButton.png" class="xButton" ></div>';
	               $('#pictures').append(str);
	               
				

			}
           
       


          }
        }
      });
    }
  </script>
</body>
</html>
