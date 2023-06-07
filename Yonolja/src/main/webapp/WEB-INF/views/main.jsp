<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>main</title>
</head>
<style>
.movingHeader{border-bottom:1px solid #ddd;}
header {
  position: fixed;
  top: 0; left: 0;
  height: 170px;
  width: 100%;
  background-color: white;
  border-top:1px solid #ddd;

  display: grid;
  grid-template-columns:1fr;
  grid-template-rows:1fr 1fr;
  place-items:center;
  z-index:2;
}
.header_container {
	display:grid;
	background-color:white;
	grid-template-columns:1fr  1fr  1fr;
	grid-template-rows:1fr;
    place-items: center;
    width:95%;
    z-index:4;
}
#mypage_button{
	border:2px solid #ddd;
	background-color:white;
	width:85px;
	height:45px;
	border-radius:45% 45% 45% 45%;
	cursor:pointer;
	overflow:hidden;
}
#mypage_button:hover{ 
	box-shadow: 0px 0px 5px #444;transition:0.5s;
}
.header_item { width:100%;border:0px solid #ddd;}
.header_item:nth-child(2){	text-align:center; }
.header_item:nth-child(3){  text-align:right;  }
#logo{height:50px;z-index:1;}
#user_profile{width:100%}
#searchbar{
	width:350px;
	height:50px;
	border-radius:5% 5% 5% 5% / 50% 50% 50% 50%;
	background-color:white;
	border:2px solid #ddd;
	cursor:pointer;
	font-size:15px;
	font-weight:bold;
	display:grid;
	grid-template-columns:4fr 4fr 4fr 1fr;
	grid-template-rows:1fr;
	place-items: center;
	opacity:1;
}
#searchbar:hover{ box-shadow: 0px 0px 5px #444;transition:0.5s;}
.searchbar_item{width:100%}
.searchbar_item:nth-child(1){border-right:1px solid #ddd;}
.searchbar_item:nth-child(2){border-right:1px solid #ddd;}
.searchbar_item:nth-child(3){
	font-weight:lighter;
	color:gray;
}
#search_img{width:30px;display:inline-block}

.header_item:nth-child(3){
	display:grid;
	grid-template-columns:4fr 1fr 1fr;
	grid-template-rows:1fr;
	place-items:center;
}
.last_header_item_item{
	
}
.last_header_item_item:nth-child(1){
	text-align:right;font-weight:bold;font-size:14px;cursor:pointer;
		border-radius:5% 5% 5% 5% / 50% 50% 50% 50%;
		min-width:200px;
}
.last_header_item_item:nth-child(1):hover{background-color:#ddd;transition:0.5s;}
.last_header_item_item:nth-child(2){
	width:35px;
	height:35px;
	border-radius:50% 50% 50% 50%;
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	place-items:center;
}
.last_header_item_item:nth-child(2):hover{
	background-color:#ddd;transition:1s;
}
.last_header_item_item:nth-child(3){

}
#world_img{width:24px;cursor:pointer;}

footer {
  position: fixed;
  bottom: 0; left: 0;
  height: 100px;
  width: 100%;
  background-color: white;
  border:1px solid #ddd;
  display:grid;
}
.footer_container{
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr 1fr;
    place-items: center;
    width:100%;
    height:100%;
}
.footer_item {
	width:95%;
	height:100%;
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	place-items:center;
}
.footer_item:nth-child(1){
	border-bottom:1px solid #ddd;
	font-size:15px;
	min-width:1056px;
}
.footer_item:nth-child(2){
	font-size:5px;
}
section {
  padding-top: 150px; padding-bottom: 150px;
}

.sub{
	display:none;
	position:absolute;
	border-radius:10% 10% 10% 10%;
	right:40px;
	border:1px solid #ddd;
	
	grid-template-columns:1fr;
	grid-template-rows:1fr 1fr 1fr;
	background-color:white;
	z-index:1;
}
.sub_item{
	cursor:pointer;
	width:100%;
	height:25px;
	font-weight:bold;
	font-size:17px;
	text-indent:1em;
	text-align:left;
}
.sub_item:hover{
	background-color:#ddd;
}
.sub_item:nth-child(n+2){
	border-top:1px solid #ddd;
}


.header_container2{
	background-color:white;
	border-top:1px solid #ddd;
	width:100%;
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	place-items:center;
} 
.environmentBox {
	width:95%;
	height:80px;
	
	
	display:grid;
	grid-template-columns:1fr 30fr 1fr 2fr;
	grid-template-rows:1fr;
	place_items:center;

}

.btnBox{
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	place-items:center;
}

#leftBtnBox{
	text-align:right;
	margin:auto 0;
}
#rightBtnBox{
	text-align:left;
	margin:auto 0;
}

#filter{
	width:80px;
	height:50px;
	background-color:white;
	border-radius:10% 10% 10% 10%;
	font-size:15px;
	font-weight:bold;
	border:0.5px solid black;
	cursor:pointer;
}
#filter:hover{
	box-shadow: 0px 0px 5px #444;transition:0.5s;
}

