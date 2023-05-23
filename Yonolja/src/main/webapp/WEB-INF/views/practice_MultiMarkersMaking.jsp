<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지역별 숙박업소들 표시하기(다중)</title>
    
</head>
<style>
#map{border:1px solid black}
</style>
<body>

<div id="map" style="width:400px;height:400px;"></div>
<button id=move>move1</button>
<button id=move2>move2</button>
</body>
<!-- 아래써진 스크립트 진짜 중요하니깐 꼭 keep 하기. -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9205057ff16b5c3fa0c0df924cbb7156&libraries=services"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>


	// 그냥 있던거 + for문 돌려야할듯 ㅋ
$(document)
.ready(function(){
	
	// 지도생성(지도를 표시할 div tag가 있어야 함)
	var mapBox = document.getElementById('map'),
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),	// 지도 중심좌표 
			level:3
	};
	
	var map = new kakao.maps.Map(mapBox, mapOption); // 지도그리기 
	

	let address = [
		{name:'옛날집',address:'부성1길82'},
		{name:'우리집',address:'부성4길20'},
		{name:'추억의집',address:'백석동43-15'}
	]	// 이렇게 객체로 생성해서 for Each 문 돌리면 됨.
	
	var geocoder = new kakao.maps.services.Geocoder();
	
	// for문으려고 하려고했는데, 
	// geocorder.addressSearch 함수안에 addresses 의 element 가 스코프상 안들어가는듯. 
	// forEach 로 파라미터로 받아서 해야하나봄.
	// ㅎㅎ 그래서 let 으로 선언해서 스코프 뚫음.
	var bounds = new kakao.maps.LatLngBounds();
	
	for(i=0;i<address.length;i++){

		let name =  address[i].name;
		geocoder.addressSearch( address[i].address , function(result, status){
	
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
				
	//	     map.setCenter(coords);	 // 이거 없어두됨. 담을줄알면.
			 setBounds();
			
		})
	}	

	function setBounds(){
		map.setBounds(bounds);
	}
	
	
	
	
	
	
	// 그 다음에는 지도범위를 마커에 맞게 설정하는거.
	
	
	
	
	
/*
	function move1(){
		// LatLng 는 coordinate 같은거임. Latitude(위도), Longitude(경도) 의 약자임.
		var newCoordinate = new kakao.maps.LatLng(33.452613, 126.570888);
		map.setCenter(newCoordinate)
	}
	
	function move2(){
		var newCoordinate = new kakao.maps.LatLng(33.450701, 126.570667);
		map.panTo(newCoordinate);
	}
	
	
	let move_normal = document.getElementById('move');
	move_normal.addEventListener('click',function(){ move1() })
	
	let move_smooth = document.getElementById('move2');
	move_smooth.addEventListener('click',function(){ move2() })
*/	
	
})
	
	
	



</script>
</html>