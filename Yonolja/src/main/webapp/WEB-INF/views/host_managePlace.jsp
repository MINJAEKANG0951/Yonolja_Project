<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<input type=hidden id=place_seq value="${place_seq}" readonly>
  <!-- 업장정보 수정 버튼 -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modifyBusinessModal" id="updatePlace">
    업장정보 수정
  </button>

  <!-- 객실타입 버튼 -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#roomTypeModal">
    객실타입
  </button>

  <!-- 객실관리 버튼 -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#roomManagementModal">
    객실관리
  </button>

  <!-- 업장정보 수정 모달 -->
  <div class="modal fade" id="modifyBusinessModal" tabindex="-1" role="dialog" aria-labelledby="modifyBusinessModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modifyBusinessModalLabel">업장정보 수정</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <h2>사업장 정보 입력</h2>
          <form action="updateMyplace" method="POST" id="fmt" enctype="multipart/form-data">
            
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
              <input type="address" class="address-input" id="pzip_code" name="pzip_code" placeholder="우편번호" readonly>
              <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>                                                                                               
              <br>
              <input type="address" id="paddress1" name="paddress1" readonly class="address2-input" placeholder="기본주소" required>
              <br><br>
              <input type="address" id="paddress2" name="paddress2" class="address2-input" placeholder="상세주소" required>
            </div>
            
            <label for="pmobile">사업자 전화번호:</label><br>
            <input type="text" id="pmobile" name="pmobile"><br>
            
            <label for="checkin">체크인 시간:</label><br>
            <input type="time" id="pcheckin" name="pcheckin"><br>
            
            <label for="checkout">체크아웃 시간:</label><br>
            <input type="time" id="pcheckout" name="pcheckout"><br>
            
            <label for="guide">안내문:</label><br>
            <textarea id="pguide" name="pguide"></textarea><br>
            
            <h3> 사업장 주변 환경 </h3>
             <c:forEach items="${environments}" var="environment">
              <input type="checkbox" id="environment${environment.place_environment_seq}" name="environments" value="${environment.place_environment_seq}">
              <label for="environment${environment.place_environment_seq}">${environment.place_environment_name}</label><br>
            </c:forEach>
            
            <h3> 사업장 보유 옵션 </h3>
            <c:forEach items="${pfeatures}" var="pfeature">
              <input type="checkbox" id="pfeature${pfeature.place_option_seq}" name="pfeatures" value="${pfeature.place_option_seq}">
              <label for="pfeature${pfeature.place_option_seq}">${pfeature.place_option_name}</label><br>
            </c:forEach>

            <input type="file" id="pimage" name="img" accept="image/*" multiple>
            
            
            
       
         
        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="submit" id="btnsubmit" class="btn btn-primary">저장</button>
        </div>
          </form>
      </div>
    </div>
  </div>

  <!-- 객실타입 모달 -->
  <div class="modal fade" id="roomTypeModal" tabindex="-1" role="dialog" aria-labelledby="roomTypeModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="roomTypeModalLabel">객실타입</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <h2>객실 정보 입력</h2>
          <form action="/insertRoomType" method="POST" id="roomTypeForm" enctype="multipart/form-data">
            <label for="roomTypeId">객실타입 ID:</label><br>
            <input type="text" id="roomTypeId" name="roomTypeId"><br>
            
            <label for="hotelId">호텔 ID:</label><br>
            <input type="text" id="hotelId" name="hotelId"><br>
            
            <label for="roomName">객실 이름:</label><br>
            <input type="text" id="roomName" name="roomName"><br>
            
            <label for="amenities">객실편의시설:</label><br>
            <textarea id="amenities" name="amenities"></textarea><br>
            
            <label for="description">객실 설명:</label><br>
            <textarea id="description" name="description"></textarea><br>
            
            <label for="roomImage">객실 사진:</label><br>
            <input type="file" id="roomImage" name="roomImage" accept="image/*"><br>
            
            <label for="maxCapacity">객실 최대 숙박 인원:</label><br>
            <input type="number" id="maxCapacity" name="maxCapacity"><br>
            
            <label for="nightRate">1박 금액:</label><br>
            <input type="number" id="nightRate" name="nightRate"><br>
            
            <input type="submit" value="제출">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary">저장</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 객실관리 모달 -->
  <div class="modal fade" id="roomManagementModal" tabindex="-1" role="dialog" aria-labelledby="roomManagementModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="roomManagementModalLabel">객실관리</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <h2>객실 정보 입력</h2>
          <form action="/insertRoom" method="POST" id="roomForm">
            <label for="roomId">객실 ID:</label><br>
            <input type="text" id="roomId" name="roomId"><br>
            
            <label for="roomTypeId">객실타입 ID:</label><br>
            <input type="text" id="roomTypeId" name="roomTypeId"><br>
            
            <label for="roomNumber">객실 번호:</label><br>
            <input type="text" id="roomNumber" name="roomNumber"><br>
            
            <input type="submit" value="제출">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary">저장</button>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 보유 객실타입 표시 -->
  <div>
    <h2>보유 객실타입</h2>
    <table class="table">
      <thead>
        <tr>
          <th>객실타입 ID</th>
          <th>호텔 ID</th>
          <th>객실 이름</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${roomTypes}" var="roomType">
          <tr>
            <td>${roomType.roomTypeId}</td>
            <td>${roomType.hotelId}</td>
            <td>${roomType.roomName}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <!-- 객실 조회 -->
  <div>
    <h2>객실 조회</h2>
    <label for="roomTypeSelect">객실타입 선택:</label>
    <select id="roomTypeSelect">
      <c:forEach items="${roomTypes}" var="roomType">
        <option value="${roomType.roomTypeId}">${roomType.roomName}</option>
      </c:forEach>
    </select>
    <button type="button" onclick="getRooms()">조회</button>

    <table class="table" id="roomTable" style="display: none;">
      <thead>
        <tr>
          <th>객실 ID</th>
          <th>객실타입 ID</th>
          <th>객실 번호</th>
        </tr>
      </thead>
      <tbody id="roomTableBody">
      </tbody>
    </table>
  </div>
  
  
  <!-- 삭제 모달 -->
  <div class="modal fade" id="deletePlaceModal" tabindex="-1" role="dialog" aria-labelledby="deletePlaceModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="deletePlaceModalLabel">업장 삭제</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>업장을 삭제하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
          <button type="button" class="btn btn-danger">삭제</button>
        </div>
      </div>
    </div>
  </div>
  

  <button type="button" class="btn btn-danger delete-button">
  업장 삭제