.environments{
	white-space:nowrap;
	overflow:hidden;
	display:flex;
	position:relative;
	height:100%;
	place-items:center;
	box-sizing: border-box;
 	border-style: solid;
	border:0px solid #ddd;
	border-left:0px solid #f1f1f1;
	border-right:0px solid #f1f1f1;
}
.environment{
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr auto;
	height:60%;
	width:110px;
	min-width:110px;
	max-width:111px;
	font-size:13px;
	text-align:center;
	color:gray;
	cursor:pointer;
	
	transition:0.5s;
}
.environment_selected{
	border-bottom:1px solid black;
	font-size:bold;
	color:black;
}
.environment_picture{
	height:30px;
}
.environment:hover{
	border-bottom:1px solid #ddd;
	font-size:bold;
	color:black;
}
.environment img{
	height:25px;
	width:25px;
	margin:0px;
}

.environment_left{
	border-radius:50% 50% 50% 50%;
	border:1px solid black;
	cursor:pointer;
	z-index:1;
	background-color:white;
	display:none;
}
.environment_left:hover{border:2px solid black;font-weight:bold}
.environment_right{
	border-radius:50% 50% 50% 50%;
	border:1px solid black;
	cursor:pointer;
	z-index:1;
	background-color:white;
	display:none;
}
.environment_right:hover{border:2px solid black;font-weight:bold}
.environmentBox:hover div button{display:block;}

section{
	width:100%;
	margin-top:30px;
	display: grid;
    gap: 15px;
    grid-template-columns: repeat(auto-fill, 300px); /* 200px짜리 영역을 갯수만큼 만듬 */
    grid-auto-rows: 400px; /* 줄바꿈 될때마다 자동으로 200px 로우 생성 */
    &__card { /* 카드의 크기는 각 grid 영역으로 잡음 */
      width: 100%;
      height: 100%;
      background-color: #fff;
      box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.07);
      border-radius: 8px;
      padding:20px;
      font-size:1.4rem;
      display:flex;
      flex-direction: column;
      justify-content: space-between;
	}  

}

div[class*=portrait]{
	margin:10px;
}
div[class*=portrait]:hover{
	border-bottom:4px solid #ddd;
}




/*				modal css 부분 				*/


#modal{
	border:2px solid #ddd;
	border-radius:5% 5% 5% 5% / 50% 50% 50% 50%;
	background-color:white;
	height:60px;
	z-index:3;
	display:none;
	overflow:hidden;
}
#modal.show{
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	place-items:center;
	width:50%;
	min-width:515px;
}
.header_container2.hide{
	display:none;
}
#modal_background{
	top:0;
	left:0;
	position:fixed;
	width:100%;
	height:100%;
	background-color:rgb(0,0,0,0.2);
	z-index:2;
	display:none;
}
#modal_background.show{
	display:block;
}
#modal_content{
	display:grid;
	grid-template-columns:1fr 1fr 1fr;
	grid-template-rows:1fr;
	place-items:center;
	width:100%;
	height:100%;
	font-size:16px;
}
#modal_content div{
	width:100%;
	height:100%;
	text-align:center;
	line-height:60px;
	cursor:pointer;
}
#modal_content div:hover{
	background-color:#ddd;
}
#modal_content div:nth-child(-n+2){
	border-right:1px solid #ddd;
}
#searchbar.hide{
	display:none;
}
#just_sentence{
	display:none;
}
#just_sentence.show{
	display:block;
}
</style>
<div id=modal_background></div>
<body>




