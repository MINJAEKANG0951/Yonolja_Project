<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/css_roomtype.css" type="text/css">
<title>roomtype</title>
</head>
<style>
</style>


<body>
<%@ include file ="./structure/header_placePage.jsp" %>
<!-- rest api 방식으로 jsp 파일을 출력할때, 그냥 url에 있는거 그대로 쓸 수 있음. model 에 안실어도 -->
<input type=hidden id=roomtype_seq value="${roomtype_seq}" readonly>
<button id=upwards>^</button>




<section>
<div id=section>

	<div id=frame>
		
	</div>
	<div id=title>
		
	</div>
	<div id=optionBox>
	
	</div>
	
	
	<div id=searchBox>
			<div id=searchbar>
				<div><button id=when> 날짜선택 </button></div> 
				<div><button id=howmanypeople> 인원추가 </button></div>
			</div>
		<div id=searchResult>
			<div id=receipt>
				<div>숙박</div>
				<div id=summary>
					<span class=roomtypeInfo>수용인원</span>
					<span id=roomtype_capacity></span> 
					<span class=roomtypeInfo>체크인</span> 
					<span id=roomtype_checkin></span> 
					<span class=roomtypeInfo>체크아웃</span> 
					<span id=roomtype_checkout></span>
				</div>
				<div>(1박기준)</div>
				<div id=pricePerDay></div>
				<div id=pricePerPeriod></div>
				<div id=bookButtonBox>
					<button id=bookButton>객실 예약하기</button>
				</div>
				<div id=howmanyLeft></div>
			</div>
			<div id=empty>
				
			</div>
		</div>
	</div>
	
	<div id=guide>
		<div>기본정보</div>
		<div id=roomtype_guide></div>
	</div>
	

	<div id=reviewBox> 
		<div id=howmanyReviewBox>객실 후기<span></span></div>
		<div id=arrangeWays_selectBox>
			<select id=arrangeWays>
				<option value=" order by to_date(rv.review_date) desc">최근 작성순</option>
				<option value=" order by rv.review_star desc,to_date(rv.review_date) desc">별점 높은순</option>
				<option value=" order by rv.review_star,to_date(rv.review_date) desc">별점 낮은순</option>
			</select>
		</div>
		<div id=reviewlist>
			
			
			<!--  이런형태로 불러와야함. 
			<div class="review" id="review1">
				<div>
					<span class="stars">★★★</span>
				</div>
				<div> blueie | 2023.6.13 </div>
				<div>
					<span>객실명</span>
					&nbsp;singleRoom
				</div>
				<div>
					여기에 댓글내용이 들어가면되는데, 길어질경우 방지ㄷㅈㄷㄱㅁㄷㄱㄹㄴㅇㄻㄴㄹㄴㅁㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹㄴㅁㅇㄻㄴㅇㄹㅈㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷ ㅂㅈㄷㅂㅈㅈㅂㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅂㄷㅈㅂㅈㄷㅂㄷㅈ ㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂ여기에 댓글내용이 들어가면되는데, 길어질경우 방지ㄷㅈㄷㄱㅁㄷㄱㄹㄴㅇㄻㄴㄹㄴㅁㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹㄴㅁㅇㄻㄴㅇㄹㅈㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷ ㅂㅈㄷㅂㅈㅈㅂㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅂㄷㅈㅂㅈㄷㅂㄷㅈ ㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂ여기에 댓글내용이 들어가면되는데, 길어질경우 방지ㄷㅈㄷㄱㅁㄷㄱㄹㄴㅇㄻㄴㄹㄴㅁㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄻㄴㅇㄹㄴㅁㅇㄻㄴㅇㄹㅈㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷㄷ ㅂㅈㄷㅂㅈㅈㅂㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅈㅂㄷㅈㅂㅈㄷㅂㄷㅈ ㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂㅂ
				</div>
			</div>
			-->
			
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
////////////////////////////////////////// global variables ///////////////////////////////////////////////////

checkin = null;
checkout = null;
howmanyChildren = null;
howmanyAdults = null;

let review_pageNum = 1;
let review_flag = true;

roomtype_options = [];

