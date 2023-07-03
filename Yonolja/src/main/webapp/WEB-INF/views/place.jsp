<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/css_place.css" type="text/css">
<title>place</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9205057ff16b5c3fa0c0df924cbb7156"></script>
</head>
<style>




</style>
<body>
<%@ include file ="./structure/header_placePage.jsp" %>

<input type=hidden id=place_seq value="${place_seq}" readonly>
<button id=upwards>^</button>
<section>
<div id=section>

	<div id=frame>
		
	</div>
	<div id=title>
		
	</div>
	<div id=optionBox>
	
	</div>
	
	<div id=tab-content>
		
		<input type=radio id=roomlist name=tab_radio>
		<input type=radio id=location name=tab_radio checked>
		<input type=radio id=guide name=tab_radio>
		<input type=radio id=reviews name=tab_radio>
		
		<div id=tabs>
			<label for=roomlist class=tab onclick="refreshRoomType()">객실목록</label>
			<label for=location class=tab id=location_tab>위치/교통</label>
			<label for=guide class=tab>안내/정책</label>
			<label for=reviews class=tab id=review_tab onclick="refreshReview()">후기</label>
		</div>
		
		<div id=content1 class=content>
			<div id=searchbar>
				<div><button id=when> 언제든지 </button></div> 
				<div><button id=howmanypeople> 인원추가 </button></div>
			</div>
			<div id=rooms>
			<!--  이 형식으로 넣으면 됨.
				<div class=room id=room_seq>
					<div>이미지슬라이드</div>
					<div>이름(객실타입이름)</div>
					<div>1박 가격</div>
				</div>
			-->
			</div>
		</div>
		
		<div id=content2 class=content>
			<h3>위치</h3>
			<div id="staticMap" style="width:300px;height:300px;border:1px solid black;"></div><br>
			<div id=address></div>
		</div>
		
		<div id=content3 class=content>
			<div id=place_guide>
				
			</div>
		</div>
		
		<div id=content4 class=content>
			<div id=reviewBox> 
				<div id=howmanyReviews></div>
				<div id=review_average></div>
				<div id=arrangeWays_selectBox>
					<select id=arrangeWays>
						<option value=" order by to_date(rv.review_date) desc">최근 작성순</option>
						<option value=" order by rv.review_star desc,to_date(rv.review_date) desc">별점 높은순</option>
						<option value=" order by rv.review_star,to_date(rv.review_date) desc">별점 낮은순</option>
					</select>
				</div>
				<div id=reviewlist>
					
				</div>
			</div>	
		</div>
	</div>
	<div id=footer>
		<div id=footerLogo>
			<img src="/img/website/footerLogo.png/">
		</div>
		<div id=terms><span>
			객실사진의 경우 객실별 대표사진으로 실제 배정받는 객실과 상이할 수 있습니다.
			(주)요놀자는 통신판매 중개자로서 통신판매의 당사자가 아니며 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.
			숙박업소는 법적으로 청소년 고용과 혼숙이 금지되어 있습니다. 따라서 청소년 혼숙으로 인한 입실거부는 정당하며, 이에 대한 법적 제재는 이용 당사자가 책임져야 합니다.
		</span></div>
	</div>
</div>
</section>


<div id=calendarModal_background>
	<div id=calendarModal>
		
		
	</div>
</div>

<div id=howmanypeopleModal_background>
	<div id=howmanypeopleModal>
		<table>
			<tr><td colspan=2><span id=howmanypeople_close>&times;&nbsp;</span></td></tr>
			<tr>
				<td>성인</td> 
				<td class=peopleNum>
					<button id=adnumMinus>-</button>
					<span id=adultNum>1</span>
					<button id=adnumPlus>+</button>
				</td>
			</tr>
			<tr>
				<td>아동</td> 
				<td class=peopleNum>
					<button id=chnumMinus>-</button>
					<span id=childNum>0</span>
					<button id=chnumPlus>+</button>
				</td>
			</tr>
		</table>
		
		<div id=howmanypeople_buttons>
			<button id=howmanypeople_decide> 확인 </button>
			<button id=howmanypeople_reset> 다시설정 </button>
		</div>
	</div>
