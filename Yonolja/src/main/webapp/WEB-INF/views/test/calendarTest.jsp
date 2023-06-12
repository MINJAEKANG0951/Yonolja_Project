<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>로그인페이지</title>
</head>
<style>
table{
	border-collapse:collapse;
}
th input{
	width:60px;
}
td{
	border:1px solid black;
	width:40px;
	height:40px;
}
</style>
<body>


</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>

calendar = calendarMaker();
calendar.getTag();
calendar.codes();
$('body').append(calendar.getTag());

$('body').append(calendar.getCode());




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
        calendarInputId_year:'calendar_year',
        calendarInputId_month:'calendar_month',
		
        unbookableDate_className:'unbookable',
        bookableDate_className:'bookable',


		today:today_str,
		checkin_selected:null,
		unavailalbe_checkin:[],
		checkout_selected:null,
		unavailable_checkout:[],

        calendar_year:this.today_year,
        calendar_month:this.today_month,
        
        today_year:this.today_year,
        today_month:this.today_month,
		

        getTag:function(){
            // 초기생성 tag는 완성. 
            tag_str = '<table id=' + this.calendarTable_id + '>'
            tag_str += '<thead>'

            tag_str += '<tr> <th colspan=7>'
            tag_str += '<input id=' + this.checkinInput_id + ' type=text> -' + ' <input id=' + this.checkoutInput_id + 'type=text>'
            tag_str += '</th> </tr>'
            tag_str += '<tr><th><button id='+ this.leftButton_id +'> < </button></th>'
            tag_str += '<th colspan=5><input id=' + this.checkinInput_id + ' type=text value='+ this.calendar_year +'> 년' 
                                  + ' <input id=' + this.checkoutInput_id + 'type=text value='+ this.calendar_month +'>월</th>'
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
            tag_str += '</table>'
            tag_str += '<button id='+ this.decideButton_id +'> 결정하기 </button>'
            tag_str += '<button id='+ this.resetButton_id + '> 다시정하기 </button>' 
            return tag_str;
        },

        
        codes:function(){
            
            // calendar 를 채우는 function
            function FillCalendar(){
                calendarTime = new Date(this.calendar_year + "-" + this.calendar_month + "-" + 1);
                $('#' + this.calendarInputId_year).val(this.calendar_year);
                $('#' + this.calendarInputId_month).val(this.calendar_month);
                start = calendarTime.getDay();
                    
                for(i=start;i<$('#'+ this.calendarTable_id + ' td').length;i++){
    
                        calendarMonth_a = calendarTime.getMonth();
    
                        // 여기서 날짜 입력하면서, td에 class 넣어주면됨. unavailable일지 available일지 정해서.
            
                        $('#'+ this.calendarTable_id + ' td:eq('+i+')').text( calendarTime.getDate() );
                        calendarTime.setDate( calendarTime.getDate()+1 );
    
    
                        calendarMonth_b = calendarTime.getMonth();
    
                        if(calendarMonth_a!=calendarMonth_b){break;}
                }
            }

            $(document)
            // 1. 왼쪽, 오른쪽 button 누를시 년/월이 바뀌면서 달력이 초기화되는 기능
            .on('click','#'+this.leftButton_id,function(){
                // 날짜를 한달 줄임
                calendarTime = new Date( this.calendar_year + "-" + this.calendar_month + "-" + 1 );
                calendarTime.setMonth( calendarTime.getMonth()-1 );
                newYear = calendarTime.getFullYear();
                newMonth = calendarTime.getMonth()+1;
                
                this.calendarYear = newYear;
                this.calendarMonth = newMonth;

                FillCalendar();
                
            })
            .on('click','#'+this.rightButton_id,function(){
                
            })
            


        },

		getCode:function(){
            
            code_str = '<script>';


            code_str = '</' + 'script>';

            return code_str;
        },


        getCss:function(){

            css_str = '<style>';


            css_str += '</style>'

        },

        // 이를 모두 문자열로 모아놓은것을 return 하는 function.
		getCodeAndTag:function(){

        }
		
	}
	
	
	
	/*
		필요한 functions : 
		
		1. calendar 를 만들 tag 문자열을 return 하는 function
        2. calendar 에서 좌,우 누를시 달(month)가 변화되면서, calendar 내 날짜들이 갱신되게하는 function.
          (checkin_selected 가 null 이면 체크인고르기 / checkin_selected 가 null 이 아니면 체크아웃 고르기 )
        3. 체크인 달력에서, 오늘 이전날짜는 모두 unavailable 처리
        4. 체크인 달력에서, checkin_unavailalbe 에 해당하는 날짜들은 모두 unavailable 처리(다른사람들의 체크인날짜/숙박날짜들)

        5. 체크인 선택시 checkout 달력으로 갱신

        6. 체크아웃 달력에서, 체크인 이전날짜는 모두 unavailable 처리
        7. 체크아웃 달력에서, checkout_unavailable 에 해당하는 날짜들을 모두 unavailable 처리 / 가장 가까운 checkout_available 전까지 
           만 available 처리
	
	*/
	
	
	return calendar;
	
}

calendar = calendarMaker();
console.log(calendar.today)


/////////// 사용공간

console.log('hi')


</script>
</html>
