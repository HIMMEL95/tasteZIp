<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<%-- <jsp:useBean id="CodeServiceImpl" class="com.spopia.infra.modules.code.CodeServiceImpl"/> --%>

<!doctype html> 
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <title>Chat</title>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/order/mapBasic.css">
	<link rel="stylesheet" href="/resources/css/chat/chat.css">
	<script defer type="text/javascript" src="/resources/js/order/mapBasic.js"></script>
</head>

<body>
    <!-- start -->
    
    <main class="clearfix">
		<!-- sidebar s -->
    	<%@include file="../../xdmin/includeV1/mainSidebar.jsp"%>
		<!-- sidebar e -->
		<div class="map_container" id="container">
			<div class="sideInfo">
				<div class="handle">
					<input type="hidden" name="handle_value" id="handle_value" value="1">
					<button type="button" id="handle" class="btn_fold expand">접기</button>
				</div>
				<div class="panel">
					<div class="panel_top">
						<div class="ng-star-inserted">
							<form method="post" id="myForm" name="myForm">
								<input type="hidden" id="selectedRoom">
								<input type="hidden" id="cuMember" name="cuMember" value="${dto.ifmmSeq}">
								<!-- contents s -->
								<div class="contents">
									<div class="inbox_people">
										<div class="headind_srch">
											<div class="recent_heading">
												<h4 style="text-shadow: 2px 5px lightgrey;">My Chatting List</h4>
											</div>
										<div class="container" style="margin-top: 2rem;">
											<div class="row justify-content-center">
												<div class="SearchBox">
													<input type="text" class="SearchBox-input" placeholder="Search" name="shValue" value="${vo.shValue }">
													<button type="submit" class="SearchBox-button">
														<i class="SearchBox-icon  material-icons"><i class="fa-solid fa-magnifying-glass"></i></i>
													</button>
												</div>
											</div>
										</div>
									</div>
