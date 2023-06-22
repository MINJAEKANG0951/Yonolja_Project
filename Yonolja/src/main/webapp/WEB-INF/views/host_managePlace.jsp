<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head> 
</head>
<style>

section{
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:100px auto auto;
	padding-top:20px;
	padding-left:100px;
	padding-right:100px;
	
}
section div{
	
}
#placeControl{
	display:grid;
	grid-template-columns:300px auto 400px;
	grid-template-rows:1fr;
	border:1px solid #ddd;
}

#placeName{
	font-size:35px;
	font-family:Georgia, "Malgun Gothic", serif;
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	place-items:center;
	justify-content:left;
}
#placeControlButtons{
	display:grid;
	grid-template-columns:1fr 1fr;
	grid-template-rows:1fr;
	place-items:center;
}
#placeControlButtons button{
	width:160px;
	height:40px;
	font-size:21px;
	background-color:rgb(0, 128, 255);
	color:white;
	border:0px solid white;
	border-radius:5px;
	cursor:pointer;
}
#placeControlButtons button:hover{
	background-color:blue;
	transition:0.5s;
}
#roomtypeControl{
	border:1px solid #ddd;
}
#roomtypeTB{
	width:100%;
	text-align:center;
	border-collapse:collapse;
}
#roomtypeTB_title{
	height:60px;
}
#roomtypeTB_title th{
	border-bottom:1px solid #ddd;
}
#roomtypeTB_title th:nth-child(1){
	text-align:center;
	font-size:23px;
}
#roomtypeTB_title th:nth-child(4){
	text-align:right;
}
#roomtypeTB tfoot td{
	border:1px solid #ddd;
}


#addRoomType{
	width:150px;
	height:40px;
	font-size:21px;
	background-color:rgb(0, 128, 255);
	color:white;
	border:0px solid white;
	border-radius:5px;
	cursor:pointer;
}
#addRoomType:hover{
	background-color:blue;
	transition:0.5s;
}
#roomtypeColumn{
	width:100%;
}
#roomtypeColumn th{
	border:1px solid #ddd;
	width:25%;
	font-size:20px;
}
.roomtype{
	cursor:pointer;
}

.roomtype:hover{
	background-color:#ddd;
	transition:0.5s;
}

.roomtype td{
	border-bottom:1px solid #ddd;
}
.roomtype_photo{
	border:1px solid black;
	width:150px;
	height:100px;
}

.roomtype td:nth-child(2){
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	place-items:center;
}

.roomtype_page{
	margin:5px;
	font-size:20px;
	cursor:pointer;
}
.roomtype_page:hover{
	background-color:#ddd;
	font-weight:bold;
}

/* 현영수정 */
.room{
	text-align:center;
	cursor:pointer;
}
.room:hover{
	background-color:#ddd;
	transition:0.3s;
}

#roomControl{
	display:grid;
	grid-template-columns:3fr 1fr;
	grid-template-rows:1fr;
	margin-top:20px;
}

#roomControl div{
	border:1px solid #ddd;
}
#roomControl_select{
	display:grid;
	grid-template-columns:3fr 1fr;
	grid-template-rows:1fr;
}

#roomlistTB {
	width:100%;
	border-collapse:collapse;
	text-align:center;
}
#roomlistTB thead tr{
	width:100%;
}
#roomlistTB thead tr th{
	width:33%;
	border:1px solid #ddd;
}

div[class*=frame]{
	z-index:10;
}

#roomControl_buttons button{
	background-color:rgb(0, 128, 255);
	border:0px;
	color:white;
	border-radius:5px;
	cursor:pointer;
}
#roomControl_buttons button:hover{
	background-color:blue;
	transition:0.3s;
}


.room_page{
	cursor:pointer;
	margin:5px;
	font-size:20px;
	cursor:pointer;
}
.room_page:hover{
	background-color:#ddd;
	transition:0.3s;
}