</div>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="/js/frameMaker.js"></script>
<script type="text/javascript" src="/js/calendarMaker2.js"></script>
<script>

//////////////////////////////global variables ///////////////////////////////////////////

let checkin = null;
let checkout = null;
let howmanyAdults = 1;
let howmanyChildren = 0;
let pureAddress = null;

let review_pageNum = 1;
let review_flag = true;
let roomtype_pageNum = 1;
let roomtype_flag = true;

///////////////////////////////////// cookie ////////////////////////////////////////////////////

document.cookie = "checkin= ; path=/place; expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "checkout= ; path=/place;expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "howmanyChildren= ; path=/place;expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "howmanyAdults= ; path=/place;expires=Tue, 19 Jan 2000 03:14:07 GMT;"



console.log(document.cookie)

cookies = document.cookie.split("; ")

for(ck=0;ck<cookies.length;ck++){
	cookie = cookies[ck];
	
	if(cookie.includes('=')){
	
		key = cookie.split("=")[0]; 
		value = cookie.split("=")[1]; 
		
		if(key==='howmanyAdults' && value!=""){ 
			howmanyAdults = parseInt(value); 
			$('#adultNum').text(howmanyAdults);
		}
		else if(key==='howmanyChildren' && value!=""){ 
			howmanyChildren = parseInt(value); 
			$('#childNum').text(howmanyChildren);
		}
		else if(key==='checkin' && value!=""){ checkin=value; console.log(checkin); }
		else if(key==='checkout' && value!=""){ checkout=value; console.log(checkout); }
		
	} 
}

document.cookie = "checkin= ; path=/; expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "checkout= ; path=/;expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "howmanyChildren= ; path=/;expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "howmanyAdults= ; path=/;expires=Tue, 19 Jan 2000 03:14:07 GMT;"

/////////////////////////////////  js, jquery  //////////////////////////////////////////////


// modal code 

document.addEventListener('click',function(event){
	if(event.target.id==='calendarModal_background'){
		$('#calendarModal_background').css('display','none');
	} else if(event.target.id==='howmanypeopleModal_background'){
		$('#howmanypeopleModal_background').css('display','none');
	}
})
document.addEventListener('scroll',function(event){
	$('#calendarModal_background').css('display','none');
	$('#howmanypeopleModal_background').css('display','none');
})




// modal 에 calendar 넣기

calendar = calendarMaker();
if(checkin!=null && checkout!=null){
	calendar.checkin_selected = checkin;
	calendar.checkout_selected = checkout;
	
	calendar.calendar_year = checkout.split(".")[0];
	calendar.calendar_month = checkout.split(".")[1];
	
}
tag = calendar.getTag();
css = calendar.getCss();
$('body').append(css);
$('#calendarModal').append(tag);
calendar.fillCalendar();
calendar.setFinishCode(  decideButtonFinishCode );
calendar.setCloseCode( calendarModalClose );


////////////////////////////////// jquery //////////////////////////////////////////////////

