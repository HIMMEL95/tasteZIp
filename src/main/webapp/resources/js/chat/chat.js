getnow = function() {
				
	var timestamp = new Date().getTime();
	
	var date = new Date(timestamp); //타임스탬프를 인자로 받아 Date 객체 생성
	
	var year = date.getFullYear().toString().slice(-2); //년도 뒤에 두자리
	var month = ("0" + (date.getMonth() + 1)).slice(-2); //월 2자리 (01, 02 ... 12)
	var day = ("0" + date.getDate()).slice(-2); //일 2자리 (01, 02 ... 31)
	var hour = ("0" + date.getHours()).slice(-2); //시 2자리 (00, 01 ... 23)
	var minute = ("0" + date.getMinutes()).slice(-2); //분 2자리 (00, 01 ... 59)
	var second = ("0" + date.getSeconds()).slice(-2); //초 2자리 (00, 01 ... 59)
	
	return year+month+day+hour+minute+second;
};

selectChatRoom = function (roomNo) {
	alert("asd")
	$(".contents").css("display", "");
    
    var roomArray = $("li[name=room]");
    roomArray.each(function (index, item) {
        if (index != roomNo - 1)
            item.classList.remove("active");
        else
            item.classList.add("active");
    });


};

addChat = function(){

	$.ajax({
		url: '/chat/insChat'
		,type: 'POST'
		,datatype:'json'
		,data:{
			cuMember : $("#cuMember").val()
		}
		,success:function(result){
			if(result.rt=="success"){
				
				$("#cuMember").val("");
				var txt="";
				txt+='<li class="room" id="';
				txt+=result.newChat.chatSeq;
				txt+='" onclick="selectChatRoom(';
				txt+=result.newChat.chatSeq;
				txt+=')">';
				txt+='<div class="d-flex bd-highlight">';
				txt+='<div class="img_cont">';
				//아래 path 와 uuidname 도 본인의 dto field에 맞게 수정
				txt+='<img src="';
				if(result.newChat.path != null)
				{
					txt+=result.newChat.path + result.newChat.uuidName;
				}
				txt+='" class="rounded-circle user_img">';
				txt+='</div>';
				txt+='<div class="chat_product_info">';
				txt+='<span class="status">';
				txt+=result.newChat.ifmmId;
				txt+='</span>';
				txt+='<p>TEST TEXT FIELD</p>';
				txt+='</div>';
				txt+='</div>';
				txt+='</li>';
				$("#chatList").prepend(txt);
				location.reload();
			}else{
				alert("fail..!");
			}
		}
		,error:function(){
			alert("ajax error..!");
		}
	});

}