#addRoomModal_background{
	position:fixed;
	top:0;
	left:0;
	width:100%;
	height:100%;
	background-color:rgb(0,0,0,0.2);
	z-index:4;
	display:none;
}

#addRoomModal{
	position:fixed;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	width:300px;
	height:130px;
	background-color:white;
	border-radius:10px;
	box-shadow: 0px 3px 9px rgba(0,0,0,.5);
	
	text-align:center;
}

#addRoomModal input{
	width:90px;
}
#addRoomModal input::-webkit-outer-spin-button,
#addRoomModal input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}



#addRoomModal button{
	width:90px;
	background-color:rgb(0, 128, 255);
	color:white;
	border-radius:5px;
	border:0px;
	cursor:pointer;
}
#addRoomModal button:hover{
	background-color:blue;
	transition:0.3s;
}



#placeUpdate_background{
	position:fixed;
	top:0;
	left:0;
	width:100%;
	height:100%;
	background-color:rgb(0,0,0,0.2);
	z-index:4;
	display:none; 
}
#placeUpdate{
	position:fixed;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	width:400px;
	height:800px;
	background-color:white;
	border-radius:10px;
	box-shadow: 0px 3px 9px rgba(0,0,0,.5);
	
	text-align:center;
	border-collapse:collapse;

}
#placeUpdate td{
	border:1px solid #ddd;
}
#placeUpdate tr:nth-child(-n+8) td{
	height:40px;
}
#guideBox{
	position:relative;
}
#guideBox textarea{
	height:90%;
	width: 90%;
    border: 1px solid #ddd;
    resize: none;
}
#placeUpdateButtons button{
	width:140px;
	height:30px;
	font-size:18px;
	background-color:rgb(0, 128, 255);
	color:white;
	border:0px solid white;
	border-radius:5px;
	cursor:pointer;
}
#placeUpdateButtons button:hover{
	background-color:blue;
	transition:0.3s;
}
#place_environments{
	width:100%;
	padding-left:30px;
}

#place_environments_checkBoxes{
	width:90%;
	border-collapse:collapse;
}
#place_environments_checkBoxes td{
	border:0px solid #ddd;
	text-align:left;
}

#placeImgUpdate_background{
	position:fixed;
	top:0;
	left:0;
	width:100%;
	height:100%;
	background-color:rgb(0,0,0,0.2);
	z-index:4;
	display:none; 
}
#placeImgUpdate{
	position:fixed;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	width:600px;
	height:700px;
	background-color:white;
	border-radius:10px;
	box-shadow: 0px 3px 9px rgba(0,0,0,.5);
	
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:1fr;
	place-items:center;
}
#ImgUpdateBox{
	border:1px solid #ddd;
	width:90%;
	height:90%;
	
	display:grid;
	grid-template-columns:1fr;
	grid-template-rows:40px auto 50px;
}
#ImgUpdateBox div{
	
}

#placeImgBox_title{
	font-size:23px;
	font-weight:bold;
	border-bottom:1px solid #ddd;
}
#placeImgBox_buttons{
	border-top:1px solid #ddd;
	text-align:center;
}
#placeImgBox_buttons button{
	width:120px;
	height:30px;
	font-size:18px;
	background-color:rgb(0, 128, 255);
	color:white;
	border:0px solid white;
	border-radius:5px;
	cursor:pointer;
}
#placeImgBox_buttons button:hover{
	background-color:blue;
	transition:0.3s;
}
#placeImgBox{
	height: 500px;
    overflow: auto;
}

.placeImgFrame{
	float:left;
	position:relative;
	width:150px;
	height:150px;
	border:1px solid gray;
	margin:10px;
	cursor:pointer;
}
.placeImgFrame:hover{
	border:1px solid black;
}
.placeImg{
	position:absolute;
	width:100%;
	height:100%;
}

