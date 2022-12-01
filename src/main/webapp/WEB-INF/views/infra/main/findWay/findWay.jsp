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
    <title>FindWay</title>
    <title>Game View</title>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/order/mapBasic.css">
	<link rel="stylesheet" href="/resources/css/findWay/findWay.css">
	<script defer type="text/javascript" src="/resources/js/main/carWay.js"></script>
	<script defer type="text/javascript" src="/resources/js/main/findWay.js"></script>
	<script defer type="text/javascript" src="/resources/js/order/mapBasic.js"></script>
	<!-- tmap api s -->
	<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx7374d191e9e54abca56a605a9dcc9c85"></script>
	<!-- <script src="https://apis.openapi.sk.com/tmap/vectorjs?version=1&appKey=l7xx7374d191e9e54abca56a605a9dcc9c85"></script> -->
	<!-- tmap api e -->
</head>

<body onload="initTmap();">
    <!-- start -->
    
    <form action="post" id="myForm" name="myForm" onsubmit="searchPlaces(); return false;">
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
							<div class="btn-group m-3" role="group" aria-label="Basic outlined example">
								<input type="hidden" name="wayType">
						  		<button type="button" class="btn btn-outline-secondary public">
						  			<i class="fa-solid fa-bus-simple"></i>
						  			대중교통
				  				</button>
							  	<button type="button" class="btn btn-outline-secondary car">
									<i class="fa-solid fa-car"></i>
							  		자동차
						  		</button>
							  	<button type="button" class="btn btn-outline-secondary walk">
							  		<i class="fa-solid fa-person-walking"></i>
							  		도보
						  		</button>
							  	<button type="button" class="btn btn-outline-secondary bike">
							  		<i class="fa-solid fa-person-biking"></i>
							  		자전거
						  		</button>
							</div>
							<!-- search s -->
							<div class="search" style="margin-top: 60px;">
								<div class="search_wrap">
									<div class="search_box2">
										<div class="input_box ui-widget">
											<label class="label_search"><img alt="" src="/resources/images/main/placeholder_b.png" style="width: 20px;"></label>
											<input type="text" id="sPlace" name="sPlace" value="${item.ifstAddress}" autocomplete="none" autofocus class="input_search ms-4" placeholder="출발지를 입력하세요." >
											<button class="search_btn" type="button" id="search1" hidden>검색</button>
										</div>
									</div>
									<div class="search_box2">
										<div class="input_box">
												<label class="label_search"><img alt="" src="/resources/images/main/placeholder_r.png" style="width: 20px;"></label>
												<input type="text" id="ePlace" name="ePlace" value="${vo.ePlace }" autocomplete="none" autofocus class="input_search ms-4" placeholder="도착지를 입력하세요.">
												<button class="search_btn" type="button" id="search2" hidden>검색</button>
										</div>
									</div>
								</div>
							</div>
							<div style="margin-left: 500px; margin-top: 35px; z-index: 200;">
								<button type="button" class="btn btnRotate rotate bg-white" id="changeBtn">
									<img alt="이미지" src="/resources/images/main/upAndDown.png" style="width: 20px; padding-right: 5px; padding-bottom: 4px;">
								</button>
							</div>
							<!-- search e -->
							<div>
								<button style="float: left;" type="button" class="btn btn-outline-secondary" id="reTyping">
									<i class="fas fa-solid fa-arrows-rotate"></i>
									다시입력
								</button>
								<button style="float:right; display:inline-block;" type="button" class="btn btn-outline-secondary" id="findWay">
									길찾기
									<i class="fa-solid fa-angle-right"></i>
								</button>
							</div>
							
							<!-- location information s -->
							<div class="ng-star-inserted map_wrap">
								<div class="main -top_space" style="padding-top: 50px; ">
									<!-- contents s -->
									<h5 class="ms-4 fw-bold">장소</h5>
									<hr class="ms-4 me-3">
									<!-- contents e -->
									<div id="menu_wrap">
										<ul id="placesList"></ul>
									</div>
								</div>
							</div>
							<footer id="footer" style="margin-bottom: 10px; display: none;">
								<div>
									<p>
										<span class="ms-5 me-2" id="start">힘난다버거 신논현역점</span>
										<i class="fa-solid fa-arrow-right-long me-2"></i>
										<span id="end">강남역 2호선</span>
									</p>
								</div>
							</footer>
						</div>
					</div>
				</div>
				<!-- <div id="map" style="width:100%;height:100%;"></div> -->
				<div id="map_wrap" class="map_wrap3">
					<div id="map_div"></div>
				</div>
			</div>
	    </main>
    </form>

    <!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77c9d237ea96142d7fda7576f0a0fc7e&libraries=services"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
	<script>
	
		$("#changeBtn").on("click", function() {
			var temp = "";
			temp = $("#sPlace").val();
			$("#sPlace").val($("#ePlace").val())
			$("#ePlace").val(temp);
		})
		
		$("#reTyping").on("click", function() {
			$("#sPlace").val("");
			$("#ePlace").val("");
			location.reload();
		})
		
		var start = $("#sPlace");
		var end = $("#ePlace");
		var sText = $("#sPlace").val()
		var eText = $("#ePlace").val()
		var text = "";
		changePlace = function (value) {
			$(".title"+value).on("click", function() {
				text = $(".title"+value).text();
				if ((start.val() != null || start.val() != "") && (end.val() == null || end.val() == "")) {
					if ($(".title"+value).text().indexOf(sText) != -1) {
						if(markerArr.length > 0){
						   for(var i in markerArr){
							   markerArr[i].setMap(null);
						   }
					   }
						start.val(text);
						$("#start").text(text);
						sLat = $(".lat"+value).val();
						sLon = $(".lon"+value).val();
						marker_s = new Tmapv2.Marker(
						{
							position : new Tmapv2.LatLng(sLat,sLon),
							icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
							iconSize : new Tmapv2.Size(24, 38),
							map : map
						});
					} 
				} else if  ((end.val() != null || end.val() != "") && document.hasFocus()) {
					if ($(".title"+value).text().indexOf(eText) != -1){
						if(markerArr.length > 0){
						   for(var i in markerArr){
							   markerArr[i].setMap(null);
						   }
					   }
						end.val(text);
						$("#end").text(text);
						eLat = $(".lat"+value).val();
						eLon = $(".lon"+value).val();
						marker_e = new Tmapv2.Marker(
						{
							position : new Tmapv2.LatLng(eLat,eLon),
							icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
							iconSize : new Tmapv2.Size(24, 38),
							map : map
						});
					}
				}
			})
		}
		
		$(".public").on("click", function() {
			$("input[name=wayType]").val("1");
			$(".ft_select").css("display", "none");
		})
		$(".car").on("click", function() {
			$("input[name=wayType]").val("2");
		})
		$(".walk").on("click", function() {
			$("input[name=wayType]").val("3");
			$(".ft_select").css("display", "none");
		})
		$(".bike").on("click", function() {
			$("input[name=wayType]").val("4");
			$(".ft_select").css("display", "none");
		})
		
		$("#findWay").on("click", function() {
			if ($("input[name=wayType]").val() == "3") {
				walkWay();
			} else if ($("input[name=wayType]").val() == "2") {
				carWay();
			}
		})
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
	        var inputSource = ['서울', '대전', '대구', '부산', '제주', '강릉',
	                           '원주', '인천', '광주', '울산', '평창', '천안'];
	
	        $('#sPlace').autocomplete({
	            source : inputSource,
	            minLength : 1
	        });
	        
	    });
	</script>
</body>

</html>