<header>
<div class=header_container>
		<div class=header_item>
			<a href="/main"><img id=logo src="/img/website/header_logo.png"></a>
		</div>
		<div class=header_item>
			<button id=searchbar>
				<div class=searchbar_item>어디든지</div>
				<div class=searchbar_item>언제든지</div>
				<div class=searchbar_item>게스트추가</div>
				<div class=searchbar_item><img id=search_img src="/img/website/search.png"></div>
			</button>
			<div id=just_sentence><h1>카테고리 검색</h1></div>
		</div>
		<div class=header_item>
			<div class=last_header_item_item title="향후개발예정"> 당신의 공간을 Yonolja하세요</div>
			<div class=last_header_item_item title="향후개발예정"><img id=world_img src="/img/website/earth.png"></div>
			<div class=last_header_item_item>
				<button id=mypage_button><img id=user_profile src="/img/website/user-profile.png"></button>
				<div class=sub>
				<% if( session.getAttribute("user_type")==null ){ %>
					<div class=sub_item onclick="location.href='/login'">로그인</div>
					<div class=sub_item onclick="location.href='/signin'">회원가입</div>
					<div class=sub_item onclick="location.href='/board'">고객문의 게시판</div>
				<% } else if(session.getAttribute("user_type").equals("customer")){ %>
					<div class=sub_item onclick="location.href='/mypage'">마이페이지</div>
					<div class=sub_item onclick="location.href='/logout'">로그아웃</div>
					<div class=sub_item onclick="location.href='/board'">고객문의 게시판</div>
				<% } else if(session.getAttribute("user_type").equals("owner")){ %>
					<div class=sub_item onclick="location.href='/mypage'">마이페이지</div>
					<div class=sub_item onclick="location.href='/logout'">로그아웃</div>
					<div class=sub_item onclick="location.href='/board'">고객문의 게시판</div>
				<% } else if(session.getAttribute("user_type").equals("admin")){ %>
					<div class=sub_item onclick="location.href='/admin'">관리자페이지</div>
					<div class=sub_item onclick="location.href='/logout'">로그아웃</div>
					<div class=sub_item onclick="location.href='/board'">고객문의 게시판</div>
				<% } %>
				</div>
			</div>
		</div>
</div>

<div id="modal">
		<div id="modal_content">
			<div><b>여행지</b></div>
			<div><b>날짜</b></div>
			<div><b>인원수</b></div>
		</div>
</div>



<div class=header_container2>

	<div class=environmentBox>
		<div id=leftBtnBox> <button class=environment_left> < </button> </div>
		<div class=environments>

		
	
		</div>
		<div id=rightBtnBox> <button class=environment_right> > </button> </div>
		<div class=btnBox>
			<button id=filter>필터</button>
		</div>
	</div>
</div>
</header>




<section>

	
	
</section>



<footer>
<div class=footer_container>
	<div class=footer_item>
		<div>
			© 2023 Waterbnb, Inc. · 개인정보 처리방침 · 이용약관 · 사이트맵 · 한국의 변경된 환불 정책 · 회사 세부정보
			&nbsp;&nbsp;&nbsp;&nbsp;
			<b>언어 : 한국어(KR) 
			통화 : \ won</b>
		</div>
	</div>
	<div class=footer_item>
		<div>
			지원 및 참고 자료
			웹사이트 제공자: Waterbnb continent KR, public limited company, 
			boosung street 1 82, cheonan | ceo : YT,HS,HY,MJ,TH | VAT 번호: x**4$123$0vv15 | 
			사업자 등록 번호: AB 5*****7 | 연락처: blueie2@naver.com, 웹사이트, 010-2952-0951 | 
			호스팅 서비스 제공업체: 아마존 웹서비스 | 
			워터비앤비는 통신판매 중개자로 워터비앤비 플랫폼을 통하여 게스트와 호스트 사이에 이루어지는 통신판매의 당사자가 아닙니다.
			워터비앤비 플랫폼을 통하여 예약된 숙소, 체험, 호스트 서비스에 관한 의무와 책임은 해당 서비스를 제공하는 호스트에게 있습니다.
		</div>
	</div>
</div>
</footer>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
////////////////////////////////////  javascript /////////////////////////////////////////

searchbar =  document.getElementById('searchbar');
modal = document.getElementById('modal');
header_container2 = document.getElementsByClassName('header_container2')[0];
modal_background = document.getElementById('modal_background');
just_sentence = document.getElementById('just_sentence');

searchbar.addEventListener('click',function(){
	if(! (header_container2.classList.contains('hide') && modal.classList.contains('show') ))
	{
		header_container2.classList.add('hide');
		modal.classList.add('show');
		modal_background.classList.add('show');
		this.classList.add('hide');
		just_sentence.classList.add('show');
	} 
})