.deleteImg{
	position:absolute;
	width:20%;
	height:20%;
	right:10px;
	top:10px;
	cursor:pointer;
}
.deleteImg:hover{
	width:23%;
	height:23%;
	transition:0.3s;
}

</style>
<body>
<%@ include file ="./structure/header.jsp" %>
<input type=hidden id=place_seq value="${place_seq}" readonly>

<div id=placeImgUpdate_background>
	<div id=placeImgUpdate>
		<div id=ImgUpdateBox>
			<div id=placeImgBox_title>
				
			</div>
			
			<div id=placeImgBox>
				<!--  이런식으로 tag 를 생성할것임 -->
				<div class=placeImgFrame>
					<img class=placeImg src="/files/baa3b18f-상명 스테이1.PNG">
					<img class=deleteImg src="/img/website/xButton.png">
				</div>
				
			</div>	
			
			<div id=placeImgBox_buttons>
				<input type="file" id=placeImgInput accept="image/*">
				<button id=addPlacePhoto>사진추가</button> &nbsp;
				<button id=closePlaceImgModal>닫기</button>
			</div>
		</div>
	</div>
</div>


<div id=placeUpdate_background>
	<table id=placeUpdate>
		<tr><td colspan=2>숙박업소 정보 수정</td></tr>
		<tr>
			<td>숙박업소 이름</td> 
			<td><input type=text id=place_name></td> 
		</tr>
		
		<tr>
			<td>숙박업소 유형</td> 
			<td>
				<select id=place_types>
					
				</select>
			</td> 
		</tr>
		
		<tr>
			<td>체크인시간</td> 
			<td><input id=place_checkin type=time></td>
		</tr>
		<tr>
			<td>체크아웃시간</td> 
			<td><input id=place_checkout type=time></td> 
		</tr>
		<tr>
			<td>연락처</td> 
			<td><input id=place_mobile type=text></td> 
		</tr>
		<tr><td colspan=2>주소</td></tr>
		<tr>
			<td colspan=2 style="text-align:left;padding-left:60px;">
				<input type="address" class="address-input" id=pzip_code name=pzip_code placeholder="우편번호" readonly>&nbsp;<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>                                                                                               
		        <input type="address" id=paddress1 name=paddress1 readonly class="address2-input" placeholder="기본주소" required><br>
		        <input type="address" id=paddress2 name=paddress2 class="address2-input" placeholder="상세주소" required><br>
			</td> 
		</tr>		             
		<tr><td colspan=2>안내문</td></tr>
		<tr>
			<td colspan=2 id=guideBox>
				<textarea id=place_guide>
				
				</textarea>
			</td>
		</tr>
		<tr><td colspan=2>주변환경</td></tr>
		<tr>
			<td colspan=2 id=place_environments>
				<table id=place_environments_checkBoxes>
				
				</table>
			</td>
		</tr>
		<tr>
			<td colspan=2 id=placeUpdateButtons>
				<button id=place_update>등록</button> &nbsp;
				<button id=close_placeModal>닫기</button>
			</td> 
		</tr>
	</table>
</div>


<div id=addRoomModal_background>
	<table id=addRoomModal>
		<tr>
			<td colspan=2 style="text-align:center;font-weight:bold;font-size:20px;">
				객실추가
			</td>
		</tr>
		<tr>
			<td>
				<input type=number placeholder="객실번호입력" id=room_number>
			</td>
			<td>
				<select id=room_select_add>
					
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<button id=insertRoom>등록</button>
			</td>
			<td>
				<button id=closeAddRoomModal>닫기</button>
			</td>
		</tr>
	</table>
</div>






