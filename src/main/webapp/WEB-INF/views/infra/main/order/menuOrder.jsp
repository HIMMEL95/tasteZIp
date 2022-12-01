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
    <title>menuOrder</title>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/order/mapBasic.css">
	<link rel="stylesheet" href="/resources/css/order/menuOrder.css">
	<script defer type="text/javascript" src="/resources/js/order/mapBasic.js"></script>
</head>

<body>
    <!-- start -->
    
    <main class="clearfix">
		<!-- sidebar s -->
    	<%@include file="../../xdmin/includeV1/mainSidebar.jsp"%>
		<!-- sidebar e -->
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
										<button class="search_btn" type="button">검색</button>
										<div class="input_box">
											<label class="label_search">장소, 버스, 지하철, 도로 검색</label>
											<input type="text" id="placeSearch" autocomplete="none" autofocus class="input_search">
										</div>
									</div>
								</div>
							</div>
							<!-- search e -->
							<div class="ng-star-inserted entry-layout">
								<!-- content s -->
								<div class="row">
									<div href="#" role="button" class="DDfpb col-2">
										<img class="back" alt="" src="https://cdn-icons-png.flaticon.com/512/54/54321.png"> 
									</div>
									<div class="col">
										<h4 class="col" style="margin-top: 12px;">에그드랍 신논현역점</h4>
									</div>
								</div>
								<div class="place_fixed_maintab">
									<div class="Jxtsc MpTT1" role="tablist" data-nclicks-area-code="tab">
										<div class="ngGKH">
											<div class="flicking-viewport" style="user-select: none; -webkit-user-drag: none; touch-action: pan-y;">
												<div class="flicking-camera" style="transform: translate(0px);">
													<a href="/restaurant/1470422298/home?from=map&amp;fromPanelNum=2&amp;ts=1666591774818" role="tab" class="tpj9w _tab-menu" aria-selected="false" title="" id="" style="width: 200px;">
														<span class="veBoZ">홈</span>
													</a>
													<a href="/restaurant/1470422298/menu?from=map&amp;fromPanelNum=2&amp;ts=1666591774818" role="tab" class="tpj9w _tab-menu" aria-selected="true" title="" id="" style="width: 200px;">
														<span class="veBoZ">메뉴</span>
													</a>
													<a href="/restaurant/1470422298/review?from=map&amp;fromPanelNum=2&amp;ts=1666591774818" role="tab" class="tpj9w _tab-menu" aria-selected="false" title="" id="" style="width: 200px;">
														<span class="veBoZ">예약</span>
													</a>
													<a href="/restaurant/1470422298/review?from=map&amp;fromPanelNum=2&amp;ts=1666591774818" role="tab" class="tpj9w _tab-menu" aria-selected="false" title="" id="" style="width: 200px;">
														<span class="veBoZ">리뷰</span>
													</a>
												</div>
											</div>
										</div>
										<div class="naver_order place">
											<div class="order_info_area">
												<div class="info_main">
													<div class="info_main_title">
														<div class="title">
															<svg viewBox="0 0 18 18" class="ico_n_logo">
																<path fill-rule="evenodd" d="M18 0v18H0V0h18zM7.255 4.582H4.473v9.054h2.915V8.79l3.357 4.846h2.782V4.582h-2.915v4.846L7.255 4.582z"></path>
															</svg>
															주문
														</div>
														<div class="title_logo">
															<div class="logo_thumb">
																<img class="thumb" src="https://naverbooking-phinf.pstatic.net/20210525_218/162190971282744RH1_PNG/image.png?type=f110_110" width="39" height="39" alt="brand logo">
															</div>
														</div>
													</div>
													<div class="info_main_notice">
														<div class="notice_desc">
															<div class="desc_type ico_takeout">
																포장주문이 가능한 가게입니다.
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="naver_order_contents">
											<div class="section_contents local_pay place">
												<div class="order_area">
													<div class="smart_category slick-slider general_place">
														<div class="category_box">
															<div class="category_box_inner">
																<div class="category_scroll">
																	<span class="blur_left"></span>
																	<button class="slick-arrow slick-prev slick-disabled" type="button">
																		<svg viewBox="0 0 10 13" class="ico_arrow">
																			<path d="M3.1 12.2L2 11.1l4.2-4.2L2 2.6l1.1-1.1 5.4 5.4-5.4 5.3z"></path>
																		</svg>
																		<span class="blind">이전</span>
																	</button>
																	<ul class="category_list" style="position: relative;">
																		<div class="category_active" style="height: 29px; transform: translate3d(18px, 0px, 0px); width: 55px;"></div>
																		<li id="category_3234748_PICKUP" class="category_item" data-active="true">
																			<a href="#" class="tab active">
																				<span class="tab_text" data-active="true" style="transition: color 0.3s ease 0s;">추천</span>
																			</a>
																		</li>
																		<li id="category_2575392_PICKUP" class="category_item" data-active="false">
																			<a href="#" class="tab">
																				<span class="tab_text" data-active="false" style="transition: color 0.3s ease 0s;">1인 세트메뉴</span>
																			</a>
																		</li>
																		<li id="category_3234751_PICKUP" class="category_item" data-active="false">
																			<a href="#" class="tab">
																				<span class="tab_text" data-active="false" style="transition: color 0.3s ease 0s;">NEW EGG DROP</span>
																			</a>
																		</li>
																		<li id="category_3234752_PICKUP" class="category_item" data-active="false">
																			<a href="#" class="tab">
																				<span class="tab_text" data-active="false" style="transition: color 0.3s ease 0s;">EGG SANDWICH</span>
																			</a>
																		</li>
																		<li id="category_2575392_PICKUP" class="category_item" data-active="false">
																			<a href="#" class="tab">
																				<span class="tab_text" data-active="false" style="transition: color 0.3s ease 0s;">1인 세트메뉴</span>
																			</a>
																		</li>
																		<li id="category_3234751_PICKUP" class="category_item" data-active="false">
																			<a href="#" class="tab">
																				<span class="tab_text" data-active="false" style="transition: color 0.3s ease 0s;">NEW EGG DROP</span>
																			</a>
																		</li>
																		<li id="category_3234752_PICKUP" class="category_item" data-active="false">
																			<a href="#" class="tab">
																				<span class="tab_text" data-active="false" style="transition: color 0.3s ease 0s;">EGG SANDWICH</span>
																			</a>
																		</li>
																	</ul>
																	<button class="slick-arrow slick-next" type="button">
																		<svg viewBox="0 0 10 13" class="ico_arrow">
																			<path d="M3.1 12.2L2 11.1l4.2-4.2L2 2.6l1.1-1.1 5.4 5.4-5.4 5.3z"></path>
																		</svg>
																		<span class="blind">다음</span>
																	</button>
																	<span class="blur_right"></span>
																</div>
															</div>
														</div>
													</div>
													<div class="order_list" style="overflow-y: scroll; height: 453px;">
														<div class="order_list_wrap">
															<div class="order_list_inner">
																<div class="order_list_tit">
																	<span class="title">새로 나온 메뉴</span>
																</div>
																<ul class="order_list_area">
																	<li class="order_list_item">
																		<div class="item_info">
																			<a href="#" class="info_link">
																				<div class="info_img">
																					<span class="img_box">
																						<img class="img" src="https://naverbooking-phinf.pstatic.net/20220729_261/16590576950643sgnW_PNG/3_%C0%DA%B8%F9%BF%A1%C0%CC%B5%E5_A_1200X1200.png?type=f220_220_60_sharpen" width="100%" height="100%" alt="섬네일">
																					</span>
																				</div>
																				<div class="info_detail">
																					<div class="tit">
																						자몽 에이드
																						<span class="ico_group">
																							<i class="ico_new">N</i>
																						</span>
																					</div>
																					<div class="detail">
																						<span class="detail_txt">
																							자몽의 상큼함을 가득 담은 시원한 자몽 에이드
																						</span>
																					</div>
																					<div class="price">
																						3,600<!-- -->원
																					</div>
																				</div>
																			</a>
																			<a href="#" class="btn_shop" role="button">
																				<div class="btn_box">
																					<svg viewBox="0 0 16 16" class="ico_cart" aria-label="주문하기">
																						<path fill-rule="evenodd" d="M6.14 12.519A1.74 1.74 0 116.139 16a1.74 1.74 0 01.001-3.481zm4.8 0A1.74 1.74 0 1110.939 16a1.74 1.74 0 01.001-3.481zm-4.8 1.052a.688.688 0 100 1.376.688.688 0 000-1.376zm4.8 0a.688.688 0 100 1.376.688.688 0 000-1.376zM2.506 2.4c.24 0 .449.173.5.415l.376 1.784h11.306c.342 0 .588.34.49.677l-1.829 6.3a.512.512 0 01-.49.376h-8.56a.515.515 0 01-.501-.414L2.093 3.452H.512A.519.519 0 010 2.926c0-.29.23-.526.512-.526zM14 5.651H3.604L4.711 10.9h7.766l1.524-5.249z"></path>
																					</svg>
																				</div>
																			</a>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
														<div class="order_list_wrap store_delivery">
															<div class="order_list_inner">
																<div class="order_list_tit">
																	<span class="title">1인 세트메뉴</span>
																	<button type="button" class="btn_fold2">
																		<i class="fa-solid fa-angle-down"></i>
																	</button>
																</div>
																<ul class="order_list_area mb-3">
																	<li class="order_list_item">
																		<div class="item_info">
																			<a href="#" class="info_link">
																				<div class="info_img">
																					<span class="img_box">
																						<img class="img" src="https://naverbooking-phinf.pstatic.net/20220823_108/166121414680370cPU_PNG/1%C0%CE%BC%BC%C6%AE_1_%B9%CC%BD%BA%C5%CD%BF%A1%B1%D7_1200X1200.png?type=f220_220_60_sharpen" width="100%" height="100%" alt="섬네일">
																					</span>
																				</div>
																				<div class="info_detail">
																					<div class="tit">
																						미스터에그 세트
																						<span class="ico_group"></span>
																					</div>
																					<div class="detail">
																						<span class="detail_txt">&lt;미스터에그 + 해쉬브라운 + 아메리카노&gt; 부드러운 스크램블 에그와 브리오쉬, 에그드랍의 특제 소스가 어우러진 샌드위치와 고소하고 부드러운 해쉬브라운, 아메리카노를 합리적인 가격으로 즐길 수 있는 ※세트메뉴음료 변경 시 에이드와 탄산음료는 HOT을 선택하여도 차가운 음료로 제공됩니다.</span>
																					</div>
																					<div class="price">7,400원</div>
																				</div>
																			</a>
																			<a href="#" class="btn_shop" role="button">
																				<div class="btn_box">
																					<svg viewBox="0 0 16 16" class="ico_cart" aria-label="주문하기">
																						<path fill-rule="evenodd" d="M6.14 12.519A1.74 1.74 0 116.139 16a1.74 1.74 0 01.001-3.481zm4.8 0A1.74 1.74 0 1110.939 16a1.74 1.74 0 01.001-3.481zm-4.8 1.052a.688.688 0 100 1.376.688.688 0 000-1.376zm4.8 0a.688.688 0 100 1.376.688.688 0 000-1.376zM2.506 2.4c.24 0 .449.173.5.415l.376 1.784h11.306c.342 0 .588.34.49.677l-1.829 6.3a.512.512 0 01-.49.376h-8.56a.515.515 0 01-.501-.414L2.093 3.452H.512A.519.519 0 010 2.926c0-.29.23-.526.512-.526zM14 5.651H3.604L4.711 10.9h7.766l1.524-5.249z"></path>
																					</svg>
																				</div>
																			</a>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
														<div class="order_list_wrap store_delivery">
															<div class="order_list_inner">
																<div class="order_list_tit">
																	<span class="title">1인 세트메뉴</span>
																	<button type="button" class="btn_fold2">
																		<i class="fa-solid fa-angle-down"></i>
																	</button>
																</div>
																<ul class="order_list_area mb-3">
																	<li class="order_list_item">
																		<div class="item_info">
																			<a href="#" class="info_link">
																				<div class="info_img">
																					<span class="img_box">
																						<img class="img" src="https://naverbooking-phinf.pstatic.net/20220823_108/166121414680370cPU_PNG/1%C0%CE%BC%BC%C6%AE_1_%B9%CC%BD%BA%C5%CD%BF%A1%B1%D7_1200X1200.png?type=f220_220_60_sharpen" width="100%" height="100%" alt="섬네일">
																					</span>
																				</div>
																				<div class="info_detail">
																					<div class="tit">
																						미스터에그 세트
																						<span class="ico_group"></span>
																					</div>
																					<div class="detail">
																						<span class="detail_txt">&lt;미스터에그 + 해쉬브라운 + 아메리카노&gt; 부드러운 스크램블 에그와 브리오쉬, 에그드랍의 특제 소스가 어우러진 샌드위치와 고소하고 부드러운 해쉬브라운, 아메리카노를 합리적인 가격으로 즐길 수 있는 ※세트메뉴음료 변경 시 에이드와 탄산음료는 HOT을 선택하여도 차가운 음료로 제공됩니다.</span>
																					</div>
																					<div class="price">7,400원</div>
																				</div>
																			</a>
																			<a href="#" class="btn_shop" role="button">
																				<div class="btn_box">
																					<svg viewBox="0 0 16 16" class="ico_cart" aria-label="주문하기">
																						<path fill-rule="evenodd" d="M6.14 12.519A1.74 1.74 0 116.139 16a1.74 1.74 0 01.001-3.481zm4.8 0A1.74 1.74 0 1110.939 16a1.74 1.74 0 01.001-3.481zm-4.8 1.052a.688.688 0 100 1.376.688.688 0 000-1.376zm4.8 0a.688.688 0 100 1.376.688.688 0 000-1.376zM2.506 2.4c.24 0 .449.173.5.415l.376 1.784h11.306c.342 0 .588.34.49.677l-1.829 6.3a.512.512 0 01-.49.376h-8.56a.515.515 0 01-.501-.414L2.093 3.452H.512A.519.519 0 010 2.926c0-.29.23-.526.512-.526zM14 5.651H3.604L4.711 10.9h7.766l1.524-5.249z"></path>
																					</svg>
																				</div>
																			</a>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
														<div class="order_list_wrap store_delivery">
															<div class="order_list_inner">
																<div class="order_list_tit">
																	<span class="title">1인 세트메뉴</span>
																	<button type="button" class="btn_fold2">
																		<i class="fa-solid fa-angle-down"></i>
																	</button>
																</div>
																<ul class="order_list_area mb-3">
																	<li class="order_list_item">
																		<div class="item_info">
																			<a href="#" class="info_link">
																				<div class="info_img">
																					<span class="img_box">
																						<img class="img" src="https://naverbooking-phinf.pstatic.net/20220823_108/166121414680370cPU_PNG/1%C0%CE%BC%BC%C6%AE_1_%B9%CC%BD%BA%C5%CD%BF%A1%B1%D7_1200X1200.png?type=f220_220_60_sharpen" width="100%" height="100%" alt="섬네일">
																					</span>
																				</div>
																				<div class="info_detail">
																					<div class="tit">
																						미스터에그 세트
																						<span class="ico_group"></span>
																					</div>
																					<div class="detail">
																						<span class="detail_txt">&lt;미스터에그 + 해쉬브라운 + 아메리카노&gt; 부드러운 스크램블 에그와 브리오쉬, 에그드랍의 특제 소스가 어우러진 샌드위치와 고소하고 부드러운 해쉬브라운, 아메리카노를 합리적인 가격으로 즐길 수 있는 ※세트메뉴음료 변경 시 에이드와 탄산음료는 HOT을 선택하여도 차가운 음료로 제공됩니다.</span>
																					</div>
																					<div class="price">7,400원</div>
																				</div>
																			</a>
																			<a href="#" class="btn_shop" role="button">
																				<div class="btn_box">
																					<svg viewBox="0 0 16 16" class="ico_cart" aria-label="주문하기">
																						<path fill-rule="evenodd" d="M6.14 12.519A1.74 1.74 0 116.139 16a1.74 1.74 0 01.001-3.481zm4.8 0A1.74 1.74 0 1110.939 16a1.74 1.74 0 01.001-3.481zm-4.8 1.052a.688.688 0 100 1.376.688.688 0 000-1.376zm4.8 0a.688.688 0 100 1.376.688.688 0 000-1.376zM2.506 2.4c.24 0 .449.173.5.415l.376 1.784h11.306c.342 0 .588.34.49.677l-1.829 6.3a.512.512 0 01-.49.376h-8.56a.515.515 0 01-.501-.414L2.093 3.452H.512A.519.519 0 010 2.926c0-.29.23-.526.512-.526zM14 5.651H3.604L4.711 10.9h7.766l1.524-5.249z"></path>
																					</svg>
																				</div>
																			</a>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="fixed-bottom bg-white" style="position: relative; box-shadow: 0px -3px 5px lightgrey; z-index: 6000;">
									<div style="height: 170px;">
										<div class="pt-3">
											<span class="ps-5">자몽에이드</span>
											<button type="button" class=" btn btnOrder position-relative">
												주문하기
												<i class="fa-solid fa-cart-plus"></i>
												<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">1</span>
											</button>
										</div>
										<span class="ps-5" style="font-weight: bold; color: red;">3,600원</span>
									</div>
								</div>
								<!-- content e -->
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=YOUR_CLIENT_ID"></script> -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec2655da82c3779d622f0aff959060e6&libraries=services"></script>
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
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
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
		
		var goUrlLogin = "/login";
		
		$("#loginBtn").on("click", function() {
			window.location.href = goUrlLogin;
		})
	</script>
</body>

</html>