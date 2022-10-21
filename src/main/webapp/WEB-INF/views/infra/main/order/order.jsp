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
	<link rel="stylesheet" href="/resources/css/order/order.css">
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
					<li>
						<a href="/story" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-pen-to-square text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="/comment" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fa-regular fa-thumbs-up text-white" style="font-size: 22px;"></i>
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
						<li><a class="dropdown-item" href="#">Sign out</a></li>
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
								<div class="entry-place-bridge">
									<div class="entry_wrap loaded ng-star-inserted">
										<div class="place_on_pcmap">
											<div class="place_didmount" id="app-root">
												<div style="width: 100%; height: 100%;">
													<div class="BXtr_ tAvTy">
														<div class="place_tab_shadow FFTct IOXHr">
															<a href="#" role="button" class="DDfpb">
																<img class="back" alt="" src="https://cdn-icons-png.flaticon.com/512/54/54321.png"> 
															</a>
															<h1 class="bh9OH">힘난다버거 신논현역점</h1>
														</div>
														<div role="main" style="width:100%; height: 300px;">
															<div class="place_img">
																<div class="uDR4i fnRPu" style="height: 300px;">
																	<div class="CEX4u">
																		<div class="fNygA">
																			<a href="#" target="_self" role="button" class="place_thumb QX0J7" id="_autoPlayable">
																				<div class="K0PDV _div" style="width:100%;height:100%;background-image:url(&quot;https://search.pstatic.net/common/?autoRotate=true&amp;type=w560_sharpen&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220822_198%2F1661157302914UrbDF_PNG%2FHIMNANDA_BURGER_LOGO_%2528%25B3%25D7%25C0%25CC%25B9%25F6%2529.png&quot;);background-position:50% 0" id="ibu_1">
																					<span class="place_blind">업체</span>
																				</div>
																			</a>
																		</div>
																	</div>
																	<div class="CEX4u">
																		<div class="hEm4D" style="height: 150px;">
																			<div class="CEX4u">
																				<div class="fNygA">
																					<a href="#" target="_self" role="button" class="place_thumb QX0J7" id="_autoPlayable">
																						<div class="K0PDV _div" style="width:100%;height:100%;background-image:url(&quot;https://search.pstatic.net/common/?autoRotate=true&amp;type=w560_sharpen&amp;src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220822_198%2F1661157302914UrbDF_PNG%2FHIMNANDA_BURGER_LOGO_%2528%25B3%25D7%25C0%25CC%25B9%25F6%2529.png&quot;);background-position:50% 0" id="ibu_1">
																							<span class="place_blind">업체</span>
																						</div>
																					</a>
																				</div>
																			</div>
																			<div class="CEX4u">
																				<div class="fNygA">
																					<a href="#" target="_self" role="button" class="place_thumb QX0J7" id="_autoPlayable">
																						<div class="K0PDV _div" style="width:100%;height:100%;background-image:url(https://search.pstatic.net/common/?autoRotate=true&type=w278_sharpen&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210617_121%2F1623912521068keJva_JPEG%2FZiLevh5CYoctWhXDNk2X8VQa.jpg);background-position:50% 0" id="ibu_1">
																							<span class="place_blind">업체</span>
																						</div>
																					</a>
																				</div>
																			</div>
																		</div>
																		<div class="hEm4D" style="height: 150px;">
																			<div class="CEX4u">
																				<div class="fNygA">
																					<a href="#" target="_self" role="button" class="place_thumb QX0J7" id="_autoPlayable">
																						<div class="K0PDV _div" style="width:100%;height:100%;background-image:url(https://search.pstatic.net/common/?autoRotate=true&type=w278_sharpen&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210617_121%2F1623912521068keJva_JPEG%2FZiLevh5CYoctWhXDNk2X8VQa.jpg);background-position:50% 0" id="ibu_1">
																							<span class="place_blind">업체</span>
																						</div>
																					</a>
																				</div>
																			</div>
																			<div class="CEX4u">
																				<div class="fNygA">
																					<a href="#" target="_self" role="button" class="place_thumb QX0J7" id="_autoPlayable">
																						<div class="K0PDV _div" style="width:100%;height:100%;background-image:url(https://search.pstatic.net/common/?autoRotate=true&type=w278_sharpen&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20210617_295%2F1623897525124lEBxL_JPEG%2F3ZYLhGCEVube9SJ0RpIbniJK.jpg);background-position:50% 0" id="ibu_1">
																							<span class="place_blind">업체</span>
																						</div>
																						<span class="xez5V" style="font-size: ">
																							<i class="fas fa-light fa-camera fa-2x mb-2"></i>
																							645개 더보기
																						</span>
																					</a>
																				</div>
																			</div>																			
																		</div>
																	</div>
																</div>
															</div>
															<div class="place_section">
																<div class="zD5Nm f7aZ0">
																	<div class="YouOG">
																		<span class="Fc1rA">힘난다버거 신논현역점</span>
																		<span class="DJJvD">햄버거</span>
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
																		<span class="PXMot">
																			<a href="/restaurant/1470422298/review/visitor" role="button" class="place_bluelink">
																				방문자리뷰
																				<em>414</em>
																			</a>
																		</span>
																		<span class="PXMot">
																			<a href="/restaurant/1470422298/review/ugc" role="button" class="place_bluelink">
																				블로그리뷰<!-- --> 
																				<em>85</em>
																			</a>
																		</span>
																	</div>
																</div>
																<div class="X0C1I"></div>
																<div class="sVyWx"></div>
																<div class="UoIF_ Afmx0 cgBhJ"></div>
															</div>
															<div class="place_fixed_maintab">
																
															</div>
															<div>
																
															</div>																
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="entry-close-button">
									
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
		var form = $("#myForm");

		$("#test").on("click", function() {
			
			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "test"
   				/* ,data : $("#formLogin").serialize() */
   				,data : { }
   				,success: function(response) {
   					if(response.rt == "success") {
   						window.location.href = "/favorite";
   					} else {
   						alert("sadsda")	;
   					}
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
		})
		
	</script>
</body>

</html>