<%-- 									<h3 class="count" style="margin: 10px 15px;">친구 : ${count }</h3>
									<div class="inbox_chat friends"  id="friendsList">
										<ul class="friendsList">
											<c:forEach items="${list }" var="list" varStatus="status">
												<li class="room" id="${list.chatSeq }">
													<div class="chat_list">  <!-- active_chat -->
														<div class="chat_people">
															<div class="chat_img">
																<c:choose>
																	<c:when test="${empty list.path }">
																		<img src="https://intermusicakorea.com/common/img/default_profile.png" alt="profile" class="chatImg"> 
																	</c:when>
																	<c:otherwise>
																		<img src="${list.path }${list.uuidName}" alt="profile" class="chatImg"> 
																	</c:otherwise>
																</c:choose>
															</div>
															<div class="chat_ib">
																<input type="hidden" id="id${list.chatSeq }" value="${list.ifmmId }">
																<h3>${list.ifmmId }</h3>
															</div>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div> --%>
									<div class="inbox_chat chatList mt-3">
										<ul class="chatList">
											<c:choose>
												<c:when test="${fn:length(list) eq 0}">
													<div class="row justify-content-center">
														<div class="col text-center"><h4><b>채팅 목록이 존재하지 않습니다.</b></h4></div>
													</div>
												</c:when>
												<c:otherwise>
													<c:forEach items="${list }" var="list" varStatus="status">
														<input type="hidden" id="room${status.index }" name="roomNo" value="${list.chatSeq }">
														<input type="hidden" name="ifmmSeq" id="ifmmSeq${status.index }" value="${list.ifmmSeq }">
														<input type="hidden" name="userId" id="userId${list.chatSeq }" value="${list.ifmmId }">
														<li class="room" id="${list.chatSeq }" onclick="selectChatRoom(${list.chatSeq})">
															<div class="chat_list">  <!-- active_chat -->
																<div class="chat_people">
																	<div class="chat_img">
																		<input type="hidden" id="imgPath${list.chatSeq }" value="${list.path }${list.uuidName}">
																		<c:choose>
																			<c:when test="${empty list.path }">
																				<img src="https://intermusicakorea.com/common/img/default_profile.png" alt="profile1" class="chatImg"> 
																			</c:when>
																			<c:otherwise>
																				<img src="${list.path }${list.uuidName}" alt="profile" class="chatImg pro${list.chatSeq }"> 
																			</c:otherwise>
																		</c:choose>
																	</div>
																	<div class="chat_ib">
																	<h5>${list.ifmmId } <span class="chat_date lastTime">Dec 25</span></h5>
																	<p class="lastTalk${list.chatSeq }">Test, which is a new approach to have all solutions 
																		astrology under one roof.</p>
																	</div>
																</div>
															</div>
														</li>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</ul>
									</div>
									<!-- contents s -->
									<div class="contents talk" style="display: none;">
										<button type="button" class="backBtn" id="backBtn"><i class="fa-solid fa-arrow-left fa-2x"></i></button>
										<div class="container-fluid" style="hight: 50px; background: #E6E6E6;" >
											<div class="row hh">
												<div class="col-1 text-start" style="margin-left: 1rem;">
													<div class="chat_img">
														<img src="" alt="sunil" class="chatImg chatListImg">
													</div>
												</div>
												<div class="col-8 text-start">
													<h4><b class="userId"></b></h4>
												</div>
											</div>
										</div>
										<div class="mesgs">
											<div class="msg_history" id="chatBox">
												<!-- <div class="incoming_msg">
													<div class="chat_img">
														<img src=https://intermusicakorea.com/common/img/default_profile.png alt="sunil" class="chatImgSm">
													</div>
													<div class="received_msg">
														<div class="received_withd_msg">
															<p>Test, which is a new approach to have</p>
															<span class="time_date"> 11:01 AM    |    Yesterday</span>
														</div>
													</div>
												</div>
												<div class="outgoing_msg">
													<div class="sent_msg">
														<p>Apollo University, Delhi, India Test</p>
														<span class="time_date"> 11:01 AM    |    Today</span>
													</div>
												</div> -->
											</div>
										</div>
										<div class="type_msg">
											<div class="input_msg_write">
												<!-- <input type="text" id="chatMessage" class="write_msg" placeholder="Type a message" /> -->
												<textarea id="chatMessage" class="form-control type_msg" placeholder="Type your message..."></textarea>
												<button class="msg_send_btn" type="button" id="sendBtn"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
											</div>
										</div>
									</div>
									<!-- contents e -->	
								</div>
								<!-- <div class="float_bar" style="width:100%; height: 50px; display: flex; justify-content: space-around;" >
									<button type="button" id="friendsBtn"><i class="fa-solid fa-user-group fa-2x"></i></button>
									<button type="button" id="chatList"><i class="fa-solid fa-comments fa-2x"></i></button>
								</div> -->
							</div>
								<!-- contents e -->
							</form>
						</div>
					</div>
				</div>
			</div>
			<div id="map" style="width:100%;height:100%;"></div>
		</div>
    </main>

    <!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77c9d237ea96142d7fda7576f0a0fc7e&libraries=services"></script>
	<script type="text/javascript">
	
		$("#signOutBtn").on("click", function() {
			$.ajax({
				type: "POST"
				,url: "/logoutProc"
				,data: {}
				,success : function(response) {
					if (response.rt == "success") {
						window.location.href = "/tasteMain";
					} 
				}
			});
		});
		
		var goUrlLogin = "/login";
    	
    	$("#loginBtn").on("click", function() {
			window.location.href = goUrlLogin;
		})
	</script>
	<script type="module">

	import { initializeApp } from "https://www.gstatic.com/firebasejs/9.12.1/firebase-app.js";
	
  //Firebase 프로젝트에서 추출한 정보 입력
	const firebaseConfig = {
    apiKey: "AIzaSyBJt23BGLDNdnTcoj7Ut0EmEzKEI_z-bhQ",
    authDomain: "tastezip-8b9e4.firebaseapp.com",
    databaseURL: "https://tastezip-8b9e4-default-rtdb.firebaseio.com",
    projectId: "tastezip-8b9e4",
    storageBucket: "tastezip-8b9e4.appspot.com",
    messagingSenderId: "734649130564",
    appId: "1:734649130564:web:9c60fa95c8b7500dd4e611"
  };	
	// Initialize Firebase
	const app = initializeApp(firebaseConfig);

	import { getDatabase, ref, set, onValue }	from "https://www.gstatic.com/firebasejs/9.12.1/firebase-database.js";
	
	const db = getDatabase();

	var insMsg = document.getElementById("chatMessage");
	insMsg.addEventListener('keyup',enterKey);

	var sendBtn = document.getElementById("sendBtn");
	sendBtn.addEventListener('click',sendMessage);


	function enterKey() {
		
		var keycode = event.keyCode;
		
		if(keycode == 13) //Enter
			sendMessage();
	};
		
	function sendMessage(){

		var room = $("#selectedRoom").val();
	
		if(room == "") {
			//채팅방을 선택하지 않고 메세지 보내면 동작하지 않도록
			$("#chatMessage").val("");
			return;
		}

		var message = $("#chatMessage").val();

		//메시지 입력창 초기화
		$("#chatMessage").val("");
		
		//새 메세지 추가하면 채팅방에 이전 기록도 다시 다 불러와서 한번 비워줌
		$("#chatBox").html(""); 	
	
		//새 메세지를 Firebase / realtime database / chat / 채팅방seq / 시간대 / 작성자 / 메세지에 입력합니다.
		set(ref(db,'chat/'+room+'/'+getnow()+'/'+${sessSeq} ),{
			Masseage: message
		})

		//스크롤을 제일 아래로 유지
		$("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
	};
	
	function readMessage(e){

		const room = e.id; 
		$("#selectedRoom").val(room);
		
		const dbRef = ref(db, 'chat/'+room);
		const txt = "";
        onValue(dbRef,(snapshot) => {
            if(snapshot.key == $("#selectedRoom").val()){
				//채팅을 누르면 기존 채팅은 지우고 새로 불러오게
				$("#chatBox").html("");
                snapshot.forEach((childSnapshot) => {
                    const timetable = childSnapshot.key;
                    console.log(timetable); 
                    onValue(ref(db,'chat/'+room+'/'+timetable),(snapshot2) => {
                        snapshot2.forEach((childSnapshot2) => {
                            const writer = childSnapshot2.key
                            console.log(writer);
                        
                            onValue(ref(db,'chat/'+room+'/'+timetable+'/'+writer),(snapshot3) => {
                                snapshot3.forEach((childSnapshot3) => {
                                        const message = childSnapshot3.val()
                                        console.log(message);
										var txt = '';
										txt += '<div class="';
										txt += writer == ${sessSeq} ? 'outgoing_msg' : 'incoming_msg';
										txt += '">';
										txt += writer == ${sessSeq} ? '' : '<div class="chat_img"><img src="'+imgPath+'" alt="profile" class="chatImgSm"></div>';
										txt += writer == ${sessSeq} ? '<div class="sent_msg"><p>'+message+'</p><span class="time_date right">'+getTimeFormat(timetable)+'</span></div>' : '<div class="received_msg"><div class="received_withd_msg"><p>'+message+'</p><span class="time_date">'+getTimeFormat(timetable)+'</span></div></div>';
                                        $("#chatBox").append(txt);
                                        $("#chatBox").scrollTop($("#chatBox")[0].scrollHeight);
                                    });
                                }); 
                            }); 
                        });
                    });
                 }		
            });	
	}

	$(".room").click(function(){
		readMessage(event.currentTarget);
				
	}); 
	function getTimeFormat(timetable){
		//221105080634 
		return timetable.substring(0,2)+"-"+timetable.substring(2,4)+"-"+timetable.substring(4,6)+" "+timetable.substring(6,8)+":"+timetable.substring(8,10)+":"+timetable.substring(10,12);	
	}

	</script>
	<script type="text/javascript">
	
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
		
		var imgPath;
		selectChatRoom = function (roomNo) {
			imgPath = $("#imgPath"+roomNo).val();
			$(".pro"+roomNo).attr("src", $("#imgPath"+roomNo).val());
			/* $(".chatImgSm").attr("src", $("#imgPath"+roomNo).val()); */
			$(".userId").html($("#userId"+roomNo).val());
			$(".contents").css("display", "");
			$(".chatList").css("display", "none");
			$(".headind_srch").css("display", "none");
			
			if ($("#imgPath"+roomNo).val() == "") {
				$(".chatListImg").attr("src", "https://intermusicakorea.com/common/img/default_profile.png");
				$(".chatImgSm").attr("src", "https://intermusicakorea.com/common/img/default_profile.png");
			} else {
				$(".chatListImg").attr("src", imgPath);
				$(".chatImgSm").attr("src", imgPath);
			}
			
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
						/*var txt="";
						txt+='<li class="room" id="';
						txt+=result.newChat.chatSeq;
						txt+='" onclick="selectChatRoom(';
						txt+=result.newChat.chatSeq;
						txt+=')">';
						txt+='<div class="chat_list"><div class="chat_img"><input type="hidden" id="imagePath';
						txt+=result.newChat.chatSeq;
						txt+='" value="';
						if(result.newChat.path != null)
						{
							txt+=result.newChat.path;
							txt+=result.newChat.uuidName;
						}
						txt+='">';
						if(result.newChat.path != null) {
							txt+='<img src="'+result.newChat.path+result.newChat.uuidName+'" alt="profile1" class="chatImg">';
						} else {
							txt+='<img src="https://intermusicakorea.com/common/img/default_profile.png" alt="profile1" class="chatImg">';
						}
						txt+='</div><div class="chat_ib"><h5>';
						txt+=result.newChat.ifmmId;
						txt+='<span class="chat_date lastTime">Dec 25</span></h5>';
						txt+='<p>TEST TEXT FIELD</p>';
						txt+='</div>';
						txt+='</div>';
						txt+='</li>';
						$("#chatList").prepend(txt);*/
						location.reload();
					}else{
						alert("이미 등록된 친구 입니다!!(새로고침X)");
					}
				}
				,error:function(){
					alert("ajax error..!");
				}
			});
		}
		
		$("#backBtn").on("click", function() {
			$(".talk").css("display", "none");
			$(".chatList").css("display","");
			$(".headind_srch").css("display", "");
		})

		if ($("input[name=cuMember]").val() != "") {
			alert($("input[name=cuMember]").val())
			addChat();
		}
	</script>
	<script type="text/javascript">
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.5021008334827, 127.024465815419), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
		var mapTypeControl = new kakao.maps.MapTypeControl();
	
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
		// 지도에 교통정보를 표시하도록 지도타입을 추가합니다
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);    
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(container, options); 
	</script>
</body>

</html>