roomtype_price = null;
roomtype_capacity = null;
/////////////////////////////////  js, jquery  //////////////////////////////////////////////


//modal code 

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




//modal 에 calendar 넣기

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



/////////////////////////////////////////////// cookies ////////////////////////////////////////////////////
// 여기서 쿠키사용
console.log(document.cookie)

cookies = document.cookie.split("; ")

for(ck=0;ck<cookies.length;ck++){
	cookie = cookies[ck];
	
	if(cookie.includes('=')){
	
		key = cookie.split("=")[0]; 
		value = cookie.split("=")[1]; 
		
		if(key==='howmanyAdults' && value!=""){ howmanyAdults = parseInt(value); }
		else if(key==='howmanyChildren' && value!=""){ howmanyChildren = parseInt(value); }
		else if(key==='checkin' && value!=""){ checkin=value; }
		else if(key==='checkout' && value!=""){ checkout=value; }
		
	} 
}


// 그 후 바로 삭제
document.cookie = "checkin= ; path=/roomtype; expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "checkout= ; path=/roomtype;expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "howmanyChildren= ; path=/roomtype;expires=Tue, 19 Jan 2000 03:14:07 GMT;"
document.cookie = "howmanyAdults= ; path=/roomtype;expires=Tue, 19 Jan 2000 03:14:07 GMT;"

console.log(document.cookie)
console.log(checkin + ":" + checkout + ":" + howmanyChildren + ":" + howmanyAdults);

///////////////////////////////////////////// jquery /////////////////////////////////////////////////////

$(document)
.ready(function(){
	allOptions(); // loadPage() 가 callback function 으로 들어있음
	loadRoomTypeReviews();
	
	// 여기다가 roomRefresh 하면될듯
})
.on('click','.toPlace',function(){
	document.location = "/place/" + $(this).attr('id');
})
.on('change','#arrangeWays',function(){
	refreshReview();
})
.on('click','#upwards',function(){
	goToScroll('body'); 
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
	
	roomRefresh();
})
.on('click','#howmanypeople_reset', function(){
	$('#adultNum').text(1);
	$('#childNum').text(0);
})
.on('click','#bookButton',function(){
	
	// 예약페이지 이동 
	// book
	
	roomtype_seq = parseInt( $('#roomtype_seq').val() );
	checkinDate = new Date(checkin) 
	checkoutDate = new Date(checkout)
	howmanyDays = (checkoutDate-checkinDate)/(24*1000*3600);
	book_price = howmanyDays*roomtype_price;
	
	
	
	$.ajax({url:'/addBook', type:'post', dataType:'text',
		data:{
			roomtype_seq:roomtype_seq,
			checkin:checkin,
			checkout:checkout,
			book_price:book_price,
			howmanypeople:( howmanyAdults + howmanyChildren )
		},
		success:function(url){
			if(url=='main'){alert('예약이 성공적으로 완료되었습니다!')}
			document.location = "/" + url;
		}
	
	})
	
	
	
})

//////////////////////////////////////////// functions ///////////////////////////////////////////////////
function allOptions(){
	$.ajax({url:'/getPlaceOptions', type:'post', dataType:'json',
		success:function(options){
			for(i=0;i<options.length;i++){	
				option = options[i];
				optionElement = {seq:option.option_seq, name:option.option_name, img:option.option_img};
				roomtype_options.push(optionElement);

			}
		}, 
		complete:function(){
			loadPage();
		}
	})
}

