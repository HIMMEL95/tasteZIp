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
										<button class="search_btn" type="submit">검색</button>
										<div class="input_box">
											<input type="text" id="shValue" name="shValue" autocomplete="off" placeholder="장소 검색" autofocus class="input_search" oninput="change_text()">
										</div>
									</div>
								</div>
							</div>
							<!-- search e -->
							<div class="ng-star-inserted entry-layout">
								<!-- content s -->
								<div class="entry-place-bridge">
									<div class="entry_wrap loaded ng-star-inserted">
										<div class="place_on_pcmap">
											<div class="place_didmount" id="app-root">
												<div style="width: 100%; height: 100vh;">
													<div class="BXtr_ tAvTy">
														<div class="place_tab_shadow FFTct IOXHr">
															<a href="javascript:goList();" role="button" class="DDfpb">
																<img class="back" alt="" src="https://cdn-icons-png.flaticon.com/512/54/54321.png"> 
															</a>
															<h1 class="bh9OH">${item.ifstName }</h1>
														</div>
														<div role="main" style="width:100%; height: 300px;">
															<div class="place_img">
																<div class="uDR4i fnRPu" style="height: 300px;">
																	<c:forEach items="${img}" var="img" varStatus="status">
																		<div class="CEX4u">
																			<div class="fNygA">
																				<a href="#" target="_self" role="button" class="place_thumb QX0J7" id="_autoPlayable">
																					<div class="K0PDV _div" style="width:100%;height:100%;" id="ibu_1">
																						<img src="${img.path }${img.uuidName}" alt="" style="width: 295.1px; height: 300px">
																					</div>
																				</a>
																			</div>
																		</div>
																	</c:forEach>
																</div>
															</div>
															<div class="place_section">
																<div class="zD5Nm f7aZ0">
																	<div class="YouOG">
																		<span class="Fc1rA">${item.ifstName }</span>
																	</div>
																	<div class="dAsGb">
																		<span class="PXMot LXIwF">
																			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 13 13" class="GWkzU" aria-hidden="true">
																				<path d="M8.26 4.68h4.26a.48.48 0 01.28.87L9.35 8.02l1.33 4.01a.48.48 0 01-.18.54.48.48 0 01-.56 0l-3.44-2.5-3.44 2.5a.48.48 0 01-.74-.54l1.33-4L.2 5.54a.48.48 0 01.28-.87h4.26l1.3-4a.48.48 0 01.92 0l1.3 4z"></path>
																			</svg>
																			<span class="place_blind">별점</span>
																			<em>4.35</em>
																			/5
																		</span>
																		<!-- <span class="PXMot">
																			<a href="/restaurant/1470422298/review/visitor" role="button" class="place_bluelink">
																				방문자리뷰
																				<em>414</em>
																			</a>
																		</span>
																		<span class="PXMot">
																			<a href="/restaurant/1470422298/review/ugc" role="button" class="place_bluelink">
																				블로그리뷰 
																				<em>85</em>
																			</a>
																		</span> -->
																	</div>
																</div>
																<div class="X0C1I">
																	<a href="#" target="_self" role="button" class="Pcppb">
																		<i class="fa-solid fa-location-dot text-primary"></i>
																		출발
																	</a>
																	<a href="#" target="_self" role="button" class="gd2MP">		
																		<i class="fa-solid fa-location-dot"></i>
																		도착															
																	</a>
																</div>
															</div>
															<div style="background: #e2e5e8; height: 10px;"></div>
															<div class="place_fixed_maintab">
																<div class="Jxtsc MpTT1" role="tablist" data-nclicks-area-code="tab">
																	<div class="ngGKH">
																		<div class="flicking-viewport" style="user-select: none; -webkit-user-drag: none; touch-action: pan-y;">
																			<div class="flicking-camera" style="transform: translate(0px);">
																				<a href="javascript:goHome(${item.ifstSeq})" role="tab" class="tpj9w _tab-menu" aria-selected="false" title="" id="" style="width: 200px;">
																					<span class="veBoZ">홈</span>
																				</a>
																				<a href="/menu" role="tab" class="tpj9w _tab-menu" aria-selected="true" title="" id="" style="width: 200px;">
																					<span class="veBoZ">메뉴</span>
																				</a>
																				<a href="javascript:goComment(${item.ifstSeq})" role="tab" class="tpj9w _tab-menu" aria-selected="false" title="" id="" style="width: 200px;">
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
																				<div class="order_list">
																					<div class="order_list_wrap store_delivery">
																						<div class="order_list_inner">
																							<c:set var="listCodeSet" value="${CodeServiceImpl.selectListCachedCode('7') }" />
																							<c:forEach items="${setDiv }" var="setDiv" varStatus="status">
																								<div class="order_list_tit">
																									<span class="title">
																										<c:forEach items="${listCodeSet }" var="listSet" varStatus="statusSet">
																											<c:if test="${setDiv.ifmnSet_div eq listSet.ifccSeq}"><c:out value="${listSet.ifccName }"/></c:if>
																										</c:forEach>
																									</span>
																									<button type="button" class="btn_fold2" onclick="popover(${status.index})">
																										<input type="hidden" value="1" name="popValue${status.index }">
																										<i id="popoverBtn${status.index }" class="fa-solid fa-angle-down"></i>
																									</button>
																								</div>
																								<c:forEach items="${list }" var="list" varStatus="status2">
																									<c:choose>
																										<c:when test="${setDiv.ifmnSet_div eq list.ifmnSet_div }">
																											<%-- <input type="hidden" name="menuSeq${list.ifmnSeq}" value="${list.ifmnSeq }"> --%>
																											<div class="menuSeq${list.ifmnSeq}"></div>
																											<ul class="order_list_area${status.index }">
																												<li class="order_list_item">
																													<div class="item_info">
																														<a href="#" class="info_link">
																															<div class="info_img">
																																<c:choose>
																																	<c:when test="${empty list.path }">
																																		<span class="img_box">
																																			<img class="img" src="https://naverbooking-phinf.pstatic.net/20220823_108/166121414680370cPU_PNG/1%C0%CE%BC%BC%C6%AE_1_%B9%CC%BD%BA%C5%CD%BF%A1%B1%D7_1200X1200.png?type=f220_220_60_sharpen" width="100%" height="100%" alt="섬네일">
																																		</span>
																																	</c:when>
																																	<c:otherwise>
																																		<span class="img_box">
																																			<img class="img" src="${list.path }${list.uuidName}" width="100%" height="100%" alt="섬네일">
																																		</span>
																																	</c:otherwise>
																																</c:choose>
																															</div>
																															<div class="info_detail">
																																<div class="tit${list.ifmnSeq }">
																																	<input type="hidden" name="name${list.ifmnSeq }" value="${list.ifmnName }">
																																	${list.ifmnName }<span class="ico_group"></span>
																																</div>
																																<div class="detail">
																																	<span class="detail_txt">${list.ifmnInfo }</span>
																																</div>
																																<div class="price${list.ifmnSeq }">
																																	<input type="hidden" name="price${list.ifmnSeq }" value="${list.ifmnPrice }">
																																	<fmt:formatNumber type="number" pattern="#,###" value="${list.ifmnPrice}"/>원
																																</div>
																															</div>
																														</a>
																														<button class="btn_shop" type="button" onclick="goCart(${list.ifmnSeq})">
																															<div class="btn_box">
																																<svg viewBox="0 0 16 16" class="ico_cart" aria-label="주문하기">
																																	<path fill-rule="evenodd" d="M6.14 12.519A1.74 1.74 0 116.139 16a1.74 1.74 0 01.001-3.481zm4.8 0A1.74 1.74 0 1110.939 16a1.74 1.74 0 01.001-3.481zm-4.8 1.052a.688.688 0 100 1.376.688.688 0 000-1.376zm4.8 0a.688.688 0 100 1.376.688.688 0 000-1.376zM2.506 2.4c.24 0 .449.173.5.415l.376 1.784h11.306c.342 0 .588.34.49.677l-1.829 6.3a.512.512 0 01-.49.376h-8.56a.515.515 0 01-.501-.414L2.093 3.452H.512A.519.519 0 010 2.926c0-.29.23-.526.512-.526zM14 5.651H3.604L4.711 10.9h7.766l1.524-5.249z"></path>
																																</svg>
																															</div>
																														</button>
																													</div>
																												</li>
																											</ul>
																										</c:when>
																									</c:choose>
																								</c:forEach>
																							</c:forEach>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="fixed-bottom bg-white" style="position: relative; box-shadow: 0px -3px 5px lightgrey; z-index: 6000; display: none;">
									<div class="pt-3">
										<span class="ps-5 buyName">자몽에이드</span>
									</div>
									<span class="ps-5 totalPrice" style="font-weight: bold; color: red;">3,600원</span>
									<button type="button" id="buyBtn" class="btn btnOrder position-relative" style="margin-left: 200px; float: right; margin-bottom: 0px; bottom: 20px; right: 40px;">
										주문하기
										<i class="fa-solid fa-cart-plus"></i>
										<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="display: none;">1</span>
									</button>
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
	<script type="text/javascript">
		change_text = function() {
			var content = $("#shValue").val();
			
			if (content != null || content != "") {
				$(".label_search").text("");
			}
			
			if (content.length == 0 || content == '') {
				$(".label_search").text("장소 검색");
			}
		};
		
		popover = function(keyValue) {
			if ($("input[name=popValue"+keyValue+"]").val() == 0) {
				$("input[name=popValue"+keyValue+"]").val(1);
				$("#popoverBtn"+keyValue).removeClass("fa-angle-down");
				$("#popoverBtn"+keyValue).addClass("fa-angle-up");
				$(".order_list_area"+keyValue).css("display", "");
			} else {
				$("input[name=popValue"+keyValue+"]").val(0);
				$("#popoverBtn"+keyValue).addClass("fa-angle-down");
				$("#popoverBtn"+keyValue).removeClass("fa-angle-up");
				$(".order_list_area"+keyValue).css("display", "none");
			}
		}
		
		/* goCart = function (value) {
			alert($("input[name=menuSeq"+value+"]").val())
			$.ajax({
				type: "POST"
				,url: "/menu/cart"
				,data: {
					ifmnSeq : $("input[name=menuSeq"+value+"]").val()
				}
				,success : function(response) {
					if (response.rt == "success") {
						var innerHtml ="";
						innerHtml += '<input type="hidden" name="ifmnSeqArr" id="ifmnSeqArr'+value+'" value="'+value+'">';
						$(".menuSeq"+value).html(innerHtml);
					} else if (response.rt == "duplicate") {
						alert("중복된 상품을 선택 하셨습니다.!!!")
					}
				}
			});
		} */
		
		// 쿠키 값 가져오기 s
		var getCookieValue = (name) => (
			document.cookie.match('(^|;)\\s*' + name + '\\s*=\\s*([^;]+)')?.pop() || ''
		)
		
		var value = getCookieValue("cart");
		
		if (value != "") {
			var cookieArr = value.split(":");
			$(".bg-white").css("display", "");
			
			if (cookieArr.length == 1) {
				$(".buyName").html($("input[name=name"+cookieArr[0]+"]").val());
			} else {
				$(".buyName").html($("input[name=name"+cookieArr[0]+"]").val() + " 외 " + (cookieArr.length-1));
				var totalPrice = 0;
				for (var i=0; i<cookieArr.length; i++) {
					totalPrice += parseInt($("input[name=price"+cookieArr[i]+"]").val());
				}
				totalPrice = String(totalPrice);
				totalPrice = totalPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				
				$(".totalPrice").html(totalPrice + " 원");
			}
		}
		// 쿠키 값 가져오기 e
		
		var cart = [];
		var result = "";
		
		var ifmnName = [];
		var ifmnPrice = [];
		goCart = function (value) {
			
			$(".bg-white").css("display", "");
			
			if (cart.includes(value)) {
				alert("중복된 상품을 선택하셨습니다.");
			} else {
				cart.push(value);
				var innerHtml ="";
				innerHtml += '<input type="hidden" name="ifmnSeq" id="ifmnSeqArr'+value+'" value="'+value+'">';
				$(".menuSeq"+value).html(innerHtml);
				result += value + " ";
				
				ifmnName.push($("input[name=name"+value+"]").val())
				ifmnPrice.push($("input[name=price"+value+"]").val())
				
				$(".badge").css("display", "");
				$(".badge").html(ifmnName.length);
				
				if (ifmnName.length == 1) {
					$(".buyName").html(ifmnName);
				} else if (ifmnName.length > 1) {
					$(".buyName").html(ifmnName[0] + " 외 " + (ifmnName.length-1));
				}
				
				/* document.cookie = "cart="+cart; */
			}
			
			var totalPrice = 0;
			for(var i=0; i<ifmnPrice.length; i++) {
				totalPrice += parseInt(ifmnPrice[i]);
			}
			
			totalPrice = String(totalPrice);
			totalPrice = totalPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			
			$(".totalPrice").html(totalPrice + " 원");
		}
		
		var goUrlCart = "/order/cartOrder";
		var goStoreList = "/storeList";
		var form = $("#myForm");
		
		goList = function() {
			form.attr("action", goStoreList).submit();
		}
		
		$("#buyBtn").on("click", function() {
			$.ajax({
				type: "POST"
				,url: "/menu/cart"
				,data: {
					ifmnSeq : result
				}
				,success : function(response) {
					if (response.rt == "success") {
						form.attr("action", goUrlCart).submit();
					} else {
						alert("상품을 하나 이상 눌러주세요!!");
					}
				}
			});
		})
		
	</script>
	<script type="text/javascript">
		var goUrlForm = "/store/storeMain";
	 	var goUrlComment = "/comment/storeComment";
		var seq = $("input[name=ifstSeq]");
		var form = $("#myForm");
		
		goHome = function(keyValue) {
			seq.val(keyValue);
			form.attr("action", goUrlForm).submit();
		}
		
		goComment = function(keyValue) {
			seq.val(keyValue);
			form.attr("action", goUrlComment).submit();
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
		
		var goUrlLogin = "/login";
		
		$("#loginBtn").on("click", function() {
			window.location.href = goUrlLogin;
		})
	</script>
</body>

</html>