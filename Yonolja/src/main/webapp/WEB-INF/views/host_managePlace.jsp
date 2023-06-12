<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
	
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

  <!-- 업장정보 수정 버튼 -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modifyBusinessModal" id="updatePlace">
    업장정보 수정
  </button>

  <!-- 객실타입 버튼 -->
  <button type="button" id="btnRoomtype"class="btn btn-primary" data-toggle="modal" data-target="#roomTypeModal">
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
        
            <input type="text" id="place_seq" value="${place_seq}" readonly>
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
          <form action="${roomType != null && roomType.roomtype_seq != '' ? '/modifyRoomtype' : '/insertRoomType'}" method="POST" id="roomTypeForm" enctype="multipart/form-data">
    <input type="hidden" id="place_seq" name="place_seq" value="${place_seq}" readonly>
    <label for="roomtype_seq">객실 타입 번호:</label><br>
    <input type="text" id="roomtype_seq" name="roomtype_seq" value="${roomType != null && roomType.roomtype_seq != '' ? roomType.roomtype_seq : ''}" readonly><br>
            
            <label for="roomName">객실 이름:</label><br>
            <input type="text" id="roomtype_name" name="roomtype_name"><br>
            
            <label for="roomImage">객실 사진:</label><br>
            <input type="file" id="roomtype_imgs" name="roomtype_imgs" accept="image/*" multiple><br>
            
            <label for="maxCapacity">객실 최대 숙박 인원:</label><br>
            <input type="number" id="roomtype_capacity" name="roomtype_capacity"><br>
            
            <label for="nightRate">1박 금액:</label><br>
            <input type="number" id="roomtype_price" name="roomtype_price"><br>
            
<!--             <label for="amenities">객실편의시설:</label><br> -->
<!--             <textarea id="roomtype_options" name="roomtype_options"></textarea><br> -->
            
            <label for="roomGuide">객실 설명:</label><br>
            <textarea id="roomtype_guide" name="roomtype_guide"></textarea><br>
            
            <input type="submit" value="제출">
       
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-danger" id="btnDelete">삭제</button> <!-- 삭제 버튼 추가 -->
        </div>
      </div>
    </div>
  </div>

  <!-- 객실관리 모달 -->
  <div class="modal fade" id="roomManagementModal" tabindex="-1" role="dialog" aria-labelledby="roomManagementModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="manageRoom">객실관리</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <h2>객실 정보 입력</h2>
          <form action="/addRoom" method="POST" id="roomForm">
         
            <input type="hidden" id="place_seq" name="place_seq" value="${place_seq}" readonly>
            <label for="roomTypeId">객실타입 이름:</label><br>
          <select id="roomTypeId" name="roomTypeId">
            <c:forEach items="${roomTypes}" var="roomType" >
            <option value="${roomType.roomtype_seq}">"${roomType.roomtype_name}"</option>
           </c:forEach>
          </select><br>

            
            <label for="roomNumber">객실 번호:</label><br>
            <input type="text" id="roomNumber" name="roomNumber"><br>
            
            <input type="submit" value="제출">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
    
        </div>
      </div>
    </div>
  </div>
  
  <!-- 보유 객실타입 표시 -->
  <div>
    <h2>보유 객실타입</h2>
    <table id = "tblRoomtype" class="table">
      <thead>
        <tr>
          <th>객실타입 번호</th>
          <th>객실타입 이름</th>
          <th>객실타입 사진</th>
          <th>객실 최대인원 </th>
          <th>객실 1박금액 </th>
          <th>객실 타입옵션 </th>
          <th>객실 안내문 </th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${roomTypes}" var="roomType" >
          <tr>
          	<td>${roomType.roomtype_seq}</td>
            <td>${roomType.roomtype_name}</td>
             <td>
       			 <c:forEach items="${roomType.roomtype_imgs.split(',')}" var="image">
          		 <img src="${image}" alt="객실타입 이미지" style="max-width: 100%; height: 100px;">
        		</c:forEach>
      		</td>
            <td>${roomType. roomtype_capacity}</td>
            <td>${roomType.roomtype_price}</td>
            <td>${roomType.roomtype_options}</td>
            <td>${roomType.roomtype_guide}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <!-- 객실 조회 -->
  <div>
    <h2>객실 조회</h2>
     <form id="roomForm">
    	<label for="roomTypeSelect">객실타입 선택:</label>
    	<input type="hidden" id="place_seq" name="place_seq" value="${place_seq}" readonly>
   			 <select id="showRoomtype" name="roomTypeNum">
           		 <c:forEach items="${roomTypes}" var="roomType" >
            	 <option value="${roomType.roomtype_seq}">"${roomType.roomtype_name}"</option>
          		 </c:forEach>
          	 </select><br>
        <input type="button" id="fetchRoomsButton" value="조회">
   	 </form>

    <table class="table" id="roomTable" style="display: block;">
    
      <thead>
        <tr>
          <th></th> <!-- 체크박스를 위한 새로운 열 -->
          <th>객실타입 이름</th>
          <th>객실 번호</th>
        </tr>
      </thead>
      <tbody id="roomTableBody">
      </tbody>
    </table>
    <input type="button" id="btnDeleteRoom" value="선택한 객실 삭제">
    
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
  

  <button type="button" id="btnDeletePlace" class="btn btn-danger delete-button">
  업장 삭제
