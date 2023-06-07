<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<html>
<head>
    <title>사업장 정보 입력</title>
</head>
<style>

.dropzone{

height:500px;
border:2px dashed red;
border-radius:10%;
margin:20px;
padding:20px;
display:flex;
justify-content:center;
align-items:center;
position:sticky;
}

.dropzone img{
width:100%;
height:100%;
/* padding:auto; */
}

</style>
<body>


    <h2>사업장 정보 입력</h2>
    <form action="/insertPlace" method="POST" id="fmt" enctype="multipart/form-data">
    	
        <label for="pname">사업장 이름:</label><br>
        <input type="text" id="pname" name="pname"><br>
        
        <label for="ptype">사업장 유형:</label>
		
		<select id="ptype" name="ptype">
    	<c:forEach items="${ptypes}" var="ptype">
        <option name=ptype value="${ptype.place_type_seq}">${ptype.place_type_name}</option>
    	</c:forEach>
    	
		</select><br>
        
        <label for="paddress">사업장 위치:</label><br>
   
        
        <div class="information5">
         <input type="address" class="address-input" id=pzip_code name=pzip_code placeholder="우편번호" readonly><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>                                                                                               
         <br> <input type="address" id=paddress1 name=paddress1 readonly class="address2-input" placeholder="기본주소" required>
         <br> <br><input type="address" id=paddress2 name=paddress2 class="address2-input" placeholder="상세주소" required>
        </div>
        
        <label for="pmobile">사업자 전화번호:</label><br>
        <input type="text" id="pmobile" name="pmobile"><br>
        
        <label for="checkin">체크인 시간:</label><br>
        <input type="time" id="pcheckin" name="pcheckin"><br>
        
        <label for="checkout">체크아웃 시간:</label><br>
        <input type="time" id="pcheckout" name="pcheckout"><br>
        
        <label for="guide">안내문:</label><br>
        <textarea id="pguide" name="pguide"></textarea><br>
       
      <h3>사업장 주변 환경</h3>
       <c:forEach items="${environments}" var="environment">
         <input type="checkbox" id="environment${environment.place_environment_seq}" name="environments" value="${environment.place_environment_seq}">
         <label for="environment${environment.place_environment_seq}">${environment.place_environment_name}</label><br>
       </c:forEach>
       
      <h3>사업장 보유 옵션</h3>
      <c:forEach items="${pfeatures}" var="pfeature">
      <input type="checkbox" id="pfeature${pfeature.place_option_seq}" name="pfeatures" value="${pfeature.place_option_seq}">
      <label for="pfeature${pfeature.place_option_seq}">${pfeature.place_option_name}</label><br>
      </c:forEach>

  
        <input type="file" id="pimage" name="img" accept="image/*" multiple>
     <!--    <button type="button" class="btn btn-secondary mb-2" onclick="document.getElementById('file-input').click()">파일 선택</button>
        <div id="dropzone" class="dropzone" style=height:500px;>드래그 앤 드롭으로 이미지를 첨부하세요</div> -->
  
        
        
        <input type="submit" value="제출">
    </form>
</body>

 <script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

$(document)
.on('click','#mypage_button',function(){
   
})


var dropzone = document.getElementById('dropzone');
    var fileInput = document.getElementById('file-input');

    function readAndPreview(file) {
      var reader = new FileReader();
      reader.onload = function(event) {
        var imgElement = document.createElement('img');
        imgElement.src = event.target.result;
        dropzone.innerHTML = '';
        dropzone.appendChild(imgElement);
      };
      reader.readAsDataURL(file);
    }

    dropzone.ondragover = function() {
      this.classList.add('bg-light');
      return false;
    };

    dropzone.ondragleave = function() {
      this.classList.remove('bg-light');
      return false;
    };

    dropzone.ondrop = function(e) {
      e.preventDefault();
      this.classList.remove('bg-light');

      var file = e.dataTransfer.files[0];
      readAndPreview(file);
    };

    fileInput.onchange = function(e) {
      var file = e.target.files[0];
      readAndPreview(file);
    };

    
    
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("paddress2").value = extraAddr;
                
                } else {
                    document.getElementById("paddress2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('pzip_code').value = data.zonecode;
                document.getElementById("paddress1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("paddress2").focus();
            }
        }).open();
        return false;
    }
</script>

</html>
