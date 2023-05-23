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
</style>
<body>
<table>
<tr><td>숙박업소이름</td> <td> <input id=name type=text> </td> </tr>
<tr><td>숙박업소주소</td> <td> <input id=address type=text> </td> </tr><tr>
<tr><td></td> <td><button id=register>등록하기</button></td> </tr>
<tr><td></td> <td><button id=search>검색하기</button></td> </tr>
<tr><td>현재까지 등록된 내역</td> <td id=places></td> </tr>
</table>
<hr>
<div id="map" style="width:400px;height:400px;"></div>

</body>
<!-- 아래써진 스크립트 진짜 중요하니깐 꼭 keep 하기. -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9205057ff16b5c3fa0c0df924cbb7156&libraries=services"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>


//////////////////////////////////////// map related codes //////////////////////////////////////

	var mapBox = document.getElementById('map'),
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),	// 지도 중심좌표 
			level:3
	};
	
	var map = new kakao.maps.Map(mapBox, mapOption); // 지도그리기 
	
	var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표변환객체
	
	var bounds = new kakao.maps.LatLngBounds();	// 지도 재설정할 범위를 가지는 객체인 LatLngBounds 객체 

	function setBounds(){
		map.setBounds(bounds);
	}


	let places = [];

	
	
	
	
///////////////////////////////////////////////////////////////////////////////////////////////

$(document)
.on('click','#register',function(){
	info = {name:$('#name').val(), address:$('#address').val()}
	places.push(info);
	
	str = '';
	for(i=0;i<places.length;i++){
		str = str + " [" + places[i].name + "," + places[i].address+"]"; 
	}
	
	$('#places').text(str);
	console.log(places)
})
.on('click','#search',function(){
	
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
    address varchar2(60)

);
create sequence business_id_seq;
alter table hotelz modify address varchar2(4000);
commit;

했음


*/
</script>
</html>