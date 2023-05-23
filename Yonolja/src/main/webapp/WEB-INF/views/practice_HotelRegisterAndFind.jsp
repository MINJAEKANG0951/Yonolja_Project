<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title> 숙박업소 등록과 검색 </title>
    
</head>
<style>
#map{border:1px solid black}
#business_list{black;border-collapse:collapse;}
#business_list thead {border-bottom:1px solid black}
#business_list thead th{min-width:120px;text-align:left}
#keyword{width:200px;}
.co{
background-color:purple;
border-radius:10% 10% 10% 10%;
border:2px solid black;
cursor:pointer;
}
.co:hover{
background-color:skyblue;
}
.co a{color:white}
</style>
<body>
<div id="map" style="width:600px;height:600px;"></div> <br>
<input type=text id=keyword placeholder="키워드검색(주소,호텔이름 등)"> &nbsp; <button id=search>검색</button>
<hr>

<h2>호텔정보</h2>
<input type=text id=business_name placeholder="사업장 이름"><br>
<input type=text id=business_owner placeholder="사업주 이름"><br>
<input type=text id=business_type placeholder="사업 유형">
<h2>호텔주소</h2>
<input type="text" name=postcode id="sample6_postcode" placeholder="우편번호" readonly>
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" readonly><br>
<input type="text" name=address id="sample6_address" placeholder="주소" readonly><br>
<input type="text" name=detailAddress id="sample6_detailAddress" placeholder="상세주소">
<br><br>

<button id=register>업장 등록하기</button> <button id=reset>지우기</button> <br><br>
<button id=showList>등록된 업장 리스트보기</button><br><br>

<table id=business_list>
	<thead> 
		<tr> 
			<th>비즈니스아이디</th> <th>비즈니스명</th> <th>사업주</th> <th>비즈니스유형</th> <th>주소</th> 
		</tr> 
	</thead>
	<tbody>
		
	</tbody>
</table>

</body>
<!-- 아래써진 스크립트 진짜 중요하니깐 꼭 keep 하기. -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9205057ff16b5c3fa0c0df924cbb7156&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>


