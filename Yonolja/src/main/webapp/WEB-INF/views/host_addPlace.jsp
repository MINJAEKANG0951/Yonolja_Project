<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

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

.container{
	display:flex;
	justify-content:center;
	
}

.content{
/*     border: 1px solid black; */
/*     padding:30px; */
/*     border-radius:5%; */
   
/*     transform-origin: top left; */

    border: 1px solid #ccc; /* 외부에 네모난 선 추가 */
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    border-radius: 15px;
    width: 400px;
    margin: auto; /* 가운데 정렬 */
    padding: 20px; /* 내부 패딩 추가 for better appearance */
    background-color: #lightblue;
    position: relative;
  
}

.addformSubmit{
	display:flex;
	justify-content:right;
	padding-right:20px;
	margin-top:20px;
	

}

  h2, h3 {
        font-weight: bold;
    }

.btn-primary{

	margin-left: 5px;
    padding-bottom: 30px;
    margin-bottom: 5px;
    height: 10px;

}
</style>
<body>
<%@ include file ="./structure/header.jsp" %>
<div class= container>
    <form action="/insertPlace" method="POST" id="fmt" enctype="multipart/form-data"  >
<!--     <h2>사업장 정보 입력</h2>  -->
    	
    	<div class=content>
    	 <h2>사업장 정보 입력</h2> 
        <label for="pname" >사업장 이름:</label><br>
        <input type="text" id="pname" name="pname" class="form-control form-control-lg" aria-label=".form-control-lg example"><br>
        
        <label for="ptype">사업장 유형:</label>
		
		<select  id="ptype" name="ptype"  class="form-select" aria-label="Default select example">
    	<c:forEach items="${ptypes}" var="ptype">
        <option name=ptype value="${ptype.place_type_seq}">${ptype.place_type_name}</option>
    	</c:forEach>
    	
		</select><br>
        
        <label for="paddress">사업장 위치:</label><br>
   
        
        <div class="information5">
         <input type="address" class="address-input" id=pzip_code name=pzip_code placeholder="우편번호" readonly><input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-primary" value="우편번호 찾기" ><br>                                                                                               
         <br> <input type="address" id=paddress1 name=paddress1 readonly class="address2-input" placeholder="기본주소" style= width:100%; required>
         <br> <br><input type="address" id=paddress2 name=paddress2 class="address2-input" placeholder="상세주소" style= width:100%; required>
        </div>
        <br>
        <label for="pmobile">사업자 전화번호:</label><br>
        <input type="text" id="pmobile" name="pmobile" class="form-control form-control-lg" aria-label=".form-control-lg example"><br>
        
        <label for="checkin">체크인 시간:</label><br>
        <input type="time" id="pcheckin" name="pcheckin" class="form-control form-control-lg" aria-label=".form-control-lg example"><br>
        
        <label for="checkout">체크아웃 시간:</label><br>
        <input type="time" id="pcheckout" name="pcheckout" class="form-control form-control-lg" aria-label=".form-control-lg example"><br>
        
        <label for="guide">안내문:</label><br>
        <textarea id="pguide" name="pguide" style="width:100%; height:100px;"></textarea><br>
       <br>
      <h3>사업장 주변 환경</h3>
     



<div class="form-row">
  <c:forEach items="${environments}" var="environment" varStatus="loop">
    <div class="col-4">
      <div class="form-check">
        <input type="checkbox" class="form-check-input" id="environment${environment.place_environment_seq}" name="environments" value="${environment.place_environment_seq}">
        <label class="form-check-label" for="environment${environment.place_environment_seq}">${environment.place_environment_name}</label>
      </div>
    </div>
    <c:if test="${loop.index % 3 == 2}">
      </div><div class="form-row">
    </c:if>
  </c:forEach>
</div>


       
      <!-- 
          <div class="form-check">
  <c:forEach items="${environments}" var="environment">
    <input type="checkbox" class="form-check-input" id="environment${environment.place_environment_seq}" name="environments" value="${environment.place_environment_seq}">
    <label class="form-check-label" for="environment${environment.place_environment_seq}">${environment.place_environment_name}</label><br>
  </c:forEach>
</div>

      
       --> 
       
       
       
       
       
 
        <div class=addformSubmit>
        <input type="submit" class="btn btn-primary" value="제출">
    	</div>
    </form>
    </div>
    
   </div>
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