<section>

	<div id=placeControl>
		<div id=placeName></div>
		<div></div>
		<div id=placeControlButtons>
			<div>
				<button id="updatePlace">기본정보 수정</button>
			</div>
			<div>
				<button id="updatePlaceImg">이미지 관리</button>
			</div>
		</div>
	</div>
	
	<div id=roomtypeControl>
		<table id=roomtypeTB>
			<thead>
			
				<tr id=roomtypeTB_title>
					<th>보유 객실타입</th>
					<th></th>
					<th></th>
					<th><button id=addRoomType>객실타입추가</button>&nbsp;&nbsp;</th>
				</tr>
				<tr id=roomtypeColumn>
					<th>이름</th>
					<th>이미지</th>
					<th>수용인원</th>
					<th>1박 금액</th>
				</tr>
			</thead>
			
			<tbody>
				<!--  여기에 roomtype 넣기 -->
				<!-- 이런식으로 tag 가 들어가면 됨  
				<tr class=roomtype id=1>
					<td>싱글룸</td>
					<td><div class=roomtype_photo></div></td>
					<td>3명</td>
					<td>10,000</td>
				</tr>
				-->
			</tbody>
			
			<tfoot>
				<tr>
					<td colspan=4 id=rtPageNums>
				
					<td>
				</tr>
			</tfoot>
		</table>
	</div>
	
	<div id=roomControl>
		<div id=roomlist>
			<table id=roomlistTB>
				<thead>
					<tr>
						<th>객실타입</th>
						<th>객실번호</th>
						<th>전체선택 <input type=checkbox id=checkAllRooms></th>
					</tr>
				</thead>
				<tbody>
					<!--  이런 모양으로 넣으면 됨 -->
					<!--  
					<tr class=room id=2>
						<td>싱글룸</td>
						<td>201</td>
						<td><input type=checkbox value=room_seq></td>
					</tr>	
					-->
				</tbody>
				<tfoot>
					<tr>
					<td></td>
					<td colspan=2 id=rmPageNums>
						<!--  여기에 pageNums 가 들어감 -->
						<span class=room_page>1</span>
						<span class=room_page>2</span>
						<span class=room_page>3</span>
						<span class=room_page>4</span>
					</td>
					<td></td>
					</tr>
				</tfoot>			
			</table>
		</div>
		<div id=roomControl_select>
			<div>
				<select id=room_selectBox>
					
				</select>
			</div>
			<div id=roomControl_buttons>
				<button id=roomDelete>삭제</button>
				<button id=roomAdd>추가</button>
			</div>
		</div>
	</div>

</section>



</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript" src="/js/frameMaker.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

///////////////////////////// javascript ///////////////////////////////


document.addEventListener('click',function(event){
	

	if(event.target.id==='addRoomModal_background'){
		$('#addRoomModal_background').css('display','none');
	} else if(event.target.id==='placeUpdate_background'){
		$('#placeUpdate_background').css('display','none');
		$('html').css('overflow','auto');
	} else if(event.target.id==='placeImgUpdate_background'){
		$('#placeImgUpdate_background').css('display','none');
		$('html').css('overflow','auto');
	}
		
		
})
document.addEventListener('scroll',function(event){
	$('#addRoomModal_background').css('display','none');
})


///////////////////////////// global variables //////////////////////////

let currentRoomTypePage = 1;
let currentRoomPage = 1;
let howmanyUnits = 4;
let howmanyRoomUnits = 5;


let place_types = [];
let place_environments = [];
let roomtype_options = [];


/////////////////////////////// jquery //////////////////////////////////
$(document)
.ready(function(){
	
	loadPlaceTypes();
	loadPlaceEnvironments();
	loadRoomTypeOptions();	// 콜백으로 해야 할 수 도 있다.
		
	roomType_search();
	
	
	loadRoomTypes();
	loadrtPageNums();
	refresh_placeImg();
})
.on('click','.roomtype td:nth-child(1)',function(){ // 아직 안만듬
	  rtseq = $(this).parent().attr('id');
	  alert(rtseq)
})
.on('click','.roomtype td:nth-child(3)',function(){ // 아직 안만듬
	  rtseq = $(this).parent().attr('id');
	  alert(rtseq)
})
.on('click','.roomtype td:nth-child(4)',function(){ // 아직 안만듬
	  rtseq = $(this).parent().attr('id');
	  alert(rtseq)
})