function loadPage(){ // roomtype 에 관한 전반적인 정보들을 불러옴
	
	roomtype_seq = parseInt( $('#roomtype_seq').val() );
	
	$.ajax({url:'/getRoomType', type:'post', dataType:'json', 
		
		data:{roomtype_seq:roomtype_seq},
		success:function(roomtype){
			
			/*
				
				(roomtype.place_seq)
				roomtype.place_name
				roomtype.seq
				roomtype.name
				roomtype.imgs
				roomtype.capacity
				roomtype.price
				roomtype.options
				roomtype.guide
				
				roomtype.reviewCount
				
		
				
			*/
			
			
			
			
			
			// 1. roomtypeImg 넣기
			
			imgs = roomtype.imgs.split(",");
			
			frame = makeFrame();
			frame.left_img = "/img/website/place_left.png"
			frame.right_img = "/img/website/place_right.png"
			frame.left_style = 'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);left:10px;width:80px;height:150px;'
			frame.right_style = 'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);right:10px;width:80px;height:150px;'
			
			for(i=0;i<imgs.length;i++){
				frame.addPhoto(imgs[i]);
			}
			tagstr = frame.getTagStr();
			cssstr = frame.getCssStr();
			$('body').append(cssstr);
			$('#frame').append(tagstr);
			
			
			
			
			// 2. title 에 roomtype 이름, place 이름넣기
			
			titlestr = ''
			titlestr +='<div>' + roomtype.name + '</div>'
			titlestr +='<div><span class=toPlace id='+ roomtype.place_seq +'>' + roomtype.place_name + '></span></div>'
			$('#title').append(titlestr);
			
			
			
			// 3. roomtypeOptions 
			
			str = '<div class=options>'
			
			if(roomtype.options!=null){
				options = roomtype.options.split(","); 
				container = [] 
				for(i=0;i<options.length;i++){
		
					for(j=0;j<roomtype_options.length;j++){
						if( parseInt(options[i]) == roomtype_options[j].seq && !container.includes(options[i])){
							str += '<div class=option>'
							str += '<div><img src="' + roomtype_options[j].img + '"></div>'
							str += '<div>' + roomtype_options[j].name + '</div>'
							str += '</div>'
							container.push(options[i]);
							break;
						}
					}
				}
				
				str += '</div>'
				$('#optionBox').append(str);
			} else {
					str += '<div class=options>'
					str += '<div class=option>'
					str += '<div><img src="/img/place_option/none.png"></div>'
					str += '<div>없음</div>' 
					str += '</div>'
				$('#optionBox').append(str);
			}
			

			
			// 4. 객실 기본정보를 receipt 에 일부 입력
			
			$('#roomtype_capacity').text("최대" + roomtype.capacity + "인");
			$('#roomtype_checkin').text(roomtype.checkin);
			$('#roomtype_checkout').text(roomtype.checkout);
			$('#pricePerDay').text( parseInt(roomtype.price).toLocaleString() + "원" )
			
			roomtype_price = roomtype.price;
			roomtype_capacity = roomtype.capacity;
			
			// 5. roomtype_guide 표시
			$('#roomtype_guide').html(roomtype.guide);
			
			// 6. roomtype 에 대한 review 개수 표시
			
			$('#howmanyReviewBox span').text('(' + roomtype.reviewCount + ')');
		
			
			
		},
		complete:function(){
			roomRefresh();
		}
	
	})
	
}

