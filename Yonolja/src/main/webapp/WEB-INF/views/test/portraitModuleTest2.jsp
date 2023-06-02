<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<title>portraitModuleTest2</title>
</head>
<style>
section{
	display: grid;
    gap: 20px;
    grid-template-columns: repeat(auto-fill, 300px); /* 200px짜리 영역을 갯수만큼 만듬 */
    grid-auto-rows: 500px; /* 줄바꿈 될때마다 자동으로 200px 로우 생성 */
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
div[class*="portrait"]{
	margin:20px;
}

#hello:hover ~ #bye{display:block;}
</style>
<body>

<button id=makeportrait> 만들어! </button>
<section>


</section>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>

$(document)
.on('click','#makeportrait',function(){
	
	pstructure = makeStructure();
	pstructure.setBody('거북이집','★★★★','천안어딘가','1000원/박')
	pstructure.add_picture("/img/test/거북이1.png");
    pstructure.add_picture("/img/test/거북이2.png");
    pstructure.add_picture("/img/test/거북이3.png");
    
    tag = pstructure.getPortrait();
    $('section').append(tag);
    tagcss = pstructure.getPortraitCss();
    $('section').append(tagcss);
})







function makeStructure(){

    let uuid = self.crypto.randomUUID();
    uuid = "a" + uuid.substring(0,10);

    portraitStructure = {

        test:function(){console.log('hi')},

        portrait_code:uuid+ "-portrait",
        portrait_style:'text-align:center;width:300px;height:400px;',
        // portrait_width:'300px',
        // portrait_height:'400px',
        set_portrait_width:function(data){this.portrait_width=data;},

        radio_code: uuid + '-slide',
        radio_id  : uuid + '-radio',
        radio_name: uuid + "-slide",

        head_code:uuid+ "-head",
        head_style:'width:300px;height:300px;position:relative;',
        // head_height:"300px",
        set_head_height:function(data){this.head_height=data;},

        pictureList_code:uuid+ "-pictureList",
        pictureList_style:'width:100%;height:100%;white-space:nowrap;overflow:hidden;padding:0px;font-size:0px;border:1px solid #ddd;border-radius:10% 10% 10% 10%',
        pictureList_elements:[],    // 사용자입력 

        add_picture:function(data){this.pictureList_elements.push(data)},
        pictureList_li_code:uuid+ "-pictureList",
        pictureList_li_style:'list-style:none; display:inline-block; width:100%; height:100%; transition:0.5s;',

        control_code:uuid+ "-control",
        control_style:'font-weight:bold;',

        left_code:uuid+"-left",
        left_style:'position:absolute;cursor:pointer;top:45%;left:10px;width:30px;height:30px;',
        left_img:"/img/test/left.png",

        right_code:uuid+"-right",
        right_style:'position:absolute;cursor:pointer;top:45%;right:10px;width:30px;height:30px;',   
        right_img:"/img/test/right.png",

        body_code:uuid+ "-body",
        body_style:	'display:grid;grid-template-columns:3fr 1fr;grid-template-rows:0.5fr 1fr 1fr 1fr;height:100px;padding:0px;',
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
            
            portraitStr += '<div class=' + this.portrait_code + ' style="' + this.portrait_style +'">';
                portraitStr += radiostr;

                portraitStr += '<div class=' + this.head_code + ' style="' + this.head_style + '">'
                    
                    portraitStr += '<ul class=' + this.pictureList_code + ' style="' + this.pictureList_style + '">' 
                        portraitStr += imgstr;
                    portraitStr += '</ul>'
                    
                    portraitStr += '<div class=' + this.control_code + '>';
                        portraitStr += controlstr;
                    portraitStr += '</div>'

                portraitStr += '</div>';

                portraitStr += '<div class=' + this.body_code + ' style="'+ this.body_style +'">';
                    portraitStr += '<div></div> <div></div>'
                    portraitStr += '<div style="text-align:left;font-weight:bold;">' + this.body_element_name + '</div>'
                    portraitStr += '<div style="text-align:right">' + this.body_element_review + '</div>'
                    portraitStr += '<div style="text-align:left">' + this.body_element_address + '</div>'
                    portraitStr += '<div></div>'
                    portraitStr += '<div style="text-align:left">' + this.body_element_price + '</div>'
                    portraitStr += '<div></div>'
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
                
                cssStr2 += '.' + this.portrait_code + ":hover ." + this.radio_code +":nth-child(" + (i+1) + 
                            "):checked ~ ." + this.head_code + " div div:nth-child(" + (i+1) + ") label" +
                            "{display:block;}\n" 
            }
            
            portraitCssStr = '<style>' + cssStr1 + cssStr2 +  cssStr3 + cssStr4 + cssStr5 + "</style>";

            return portraitCssStr;
        }

    }


    return portraitStructure;
}














</script>