.on('click','.roomtype_page',function(){
	currentRoomTypePage = parseInt($(this).text())
	loadRoomTypes();
	loadrtPageNums();
})
.on('change','#room_selectBox',function(){
	currentRoomPage = 1;
	loadRooms();
	loadrmPageNums();
})
.on('click','.room_page',function(){
	currentRoomPage = parseInt($(this).text())
	loadRooms();
	loadrmPageNums();
})
.on('click','#checkAllRooms',function(){
	if( $(this).prop('checked') ){
		for(i=0;i<$('.roomCheckBox').length;i++){
			$('.roomCheckBox:eq('+i+')').prop('checked',true);
		}
	} else {
		for(i=0;i<$('.roomCheckBox').length;i++){
			$('.roomCheckBox:eq('+i+')').prop('checked',false);
		}
	}
})
.on('click','#roomDelete',function(){
		
	str = ''
	for(i=0;i<$('.roomCheckBox:checked').length;i++){
		if(i==0){str += $('.roomCheckBox:checked:eq('+i+')').val();}
		else {str += "," + $('.roomCheckBox:checked:eq('+i+')').val();}
	}
	
	if(!confirm("정말 해당 객실(들)을 삭제하시겠습니까?")){
		return false;
	}
	
	$.ajax({url:'/deleteRoom', type:'post', 
		
		data:{roomSeqs:str},
		complete:function(){
			currentRoomPage = 1;
			loadRooms();
			loadrmPageNums();
		}
		
	})
	
})
.on('click','#roomAdd',function(){
	$('#addRoomModal_background').css('display','block');
})
.on('click','#closeAddRoomModal',function(){
	$('#addRoomModal_background').css('display','none');
})
.on('click','#insertRoom',function(){
	
	// 1. ajax 로 유효성 검사
	// 2. complete function 에 유효성검사 결과에 따라
	//    insert 할지 말지를 결정.
	
	place_seq = parseInt($('#place_seq').val());
	$.ajax({url:'/addRoomInvalidation', type:'post', dataType:'text',
		
		data:{ 
			place_seq:place_seq,
			room_number:$('#room_number').val()
		},
		
		success:function(response){
			
			if(response=="doit"){
				// addRoom
				addRoom();
			} else {
				// addRoom 안함(아무것도 안함/client에게 같은방있다고 전해줌)
				alert('이미 존재하는 객실번호입니다');
			}
			
		}
		
	})
})
.on('click','#updatePlace',function(){
	loadPlaceInfo();
	$('html').css('overflow','hidden');
	$('#placeUpdate_background').css('display','block');
})
.on('click','#close_placeModal',function(){
	$('html').css('overflow','auto');
	$('#placeUpdate_background').css('display','none');
})
.on('click','#place_update',function(){
	updatePlace();
})
.on('click','#updatePlaceImg',function(){
	refresh_placeImg();
	$('#placeImgUpdate_background').css('display','block');
	$('html').css('overflow','hidden');
})
.on('click','#closePlaceImgModal',function(){
	$('#placeImgUpdate_background').css('display','none');
	$('html').css('overflow','auto');
})
.on('click','#addPlacePhoto',function(){
	$('#placeImgInput').trigger('click');
})
.on('input','#placeImgInput',function(){
	
	place_seq = parseInt($('#place_seq').val());
	
	var formData = new FormData();
	var img = $('#placeImgInput')[0].files[0];
	
	formData.append('place_seq',place_seq)
	formData.append('img',img);
	
	$.ajax({url:'/addPlaceImg', type:'post', dataType:'text',
		processData: false,
	    contentType: false,
		data:formData,
		success:function(result){
			alert(result);
		}, 
		complete:function(){
			refresh_placeImg();
		}
		
	})
})

