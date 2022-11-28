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
	<link rel="stylesheet" href="/resources/css/comment/storeComment.css">
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
						<a href="/storeList" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
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
																				<a href="/storeMain" role="tab" class="tpj9w _tab-menu" aria-selected="false" title="" id="" style="width: 200px;">
																					<span class="veBoZ">홈</span>
																				</a>
																				<a href="/menu" role="tab" class="tpj9w _tab-menu" aria-selected="true" title="" id="" style="width: 200px;">
																					<span class="veBoZ">메뉴</span>
																				</a>
																				<a href="/storeComment" role="tab" class="tpj9w _tab-menu" aria-selected="false" title="" id="" style="width: 200px;">
																					<span class="veBoZ">리뷰</span>
																				</a>
																			</div>
																		</div>
																	</div>
																	
																	<!-- comment content s -->
																	
																	<div class="container">
																		<div class="container review">
																			 	<!-- Header -->
																	            <div class="row align-items-center">
																	              <div class="col-12 col-md text-md-center">
																	
																	                <!-- Rating -->
																	                <div class="rating text-dark h6 mb-4 mb-md-0" data-value="4">
																	                </div>
																	
																	
																	              </div>
																	              <div class="col-12 col-md-auto mt-5">
																	
																	                <!-- Button -->
																	                <a class="btn btn-dark collapsed" data-bs-toggle="collapse" href="#reviewForm" aria-expanded="false">
																	                  후기 작성하기
																	                </a>
																	
																	              </div>
																	            </div>
																	
																	            <!-- New Review -->
																	            <div class="collapse" id="reviewForm" style="">
																	
																	              <!-- Divider -->
																	              <hr class="my-8">
																	
																	              <!-- Form -->
																	                <div class="row">
																	                  <div class="col-12 mb-6">
																	
																	                    <!-- Text -->
																	                    <p class="mb-1 fs-xs">
																	                      별점:
																	                    </p>
																	
																	                    <!-- Rating form -->
																	                    <div class="rating-form">
																	                    
																	                    	<div class="star-rating justify-content-center">
																	                    	  <input type="hidden" name="ifcmGrade" id="ifcmGrade">
																							  <input type="radio" id="5-stars" name="startPoint" onclick="countingStar(5)" /> 
																							  <label for="5-stars" class="star">&#9733;</label>
																							  <input type="radio" id="4-stars" name="startPoint" onclick="countingStar(4)" />
																							  <label for="4-stars" class="star">&#9733;</label>
																							  <input type="radio" id="3-stars" name="startPoint" onclick="countingStar(3)" />
																							  <label for="3-stars" class="star">&#9733;</label>
																							  <input type="radio" id="2-stars" name="startPoint" onclick="countingStar(2)" />
																							  <label for="2-stars" class="star">&#9733;</label>
																							  <input type="radio" id="1-star"  name="startPoint" onclick="countingStar(1)" />
																							  <label for="1-star" class="star">&#9733;</label>
																							</div>
																	
																	                    </div>
																	
																	                  </div>
																	                  <div class="col-12" style="margin-top: 1rem;">
																	
																	                    <!-- Name -->
																	                    <div class="form-group">
																	                      <label class="visually-hidden" for="reviewName">id:</label>
																	                      <input class="form-control form-control-sm" id="reviewName" name="ifmmId" type="text" value="${sessId}" required="">
																	                    </div>
																	
																	                  </div>
																	                  <div class="col-12" style="margin-top: 1.5rem;">
																	
																	                    <!-- Review -->
																	                    <div class="form-group">
																	                      <label class="visually-hidden" for="reviewText">후기</label>
																	                      <textarea class="form-control form-control-sm" id="reviewText" name="ifcmComment" rows="5" placeholder="후기를 작성해주세요." required=""></textarea>
																	                    </div>
																	
																	                  </div>
																	                  <div class="col-12 text-center" style="margin-top: 3rem;">
																	
																	                    <!-- Button -->
																	                    <button class="btn btn-outline-dark mb-5" type="button" id="BtnComment">후기 등록하기</button>
																	
																	                  </div>
																	                </div>
																	            </div>
																	       </div>
																	      </form>
																	            
																	       <div class="container review" style="margin-top: 2rem;">
																	       <c:choose>
																	           <c:when test="${fn:length(list) eq 0 }">
																	               <div class="text-center mb-5"><h5><b>이 스토어에 대한 리뷰가 존재하지 않습니다.😢</b></h5></div>
																	           </c:when>
																	           <c:otherwise>
																	           		<c:forEach items="${list }" var="list" varStatus="status">
																	           		<div class="card shadow bg-body rounded cardBorder mb-3">
																			           <div class="card-body">
																				           <div class="row">
																				         		<div class="col-1">
																									<c:choose>
																										<c:when test="${list.pseq eq null }">
																											<img alt="" src="https://intermusicakorea.com/common/img/default_profile.png" class="avatar avatar-review">
																										</c:when>
																										<c:otherwise>
																											<img alt="" src="${list.path}${list.uuidName}" class="avatar avatar-review">
																										</c:otherwise>
																									</c:choose>
																								</div>
																								<div class="col-11 text-start" id="reviewID">
																									<span><c:out value="${list.ifmmId}"/></span>
																								</div>
																							</div>
																							<div class="row justify-content-between">
																								<div class="col-4 text-start">
																									<div class="reviewStar2">
																										<c:forEach begin="1" end="${list.ifcmGrade}" varStatus="status">
																											<i class="fa-solid fa-star"></i>  
																										</c:forEach>
																										&nbsp;<span><b><c:out value="${list.ifcmGrade}"/>점</b></span>
																									</div>
																								</div>
																								<div class="col-8 text-end">
																									<span class="reviewDate"><c:out value="${list.ifcmCreatedAt}"/></span>
																								</div>
																							</div>
																							<div class="reviewContent">
																								<span>
																									<c:out value="${list.ifcmComment}"/> 
																								</span>
																							</div>
																						</div>
																					</div>
																	           		</c:forEach>
																	           </c:otherwise>
																	       </c:choose>
																	       	<div class="row justify-content-center mt-5 mb-3">
																	       		<%@include file="../../xdmin/includeV1/pagination.jsp"%>
																			</div>
																		</div>
																	</div>
																	
																	<!-- comment content e -->
																	
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
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
		
		
		var goUrlList = "/comment/storeComment";
		var goUrlInst = "/comment/commentInst";
		
		var form = $("#myForm");
		
		goList = function(keyValue){
			$("input:hidden[name=ifstSeq]").val(keyValue);
			form.attr("action", goUrlList).submit();
		}
		
		countingStar = function(key){
			$("#ifcmGrade").val(key)
		}
		
		$("#BtnComment").on("click", function(){
			form.attr("action", goUrlInst).submit();
		});
		
	</script>
</body>

</html>