function roomRefresh(){
	
	// 달력에 checkin, checkout 날짜 채우고, 인원추가도 성인, 아동 표시하면서,
	// 검색된 결과를 기준으로 n박 총액~도 표시해주고, 남은객실수도 표시해주는 function
	
	// 그러렴 일단 data 를 server 에 보내서, 검색기준으로 남은방이 몇개있는지 찾아줘야함.
	// 근데 참고로, 남은방은 0개는 표시되지 않을거임. 왜냐면 애초에 달력으로 막을거라서.
	// 즉 달력으로 막는애도 필요함. 
	
	
/*	 roomRefresh 의 기능
	
	1. 달력에 선택된 checkin, checkout 날짜를 표시해주고(checkin, checkout == null 일때는 '날짜선택')
		--> 언제든지를 할 수 없음. 왜냐면, 예약하려면 꼭 체크인,체크아웃 date가 필요하니깐
	2. 선택된 인원수도 보여줌( howmanyChildren, howmanyAdults == null 일때는 '인원추가' )
		
	3. 검색된 결과를 기준으로 총 금액(n박 총액~원)을 표시해줌.
	4. 검색된 결과를 기준으로 남은 객실타입의 객실 수를 보여줌(0은 나오지 않을거임. 애초에 달력의 checkin, checkout 막아놓음)
		- 근데 만약에 0이면, 예약버튼을 disabled 하긴함
	
	보낼데이터는 여전히 roomtype_seq ,체크인,체크아웃,총 인원 수
	
	가져올 데이터는 해당하는 방의 개수가 몇개인지 가져옴.
	
	날짜선택과 인원추가 둘중하나라도 하지 않거나,
	해당하는 방의 개수가 0개이면 객실예약하기 버튼을 막아버림.
*/	
	
	roomtype_seq = parseInt( $('#roomtype_seq').val() );
	
	// 1. 선택날짜 표시
	if(checkin!=null && checkout!=null){ $('#when').text(checkin + "-" + checkout); } 
	else { $('#when').text('날짜선택');}
	
		
	// 2. 선택인원 표시 
	if( !(howmanyAdults==null && howmanyChildren==null) ){
		$('#howmanypeople').text('어른 ' + howmanyAdults + '명, 아이 ' + howmanyChildren + '명')
	} else { $('#howmanypeople').text('인원추가'); }
	
	
	// 3. 총 금액 표시
	if(checkin!=null && checkout!=null){
		checkinDate = new Date(checkin) 
		checkoutDate = new Date(checkout)
		howmanyDays = (checkoutDate-checkinDate)/(24*1000*3600);
		
		$('#pricePerPeriod').text( howmanyDays + '박 총액 '+ (roomtype_price*howmanyDays).toLocaleString() +'원');
		
	} else {
		$('#pricePerPeriod').text('1박 총액 '+ roomtype_price.toLocaleString() +'원');
	}
	
	
	howmanyLeft = null;
	
	// 여기부터 서버랑 소통 
	
	$.ajax({url:'/countRoomLeft', type:'post', dataType:'text', 
		data:{
			roomtype_seq:roomtype_seq,
			checkin:checkin,
			checkout:checkout,
			howmanypeople:( howmanyAdults + howmanyChildren )
		},
		
		success:function(howmanyRoomLeft){
			$('#howmanyLeft').text('남은 객실 ' + howmanyRoomLeft + '개');
			howmanyLeft = parseInt(howmanyRoomLeft);
		},
		complete:function(){
			
			if( (howmanyAdults+howmanyChildren)>roomtype_capacity ){
				$('#bookButton').addClass('disabled')
				$('#bookButton').text('투숙인원 불일치');
				$('#bookButton').prop('disabled',true);
			} 
			else if(howmanyLeft==0){
				$('#bookButton').addClass('disabled')
				$('#bookButton').text('남은 방 없음');	
				$('#bookButton').prop('disabled',true);
			} 
			else if( checkin==null || checkout==null || howmanyAdults==null	){
				$('#bookButton').addClass('disabled')
				$('#bookButton').text('날짜,인원 선택');	
				$('#bookButton').prop('disabled',true);
			}
			else {
				$('#bookButton').removeClass()
				$('#bookButton').text('객실 예약하기');
				$('#bookButton').prop('disabled',false);
			}
			
		}
	})
	
	



	
	
}





function loadRoomTypeReviews(){
	
	roomtype_seq = parseInt( $('#roomtype_seq').val() );
	keyword = $('#arrangeWays option:selected').val();
	
	// $('#reviewlist').empty();
	$.ajax({url:'/getRoomTypeReviews', type:'post', dataType:'json',
		
		data:{
			roomtype_seq:roomtype_seq,
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
			setTimeout(function(){review_flag=true},500);
		}
	
	})
}



function decideButtonFinishCode(){
	$('#calendarModal_background').css('display','none');

	checkin = calendar.getCheckin();
	checkout = calendar.getCheckout();
	
	roomRefresh();
}

function calendarModalClose(){
	$('#calendarModal_background').css('display','none');
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

function refreshReview(){
	
	review_pageNum = 1;
	$('#reviewlist').empty();
	loadRoomTypeReviews();			// 머 리뷰없다있따표시는 loadPlaceReviews 에서 하는걸로.
	
}




// infinite scroll
$(window).scroll(function() {
	
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
 
    	loadRoomTypeReviews();
    
    }
});

// scroll 위로 자동이동
function goToScroll(selector) {
    var location = document.querySelector(selector).offsetTop;
    window.scrollTo({top: location - 100, behavior: 'smooth'});
}





</script>
</html>