/////////////////////////////// functions ///////////////////////////////
function refresh_placeImg(){
	
	
	place_seq = parseInt($('#place_seq').val());
	
	$('#placeImgBox').empty();
	$.ajax({url:'/getPlaceImgs', type:'post', dataType:'text',
			
		data:{place_seq:place_seq},
		success:function(img){	
		
			if(img!=""){
				imgs = img.split(",");
				for(i=0;i<imgs.length;i++){
					str = '<div class=placeImgFrame>'
					str +='<img class=placeImg src="' + imgs[i] + '">'
					str +='<img class=deleteImg src="/img/website/xButton.png">' 
					str +='</div>'
					
					$('#placeImgBox').append(str);
				}	
			} else {
				$('#placeImgBox').append('<span>등록된 이미지가 업습니다</span>');
			}
		
		},
		complete:function(){
			
		}
	})
	
	
	
}


function updatePlace(){
	
	place_seq = parseInt($('#place_seq').val());
	
	address = $('#pzip_code').val() + "," + $('#paddress1').val() + "," + $('#paddress2').val();
	
	evmStr = ''
	for(i=0;i<$('.placeEnvironment').length;i++){
		
		if( $('.placeEnvironment:eq('+i+')').prop('checked')){
			evmStr += "," + $('.placeEnvironment:eq('+i+')').val();
		}
		
	}
	evmStr = evmStr.substring(1)
	
	$.ajax({url:'/updatePlace', type:'post', dataType:"text",
		
		data:{
			
			place_seq:place_seq,
			place_name:$('#place_name').val(),
			place_type_seq:$('#place_types option:selected').val(),
			place_checkin:$('#place_checkin').val(),
			place_checkout:$('#place_checkout').val(),
			place_mobile:$('#place_mobile').val(),
			place_address:address,
			place_guide:$('#place_guide').val(),
			place_environment:evmStr
			
		},
		success:function(result){
			alert(result);
			$('#placeUpdate_background').css('display','none');
			$('html').css('overflow','auto');
		},
		complete:function(){
			loadPlaceInfo();
		}
	})	
}

function putPlaceTypes(){
	
	$('#place_types').empty();
	
	str = ''
	for(i=0;i<place_types.length;i++){
		type = place_types[i];
		str += '<option value='  + type.seq + '>' 
		str += type.name;
		str += '</option>'
	}
	
	$('#place_types').append(str);
}
function placeEnvironments(){
	
	$('#place_environments_checkBoxes').empty();
	
	str = ''
	
	for(i=0;i<place_environments.length;i++){
		evm = place_environments[i];
		
		str+='<td><input class=placeEnvironment type=checkbox value=' + evm.seq + '>&nbsp;' 
		str+= evm.name
		str+='</td>'
		if((i+1)%3==0){
			str = '<tr>' + str + '</tr>';
		}	
	}
		
	str +=''
	
	$('#place_environments_checkBoxes').append(str);
}

function loadPlaceTypes(){
	place_types = [];
	
	$.ajax({url:'/getAllPlaceTypes', type:'post', dataType:'json',
		success:function(data){
			for(i=0;i<data.length;i++){
				
				data[i].seq
				data[i].name
				data[i].img
				
				dictionary = {seq:data[i].seq, name:data[i].name, img:data[i].img};
				place_types.push(dictionary);
			}
		},
		complete:function(){
			console.log(place_types);
			putPlaceTypes();
			loadPlaceInfo(); 
		}
	})
}
function loadPlaceEnvironments(){
	place_environments = [];
	
	$.ajax({url:'/getAllPlaceEnvironments', type:'post', dataType:'json',
		success:function(data){
			for(i=0;i<data.length;i++){
				
				data[i].seq
				data[i].name
				data[i].img
				
				dictionary = {seq:data[i].seq, name:data[i].name, img:data[i].img};
				place_environments.push(dictionary);
			}
		},
		complete:function(){
			console.log(place_environments);
			placeEnvironments();
		}
	})
}
function loadRoomTypeOptions(){
	roomtype_options = [];
	
	$.ajax({url:'/getAllRoomTypeOptions', type:'post', dataType:'json',
		success:function(data){
			for(i=0;i<data.length;i++){
				
				data[i].seq
				data[i].name
				data[i].img
				
				dictionary = {seq:data[i].seq, name:data[i].name, img:data[i].img};
				roomtype_options.push(dictionary);
			}
		},
		complete:function(){
			console.log(roomtype_options);
		}
	})
}


