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
    <title>Favorite</title>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/order/mapBasic.css">
	<link rel="stylesheet" href="/resources/css/favorite/favorite.css">
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
											<label class="label_search"></label>
											<input type="text" id="placeSearch" autocomplete="none" autofocus class="input_search" placeholder="리스트검색">
										</div>
									</div>
								</div>
							</div>
							<!-- search e -->
							<div class="ng-star-inserted">
								<div class="main -top_space">
									<!-- contents s -->
									<table class="mt-3 me-2">
										<tr>
											<td>
												<h2 class="ms-4 title" style="text-shadow: 2px 5px lightgrey;">My Favorite Restaurants</h2>
											</td>
										</tr>
									</table>
									<div class="contents">
										<!-- 주변 카드 뷰 -->
										<div class="container">
											<div class="row justify-content-center">
												<a href="#" id="goForm">
													<div class="card_wrap" style="width: 95%; padding-left: 30px;">
									           			<div class="row pt-3">
										           			<div class="card shadow bg-body rounded border border-0">
															    <div class="card-body cardcc">
															    	<div class="row">
																		<div class="col-3">
																			<img src="http://wepeak.fifas.co.kr/upfile/product/no_image.gif" style="width: 85px; height: 85px;">
																		</div>
																		<div class="col-9">
																			<h5 class="card-title"><b>아놀로지</b></h5>
																			<p class="card-text">서울특별시 마포구 서교동 395-78 3층</p>
																			<div class="row justify-content-between">
																				<div class="col-8 text-start"><p class="card-text">대흥역 3번 출구 도보 100m</p></div>
																				<div class="col-4 text-end"><button class="custom-btn btn-15"> <i class="fa-solid fa-trash-can"></i> 삭제 </button></div>
																			</div>
																		</div>
																	</div>
															   	</div>
														    </div>
														</div>
													</div>
												</a>
												<a href="#" id="goForm">
													<div class="card_wrap" style="width: 95%; padding-left: 30px;">
									           			<div class="row pt-3">
										           			<div class="card shadow bg-body rounded border border-0">
															    <div class="card-body cardcc">
															    	<div class="row">
																		<div class="col-3">
																			<img src="http://wepeak.fifas.co.kr/upfile/product/no_image.gif" style="width: 85px; height: 85px;">
																		</div>
																		<div class="col-9">
																			<h5 class="card-title"><b>아놀로지</b></h5>
																			<p class="card-text">서울특별시 마포구 서교동 395-78 3층</p>
																			<div class="row justify-content-between">
																				<div class="col-8 text-start"><p class="card-text">대흥역 3번 출구 도보 100m</p></div>
																				<div class="col-4 text-end"><button class="custom-btn btn-15"> <i class="fa-solid fa-trash-can"></i> 삭제 </button></div>
																			</div>
																		</div>
																	</div>
															   	</div>
														    </div>
														</div>
													</div>
												</a>
												<a href="#" id="goForm">
													<div class="card_wrap" style="width: 95%; padding-left: 30px;">
									           			<div class="row pt-3">
										           			<div class="card shadow bg-body rounded border border-0">
															    <div class="card-body cardcc">
															    	<div class="row">
																		<div class="col-3">
																			<img src="http://wepeak.fifas.co.kr/upfile/product/no_image.gif" style="width: 85px; height: 85px;">
																		</div>
																		<div class="col-9">
																			<h5 class="card-title"><b>아놀로지</b></h5>
																			<p class="card-text">서울특별시 마포구 서교동 395-78 3층</p>
																			<div class="row justify-content-between">
																				<div class="col-8 text-start"><p class="card-text">대흥역 3번 출구 도보 100m</p></div>
																				<div class="col-4 text-end"><button class="custom-btn btn-15"> <i class="fa-solid fa-trash-can"></i> 삭제 </button></div>
																			</div>
																		</div>
																	</div>
															   	</div>
														    </div>
														</div>
													</div>
												</a>
											</div>
										</div>
										<%@include file="../../xdmin/includeV1/pagination.jsp"%>
									</div>
									<!-- contents s -->
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
		
	</script>
	<script type="text/javascript">
	function checkSelectAll()  {
		// 전체 체크박스
		const checkboxes 
			= document.querySelectorAll('input[name="chkBox"]');
		// 선택된 체크박스
		const checked 
			= document.querySelectorAll('input[name="chkBox"]:checked');
		// select all 체크박스
		const selectAll 
			= document.querySelector('input[name="chkAll"]');
		
		if(checkboxes.length === checked.length)  {
			selectAll.checked = true;
		}else {
			selectAll.checked = false;
		}

	}
	// 하위 체크박스 전체 선택시 전체박스 체크
	function checkAll(selectAll)  {
		const checkboxes 
			= document.getElementsByName('chkBox');
		
		checkboxes.forEach((checkbox) => {
			checkbox.checked = selectAll.checked
		})
	}
	function deleteValue(){
		var ur1 = "delete";
		var valueArr = new Array();
		var list = $()
	}
	function newPage() {
		window.location.href = ''
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