document.addEventListener('click',function(event){
	if( event.target.id === 'modal_background' ){
		header_container2.classList.remove('hide');
		modal.classList.remove('show');
		modal_background.classList.remove('show');
		searchbar.classList.remove('hide');
		just_sentence.classList.remove('show');
	}
})


////////////////////////////////////  jquery	//////////////////////////////////////////
$(document)
.ready(function(){
	getPlaceEnvironments();
	getPlaces();
})
.on('click','.environment_left',function(){
	$('.environments').animate({scrollLeft:$('.environments').scrollLeft()-350},250)
})
.on('click','.environment_right',function(){
	$('.environments').animate({scrollLeft:$('.environments').scrollLeft()+350},250)
})

// environment 클릭시 그 환경을 가진 places 만 출력 
.on('click','.environment',function(){
	
	$('.environment_selected').removeClass('environment_selected');
	
	seq = $(this).attr('id');
	$(this).addClass('environment_selected');
	selected_environment = seq;
	getPlaces('environment');
})


// 내정보버튼 drop down
$('html').click(function(e){
	clicked = $(e.target).attr('id');
	if(clicked=='user_profile'||clicked=='mypage_button'){
		if( $('.sub').css('display')=='none'  ){ $('.sub').css('display','block')} 
		else { $('.sub').css('display','none')}
	} else { $('.sub').css('display','none') }
})
// 스크롤시 header 에 효과주기 
$(window).scroll(function(){
    if($(document).scrollTop() > 0) {
        $('.header_container2').addClass('movingHeader');
    } else {
        $('.header_container2').removeClass('movingHeader');
    }
});
/////////////////////////////////////////////////////////////////////////////////////////



/////////////////////////////////// global variables ////////////////////////////////////
let selected_environment = null;


/////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////// functions ////////////////////////////////////// 
// place-environments 를 채우는 function
function getPlaceEnvironments(){
	$('.environments').empty();
	
	$.ajax({url:'/getPlaceEnvironments', type:'post', dataType:'json', 
		
		success:function(data){
			
			for(i=0;i<data.length;i++){
				seq = data[i].seq;
				name = data[i].name;
				img = data[i].img;
				
				
				environment_str = '<div class=environment id='+ seq +'>';
				environment_str += '<div class=environment_picture>'
				environment_str += "<img src='" + img + "'>"
				environment_str += '</div>'
				environment_str += '<div class=environment_name>' + name + '</div>'
				environment_str += '</div>'
				$('.environments').append(environment_str);
			}
		}
	})
}
// portrait-maker 를 통해 section 에 places 내역을 채우는 function
function getPlaces(keyword){
	
	$('section').empty();
	
	
	
	$.ajax({url:'/getPlaces', type:'post', dataType:'json', 
		
		data:{
			
			keyword:keyword,
			selected_environment:selected_environment,
		
		},
		success:function(data){
			
			for(a=0;a<data.length;a++){
				
				seq = data[a].place_seq;
				name = data[a].place_name;
				price = data[a].place_price;
				address = data[a].place_address;
				imgs = data[a].place_imgs;
				reviewRate = data[a].place_reviewRate;
				
				portrait = makeStructure();
				portrait.setMoveToUrl("/place/"+seq);
				portrait.setBody(name,"★" + reviewRate ,address,/* price */ '');
				
				imgsArray = imgs.split(",");
				for(b=0;b<imgsArray.length;b++){
					portrait.add_picture(imgsArray[b]);
				}
				
				cssStr = portrait.getPortraitCss();
				tagStr = portrait.getPortrait();
				
				$('body').append(cssStr)
				$('section').append(tagStr)
				

			}		
			
		}
	
	})		// placePrice 는 나중에 db join 해서 1박기준 알아와야할듯.. 아니면 그냥 빈칸으로두던가
}

function getPlacesByKeyword(keyword){
	
	$('section').empty();
	
	$.ajax({url:'/getPlaces', type:'post', dataType:'json', 
		
		data:{keyword:keyword},
		
		success:function(data){
		
			for(a=0;a<data.length;a++){
				
				seq = data[a].place_seq;
				name = data[a].place_name;
				price = data[a].place_price;
				address = data[a].place_address;
				imgs = data[a].place_imgs;
				reviewRate = data[a].place_reviewRate;
				
				portrait = makeStructure();
				portrait.setMoveToUrl("/place/"+seq);
				portrait.setBody(name,"★" + reviewRate ,address,/* price */ '');
				
				imgsArray = imgs.split(",");
				for(b=0;b<imgsArray.length;b++){
					portrait.add_picture(imgsArray[b]);
				}
				
				cssStr = portrait.getPortraitCss();
				tagStr = portrait.getPortrait();
				
				$('body').append(cssStr)
				$('section').append(tagStr)
				

			}		
			
		}
	
	})		// placePrice 는 나중에 db join 해서 1박기준 알아와야할듯.. 아니면 그냥 빈칸으로두던가
}