</button>
  
  


<!-- jQuery 라이브러리 -->

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script>
  
 
      
    
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


	///////////////////////place info 수정 part/////////////////
	
  $(document).on('click', '#btnsubmit', function() {
    var pzip_code = $('#pzip_code').val();
    var paddress1 = $('#paddress1').val();
    var paddress2 = $('#paddress2').val();
    var paddress = pzip_code + ',' + paddress1 + ',' + paddress2;

    var checkEnv = []; // 주변환경 체크박스 인서트
    $("input[name='environments']:checked").each(function() {
      checkEnv.push($(this).val());
    });
    console.log(checkEnv);

    var checkOpt = [];
    $("input[name='pfeatures']:checked").each(function() {
      checkOpt.push($(this).val());
    });

    console.log(checkOpt);
    console.log($('#pcheckin').val());
    console.log($('#pcheckout').val());
    console.log($('#pguide').val());



var checkEnv = '';
$("input[name='environments']:checked").each(function(index) {
  if (index === 0) {
    checkEnv += $(this).val();
  } else {
    checkEnv += "," + $(this).val();
  }
});


    checkOpt = '';
    for (i = 0; i < $("input[name=pfeatures]:checked").length; i++) {
      if (i == 0) {
        checkOpt += $("input[name=pfeatures]:checked:eq(" + i + ")").val();
      } else {
        checkOpt += "," +
          $("input[name=pfeatures]:checked:eq(" + i + ")").val();
      }
    }

    $.ajax({
      url: '/modifyPlace',
      type: 'post',
      dataType: 'text',
      data: {
        place_seq: $('#place_seq').val(),
        pname: $('#pname').val(),
        ptype: $('#ptype').val(),
        paddress: paddress,
        pmobile: $('#pmobile').val(),
        pcheckin: $('#pcheckin').val(),
        pcheckout: $('#pcheckout').val(),
        pguide: $('#pguide').val(),
        checkEnv: checkEnv,
        checkOpt: checkOpt
        // 사진 수정 기능 필요 
      },
      success: function(data) {
        if (data == "ok") {
        	 window.location.href = "/mypage"; // 성공했을 때 mypage.jsp로 이동
        } else {
          alert(data);
        }
      }
    });
  });



/////////////// 기존 객실타입 수정 /////////////////


