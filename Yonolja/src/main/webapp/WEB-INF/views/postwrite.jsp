<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="icon" href="/img/website/favicon-16x16.png" type="image/x-icon" sizes="16x16">
</head>
<%@ include file ="./structure/header.jsp" %>
<style>
 
.heade{
    display: flex; 
     justify-content: center;
    /* align-items: center; */
    padding-bottom: 30px;
}

.dropzone {
      width: 100%;
      height: 150px;
      border: 2px dashed #BBBBBB;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 15px;
    }
    .dropzone img {
      max-width: 100%;
      max-height: 100%;
    }

    .write{
        padding-left: 300px;
        padding-right: 300px;
    }

	 #submit-success {
        position: fixed;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        display: none;
        padding: 50px;
        border-radius: 10px;
        background: #fff;
        text-align: center;
        z-index: 1000;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

</style>
<body>
<div class="center">


<section>
  <div class="write">
    <h3 class="mt-3 mb-3">𝐏𝐨𝐬𝐭 𝐖𝐫𝐢𝐭𝐞</h3>
    <br>

    <form action="/submit" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label for="title">𝑇𝑖𝑡𝑙𝑒</label>
        <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
      </div>
      <div class="form-group">
        <label for="content">𝑐𝑜ntent</label>
        <textarea class="form-control" id="content" name="content" rows="3" placeholder="내용을 입력하세요"></textarea>
      </div>
      <div class="form-group">
        <label for="category">𝐶𝑎𝑡𝑒𝑔𝑜𝑟𝑖𝑒</label>
        <select class="form-control" id="category" name="category">
     	  <% if(session.getAttribute("user_type").equals("admin")){ %>
          <option name=postType value=1>공지</option>
          <option name=postType value=2>일반</option>
          <% } else { %>
          <option name=postType value=2>일반</option>
          <% } %>
        </select>
      </div>
      <div class="form-group">
        <label>𝑖𝑚𝑎𝑔𝑒</label>
        <input type="file" id="file-input" name="image" accept="image/*" style="display:none;"> <!--  style="display:none;"> -->
        <button type="button" class="btn btn-secondary mb-2" onclick="document.getElementById('file-input').click()">파일 선택</button>
        <div id="dropzone" class="dropzone">드래그 앤 드롭으로 이미지를 첨부하세요</div>
      </div>
      <button type="submit" class="btn btn-primary" style="margin-top:20px;">작성하기</button>
      
      
      
      
    </form>
  </div>
</section>




</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)
.on('click','#mypage_button',function(){
	
})

$(document).ready(function() {
    var dropzone = $('#dropzone');
    var fileInput = $('#file-input');

    function readAndPreview(file) {
        var reader = new FileReader();

        reader.onload = function(event) {
            var imgElement = $('<img>').attr('src', event.target.result);
            dropzone.empty().append(imgElement);
        };

        reader.readAsDataURL(file);
    }

    dropzone.on({
        dragover: function() {
            dropzone.addClass('bg-light');
            return false;
        },
        dragleave: function() {
            dropzone.removeClass('bg-light');
            return false;
        },
        drop: function(e) {
            e.preventDefault();
            dropzone.removeClass('bg-light');

            var file = e.originalEvent.dataTransfer.files[0];
            fileInput.get(0).files = e.originalEvent.dataTransfer.files;  // Add this line
            readAndPreview(file);
        }
    });

    fileInput.on('change', function(e) {
        var file = e.target.files[0];
        readAndPreview(file);
    });

    $('#mypage_button').on('click', function(){
        // Handle the mypage_button click event here
    });

    // Add this part
    $('form').on('submit', function(e){
        e.preventDefault();

        $(this).hide('slow', function(){
            $(this).show('slow', function(){
                $(this)[0].submit();
            });
        });
    });
});
    
    
</script>
</html>