$(document)
.ready(function(){
	loadPage();
	loadAlloptions();
	loadRoomTypes();	
//	loadPlaceReviews()
})
.on('click','#when',function(){
	$('#calendarModal_background').css('display','block');
})
.on('click','#howmanypeople',function(){
	$('#howmanypeopleModal_background').css('display','block');
})
.on('click','#howmanypeople_close',function(){
	$('#howmanypeopleModal_background').css('display','none');
})
.on('click','#adnumMinus',function(){
	adnum = parseInt( $('#adultNum').text() );
	if((adnum-1)<=0){return false;}
	$('#adultNum').text( (adnum-1) );
})
.on('click','#adnumPlus',function(){
	adnum = parseInt( $('#adultNum').text() );
	$('#adultNum').text( (adnum+1) );
})
.on('click','#chnumMinus',function(){
	chnum = parseInt( $('#childNum').text() );
	if((chnum-1)<0){return false;}
	$('#childNum').text( (chnum-1) );
})
.on('click','#chnumPlus',function(){
	chnum = parseInt( $('#childNum').text() );
	$('#childNum').text( (chnum+1) );
})
.on('click','#howmanypeople_decide', function(){
	howmanyAdults = parseInt( $('#adultNum').text() );
	howmanyChildren = parseInt( $('#childNum').text() );
	$('#howmanypeopleModal_background').css('display','none');
	
	refreshRoomType();	
})
.on('click','#howmanypeople_reset', function(){
	$('#adultNum').text(1);
	$('#childNum').text(0);
})
.on('click','#location_tab',function(){
	
})
.on('change','#arrangeWays',function(){
	refreshReview();
})
.on('click','#upwards',function(){
	goToScroll('body'); 
})
.on('click','.roomButton button',function(){
	
	roomtype_seq = $(this).attr('id');
	
	if(checkin!=null && checkout!=null){
		document.cookie = "checkin=" + checkin + "; path=/roomtype; expires expires=Tue, 19 Jan 2025 03:14:07 GMT;"
		document.cookie = "checkout=" + checkout + "; path=/roomtype; expires expires=Tue, 19 Jan 2025 03:14:07 GMT;"
	}
	
	document.cookie = "howmanyAdults=" + howmanyAdults + "; path=/roomtype; expires expires=Tue, 19 Jan 2025 03:14:07 GMT;"
	document.cookie = "howmanyChildren=" + howmanyChildren + "; path=/roomtype; expires expires=Tue, 19 Jan 2025 03:14:07 GMT;"
	// howmanyAdults 	cookie 생성
	// howmanyChildren	cookie 생성
	
	//   roomtype/roomtype_seq/checkout/checkin/howmanyAudults/howmanyChildren 
	
	document.location = "/roomtype/" + roomtype_seq 
	
})
////////////////////////////////// functions ///////////////////////////////////////////

function loadPage(){	
	
	
	
	// ajax 를 통해서 page 에 표시할 data 들을 가져옴.
	
	// 일단 최소 다음과같은 내용들을 가져와져야함.
	// 1. place 에 대한 기본적인 정보들.
	// 2. place 가 보유한 모든 roomtype 들의 roomtype option 종합  
	// 3. place 가 보유한 모든 방들의 내역(roomtype/room) --> 이건 db로 걸러서 roomtype 만 보여줄지, 아니면
	//												   room 자체를 전부다 보여줄지 정해야함
	// 4. 그리고 place의 평점도 가져와서 붙여야함.
	// 5. place 에 대한 전 리뷰도 가져와야함.
	
	place_seq = parseInt( $('#place_seq').val() );
	pureAddress = null;
	
	$.ajax({url:'/getPlace', type:'post', dataType:'json', 
		
		data:{place_seq:place_seq},
		success:function(place){
			
		/* 	place.name;
			place.imgs;
			place.address;
			place.checkin_time;
			place.checkout_time;
			place.guide;
			place.mobile; 
			place.reviewRate;
			place.reviewCount;
			
		*/
			
			// 1. placeImg 넣기
			frame = makeFrame();
			frame.left_img = "/img/website/place_left.png"
			frame.right_img = "/img/website/place_right.png"
			frame.left_style = 'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);left:10px;width:80px;height:150px;'
			frame.right_style = 'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);right:10px;width:80px;height:150px;'
			
			if(place.imgs=="" || place.imgs==null){
				
				frame.addPhoto("/img/website/noimg.png");
				
				tagstr = frame.getTagStr();
				cssstr = frame.getCssStr();
				$('body').append(cssstr);
				$('#frame').append(tagstr);
			} else {
				imgs = place.imgs.split(",");
				for(i=0;i<imgs.length;i++){
					frame.addPhoto(imgs[i]);
				}
				tagstr = frame.getTagStr();
				cssstr = frame.getCssStr();
				$('body').append(cssstr);
				$('#frame').append(tagstr);
			}
			
			
			
			// 2. title 에 이름,평점넣기
			titlestr = ''
			titlestr += '<div>' + place.name + '</div>';
			titlestr += '<div>' + reviewRateToStar(place.reviewRate) 
						+ ' (' + place.reviewCount  +')</div>'
									
			$('#title').append(titlestr)
			
			
			
			// 3. 주소로 지도그리기를 위한 주소받기.
			pureAddress = place.address.split(",")[1];
			$('#address').text(place.address);
						
			
			
			// 4. guide 입력. 그런데 이거 summernote 처럼 사용자가 엔터치면 엔터 저장하고 해야함. 
			//	  팀원들이랑 맞춰서 하기. summernote 같은거 써야할듯.
			// 	  사용자가 입력할때.
			if(place.guide==null){place.guide = "아직 작성되지 않았습니다."}
			$('#place_guide').append('<h3>안내/정책</h3>' + place.guide);			
			
			
			
			
			// 5. review 평균 / review 개수를 review_content 에 넣어줌.
			$('#howmanyReviews').append('<span>후기</span><span>(' + place.reviewCount.toLocaleString() + ')</span>');
			
			if(place.reviewRate==0){
				
				str ='<div>'
				str+='<img id=star src="/img/website/reviewStar_null.png">'
				str+='</div>'
				str+='<div>'
				str+='<strong>' + place.reviewRate.toFixed(1) + '</strong>/0.0'
				str+='</div>'
				
				$('#review_average').append(str);
			} else {
				
				str ='<div>'
				str+='<img id=star src="/img/website/reviewStar.png">'
				str+='</div>'
				str+='<div>'
				str+='<strong>' + place.reviewRate.toFixed(1) + '</strong>/5.0'
				str+='</div>'
				
				$('#review_average').append(str);
			}
			
			
			
			
			// --> placeOptions / roomtypeOptions / reviews 는 많아서 따로함
			
			
			
			
		}, complete:function(){
			loadImgMap(pureAddress);
			// 이거 location 클릭해서 지도 load시 깜빡이는거 싫으면 방법이 있음
			// label 체크시 display block 되는것 보다 먼저 code 로 display block 을 먼저 시키는거임
			// 코드가 더 빨라서 지도가 안뜨는거 같음.
			// 그러므로, 코드로 display block 시킨다음에 바로 지도만드는 function 호출하는걸로.
			// 일단은 임시방편으로 처음에 깜빡이는거.
		}
	})
	
	

	

	
	
	
	return false;
}

