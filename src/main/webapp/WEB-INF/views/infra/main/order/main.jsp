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
    <title>Order</title>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/order/mapBasic.css">
	<link rel="stylesheet" href="/resources/css/order/main.css">
	<script defer type="text/javascript" src="/resources/js/order/mapBasic.js"></script>
</head>

<body>
    <!-- start -->
    
    <main class="clearfix">
		<div id="sidebar" class="sidebar">
			<div class="d-flex flex-column flex-shrink-0 bg-dark align-center" style="width: 4.5rem; height: 100vh;">
				<a href="/tasteMain" class="d-block p-3 link-dark text-decoration-none" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Icon-only">
					<img alt="" src="/resources/images/main/logo2.png" width="40" height="30">
					<span class="visually-hidden">Icon-only</span>
				</a>
				<ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
					<li class="nav-item">
						<a href="/order" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-credit-card text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="/favorite" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-heart text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="/chat" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-comments text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<!-- <li>
						<a href="/story" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-pen-to-square text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="/comment" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fa-regular fa-thumbs-up text-white" style="font-size: 22px;"></i>
						</a>
					</li> -->
					<li>
						<a href="/findWay" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fa-solid fa-signs-post text-white" style="font-size: 22px;"></i>
						</a>
					</li>
				</ul>
				<div class="dropdown">
					<a href="#" class="d-flex align-items-center justify-content-center p-3 link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="https://github.com/mdo.png" alt="mdo" width="30" height="30" class="rounded-circle">
					</a>
					<ul class="dropdown-menu text-small shadow" style="">
						<li><a class="dropdown-item" href="#">New project...</a></li>
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Profile</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><button type="button" id="signOutBtn" class="dropdown-item">Sign out</button></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="map_container" id="container">
			<form id="myForm" name="myForm">
				<div class="sideInfo">
					<div class="handle">
						<input type="hidden" name="handle_value" id="handle_value" value="1">
						<button type="button" id="handle" class="btn_fold expand">접기</button>
					</div>
					<div class="panel">
						<div class="panel_top">
							<!-- search s -->
							<div class="search">
								<div class="search_wrap">
									<div class="search_box">
										<button class="search_btn" type="button" id="search">검색</button>
										<div class="input_box">
											<label class="label_search">장소 검색</label>
											<input type="text" id="shValue" name="shValue" value="${vo.shValue }" autocomplete="none" autofocus class="input_search" oninput="change_text()">
										</div>
									</div>
								</div>
							</div>
							<!-- search e -->
							<div class="ng-star-inserted">
								<div class="main -top_space">
									<!-- weather s -->
									<div class="weather">
										<div class="weather_card">
											<div class="card_hearder">
												<a class="address">강남구 역삼1동</a>
												<button type="button" class="card_button">위치수정</button>
											</div>
											<div class="card_content">
												<a class="date_info_wrap"> 
													<dl class="weather_area">
														<div class="half">
															<dt class="time_text">오전</dt>
															<dd class="icon_weather1">
																<span class="blind">맑음</span>
															</dd>
														</div>
														<div class="half">
															<dt class="time_text">오후</dt>
															<dd class="icon_weather1">
																<span class="blind">맑음</span>
															</dd>
														</div>
													</dl>
													<dl class="temper_area">
														<div class="half">
															<dt class="blind">오전</dt>
															<dd class="temper">2</dd>
														</div>
														<div class="half">
															<dt class="blind">오후</dt>
															<dd class="temper">14</dd>
														</div>
													</dl>
												</a>
												<a class="dust_area ng-star-inserted">
													<dl class="dust_info_list">
														<div class="dust">
															<dt class="label">미세</dt>
															<dd class="value -good">좋음</dd>
														</div>
													</dl>
													<dl class="dust_info_list">
														<div class="dust">
															<dt class="label">초미세</dt>
															<dd class="value -good">좋음</dd>
														</div>
													</dl>
												</a>
											</div>
										</div>
									</div>
									<!-- weather e -->
									<!-- contents s -->
									<div class="contents">
										<div class="around_wrap">
											<h3 class="heading">
												<span class="blind">Smart Around</span>
											</h3>
											<div class="around_content">
												<div class="around_place_card ng-star-inserted">
													<h3 class="heading2">주변</h3>
													<div>
														<button type="button" class="option_selector_wrap">
															<strong class="point">아침/오전</strong>
															<span>시간대</span>
															<strong class="point">추천순</strong>
															<strong class="blind">설정 펼치기</strong>
														</button>
														<div _ngcontent-sea-c85="" class="option_value_wrap ng-star-inserted">
															<div _ngcontent-sea-c85="" class="time_option_area">
																<input _ngcontent-sea-c85="" type="radio" name="time" class="blind ng-star-inserted" id="time_MORNING" value="MORNING">
																<label _ngcontent-sea-c85="" class="time_option ng-star-inserted" for="time_MORNING">아침/오전</label>
																<input _ngcontent-sea-c85="" type="radio" name="time" class="blind ng-star-inserted" id="time_LUNCH" value="LUNCH">
																<label _ngcontent-sea-c85="" class="time_option ng-star-inserted" for="time_LUNCH">점심</label>
																<input _ngcontent-sea-c85="" type="radio" name="time" class="blind ng-star-inserted" id="time_AFTERNOON" value="AFTERNOON">
																<label _ngcontent-sea-c85="" class="time_option ng-star-inserted" for="time_AFTERNOON">오후</label>
																<input _ngcontent-sea-c85="" type="radio" name="time" class="blind ng-star-inserted" id="time_EVENING" value="EVENING">
																<label _ngcontent-sea-c85="" class="time_option ng-star-inserted" for="time_EVENING">저녁</label>
																<input _ngcontent-sea-c85="" type="radio" name="time" class="blind ng-star-inserted" id="time_NIGHT" value="NIGHT">
																<label _ngcontent-sea-c85="" class="time_option ng-star-inserted" for="time_NIGHT">심야</label>
															</div>
															<div _ngcontent-sea-c85="" class="sort_option_area">
																<input _ngcontent-sea-c85="" type="radio" name="sort" class="blind ng-star-inserted" id="sort_RECOMMEND" value="RECOMMEND">
																<label _ngcontent-sea-c85="" class="sort_option ng-star-inserted" for="sort_RECOMMEND">추천순</label>
																<input _ngcontent-sea-c85="" type="radio" name="sort" class="blind ng-star-inserted" id="sort_REVIEW" value="REVIEW">
																<label _ngcontent-sea-c85="" class="sort_option ng-star-inserted" for="sort_REVIEW">리뷰순</label>
															</div>
															<a _ngcontent-sea-c85="" target="_blank" class="button_help" href="https://m.help.naver.com/support/service/main.help?serviceNo=19898">
																<span _ngcontent-sea-c85="" class="blind">도움말</span>
															</a>
														</div>
													</div>
													<!-- 주변 카드 뷰 -->
													<div>
														<div class="card_wrap">
															<div class="card_inner">
																<div class="image_area">
																	<span class="image_count">
																		<em>1</em>
																		/10
																	</span>
																	<div class="iamge">
																		<img alt="" width="550" height="250" src="https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220726_123%2F16588060664715aleR_JPEG%2FKakaoTalk_Photo_2022-07-26-12-20-35_007.jpeg&type=f&size=340x180">
																	</div>
																	<button type="button" class="btn_go_entry">
																		<span class="blind">라브리크 서울 상세보기</span>
																	</button>
																	<div class="image_paging">
																		<button type="button" class="rolling_arrow -prev">
																			이전 이미지
																		</button>
																		<button type="button" class="rolling_arrow -next">
																			다음 이미지
																		</button>
																	</div>
																	<div class="text_area">
																		<div class="header_text_area">
																			<strong class="name_text">라브리크 서울</strong>
																			<span class="sub_text">디저트</span>
																		</div>
																	</div>
																	<p class="desc_text"> 뉴트럴 뉴브런치, 그리고 커피와 와인Light but not light 가볍지만 가볍지 않은 즐거움으로 여러분앞에 선사 하겠습니다. feel it coming </p>
																	<dl class="info_list">
																		<div class="info_item">
																			<dt class="term">
																				리뷰
																			</dt>
																			<dd class="desc">
																				<strong>70</strong>
																			</dd>
																		</div>
																		<div class="info_item">
																			<dt class="term">
																				평균
																			</dt>
																			<dd class="desc">
																				<strong>5,000</strong>원
																			</dd>
																		</div>
																	</dl>
																	<button type="button" class="btn_go_entry">
																		<span class="blind">라브리크 서울 상세보기</span>
																	</button>
																</div>
																<button type="button" class="btn_favorite">
																	<span class="blind">즐겨찾기 설정</span>
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- contents e -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div id="map" style="width:100%;height:100%;"></div>
		</div>
    </main>

    <!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <!-- <script  src="http://code.jquery.com/jquery-latest.min.js"></script> -->
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
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.5021008334827, 127.024465815419); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map); 

		/* // 카테고리로 은행을 검색합니다
		ps.categorySearch('FD6', placesSearchCB, {useMapBounds:true}); 

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		        }       
		    }
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });

		    // 마커에 클릭이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
		    });
		} */
		
		// 키워드로 장소를 검색합니다
		
		$("#shValue").on("keyup", function (key) {
			if(key.keyCode == 13) {
				$("#search").click();
			}
		});
		
		$("#search").on("click", function() {
			ps.keywordSearch($("#shValue").val(), placesSearchCB); 
		})

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });

		    // 마커에 클릭이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
		    });
		}
		
	</script>
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
		
		var content = $("#shValue").val();

		window.addEventListener("load", function() {
			if (content.length != 0) {
				$(".label_search").text("");
			}
		})
		
		change_text = function() {
			
			if (content != null || content != "") {
				$(".label_search").text("");
			}
			
			if (content.length == 0 || content == '') {
				$(".label_search").text("장소 검색");
			}
		};
	</script>
</body>

</html>