$(document)
.on('click','#btnRoomtype',function(){//객실타입 비우기
	
	$("#roomtype_seq").val(null);	
    $("#roomtype_name").val(null);
    $("#roomtype_capacity").val(null);
    $("#roomtype_price").val(null);
    $("#roomtype_guide").val(null);
    $("input[type=submit]").val("제출");
   
})
	
   
  $(document).ready(function() {
    $("#tblRoomtype tbody > tr").click(function() {  // 테이블의 행을 클릭하면
      var roomtype_seq = $(this).find("td:eq(0)").text();  // 첫번째 열의 값 (객실타입 ID)을 가져옵니다
      var roomtype_name = $(this).find("td:eq(1)").text(); // 두번째 열의 값 (객실타입 이름)을 가져옵니다
      var roomtype_img = $(this).find("td:eq(2)").text();
      var roomtype_capacity = $(this).find("td:eq(3)").text();
      var roomtype_price = $(this).find("td:eq(4)").text();
      var roomtype_option = $(this).find("td:eq(5)").text();
      var roomtype_guide = $(this).find("td:eq(6)").text();
      
      console.log(roomtype_seq);
  
      
      // 모달의 객실타입 이름 필드에 값을 채웁니다
      
      $("#roomtype_seq").val(roomtype_seq);
      $("#roomtype_name").val(roomtype_name);
      $("#roomtype_capacity").val(roomtype_capacity);
      $("#roomtype_price").val(roomtype_price);
      $("#roomtype_guide").val(roomtype_guide);
      
      // input type submit value를 수정으로 바꿉니다.
      $("input[type=submit]").val("수정");
      
      var actionUrl = roomtype_seq !== '' ? '/modifyRoomtype' : '/insertRoomType';
      $("#roomTypeForm").attr("action", actionUrl);

      $("#roomTypeModal").modal("show");  // 모달을 엽니다
    });
  });
  
  
  /////////////////// 객실타입 개별 삭제 part//////////////
  $(document).ready(function() {
  $("#btnDelete").click(function() {
    
	  var roomtype_seq = $("#roomtype_seq").val(); // 삭제할 객실 타입의 번호
	  var place_seq = $("#place_seq").val(); // 업장 번호
	  
    if (confirm("정말로 삭제하시겠습니까?")) {
      $.ajax({
        url: "/deleteRoomtype",
        type: "POST",
        data: { roomtype_seq: roomtype_seq,
        	  place_seq: place_seq},
        success: function(result) {
          // 삭제 성공 시 필요한 처리를 수행합니다.
          // 예를 들어, 삭제 후에 모달을 닫거나 다른 동작을 수행할 수 있습니다.
          $("#roomTypeModal").modal("hide");
          location.reload(); // 페이지 새로고침
          // 추가적인 처리가 필요한 경우에는 이 부분을 수정해주세요.
        },
        error: function(xhr, status, error) {
          // 삭제 실패 시 필요한 처리를 수행합니다.
          // 예를 들어, 오류 메시지를 표시하거나 알림을 띄울 수 있습니다.
          alert("객실 타입 삭제 실패: " + error);
        }
      });
    }
  });
});

  // 객실타입당 해당하는 Room 조회 