function addRoom(){
	
	// 방 더하는 함수 
	$.ajax({url:'/addRoom', type:'post', 
		
		data:{
			roomtype_seq:$('#room_select_add option:selected').val(),
			room_number:$('#room_number').val()
		},
		complete:function(){
			$('#addRoomModal_background').css('display','none');
			currentRoomPage=1;
			loadRooms();
			loadrmPageNums();
		}
	
	})
	
}

function loadPlaceInfo(){
	$.ajax({url:'/getPlaceInfo', type:'post', dataType:'json', 	
		data:{place_seq:$('#place_seq').val()},
		success:function(place){
			// 1. placeName 띄우기
			$('#placeName').text(place.name);
			$('#placeImgBox_title').text(place.name + " 사진관리")
			
			// modal 에 placeInfo load
			
			// 이름
			$('#place_name').val(place.name);
			// 유형
			$('#place_types option:selected').prop('selected',false);
			for(i=0;i<$('#place_types option').length;i++){
				if( $('#place_types option:eq('+i+')').val() ==
					place.type_seq )
				{
					$('#place_types option:eq('+i+')').prop('selected',true);
					break;
				}
			}
			
			// 체크인,체크아웃,전화번호
			$('#place_checkin').val(place.checkin_time);
			$('#place_checkout').val(place.checkout_time);
			$('#place_mobile').val(place.mobile);
			
			$('#pzip_code').val( place.address.split(",")[0] );
			$('#paddress1').val( place.address.split(",")[1] );
			$('#paddress2').val( place.address.split(",")[2] );
			
			$('#place_guide').val(place.guide);
			
			
			$('.placeEnvironment:checked').prop('checked',false);
			placeEvms = place.environment.split(",");
			for(i=0;i<$('.placeEnvironment').length;i++){
				for(j=0;j<placeEvms.length;j++){
					if(placeEvms[j]==$('.placeEnvironment:eq('+i+')').val() ){
						$('.placeEnvironment:eq('+i+')').prop('checked',true);
						break;
					}
				}
			}
			
			
		}
	})
}

