
function makeFrame(){

    uuid = ( Math.random()*10000000000000 ) + "";
    uuid = "a" + uuid;
    uuid = uuid.replace(".","");
	// 원래 uuid 써야하는데, server돌릴때 보안상으로 차단되어서 mathrandom 으로 함 ㅋ;
	console.log(uuid);

    frame = {
		
        frameCode:uuid + "-frame",
        frameSize:'width:100%;height:100%',
        
        radio_code:uuid + "-slide", 
        radio_id:uuid + "-radio", 
        radio_name:uuid + "-slide",

        head_code:uuid + "-head",
        head_style:'width:100%;height:100%;position:relative;',

        pictureList_code:uuid + "-pictureList",
        pictureList_style:'width:100%;height:100%;white-space:nowrap;overflow:hidden;padding:0px;font-size:0px;border:1px solid #ddd;cursor:pointer;',
        pictureList_imgs:[],
        addPhoto:function(picture){
            this.pictureList_imgs.push(picture)
        },

        pictureList_li_code:uuid + "-pictureList_li",
        pictureList_li_style:'list-style:none; display:inline-block; width:100%; height:100%; transition:0.5s;',

        control_code:uuid + "-control",
        control_style:null,

        left_code:uuid + "-left",
        left_style:'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);left:10px;width:40px;height:40px;',
        left_img:"/img/test/left.png",

        right_code:uuid + "-right",
        right_style:'position:absolute;cursor:pointer;top:50%;transform:translateY(-50%);right:10px;width:40px;height:40px;',
        right_img:"/img/test/right.png",
        
        getTagStr:function(){

            if(this.pictureList_imgs.length==0){console.log("At least one picture is needed");return false;}

            radiostr = '';
            imgstr = '';
            controlstr = '';
            
            for(i=0;i<this.pictureList_imgs.length;i++){

                if(i==0){radiostr += '<input type=radio class=' + this.radio_code + ' id='+ this.radio_id + i + ' name='+ this.radio_name + ' style="display:none" checked>'}
                else{radiostr += '<input type=radio class=' + this.radio_code + ' id='+ this.radio_id + i + ' name='+ this.radio_name +' style="display:none">'}

                imgstr += '<li class=' + this.pictureList_code + ' style="' + this.pictureList_li_style + '">'
                imgstr += '<img src="' + this.pictureList_imgs[i] + '">'
                imgstr += '</li>'

                if(i==0){
                    controlstr += '<div class=' + this.control_code + i + ' style="' + this.control_style + '">'
                    controlstr += '<label class=' + this.left_code + ' for=' + this.radio_id + (this.pictureList_imgs.length-1) + ' style=' + this.left_style + '>'
                    controlstr += '<img src="' + this.left_img + '" style="' + this.left_style + '"></label>'
                    controlstr += '<label class=' + this.right_code + ' for=' + this.radio_id + (i+1) + ' style=' + this.right_style + '>'
                    controlstr += '<img src="' + this.right_img + '" style="' + this.right_style + '"></label>'
                    controlstr += '</div>'
                } else if(i==this.pictureList_imgs.length-1){
                    controlstr += '<div class=' + this.control_code + i + ' style="' + this.control_style + '">'
                    controlstr += '<label class=' + this.left_code + ' for=' + this.radio_id + (i-1) + ' style=' + this.left_style + '>'
                    controlstr += '<img src="' + this.left_img + '" style="' + this.left_style + '"></label>'
                    controlstr += '<label class=' + this.right_code + ' for=' + this.radio_id + (0) + ' style=' + this.right_style + '>'
                    controlstr += '<img src="' + this.right_img + '" style="' + this.right_style + '"></label>'
                    controlstr += '</div>'
                } else {
                    controlstr += '<div class=' + this.control_code + i + ' style="' + this.control_style + '">'
                    controlstr += '<label class=' + this.left_code + ' for=' + this.radio_id + (i-1) + ' style=' + this.left_style + '>'
                    controlstr += '<img src="' + this.left_img + '" style="' + this.left_style + '"></label>'
                    controlstr += '<label class=' + this.right_code + ' for=' + this.radio_id + (i+1) + ' style=' + this.right_style + '>'
                    controlstr += '<img src="' + this.right_img + '" style="' + this.right_style + '"></label>'
                    controlstr += '</div>'
                }
            }


            tagstr = '';
            
            tagstr = '<div class=' + this.frameCode + ' style="' + this.frameSize + '">'
            tagstr += radiostr;

            tagstr += '<div class=' + this.head_code + ' style="' + this.head_style + '">'
            tagstr += '<ul class=' + this.pictureList_code + ' style="' + this.pictureList_style + '">'
            tagstr += imgstr;
            tagstr += '</ul>'
            tagstr += '<div class=' + this.control_code + '>';
            tagstr += controlstr;
            tagstr += '</div>'
            tagstr += '</div>'

            tagstr += '</div>'
            return tagstr;
        },

        getCssStr:function(){

            cssStr1 = ''
            cssStr2 = ''
            cssStr3 = '.' + this.head_code + " img{width:100%;height:100%;}\n"
            cssStr4 = '.' + this.left_code + "{display:none;}\n";
            cssStr5 = '.' + this.right_code + "{display:none;}\n"
            
            for(i=0;i<this.pictureList_imgs.length;i++){

                cssStr1 += '.' + this.radio_code + ":nth-child(" + (i+1) + "):checked ~ ." +
                           this.head_code + " ul li{transform:translateX(" + (i*(-100)) + "%);}\n"

                if(this.pictureList_imgs.length==1){

                } else if(i==0){
                    cssStr2 += '.' + this.frameCode + ":hover ." + this.radio_code + ":nth-child(" + (i+1) +
                    "):checked ~ ." + this.head_code + " div div:nth-child(" + (i+1) + ") ." + this.right_code +
                    "{display:block;}\n"
                } else if(i==this.pictureList_imgs.length-1) {
                    cssStr2 += '.' + this.frameCode + ":hover ." + this.radio_code + ":nth-child(" + (i+1) +
                    "):checked ~ ." + this.head_code + " div div:nth-child(" + (i+1) + ") ."  + this.left_code +
                    "{display:block;}\n"
                } else {
                    cssStr2 += '.' + this.frameCode + ":hover ." + this.radio_code + ":nth-child(" + (i+1) +
                    "):checked ~ ." + this.head_code + " div div:nth-child(" + (i+1) + ") label" +
                    "{display:block;}\n"
                }

            }

            cssStr = '<style>' + cssStr1 + cssStr2 + cssStr3 + cssStr4 + cssStr5 + '</style>'

            return cssStr;

        }
    }

	


    return frame;

}
