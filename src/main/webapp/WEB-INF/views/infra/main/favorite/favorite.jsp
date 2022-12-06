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
			<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
			<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
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
											<input type="text" id="shValue" name="shValue" value="${vo.shValue }" placeholder="장소 검색" autocomplete="none" autofocus class="input_search" oninput="change_text()">
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
		  										<input type="hidden" name="ifmmSeq" value="${sessSeq}"/>
		  										<input type="hidden" name="ifstSeq" id="ifstSeq"/>
												<c:choose>
													<c:when test="${fn:length(favorite) eq 0}">
														<div class="col text-center mt-4 mb-2"><h5><b>좋아요한 스토어가 존재하지 않습니다.</b></h5></div>
													</c:when>
													<c:otherwise>
														<c:forEach items="${favorite}" var="favorite" varStatus="status">
															<div id="fvItem${favorite.ifstSeq}">
															<input type="hidden" name="ifstSeq" value="${favorite.ifstSeq}"/>
																<div class="card_wrap a" style="width: 95%; padding-left: 30px;">
												           			<div class="row pt-3 b">
													           			<div class="card shadow bg-body rounded border border-0">
																		    <div class="card-body cardcc">
																		    	<div class="row">
																					<div class="col-3">
																						<img src="${favorite.path}${favorite.uuidName}" style="width: 85px; height: 85px;">
																					</div>
																					<div class="col-6">
																						<h5 class="card-title"><b>${favorite.ifstName}</b></h5>
																						<p class="card-text">${favorite.ifstAddress}</p>
																						<div class="row justify-content-between">
																							<div class="col text-start"><p class="card-text">${favorite.ifstPhone}</p></div>
																						</div> 
																					</div>
																					<div class="col-3 text-end">
																						<button class="learn-more2 mt-3" type="button" onclick="openModal(${favorite.ifstSeq})"><i class="fa-solid fa-trash-can"></i> 삭제</button>
																					</div>
																				</div>
																		   	</div>
																	    </div>
																	</div>
																</div>
															</div>
														</c:forEach>	
														<!-- Modal -->
														<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 1000;">
														  <div class="modal-dialog">
														    <div class="modal-content">
														      <div class="modal-header">
														        <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="fa-solid fa-file-zipper"></i> MATZIP</h1>
														      </div>
														      <div class="modal-body text-start">
														        정말로 삭제하시겠습니까?
														      </div>
														      <div class="modal-footer">
														        <button type="button" class="btn btn-light"  onclick="closeModal()">닫기</button>
														        <button type="button" class="btn btn-dark" onclick="favoriteDele()">삭제하기</button>
														      </div>
														    </div>
														  </div>
														</div>
													</c:otherwise>
												</c:choose>
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
		
		
		// 검색
		
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
		
		var goUrlLogin = "/login";
		
		$("#loginBtn").on("click", function() {
			window.location.href = goUrlLogin;
		})
	</script>
	<script type="text/javascript">
	<!-- Like 버튼 구현 -->
	
	var goUrlList = "/favorite"
	
	var form = $("#myForm");
	
	goList = function(thisPage){
		$("input:hidden[name=thisPage]").val(thisPage);
		form.attr("action", goUrlList).submit();
	}
	
	function favoriteDele(){

		$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url:"/store/favoriteDele"
				/* ,data : $("#formLogin").serialize() */
				,data : { "ifstSeq" : $("#ifstSeq").val(), "ifmmSeq" : $("input[name=ifmmSeq]").val()}
				,success: function(response) {
					$("#exampleModal").removeClass("show");
					$("#fvItem"+ $("#ifstSeq").val()).remove();
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
	}
	
	function openModal(seq){
		$("#ifstSeq").val(seq);
		$("div").removeClass("modal-backdrop");
		$("#exampleModal").addClass("show");
		$("#exampleModal").css("display","block");
		
	}
	
	function closeModal(){
		$("#exampleModal").css("display","none");
	}
	</script>
</body>

</html>