$(document).ready(function() {
    $("#fetchRoomsButton").click(function(e) {
        var roomTypeNum = $("#showRoomtype").val(); // Get the selected room type number

        $("#roomTableBody").empty(); // Clear the table body

        $.ajax({
            url: "/showRooms",
            type: "POST",
            data: {
                roomTypeNum: roomTypeNum
            },
            success: function(data) {
                var rooms = JSON.parse(data);
                for(var i = 0; i < rooms.length; i++) {
                    var row = $("<tr>");
                    row.append($("<td>").html('<input type="checkbox" class="room-checkbox" />')); // 체크박스 추가
                    row.append($("<td>").text(rooms[i].roomtype_name));
                    row.append($("<td>").text(rooms[i].room_number));
                    $("#roomTableBody").append(row);
                }
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
})

///////////// 선택한 객실만 삭제 코드 ///////////


  
function fetchRooms() {
    var roomTypeNum = $("#showRoomtype").val(); // 객실타입 선택값 가져오기

    $.ajax({
        url: '/fetchRooms',
        type: 'GET',
        data: {
            roomTypeNum: roomTypeNum,
            placeSeq: $("#place_seq").val()
        },
        success: function(rooms) {
            // 받아온 rooms로 테이블 채우는 로직 (이전 테이블 내용은 삭제)
            // 예를 들어, 이렇게 할 수 있습니다.
            var tableBody = $("#roomTableBody");
            tableBody.empty(); // 이전 내용 삭제
            rooms.forEach(function(room) {
                // 각 room을 테이블에 추가
                var row = "<tr><td>" + room.roomNumber + "</td><td>" + room.roomTypeName + "</td></tr>";
                tableBody.append(row);
            });
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.error('서버와의 통신 오류: ' + textStatus, errorThrown);
        }
    });
}

$(document).ready(function() {
    $("#fetchRoomsButton").click(fetchRooms);

    $("#btnDeleteRoom").click(function() {
        var placeSeq = $("#place_seq").val(); // hidden input에서 place_seq 가져오기

        $(".room-checkbox:checked").each(function() {
            var row = $(this).closest("tr");
            // 삭제할 객실 정보 가져오기

            var roomNumber = row.find("td:eq(2)").text();
            console.log(roomNumber);

            // 서버에 AJAX 요청으로 객실 삭제하기
            $.ajax({
                url: '/deleteRoomNum', // 객실을 삭제하기 위한 엔드포인트
                type: 'POST',
                data: {
                    roomNumber: roomNumber,
                    placeSeq: placeSeq // place_seq를 서버에 보내기
                },
                success: function(response) {
                    // 서버가 성공적으로 응답하면, 테이블에서 객실을 삭제하고 객실 목록을 다시 불러옵니다
                    if(response.status == 'success') {
                        row.remove();
                        fetchRooms(); // 객실 삭제 후 객실 목록 다시 불러오기
                    } else {
                        // 서버에서 반환된 오류를 처리합니다
                        console.error('객실 삭제 오류: ' + response.message);
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    // 서버와의 통신 중 발생하는 오류를 처리합니다
                    console.error('서버와의 통신 오류: ' + textStatus, errorThrown);
                }
            });
        });
    });
});

////////////////// 객실 insert시 동일한 객실번호 추가방지 /////////////
$(document).ready(function() {
    $('#roomForm').on('submit', function(event) {
        event.preventDefault(); // 원래의 submit 동작을 막습니다.
        var roomTypeId = $('#roomTypeId').val();
        var roomNumber = $('#roomNumber').val();

        // 서버에 AJAX 요청으로 객실 존재 확인하기
        $.ajax({
            url: '/checkRoomExists', 
            type: 'GET',
            data: {
                roomTypeId: roomTypeId,
                roomNumber: roomNumber
            },
            success: function(response) {
                // 서버가 성공적으로 응답하면, 객실이 존재하는지 확인합니다
                if(response.exists) {
                    // 객실이 이미 존재하면 알림을 보여줍니다
                    alert('같은 객실타입에 해당 객실번호가 이미 존재합니다.');
                } else {
                    // 객실이 존재하지 않으면 폼을 제출합니다
                    $('#roomForm').off('submit').submit();
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                // 서버와의 통신 중 발생하는 오류를 처리합니다
                console.error('서버와의 통신 오류: ' + textStatus, errorThrown);
            }
        });
    });
});
////////////place Delete////////////////////////////////

$(document).ready(function() {
    $("#btnDeletePlace").click(function(){
        var url = window.location.pathname;
        var placeSeq = url.substring(url.lastIndexOf('/') + 1);

        // 사용자에게 삭제를 진행할 것인지 확인합니다.
        var isConfirm = confirm("정말로 삭제하시겠습니까?");

        // 사용자가 '확인'을 눌렀을 때만 삭제 요청을 보냅니다.
        if(isConfirm) {
            $.ajax({
                url: "/deletePlace/" + placeSeq,
                type: 'DELETE',
                success: function(result) {
                    // 삭제가 성공적으로 처리된 후, 페이지를 /mypage로 리디렉트합니다.
                    window.location.href = "/mypage";
                }
            });
        }
    });
});


	
	


    
    
    
 </script>
</body>
</html>