</button>
  
  


<!-- jQuery 라이브러리 -->

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script>
  
  $(document).ready(function() {
      $(".delete-button").click(function() {
        $("#deletePlaceModal").modal("show");
      });
    });
  function getRooms() {
      var roomTypeId = document.getElementById("roomTypeSelect").value;
      // AJAX 요청을 통해 서버에 해당 객실타입에 속하는 객실들을 조회하는 로직 작성
      // 결과를 받아와서 아래 코드로 객실 목록을 표시
      var rooms = []; // 받아온 객실 데이터 배열 예시
      // 예시 데이터로 객실 목록 표시
      var roomTableBody = document.getElementById("roomTableBody");
      roomTableBody.innerHTML = "";
      for (var i = 0; i < rooms.length; i++) {
        var room = rooms[i];
        var row = document.createElement("tr");
        row.innerHTML = "<td>" + room.roomId + "</td><td>" + room.roomTypeId + "</td><td>" + room.roomNumber + "</td>";
        roomTableBody.appendChild(row);
      }
      document.getElementById("roomTable").style.display = "table";
    }
    function sample6_execDaumPostcode() {
      new daum.Postcode({
        oncomplete: function(data) {
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수

          if (data.userSelectedType === 'R') {
            addr = data.roadAddress;
          } else {
            addr = data.jibunAddress;
          }

          if (data.userSelectedType === 'R') {
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
              extraAddr += data.bname;
            }
            if (data.buildingName !== '' && data.apartment === 'Y') {
              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            if (extraAddr !== '') {
              extraAddr = ' (' + extraAddr + ')';
            }
            document.getElementById("paddress2").value = extraAddr;
          } else {
            document.getElementById("paddress2").value = '';
          }

          document.getElementById('pzip_code').value = data.zonecode;
          document.getElementById("paddress1").value = addr;
          document.getElementById("paddress2").focus();
        }
      }).open();
      return false;
      
      // 새로운 객실타입 추가 함수
      function addRoomType() {
    	  var formData = new FormData($("#roomTypeForm")[0]);

        $.ajax({
          url: "/insertRoomType",
          type: "POST",
          data: formData,
          processData: false,
          contentType: false,
          success: function(response) {
            var roomType = response.roomType;
            var roomTypeSelect = document.getElementById("roomTypeSelect");
            var option = document.createElement("option");
            option.value = roomType.roomTypeId;
            option.text = roomType.roomName;
            roomTypeSelect.appendChild(option);
          },
          error: function(error) {
            console.log("Error:", error);
          }
        });
      }
    }
    
    
