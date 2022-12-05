<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<jsp:useBean id="CodeServiceImpl" class="com.tasteZip.infra.modules.code.CodeServiceImpl"/>

<!doctype html> 
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <title>Menu</title>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/order/mapBasic.css">
	<link rel="stylesheet" href="/resources/css/order/menu.css">
	<script defer type="text/javascript" src="/resources/js/order/mapBasic.js"></script>
</head>

<body>
    <!-- start -->
    
    <main class="clearfix">
		<!-- sidebar s -->
    	<%@include file="../../xdmin/includeV1/mainSidebar.jsp"%>
		<!-- sidebar e -->
		<div class="map_container" id="container">
			<form id="myForm" name="myForm" action="post">
				<input type="hidden" name="ifstSeq" value="<c:out value="${item.ifstSeq}"/>"/>
				<input type="hidden" name="store" value="<c:out value="${store}"/>"/>
				<div class="sideInfo">
					<div class="handle">
						<input type="hidden" name="handle_value" id="handle_value" value="1">
						<button type="button" id="handle" class="btn_fold expand">접기</button>
					</div>
					<div class="panel">
						<div class="panel_top">
							<div class="ng-star-inserted">
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
								<!-- contents e -->
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div id="map" style="width:100%;height:100%;"></div>
    </main>

    <!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77c9d237ea96142d7fda7576f0a0fc7e&libraries=services"></script>
	<script>
	
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