function reviewRateToStar(reviewRate){ // review rate 를 받으면 예쁘게 별로 만들어주는 function
	
	if(reviewRate==0){return "아직 작성된 리뷰가 없습니다.";}
	
	
	reviewRate_ceil = Math.floor(reviewRate)
	
	stars = ''
	for(b=0;b<reviewRate_ceil;b++){
		stars += '★'
	}
	stars = '<span class=stars>' + stars + '</span><span> ' + reviewRate.toFixed(1) + '</span>'
	
	return stars;
}

function reviewToStar(reviewRate){
	
	reviewRate_ceil = Math.floor(reviewRate)
	stars = ''
	for(c=0;c<reviewRate_ceil;c++){
		stars += '★'
	}
	stars = '<span class=stars>' + stars + '</span>'
	
	return stars;
}


function loadAlloptions(){
	
	place_seq = parseInt( $('#place_seq').val() );
	
	$.ajax({url:'/getAlloptions', type:'post', dataType:'json', 
		
		data:{place_seq:place_seq},
		success:function(options){
			
			if(options==""){
				
				str = '<div class=optionBox_title>보유옵션</div>'
					str += '<div class=options>'
					str += '<div class=option>'
					str += '<div><img src="/img/place_option/none.png"></div>'
					str += '<div>없음</div>' 
					str += '</div>'
				str += '</div>'
				$('#optionBox').append(str);
				
			} else {
				str = '<div class=optionBox_title>보유옵션</div>'
					str += '<div class=options>'
					for(i=0;i<options.length;i++){
						str += '<div class=option>'
						str += '<div><img src="' + options[i].img + '"></div>'
						str += '<div>' + options[i].name + '</div>'
						str += '</div>'
					}
					str += '</div>'
					
					$('#optionBox').append(str);
			}
			
		
		}
	})
	return false;
}


function refreshRoomType(){
	roomtype_pageNum = 1;
	$('#rooms').empty();
	loadRoomTypes();
}