$(document)
.on('click','#updatePlace',function(){
	
	
	// ajax 로 정보수정.
	
	// 비우기
	$('#pname').val(null);
	$('#ptype option').prop('selected',false);
	$('#pzip_code').val(null);
	$('#paddress1').val(null);
	$('#paddress2').val(null);
	
	$('#pcheckin').val(null);
	$('#pcheckout').val(null);
	
	$('#pguide').val(null);
	$('input[name=environments]').prop('checked',false);
	$('input[name=pfeatures]').prop('checked',false);
	
	
	// 채우기
	place_seq = $('#place_seq').val();
	
	$.ajax({url:'/getPlaceInfo', type:'post', dataType:'json', 
		
		data:{place_seq:place_seq},
		success:function(data){
		
			data.name;
			data.type_seq;
			data.address;
			data.mobile;
			data.checkin;
			data.checkout;
			data.guide;
			data.environments;
			data.options;
			
			$('#pname').val(data.name);
			for(i=0;i<$('#ptype option').length;i++){
				option_value = $('#ptype option:eq('+i+')').val();
				if(option_value==data.type_seq){
					$('#ptype option:eq('+i+')').prop('selected',true);
					break;
				}
			}
			console.log(data.address)
			addressElements = data.address.split(",");
			$('#pzip_code').val(addressElements[0]);
			$('#paddress1').val(addressElements[1]);
			$('#paddress2').val(addressElements[2]);
			
			$('#pmobile').val(data.mobile);
			
			$('#pcheckin').val(data.checkin);
			$('#pcheckout').val(data.checkout);
			$('#pguide').val(data.guide);
			
			
			
			if(data.environments==null){
				console.log('place_envrionment 없음.')
			} else {
				evElements = data.environments.split(",");
				for(i=0;i<$('input[name=environments]').length;i++){
					evSeq = $('input[name=environments]:eq('+i+')').val();
					if( evElements.includes(evSeq)  ){
						$('input[name=environments]:eq('+i+')').prop('checked',true);
					}
				}
			}
			if(data.options==null){
			} else {
				optionElements = data.options.split(",");
				for(i=0;i<$('input[name=pfeatures]').length;i++){
					option_seq = $('input[name=pfeatures]:eq('+i+')').val();
					if( optionElements.includes(option_seq)  ){
						$('input[name=pfeatures]:eq('+i+')').prop('checked',true);
					}
				}
			}
			
		}
	
	})
	
	
	
	
})



.on('click','#btnsubmit',function(){
	
	var pzip_code = $('#pzip_code').val();
	var paddress1 = $('#paddress1').val();
	var paddress2 = $('#paddress2').val();
	var paddress = pzip_code +','+paddress1+','+paddress2;
	
	
	 var checkEnv = []; // 주변환경 체크박스 인서트
	  $("input[name='environments']:checked").each(function() {
		  checkEnv.push($(this).val());
	    });
	 
	  var checkOpt = [];
	   $("input[name='pfeatures']:checked").each(function() {
		   checkOpt.push($(this).val());
	    });
	  
	
	// 배열로 만들어서 값을  컨트롤러에서 values처리를 해서 넣어줌.  
	
	
	$.ajax({
		url:'/updateMyplace',
		type:'post',
		dataType:'json', 
        data:{
        	  place_seq:$('#place_seq').val(),
        	  pname:$('#pname').val(),
        	  ptype:$('#ptype').val(),
        	  paddress:paddress,
        	  pmobile:$('#pmobile').val(),
        	  pcheckin:$('#pcheckin').val(),
			  pcheckout:$('#pcheckout').val(),
			  pguide:$('#pguide').val(),
			  checkEnv:checkEnv,
			  checkOpt:checkOpt
			  // 사진 수정 기능 필요 
			  },
              
              success:function(data){
                  
                  
                  if(data=="ok") {
                 	 
 					  
                  } else {	
                 	 
 		               alert(data);
                  }
                  
                
          }
              
	});
	
	
})
  
 document.getElementById('pcheckin').onclick = function(){
	a= $(this).val();
	console.log(a);
}
    
    
  </script>
</body>
</html>
