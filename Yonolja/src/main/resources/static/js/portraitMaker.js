

function makeStructure(){
	/*
    uuid = self.crypto.randomUUID();
    uuid = "a" + uuid.substring(0,10);
    */
    uuid = ( Math.random()*10000000000000 ) + "";
    uuid = "a" + uuid;
    uuid = uuid.replace(".","-");
	// 원래 uuid 써야하는데, server돌릴때 보안상으로 차단되어서 mathrandom 으로 함 ㅋ;
	console.log(uuid);

    portraitStructure = {
		
        test:function(){console.log('makeStructure for portrait')},
        clickFunction:function(){alert('test')},
        
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
        body_style:	'display:grid;grid-template-columns:1fr 1fr;grid-template-rows:0.5fr 1fr 1fr;height:130px;padding:0px;cursor:pointer;',
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
                    
                    portraitStr += '<ul class=' + this.pictureList_code + ' style="' + this.pictureList_style + '">' 
                        portraitStr += imgstr;
                    portraitStr += '</ul>'
                    
                    portraitStr += '<div class=' + this.control_code + '>';
                        portraitStr += controlstr;
                    portraitStr += '</div>'

                portraitStr += '</div>';

                portraitStr += '<div class=' + this.body_code + ' style="'+ this.body_style + '">' 
                    portraitStr += '<div></div> <div></div>'
                    portraitStr += '<div style="text-align:left;font-weight:bold;font-size:20px;">' + this.body_element_name + '</div>'
                    portraitStr += '<div style="text-align:right;font-weight:bold;font-size:15px;">' + this.body_element_review + '</div>'
                    portraitStr += '<div style="text-align:left;color:gray;font-size:13px;grid-column:1/span 2;">' + this.body_element_address + '</div>'
                 	portraitStr += '<div style="text-align:left;font-weight:bold;grid-column:1/span 2;">' + this.body_element_price + '</div>' 
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

    },
    
    
    
    function setClickFunction(fun){
		portraitStructure.clickFunction = fun;
	}
    
    
    $(document)
    .on('click','.'+portraitStructure.pictureList_code,function(){
		portraitStructure.clickFunction();
	})
    
    
    
    return portraitStructure;
}