function loadRoomTypes(){
	
	// 이것도 main 에서 한것처럼, db로 검색시 방 골라올 수 있어야함.
	// 대신 이번에는 지역 이런거 다 빼고 대신에 날짜랑 인원으로만 검색. 
	// 일단 data 뭐보낼지는 나중에 생각하고 다 불러오는것만 일단 해보자.
	
	
	
	place_seq = parseInt( $('#place_seq').val() );
	
	$.ajax({url:'/getRoomTypes', type:'post', dataType:'json',
		
		data:{ 
			
			/* 검색조건 keyword*/
			place_seq:place_seq,
			checkin:checkin,
			checkout:checkout,
			howmanypeople:( parseInt(howmanyAdults) + parseInt(howmanyChildren) ) ,
			pageNum:roomtype_pageNum
			
		},
		success:function(roomtypes){
			
			if(roomtype_flag==false){return false;} else{console.log("pageNum : "+roomtype_pageNum +", loadRoomTypes 실행")}
			
			roomtype_flag=false;
			
			
			if(checkin==null && checkout==null){$('#when').text('언제든지')}
			else{$('#when').text(checkin + "-" + checkout)}
			
			if(howmanyAdults==0 && howmanyChildren==0){$('#howmanypeople').text('인원추가')}
			else{$('#howmanypeople').text('어른 '+howmanyAdults + '명, 아이 ' + howmanyChildren +'명' )}
			
			
			
			if(roomtypes.length==0 && roomtype_pageNum==1){console.log('no roomtypes');return false;}
			else if(roomtypes.length!=0){roomtype_pageNum++;}
			
			
			if(roomtypes.length==0){console.log("더 이상 객실내역없음");return false;}
			
			for(a=0;a<roomtypes.length;a++){
				
			
				str = '<div class=room id=' + roomtypes[a].seq + '>'
				str += '<div class=roomPhotos>'
				roomtypeFrame = makeFrame();
				roomtypeFrame.left_img = "/img/website/roomtype_left.png"
				roomtypeFrame.right_img = "/img/website/roomtype_right.png"
				roomtypeFrame.left_style = 'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);left:7px;width:30px;height:30px;'
				roomtypeFrame.right_style = 'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);right:7px;width:30px;height:30px;'
				roomtypeFrame.pictureList_style = 'width:100%;height:100%;white-space:nowrap;overflow:hidden;padding:0px;font-size:0px;cursor:pointer;'
				
				if( roomtypes[a].imgs!=null ){
					roomtypeImgs = roomtypes[a].imgs.split(",");
					for(j=0;j<roomtypeImgs.length;j++){
						roomtypeFrame.addPhoto(roomtypeImgs[j]);
					}
				} else {
					roomtypeFrame.addPhoto('/img/website/noimg.png');
				}
					
				
				str += roomtypeFrame.getTagStr();
				str += '</div>'
				str += '<div class=roomName>' + roomtypes[a].name + '</div>'
				str += '<div class=roomCapacity> 최대 수용인원 ' + roomtypes[a].capacity + '명</div>'
				str += '<div class=roomPrice>' + roomtypes[a].price.toLocaleString() + ' 원 <span> (1박)</span></div>'
				str += '<div class=roomButton><button id='+ roomtypes[a].seq +'>객실선택하기</button></div>'
				str += '</div>'
				
				$('body').append( roomtypeFrame.getCssStr() );
				$('#rooms').append(str);
			
			}
		}, 
		
		complete:function(){
			setTimeout(function(){roomtype_flag=true;},30)
		}
	
	})
}


function decideButtonFinishCode(){
	$('#calendarModal_background').css('display','none');

	checkin = calendar.getCheckin();
	checkout = calendar.getCheckout();
	
	refreshRoomType();
}

function calendarModalClose(){
	$('#calendarModal_background').css('display','none');
}


function loadMap(){
	$('#mapBox').empty();
	$('#body').append('<div id=map></div>')
	let container = document.getElementById('map'); 
	let options = { center: new kakao.maps.LatLng(33.450701, 126.570667), level: 3 };
	let map = new kakao.maps.Map(container, options); 
	
	var geocoder = new kakao.maps.services.Geocoder();
	geocoder.addressSearch(pureAddress,function(result,status){
		
		if(status === kakao.maps.services.Status.OK){
			
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			var marker = new kakao.maps.Marker({
			    position: coords
			});
			marker.setMap(map);
			map.setCenter(coords);
			
		}
	})
}