//////////////////////////////////////// map related codes //////////////////////////////////////

	let mapBox = document.getElementById('map'),
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),	// 지도 중심좌표 
			level:3
	};
	
	let map = new kakao.maps.Map(mapBox, mapOption); // 지도그리기 
	
	let geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표변환객체
	
	let bounds = new kakao.maps.LatLngBounds();	// 지도 재설정할 범위를 가지는 객체인 LatLngBounds 객체 

	function setBounds(){
		map.setBounds(bounds);
	}

	let markers = [];
	let customOverlays = [];
	
	let places = [];
	
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////// 여기는 주소입력관련 codes ///////////////////////////////////////////


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
           
                } else {
                  
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

///////////////////////////////////////////////////////////////////////////////////////////////


$(document)
.ready(function(){
	$('#showList').trigger('click');
})
.on('click','#search_temp',function(){
	
	/*
	for(i=0;i<places.length;i++){

		let name =  places[i].name;
		geocoder.addressSearch( places[i].address , function(result, status){
	
			if(status===kakao.maps.services.Status.OK){
				 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				 var marker = new kakao.maps.Marker({
					 map:map, 
					 position:coords
				 });
				 
				 marker.setMap(map);
				 
				 bounds.extend(coords);
			}
			
			 var infowindow = new kakao.maps.InfoWindow({
		          content: '<div style="width:150px;text-align:center;padding:6px 0;"><a href="/여기다가 그 hotel_seq 넣으면될듯">' + name + '</a></div>'
		     });
		     infowindow.open(map, marker);
				
			 setBounds();
			
		})
	}	
	*/
	/*
	data.forEach(function(business){
		console.log(business);
		geocoder.addressSearch( business.address , function(result, status){
			
			if(status===kakao.maps.services.Status.OK){
				 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				 var marker = new kakao.maps.Marker({
					 map:map, 
					 position:coords
				 });
				 marker.setMap(map);
				 bounds.extend(coords);
			}
			
			 var infowindow = new kakao.maps.InfoWindow({
		          content: '<div style="width:150px;text-align:center;padding:6px 0;"><a href="/'+ business.id +'">' + business.name + '</a></div>'
		     });
		     infowindow.open(map, marker);
			 setBounds();
			
		})
		
	})
	*/	
	
	
	
	
	
	
	
})

.on('click','#register',function(){
	
	business_name = $('#business_name').val();
	business_owner = $('#business_owner').val();
	business_type = $('#business_type').val();
		postcode = $('#sample6_postcode').val();
		address = $('#sample6_address').val();
		address_detail = $('#sample6_detailAddress').val();
	
	business_address = postcode + "," + address + "," + address_detail
	
	
	$.ajax({url:'/addPlace', type:'post', 
		data:{ business_name:business_name, 
			   business_owner:business_owner, 
			   business_type:business_type,
			   business_address:business_address
			  },
		success:function(){
			console.log('a business has been added to the list');
		},
		complete:function(){
			$('#showList').trigger('click');
			$('#reset').trigger('click');
		}
	})
	
	
})


.on('click','#showList',function(){
	
	$('#business_list tbody').empty();
	
	$.ajax({url:'/getBusinesses', type:'post', dataType:'json',
		
		success:function(data){
			
			for(i=0;i<data.length;i++){
				id = data[i].business_id;
				name = data[i].business_name;
				owner = data[i].business_owner;
				type = data[i].business_type;
				address = data[i].business_address;
				
				
				str = '<tr>'
				str += '<td>' + id + '</td>'
				str += '<td>' + name + '</td>'
				str += '<td>' + owner + '</td>'
				str += '<td>' + type + '</td>'
				str += '<td>' + address + '</td><tr>';
				
				$('#business_list tbody').append(str);
			}
			
		}
		
	})
})

.on('click','#reset',function(){
	
	$('#business_name').val('');
	$('#business_owner').val('');
	$('#business_type').val('');
	$('#sample6_postcode').val('');
	$('#sample6_address').val('');
	$('#sample6_detailAddress').val('');
	
})

.on('click','#search',function(){
	
	
	// 기존의 bound 객체도 initialize 해야함.
	
	// 기존의 마커들 지우기(새 keyword 와 관련된 marker 들면 보여줘야 하니깐)
	// 그리고 기존의 infowindow 도 지워야하고,
	for(i=0;i<customOverlays.length;i++){
//		markers[i].setMap(null);
//   	infowindows[i].close();
		customOverlays[i].content = '<span style="display:none"></span>';
		customOverlays[i].setMap(null);
		
	} 
	markers = [];
	customOverlays = [];
	bounds = new kakao.maps.LatLngBounds();
	infowindows = [];
	
	
	
	keyword = $('#keyword').val();
	$.ajax({url:'/search', type:'post', dataType:'json',
		
		data:{keyword:keyword},
		success:function(data){
			
			data.forEach(function(business){
				console.log('비즈니스 : ' + business);
				geocoder.addressSearch( business.business_address , function(result, status){
					if(status===kakao.maps.services.Status.OK){
						 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				/*
						 var marker = new kakao.maps.Marker({
							 map:map, 
							 position:coords,
							 clickable:true
						 });
				
						 markers.push(marker);	// 마커를 배열에 추가
						 marker.setMap(map); 
				*/
						 bounds.extend(coords);
						 
					}

					/*
					 var infowindow = new kakao.maps.InfoWindow({
				          content: '<div style="width:150px;text-align:center;;"><a href="/'+ business.business_id +'">' + business.business_name + '</a></div>'
				     });
				     infowindow.open(map, marker);
				     infowindows.push(infowindow);
				    */ 
				     
					 setBounds();
					
					 var customOverlay = new kakao.maps.CustomOverlay({
						    position: coords,
						    content: '<span class=co><a href=/business/'+ business.business_id +'>' + business.business_name + '</a></span>'   
					}); // 굳이 마커 안만들고 customer overlay 로만 해두 될듯. 클릭하면 그 호텔사이트 드가지고
					 
					customOverlays.push(customOverlay)
					customOverlay.setMap(map);
					
				})
			})
			
		},
		complete:function(){
			
		}
		
	})
	

	$('#keyword').val('');
})

// 머 이름이야 부산호텔인데 서울에 있을수도 있긴 한데, 주소는 찐으로 할거니깐 키워드검색하면 
// 그걸 기준으로 db에서 주소에 포함되는 내용 찾고, 그 키워드를 주소에 가지고있는 숙박업소들만
// pagenation 해서 쫙 보여주면됨. 그리고 지도로도 보여주기도 가능함.

// 본인위치따는것도 할줄알면 근처호텔보여주기도 가능할듯.
// 다음API 로 주소 저장하고,  
// DB랑 함 해가지고 검색에따라서 다르게 표시하는거 해보쇼

/*


create table hotelz(

    business_id number,
    business_name varchar2(32),
    business_owner varchar2(32),
    business_type varchar2(32),
    address varchar2(4000)

);
create sequence business_id_seq;
commit;

했음


*/
</script>
</html>