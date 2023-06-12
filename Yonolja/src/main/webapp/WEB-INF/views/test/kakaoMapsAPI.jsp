<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<title>kakaomapsAPI 다루기</title>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9205057ff16b5c3fa0c0df924cbb7156&libraries=services"></script>
</head>
<style>
#map{
	
	width:300px;
	height:300px;
}
</style>
<body>


<div id="map"></div>
<button id=setMap>setMap</button>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

/* 		이거는 customer overlay 를 지도에 더하는 방법

	var position = new kakao.maps.LatLng(33.450701, 126.570667);  
	var customOverlay = new kakao.maps.CustomOverlay({
		position:position,
		content:'<button>바보</button>'
	})
	customOverlay.setMap(map);
*/




/*		이거는 주소를 불러와서 좌표로 변환하는방법

	// geocoder 객체를 생성해서
	var geocoder = new kakao.maps.services.Geocoder();
	
	// geocoder 객체내의 method 로 좌표를 알아내고,
	geocoder.addressSearch('천안시 서북구 두정동 부성1길82', function(result,status){
		// 주소가 성공적으로 좌표로 변환되면,
		if(status === kakao.maps.services.Status.OK){
			
			// 좌표 data를  coords 라는 변수에 담고,
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			// 그 좌표에 해당하는 customOverlay 를 만든다음에,
			var customOverlay = new kakao.maps.CustomOverlay({
				
				position:coords,
				content:'<button>여기다 여기</button>'
				
			})
			
			customOverlay.setMap(map); // customOverlay 를 지도에 찍음
			
		} else {
			
			console.log('fail')
			
		}
	})
	
*/	
	

// 이거는 배열의 모든 좌표들이 보이도록 지도의 범위를 재설정하는것
var points = [
	
	new kakao.maps.LatLng(33.452278, 126.567803),
    new kakao.maps.LatLng(33.452671, 126.574792),
    new kakao.maps.LatLng(33.451744, 126.572441)
	
]

	
// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체 생성
var bounds = new kakao.maps.LatLngBounds();
	

for(i=0;i<points.length;i++){
	bounds.extend(points[i]);
}

// map.setBounds(bounds);
$('#setMap').click(function(){
	map.setBounds(bounds);
})



/*
 
 순서 : 
	 
	 1. 지도를 갱신해서 만듬.					 v
 	 2. ajax 를 통해 받아온 주소들을 좌표로 변환함. v
 	 3. 좌표를 가지고 마커(또는 커스텀 오버레이)를 생성 v 
 	 4. 생긴 마커(커스텀 오버레이)들을 따라서 지도의 범위를 정함. 

 */


</script>
</html>