// 주소를가지고 이미지 지도를 만드는 함수 
function loadImgMap(address){
	
	$.ajax({url:'/coordinates', type:'get', dataType:'json',
		
		data:{address:address},
		success:function(data){
			
			xcoord = data.documents[0].x
			ycoord = data.documents[0].y
			
			// 주소의 좌표를 얻었으니 이제 이미지지도를 만들기만 하면됨.
			var markerPosition  = new kakao.maps.LatLng(ycoord, xcoord); 
			var marker = {
			    position: markerPosition
			};
			var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
		    staticMapOption = { 
		        center: new kakao.maps.LatLng(ycoord, xcoord), // 이미지 지도의 중심좌표
		        level: 3, // 이미지 지도의 확대 레벨
		        marker: marker // 이미지 지도에 표시할 마커 
		    };    

			// 이미지 지도를 표시할 div와 옵션으로 이미지 지도를 생성합니다
			var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
			
			
		},
		complete:function(){
			$('#roomlist').trigger('click');
		}
	
	})
	
}




function refreshReview(){
	
	review_pageNum = 1;
	$('#reviewlist').empty();
	loadPlaceReviews();			// 머 리뷰없다있따표시는 loadPlaceReviews 에서 하는걸로.
	
}

function loadPlaceReviews(){
	
	place_seq = parseInt( $('#place_seq').val() );
	keyword = $('#arrangeWays option:selected').val();
	
	// place 자체의 리뷰총점, 리뷰개수도 가져와야함
	// >> 이건 loadpage 에서 getplace 로 place 에 대한 data 가져오니깐 거기서하면될듯.
	
	// place 의 모든 review 를 가져옴.
	$.ajax({url:'/getReviews', type:'post', dataType:'json',
		
	
		data:{
			place_seq:place_seq,
			keyword:keyword,
			pageNum:review_pageNum
		},
		success:function(reviews){
			
			if(review_flag==false){return false;} else{console.log("pageNum : " + review_pageNum + ", loadReviews 실행")}
			review_flag = false;
			
			
			if(review_pageNum==1 && reviews.length==0){
				console.log("등록된 리뷰 없음")
				$('#reviewlist').empty();
				$('#reviewlist').append('<h3>등록된 리뷰가 없습니다.</h3>'); 
				return false;
			} else if(reviews.length!=0) {
				review_pageNum++;
			}	// 머 pageNum 이 1은 아닌데 review 가 없는경우엔 더이상 pageNum 증가시킬필욘없으니까. 
				// 아래 for문도 안돌아갈거임. review 가 0개니깐.
			
			
			if(reviews.length==0){console.log("더 이상 리뷰 없음.");return false;}
			
				
//			$('#reviewlist').empty();	바닥찍었을때 review 더 불러오는건 덧붙이는방식이니깐.
	
			for(i=0;i<reviews.length;i++){
				
				seq = reviews[i].seq;
				user_id = reviews[i].user_id;
				roomtype_name = reviews[i].roomtype_name;
				star = reviews[i].star;
				content = reviews[i].content;
				date = reviews[i].date;
				
				if(content==null){content = '&nbsp;';}
				
				str = '<div class=review id=review' + seq + '>' 
				str +='<div>' + reviewToStar(star) + '</div>';
				str +='<div>' + user_id + ' | ' + date + '</div>';
				str +='<div><span>객실명</span>&nbsp;' + roomtype_name + '</div>';
				str +='<div>' + content + '</div>';
				str +='</div>'
				
				
				$('#reviewlist').append(str);

				
			}
			
			
			
		}, 
		
		complete:function(){
			setTimeout(function(){review_flag=true},30);
		}
	
	})
}


// 이거는 infinite scroll
$(window).scroll(function() {
	
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
    	
    	// review_tab 에 checked 되어 있으면, review 를 load
    	// roomtypes_tab 에 checked 되어 있으면, roomtype 을 load 
    	// 그 외에는 딱히.
    	checked_tab = $('input[name=tab_radio]:checked').attr('id')
    	
    	if(checked_tab=='reviews'){
    		loadPlaceReviews();
    	} else if(checked_tab=='roomlist'){
    		loadRoomTypes();
    	}
    		
    	
    }
});