function loadRoomTypes(){
	
	place_seq = parseInt($('#place_seq').val());
	
	$('#roomtypeTB tbody').empty();
	
	$.ajax({url:'/getPlaceRoomTypes', type:'post', dataType:'json',
		
		data:{
			place_seq:place_seq,
			pageNum:currentRoomTypePage,
			howmanyUnits:howmanyUnits
		},
		
		success:function(roomtypes){
			
			for(a=0;a<roomtypes.length;a++){
				
				roomtype = roomtypes[a];
				
				/*
				roomtype.seq;
				roomtype.name;
				roomtype.imgs;
				roomtype.capacity;
				roomtype.price;
				*/
				roomtypeFrame = makeFrame();
				roomtypeFrame.left_img = "/img/website/roomtype_left.png"
				roomtypeFrame.right_img = "/img/website/roomtype_right.png"
				roomtypeFrame.left_style = 'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);left:7px;width:30px;height:30px;'
				roomtypeFrame.right_style = 'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);right:7px;width:30px;height:30px;'
				roomtypeFrame.pictureList_style = 'width:100%;height:100%;white-space:nowrap;overflow:hidden;padding:0px;font-size:0px;cursor:pointer;'
				
				if( roomtype.imgs!=null ){
					roomtypeImgs = roomtype.imgs.split(",");
					for(j=0;j<roomtypeImgs.length;j++){
						roomtypeFrame.addPhoto(roomtypeImgs[j]);
					}
				} else {
					roomtypeFrame.addPhoto('/img/website/noimg.png');
				}
				
				str = '<tr class=roomtype id=' + roomtype.seq + '>'
				str +='<td>' + roomtype.name + '</td>'
				str +='<td><div class=roomtype_photo>' + roomtypeFrame.getTagStr() + '</div></td>'
				
				str +='<td>' + roomtype.capacity + '명' + '</td>'
				str +='<td>' + parseInt(roomtype.price).toLocaleString() + '원</td>'
				str += '</tr>'
				
				$('body').append( roomtypeFrame.getCssStr() );
				$('#roomtypeTB tbody').append(str);
	
				
			}	
		}
	})
}
function loadrtPageNums(){
	
	place_seq = parseInt($('#place_seq').val());
	
	$('#rtPageNums').empty();
	
	$.ajax({url:'/getRoomTypePageNums', type:'post', dataType:'text',
		
		data:{
			place_seq:place_seq,
			howmanyUnits:howmanyUnits
		},
		
		success:function(howmanyPages){
			
			str = ''
			for(i=0;i<parseInt(howmanyPages);i++){
				str += '<span class=roomtype_page>' + (i+1) + '</span>' 
			}
			$('#rtPageNums').append(str);
			
		}
	
	})
}

function loadRooms(){
	
	place_seq = parseInt($('#place_seq').val());
	
	$('#roomlistTB tbody').empty();

	$.ajax({url:'/getPlaceRooms', type:'post', dataType:'json',
		
		data:{
			
			place_seq:place_seq,
			pageNum:currentRoomPage,
			howmanyUnits:howmanyRoomUnits,
			selected_roomType:$('#room_selectBox option:selected').val()
		},
		
		success:function(rooms){
			
			for(i=0;i<rooms.length;i++){
				room = rooms[i];
		
				str = '<tr class=room id=' + room.seq + '>'
				str +='<td>' + room.type_name + '</td>'
				str +='<td>' + room.number + '</td>'
				str +='<td><input type=checkbox value=' + room.seq + ' class=roomCheckBox></td>'
				str +='</tr>'
					
				$('#roomlistTB tbody').append(str);
			}
		}
	})
}

function loadrmPageNums(){
	
	place_seq = parseInt($('#place_seq').val());
	
	$('#rmPageNums').empty();
	
	$.ajax({url:'/getRoomPageNums', type:'post', dataType:'text',
		
		data:{
			place_seq:place_seq,
			howmanyUnits:howmanyRoomUnits,
			selected_roomType:$('#room_selectBox option:selected').val()
		},
		
		success:function(howmanyPages){
			
			str = ''
			for(i=0;i<parseInt(howmanyPages);i++){
				str += '<span class=room_page>' + (i+1) + '</span>' 
			}
			$('#rmPageNums').append(str);
			
		}
	
	})
}

function roomType_search(){
	
	place_seq = parseInt($('#place_seq').val());
	
	$('#room_selectBox').empty();
	$.ajax({url:'/searchPlaceRoomTypes', type:'post', dataType:'json',
		
		data:{ place_seq:place_seq },
		
		success:function(roomtypes){
			
			str = '' 
			for(c=0;c<roomtypes.length;c++){
				roomtype = roomtypes[c];
				str += '<option value=' + roomtype.seq +'>'
				str += roomtype.name
				str += '</option>'
			}
			
			$('#room_select_add').append(str);
			str = '<option value=-1>모든객실조회</option>' + str;
			$('#room_selectBox').append(str);
		},
		
		complete:function(){
			currentRoomPage=1;
			loadRooms();
			loadrmPageNums();
		}
	})
}








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
</body>
</html>