// portrait-maker function
function makeStructure(){

    uuid = self.crypto.randomUUID();
    uuid = "a" + uuid.substring(0,10);

    portraitStructure = {
		
        test:function(){console.log('hi')},
        
        moveToUrl:null,
        setMoveToUrl:function(data){this.moveToUrl=data;},

        portrait_code:uuid+ "-portrait",
        portrait_style:'text-align:center;width:250px;height:400px;',
        // portrait_width:'300px',
        // portrait_height:'400px',
        set_portrait_width:function(data){this.portrait_width=data;},

        radio_code: uuid + '-slide',
        radio_id  : uuid + '-radio',
        radio_name: uuid + "-slide",

        head_code:uuid+ "-head",
        head_style:'width:100%;height:250px;position:relative;',
        // head_height:"300px",
        set_head_height:function(data){this.head_height=data;},

        pictureList_code:uuid+ "-pictureList",
        pictureList_style:'width:100%;height:100%;white-space:nowrap;overflow:hidden;padding:0px;font-size:0px;border:1px solid #ddd;border-radius:10% 10% 10% 10%;cursor:pointer;',
        pictureList_elements:[],    // 사용자입력 

        add_picture:function(data){this.pictureList_elements.push(data)},
        pictureList_li_code:uuid+ "-pictureList",
        pictureList_li_style:'list-style:none; display:inline-block; width:100%; height:100%; transition:0.5s;',

        control_code:uuid+ "-control",
        control_style:'font-weight:bold;',

        left_code:uuid+"-left",
        left_style:'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);left:10px;width:30px;height:30px;',
        left_img:"/img/test/left.png",

        right_code:uuid+"-right",
        right_style:'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);right:10px;width:30px;height:30px;',   
        right_img:"/img/test/right.png",

        body_code:uuid+ "-body",
        body_style:	'display:grid;grid-template-columns:3fr 1fr;grid-template-rows:0.5fr 1fr 1fr;height:100px;padding:0px;cursor:pointer;',
        // body_height:'100px',
		
        body_element_name:null,
        body_element_review:null,
        body_element_address:null,
        body_element_price:null,

        setBody:function(name,review,address,price){
            this.body_element_name = name;
            this.body_element_review = review;
            this.body_element_address = address;
            this.body_element_price = price;
        },     

        getPortrait:function(){
            
            if(this.pictureList_elements.length==0){console.log('portrait에 사진을 넣어주세요');return false;}

            radiostr = '';
            imgstr = '';
            controlstr = '';

            for(i=0;i<this.pictureList_elements.length;i++){
                
                if(i==0){
                    radiostr += '<input type=radio class=' + this.radio_code + ' id='+ this.radio_id + i + ' name='+ this.radio_name + ' style="display:none" checked>'
                } else {
                    radiostr += '<input type=radio class=' + this.radio_code + ' id='+ this.radio_id + i + ' name='+ this.radio_name +' style="display:none">'
                }
               
                
                imgstr += '<li class=' + this.pictureList_li_code + ' style="' + this.pictureList_li_style + '">'
                imgstr += '<img src="' + this.pictureList_elements[i] + '">'
                imgstr += '</li>'

                if(i==0){
                    controlstr += '<div class=' + this.control_code + i + ' style="'+ this.control_style +'">';
                    controlstr += '<label class=' + this.left_code + ' for=' + this.radio_id + (this.pictureList_elements.length-1) +' style='+ this.left_style +'>'
                    controlstr += '<img src="' + this.left_img +'" style="'+ this.left_style +'"></label>';
                    controlstr += '<label class=' + this.right_code + ' for=' + this.radio_id + (i+1) +' style='+ this.right_style +'>'
                    controlstr += '<img src="' + this.right_img +'" style="'+ this.right_style +'"></label>';
                    controlstr += '</div>'
                } else if(i==this.pictureList_elements.length-1){
                    controlstr += '<div class=' + this.control_code + i + ' style="'+ this.control_style +'">';
                    controlstr += '<label class=' + this.left_code + ' for=' + this.radio_id + (i-1) +' style='+ this.left_style +'>'
                    controlstr += '<img src="' + this.left_img +'" style="'+ this.left_style +'"></label>';
                    controlstr += '<label class=' + this.right_code + ' for=' + this.radio_id + (0) +' style='+ this.right_style +'>'
                    controlstr += '<img src="' + this.right_img +'" style="'+ this.right_style +'"></label>';
                    controlstr += '</div>'
                } else {
                    controlstr += '<div class=' + this.control_code + i + ' style="'+ this.control_style +'">';
                    controlstr += '<label class=' + this.left_code + ' for=' + this.radio_id + (i-1) +' style='+ this.left_style +'>'
                    controlstr += '<img src="' + this.left_img +'" style="'+ this.left_style +'"></label>';
                    controlstr += '<label class=' + this.right_code + ' for=' + this.radio_id + (i+1) +' style='+ this.right_style +'>'
                    controlstr += '<img src="' + this.right_img +'" style="'+ this.right_style +'"></label>';
                    controlstr += '</div>'
                }
            }

            portraitStr = "";
                                // 여기 sectionItem 임시로 전체클래스 준거임. 나중에 고치던가하셈
            portraitStr += '<div class=' + this.portrait_code + ' style="' + this.portrait_style +'">';
                portraitStr += radiostr;

                portraitStr += '<div class=' + this.head_code + ' style="' + this.head_style + '">'
                    
                    portraitStr += '<ul class=' + this.pictureList_code + ' style="' + this.pictureList_style + '" onclick=\'location.href="'+ this.moveToUrl +'"\'>' 
                        portraitStr += imgstr;
                    portraitStr += '</ul>'
                    
                    portraitStr += '<div class=' + this.control_code + '>';
                        portraitStr += controlstr;
                    portraitStr += '</div>'

                portraitStr += '</div>';

                portraitStr += '<div class=' + this.body_code + ' style="'+ this.body_style + '" onclick=\'location.href="'+ this.moveToUrl +'"\'>' 
                    portraitStr += '<div></div> <div></div>'
                    portraitStr += '<div style="text-align:left;font-weight:bold;">' + this.body_element_name + '</div>'
                    portraitStr += '<div style="text-align:right">' + this.body_element_review + '</div>'
                    portraitStr += '<div style="text-align:left;color:gray;">' + this.body_element_address + '</div>'
                    portraitStr += '<div></div>'
/*                  portraitStr += '<div style="text-align:left">' + this.body_element_price + '</div>'
                    portraitStr += '<div></div>' */
                portraitStr += '</div>';
            portraitStr += '</div>'

            return portraitStr;
        },

        getPortraitCss:function(){
            
            cssStr1 = '';
            cssStr2 = '';
            cssStr3 = '.' + this.head_code + " img{width:100%;height:100%}\n";
            cssStr4 = '.' + this.left_code + "{display:none;}\n";
            cssStr5 = '.' + this.right_code + "{display:none;}\n";

            for(i=0;i<this.pictureList_elements.length;i++){

                cssStr1 += "." + this.radio_code + ":nth-child(" + (i+1) + "):checked ~ ." + 
                            this.head_code + " ul li{transform:translateX(" + (i*(-100)) + "%);}\n" 
                
                if(this.pictureList_elements.length==1){
                	
                } else if(i==0){
                	cssStr2 += '.' + this.portrait_code + ":hover ." + this.radio_code +":nth-child(" + (i+1) + 
                    "):checked ~ ." + this.head_code + " div div:nth-child(" + (i+1) + ") ." + this.right_code +
                    "{display:block;}\n" 
                } else if(i==this.pictureList_elements.length-1){
                	cssStr2 += '.' + this.portrait_code + ":hover ." + this.radio_code +":nth-child(" + (i+1) + 
                    "):checked ~ ." + this.head_code + " div div:nth-child(" + (i+1) + ") ." + this.left_code +
                    "{display:block;}\n" 
                } else {
                	  cssStr2 += '.' + this.portrait_code + ":hover ." + this.radio_code +":nth-child(" + (i+1) + 
                      "):checked ~ ." + this.head_code + " div div:nth-child(" + (i+1) + ") label" +
                      "{display:block;}\n" 
                }
             
            }
            
            portraitCssStr = '<style>' + cssStr1 + cssStr2 +  cssStr3 + cssStr4 + cssStr5 + "</style>";

            return portraitCssStr;
        }

    }
    return portraitStructure;
}
/////////////////////////////////////////////////////////////////////////////////////////





</script>
</html>