// 이거는 scroll 위로 자동이동
function goToScroll(selector) {
    var location = document.querySelector(selector).offsetTop;
    window.scrollTo({top: location - 100, behavior: 'smooth'});
}



// 일단 review 먼저 infinite scroll 해보자.

/*

	설계 : 
	
		data 보낼때 pageNum 도 같이보냄.
		pageNum 의 초깃값은 1임.
		
		스크롤이 바닥을치면 
		그때 pageNum 을 data 로 서버에 보내고,
		pageNum+1(그 다음페이지)데이터가 있는지 조사
		
		있으면, JSONArray 로 보내고, 없으면 JSONArray 의 길이가 0일거임.
		
		길이가 0 이면 pageNum 값을 더이상 올리지 않음.
		길이가 0이 아니면 pageNum 의 값을 올림.
		그래서 다음번에 또 바닥치면 이번엔 3번째 페이지를 불러올거임.
		
		그리고 참고로, review_tab 을 클릭 할 떄 마다 pageNum 을 1로 갱신해야할듯.
		
		그렇다는건 review 를 로드하는걸 맨처음에 하는게 아니라, review_tab 클릭시에 해야함.
		
*/



// review 와 마찬가지로, roomtype 에 대한 infinite scroll

/*

	설계 : 
		
		data 보낼때 pageNum 도 같이 보냄.
		pageNum 의 초깃값은 1임.
		
		스크롤이 바닥을치면
		그때 pageNum 을 data 로 서버에 보내고,
		pageNum+1(그 다음페이지)데이터가 있는지 조사.



	1. roomlist_tab 버튼 누를시 pageNum=1 로 만들고 loadRoomtypes()
	2. calendar decide 버튼 누를시 pageNum=1 로 만들고 loadRoomtypes()
	3. 인원 decide 버튼 누를시 pageNum=1 로 만들고 loadRoomtypes()
	
	4. 스크롤 바닥을 찍었을 때 다음 page의 roomtypes 를 더 가져오는 함수
		- 바닥찍었을때 다음페이지에 roomtypes 가 더 있으면 불러온다음에 pageNum 증가시키고,
		- 바닥찍었을때 다음페이지에 리뷰가 없으면 pageNum 은 증가하지 않음

*/



/*
review infinite scroll 을 위해 필요한 함수들(일단)

	1. review_tab 을 눌렀을 때 모든것을 초기화시키는 함수.
		- pageNum 초기화 시켜야함
		- reviewlist empty 해야함(있던 리뷰 다 지워야함)
		- page1 의 reviews 들을 가져와야함. page가 1인데 reviews 가 없으면, 없다고 표시해야함. 3번임
	
	2. 새로 selectBox 에서 정렬기준을 눌렀을때 리뷰를 초기화시키는 함수.
		- pageNum 초기화 시켜야함
		- reviewlist empty 해야함(있던 리뷰 다 지워야함)
		- page1 의 reviews 들을 가져와야함. page가 1인데 reviews 가 없으면, 없다고 표시해야함. 3번임
		
	3. 스크롤이 바닥을 찍었을 때 다음 page 의 review 를 더 가져오는 함수
		- 바닥을 찍었을때 다음페이지에 리뷰가 있으면 불러온다음에, pageNum 을 증가시킴.
		- 바닥을 찍었을때 다음페이지에 리뷰가 없으면 pageNum 은 증가하지 않음(사실 증가해도 상관은없음)
		

*/



// 아 버그 이유 알았다ㅋ. 애초에 스크롤이 어느정도 아래로가있고, 거기서 load 해서 scroll 이 바닥을찍음과 동시에 load가 되면,
// 바닥을찍으니깐 또 load가 되면서 동시에 load가 2번실행됨. 그래서 똑같은 review unit 이 두 번 출력되는거.
// 이거는 roomtypes 나 reviews 나 마찬가지.
// 즉 load 하기전에 scroll 을 특정위치에 고정시켜야함.


</script>
</html>
