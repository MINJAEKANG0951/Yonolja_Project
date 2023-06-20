
function calendarMaker(){
	
	today = new Date();
	today_year = today.getFullYear();
	today_month = today.getMonth()+1;
    today_date = today.getDate();

    today_str = today_year + "-" + today_month + "-" + today_date;
    

	calendar = {

		calendarTable_id:'calendar',
		checkinInput_id:'checkin',
		checkoutInput_id:'checkout',
		leftButton_id:'calendar_left', 
		rightButton_id:'calendar_right',
        decideButton_id:'calendar_decide',
        resetButton_id:'calendar_reset',
        closeButton_id:'calendar_close',
        calendarInputId_year:'calendar_year',
        calendarInputId_month:'calendar_month',
		
        unbookableDate_className:'unbookable',
        bookableDate_className:'bookable',


		today:today_str,
		checkin_selected:null,
		unavailable_checkin:[],
		checkout_selected:null,
		unavailable_checkout:[],

        calendar_year:this.today_year,
        calendar_month:this.today_month,
        
        today_year:this.today_year,
        today_month:this.today_month,
		
		aimFor_checkin:null,
		aimFor_checkout:null,
		
		decided_checkin:null,
		decided_checkout:null,
		
		finishCode:null,
		closeCode:null,

        getTag:function(){
            // 초기생성 tag는 완성. 
            tag_str = '<table id=' + this.calendarTable_id + '>'
            tag_str += '<thead>'
			tag_str += '<tr><th colspan=7 align="right"> <span id='+ this.closeButton_id +'>&times;&nbsp;</span> </th></tr>'
            tag_str += '<tr> <th colspan=7>'
            tag_str += '<span id=guide>  </span>'
            tag_str += '</th></tr><tr>'
            tag_str += '<th colspan=7>'
            tag_str += '<input id=' + this.checkinInput_id + ' type=text placeholder=checkin readonly> -' + ' <input id=' + this.checkoutInput_id + ' type=text placeholder=checkout readonly>'
            tag_str += '</th> </tr>'
            tag_str += '<tr><th><button id='+ this.leftButton_id +'> < </button></th>'
            tag_str += '<th colspan=5><input id=' + this.calendarInputId_year + ' type=text readonly> 년' 
                                  + ' <input id=' + this.calendarInputId_month+ ' type=text readonly> 월 </th>'
            tag_str += '<th><button id='+ this.rightButton_id +'> > </button></th></tr>'
            tag_str += '<tr> <th>일</th> <th>월</th> <th>화</th> <th>수</th> <th>목</th> <th>금</th> <th>토</th> </tr>'
            tag_str += '</thead>'
            tag_str += '<tbody>'
            tag_str += '<tr> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>'
            tag_str += '<tr> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>'
            tag_str += '<tr> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>'
            tag_str += '<tr> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>'
            tag_str += '<tr> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>'
            tag_str += '<tr> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> <td></td> </tr>'
            tag_str += '</tbody>'
            tag_str += '<tfoot>'
            tag_str += '<tr>'
            tag_str += '<td colspan=7>'
            tag_str += '<button id='+ this.decideButton_id +'> 확인 </button>'
            tag_str += '<button id='+ this.resetButton_id + '> 다시 정하기 </button>'
            tag_str += '</td>'
            tag_str += '</tr>'
            tag_str += '</tfoot>'
            tag_str += '</table>' 
            return tag_str;
        },

        
		getCode:function(){
            
            code_str = '<script>';


            code_str = '</' + 'script>';

            return code_str;
        },


        getCss:function(){

            css_str = '<style>';
            css_str += '#' + this.calendarTable_id + '{width:100%;height:100%;border-collapse:collapse;border:0px solid black;}'
            css_str += '#' + this.calendarTable_id + ' tr:nth-child(1) th span{font-size:30px;font-weight:bold;color:#ddd;cursor:pointer}'
            css_str += '#' + this.calendarTable_id + ' tr:nth-child(1) th span:hover{color:black;}'
            css_str += '#' + this.calendarTable_id + ' th #guide{text-align:center;font-size:25px;font-weight:bold;}'
            css_str += '#' + this.calendarTable_id + ' th{width:75px;height:37px;}'
            css_str += '#' + this.calendarTable_id + ' thead tr:nth-child(3){border-bottom:1px solid #ddd;}'
            css_str += '#' + this.calendarTable_id + ' tr:nth-child(3) th input{width:130px;font-size:20px;text-align:center;border:0px;color:gray;}'
            css_str += '#' + this.calendarTable_id + ' tr:nth-child(4) th input:nth-child(1){width:45px;font-size:18px;text-align:right;border:0px}'
            css_str += '#' + this.calendarTable_id + ' tr:nth-child(4) th input:nth-child(2){width:20px;font-size:18px;text-align:right;border:0px}'
            css_str += '#' + this.calendarTable_id + ' tr:nth-child(4) th button{width:35px;height:35px;cursor:pointer;background-color:black;color:white;border:0px;border-radius:10px 10px 10px 10px;font-size:10px;}'
            css_str += '#' + this.calendarTable_id + ' tr:nth-child(4) th button:hover{background-color:#ddd;transition:0.3s;}'
            css_str += '#' + this.calendarTable_id + ' thead tr:nth-child(5){border-bottom:0px solid #ddd;}'
            css_str += '#' + this.calendarTable_id + ' tbody tr td{width:75px; height:37px; cursor:pointer; font-weight:bold;text-align:center}'
            css_str += '#' + this.calendarTable_id + ' tbody tr td:hover{background-color:#ddd;transition:0.5s;}'
            css_str += '#' + this.calendarTable_id + ' .unavailable{color:#ddd;}'
            css_str += '#' + this.calendarTable_id + ' .booked{text-decoration:line-through;color:#ddd;}'
            css_str += '#' + this.calendarTable_id + ' .checkined{background-color:black;color:white;box-shadow: 0 0 0 1px black inset;}'
            css_str += '#' + this.calendarTable_id + ' .checkouted{background-color:black;color:white;box-shadow: 0 0 0 1px black inset;}'
            css_str += '#' + this.calendarTable_id + ' tfoot {text-align:right}'
            css_str += '#' + this.calendarTable_id + ' tfoot button{width:115px;height:40px;background-color:black;color:white;font-size:15px;border-radius:15% 15% 15% 15% / 50% 50% 50% 50%;border:0px;margin:10px;cursor:pointer;}'
            css_str += '#' + this.calendarTable_id + ' tfoot button:hover{background-color:gray;transition:0.3s;}'
            css_str += '</style>'
			
            return css_str;
        },

        
        // table 의 날짜들을 채우는 function
        fillCalendar:function(){
           
           // checkin, checkinout 인풋에 객체에 저장된 checkin, checkout 값을 저장함.
           $('#' + this.checkinInput_id).val(this.checkin_selected);
           $('#' + this.checkoutInput_id).val(this.checkout_selected);
        	
        	// 한 번 비우고 나서 채움.   나중에 이 채우는것도 체크인이 있을때 채우는거/없을때 채우는거 다르게해야함.
           $('#' + this.calendarTable_id + ' tbody td').empty();
        	
		   calendarTime = new Date(this.calendar_year + "-" + this.calendar_month + "-" + 1);
		   todayTime = new Date(this.today)
		   
           $('#' + this.calendarInputId_year).val(this.calendar_year);
           $('#' + this.calendarInputId_month).val(this.calendar_month);
  		   
           start = calendarTime.getDay();
           
         
           // 사용될수도있는 가장 가까운 checkout 값을 구하기 쉽게 unavilable_checkout 을 정렬함
           for(i=0;i<this.unavailable_checkout.length;i++){
        	   for(j=i+1;j<this.unavailable_checkout.length;j++){
        		   cout1 = new Date( this.unavailable_checkout[i] );
        		   cout2 = new Date( this.unavailable_checkout[j] );
        		   if(cout1>cout2){
        			   tem = this.unavailable_checkout[i];
        			   this.unavailable_checkout[i] = this.unavailable_checkout[j];
        			   this.unavailable_checkout[j] = tem;
        		   }
        	   }
           }
        
           
           // 클래스 주기전에 모든 td class 초기화 
           $('#'+ this.calendarTable_id + ' tbody td').removeClass();
           $('#'+ this.calendarTable_id + ' tbody').fadeOut(0, function(){
        	   $(this).fadeIn(400);
           });
           
           if(this.checkin_selected==null){
        	   $('#'+ this.calendarTable_id + ' #guide').text('체크인 날짜를 선택')
           } else if(this.checkin_selected!=null && this.checkout_selected==null){
        	   $('#'+ this.calendarTable_id + ' #guide').text('체크아웃 날짜를 선택')
           } else {
        	   $('#'+ this.calendarTable_id + ' #guide').text("날짜를 선택하려면 '확인'버튼을 눌러주세요")
           }
           
           $('#'+ this.calendarTable_id + ' #guide').fadeOut(0, function(){
        	   $(this).fadeIn(400);
           });
      	   
           // td 에 class 주기
           for(i=start;i<$('#'+ this.calendarTable_id + ' tbody td').length;i++){
        	   
                   calendarMonth_a = calendarTime.getMonth(); // 시작(하루 더했을때 달이 증가하는지 보기위함)

                   // 여기서 날짜 입력하면서, td에 class 넣어주면됨. unavailable일지 available일지 정해서.
                   $('#'+ this.calendarTable_id + ' tbody td:eq('+i+')').text( calendarTime.getDate() );
               	   
                   calendarTimeStr = calendarTime.getFullYear() + ".";
                   calendarTimeStr += (calendarTime.getMonth()+1) + ".";
                   calendarTimeStr += calendarTime.getDate();

                   if(todayTime>calendarTime){ 
                	   $('#'+ this.calendarTable_id + ' tbody td:eq('+i+')').addClass('unavailable');
                   }
                   else if( // checkin 값이 없고, calendarTimeStr 이 unavailable_checkin 에 있을때
                        this.checkin_selected == null &&
                        this.unavailable_checkin.includes(calendarTimeStr)
                   ){
                        $('#'+ this.calendarTable_id + ' tbody td:eq('+i+')').addClass('booked');
                   }
                   else if(	// checkin 값이 있을때. 가장 가까운 checkout 날짜까지만 예약 가능해야함.
                		   	// checkin_selected 가 값이 있으면 여기서 조건처리가되고, 없으면 아래 else 에서 처리됨.
                		this.checkin_selected != null 
                   ){	
                	   checkinTime = new Date(this.checkin_selected);
                	   calendarTime = new Date(calendarTimeStr);      
	   
                	   // 한 이쯤에서 가장 가까운 checkout 날짜를 골라내는 코드를 가져오면 될듯 
              		   // 그런데 여기서 하면 for문돌면서 계속하니깐 sort 자체는 맨위에서 한번
              		   
              		   closestdate = null;
                	   for(j=0;j<this.unavailable_checkout.length;j++){
                		   if( !(checkinTime>=new Date(this.unavailable_checkout[j])) ){
                			   closestdate = new Date(this.unavailable_checkout[j])
                			   break;
                		   } 
                	   }	// 이 코드를 통해서 checkin 날짜와 가장 가까운 checkout 날짜(closest date) 를 구할 수 있음.
           
  	  				   // 참고로 data 객체는 동등비교가 불가능함. 늘 >= 또는 > 이런식으로 해야함. 거기에 동등비교도 포함되는거
                	   
                	   
                	   if(this.checkin_selected==calendarTimeStr){
                		   $('#'+ this.calendarTable_id + ' tbody td:eq('+i+')').addClass('checkined');
                	   } else if(this.checkout_selected==calendarTimeStr){
                		   $('#'+ this.calendarTable_id + ' tbody td:eq('+i+')').addClass('checkouted')
                	   } else if(calendarTime<checkinTime){
                		   $('#'+ this.calendarTable_id + ' tbody td:eq('+i+')').addClass('unavailable')
                	   } else if(calendarTime>checkinTime && closestdate==null){   
                		   // 가장 가까운날짜 이전까지는 available / 그 이후부터는 unavailable
                		   $('#'+ this.calendarTable_id + ' tbody td:eq('+i+')').addClass('available')
                	   } else if(calendarTime>checkinTime && closestdate==null){   
                		   $('#'+ this.calendarTable_id + ' tbody td:eq('+i+')').addClass('available')
                	   } else if(calendarTime>checkinTime && 
                			     closestdate!=null &&
                			     calendarTime<closestdate 
                	   ){   
                		   $('#'+ this.calendarTable_id + ' tbody td:eq('+i+')').addClass('available')
                	   } else if(calendarTime>checkinTime && 
	              			     closestdate!=null &&
	            			     calendarTime>=closestdate 
	            	   ){   
	            		   $('#'+ this.calendarTable_id + ' tbody td:eq('+i+')').addClass('unavailable')
	            	   } 
                	   // 일단 체크인 이전의 날들은 모두 unavailable 처리해야함. v
                	   // 그리고 체크인과 가장 가까운 체크아웃 가능한 날짜를 구하고, 그 둘의 사이만 available 해야함
                	   // 그리고, 가장 가까운 체크아웃 날 이후로는 unavailable 해야함.
                	   
                	   
                	   // 가장 가까운날까지만 예약 가능해야하고, 그 이후로의 날들은 모두 unavailable 처리해야함.
                	   // calendarTime 과 this.unavailable_checkout 에서 체크인 이후의 날중 가장 가까운애를 
                	   // 찾아서 비교를 한다음, 
                	   
                   } else {
                	   $('#'+ this.calendarTable_id + ' tbody td:eq('+i+')').addClass('available');
                   }
       				
                   
                   calendarTime.setDate( calendarTime.getDate()+1 ); // 하루증가시킴
                   calendarMonth_b = calendarTime.getMonth(); // 끝(하루 더했을때 달이 증가하는지 보기위함)	
                   if(calendarMonth_a!=calendarMonth_b){break;} // 증가했으면 달력에 숫자기입 종료
           }
            
         
           
        },
           
        // 왼쪽 버튼 눌렀을 때
        leftButtonCode:function(){
        	
        	// 1. calendar_year / calendar_month 바꾸기 
        	calendarTime = new Date(this.calendar_year + "-" + this.calendar_month + "-" + 1);
        	calendarTime.setMonth( calendarTime.getMonth()-1 );
        	this.calendar_year = calendarTime.getFullYear();
        	this.calendar_month = calendarTime.getMonth()+1;
        	
        	// 2. this.fillcalendar
        	this.fillCalendar();
        	
        },
        
        // 오른쪽 버튼 눌렀을 때
        rightButtonCode:function(){
        	
        	// 1. calendar_year / calendar_month 바꾸기 
        	calendarTime = new Date(this.calendar_year + '-' + this.calendar_month + '-' + 1);
        	calendarTime.setMonth( calendarTime.getMonth()+1 );
        	this.calendar_year = calendarTime.getFullYear();
        	this.calendar_month = calendarTime.getMonth()+1;
        	
        	// 2. this.fillcalendar
        	this.fillCalendar();
        	
        },
        
        
        
        // 아니면 checkinm, checkout 넣으면 알아서 날짜 정해주는 코드 
   		add_check:function(checkin, checkout){
   			
   			checkinTime = new Date(checkin);
   			checkoutTime = new Date(checkout);
   			
   			while(checkinTime<checkoutTime){
   				
   				checkinTime_year = checkinTime.getFullYear();
   				checkinTime_month = checkinTime.getMonth()+1;
   				checkinTime_date = checkinTime.getDate();
   				check_str = checkinTime_year + "." + checkinTime_month + "." + checkinTime_date;
   				
   				this.unavailable_checkin.push(check_str);
   				checkinTime.setDate( checkinTime.getDate() + 1 );
   				
   				checkinTime_year = checkinTime.getFullYear();
   				checkinTime_month = checkinTime.getMonth()+1;
   				checkinTime_date = checkinTime.getDate();
   				check_str = checkinTime_year + "." + checkinTime_month + "." + checkinTime_date;
   				
   				
   			
   	   			this.unavailable_checkout.push(check_str);
   				
   			}
   		
   		
   		},
   		
   		
   		
   		setAim:function(aim1,aim2){
			   
			   this.aimFor_checkin=aim1;
			   this.aimFor_checkout=aim2;
			   
		},
        
        getCheckin:function(){
			return this.decided_checkin;
		},
		
		getCheckout:function(){
			return this.decided_checkout;
		},
        
        
        setFinishCode:function(fun){
			this.finishCode = fun;
		},
		
		 setCloseCode:function(fun){
			this.closeCode = fun;
		}
		
	}
	
	
	// 이렇게해놓으면 버튼클릭시 작동함.
	$(document)
	.on('click','#'+calendar.leftButton_id, function(){
		calendar.leftButtonCode();
	})
	.on('click','#'+calendar.rightButton_id, function(){
		calendar.rightButtonCode();
	})
	
	// 
	.on('click','.available',function(){
		
		if(calendar.checkin_selected==null){
			str = calendar.calendar_year + "." + calendar.calendar_month + "." + $(this).text();
			calendar.checkin_selected = str;
		} else {
			str = calendar.calendar_year + "." + calendar.calendar_month + "." + $(this).text();
			calendar.checkout_selected = str;
		}
		
		calendar.fillCalendar();
	})
	
	//
	.on('click','#' + calendar.decideButton_id, function(){
		
		if(calendar.checkin_selected!=null && calendar.checkout_selected!=null){
			
			$('#' + calendar.aimFor_checkin).val(calendar.checkin_selected);
			$('#' + calendar.aimFor_checkout).val(calendar.checkout_selected);
			calendar.decided_checkin = calendar.checkin_selected;
	 		calendar.decided_checkout = calendar.checkout_selected;
		} else { 
			$('#' + calendar.aimFor_checkin).val(null);
			$('#' + calendar.aimFor_checkout).val(null);
			calendar.decided_checkin = null;
	 		calendar.decided_checkout = null;
		}
		
		
		calendar.finishCode();

	})
	.on('click','#' + calendar.resetButton_id, function(){
	   // 리셋하는 code
	   calendar.checkin_selected = null;
	   calendar.checkout_selected = null;
	   calendar.fillCalendar();
	   
	   $('#' + calendar.aimFor_checkin).val(null);
	   $('#' + calendar.aimFor_checkout).val(null);
	   
	   this.decided_checkin = null;
	   this.decided_checkout = null;
	})
	
	
	.on('click', '#' + calendar.closeButton_id, function(){
		
		calendar.closeCode();
		
	})
	
	/*
		필요한 functions : 
		
		1. calendar 를 만들 tag 문자열을 return 하는 function v
        2. calendar 에서 좌,우 누를시 달(month)가 변화되면서, calendar 내 날짜들이 갱신되게하는 function.
          (checkin_selected 가 null 이면 체크인고르기 / checkin_selected 가 null 이 아니면 체크아웃 고르기 ) v
        3. 체크인 달력에서, 오늘 이전날짜는 모두 unavailable 처리 v
        4. 체크인 달력에서, checkin_unavailalbe 에 해당하는 날짜들은 모두 unavailable 처리(다른사람들의 체크인날짜/숙박날짜들)

        5. 체크인 선택시 checkout 달력으로 갱신 v

        6. 체크아웃 달력에서, 체크인 이전날짜는 모두 unavailable 처리 v
        7. 체크아웃 달력에서, checkout_unavailable 에 해당하는 날짜들을 모두 unavailable 처리 / 가장 가까운 checkout_available 전까지 
           만 available 처리 v
	
	*/
	
	
	return calendar;
	
}