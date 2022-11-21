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
	<script defer type="text/javascript" src="/resources/js/order/mapBasic.js"></script>
	<!-- tmap api s -->
	<script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx7374d191e9e54abca56a605a9dcc9c85"></script>
	<!-- tmap api e -->
</head>

<body onload="initTmap();">
    <!-- start -->
    
    <form action="post" id="myForm" name="myForm" onsubmit="searchPlaces(); return false;">
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
					<!-- 	<li>
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
							<li><a class="dropdown-item" href="/mypage/mypageMain">My Page</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><button type="button" id="signOutBtn" class="dropdown-item">Sign out</button></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="map_container" id="container">
				<div class="sideInfo">
					<div class="handle">
						<input type="hidden" name="handle_value" id="handle_value" value="1">
						<button type="button" id="handle" class="btn_fold expand">접기</button>
					</div>
					<div class="panel">
						<div class="panel_top">
							<div class="btn-group m-3" role="group" aria-label="Basic outlined example">
						  		<button type="button" class="btn btn-outline-secondary">
						  			<i class="fa-solid fa-bus-simple"></i>
						  			대중교통
				  				</button>
							  	<button type="button" class="btn btn-outline-secondary">
									<i class="fa-solid fa-car"></i>
							  		자동차
						  		</button>
							  	<button type="button" class="btn btn-outline-secondary">
							  		<i class="fa-solid fa-person-walking"></i>
							  		도보
						  		</button>
							  	<button type="button" class="btn btn-outline-secondary">
							  		<i class="fa-solid fa-person-biking"></i>
							  		자전거
						  		</button>
							</div>
							<!-- search s -->
							<div class="search" style="margin-top: 60px;">
								<div class="search_wrap">
									<div class="search_box2">
										<div class="input_box">
											<label class="label_search"><img alt="" src="/resources/images/main/placeholder_b.png" style="width: 20px;"></label>
											<input type="text" id="sPlace" name="sPlace" value="${vo.sPlace }" autocomplete="none" autofocus class="input_search ms-4" placeholder="출발지를 입력하세요." >
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
								<button style="float:right; display:inline-block;" type="button" class="btn btn-outline-secondary" id="reTyping2">
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
										<div id="pagination"></div>
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
				<div id="map" style="width:100%;height:100%;"></div>
				<!-- <div id="map_wrap" class="map_wrap3">
					<div id="map_div"></div>
				</div> -->
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
	<script>
	
		// 마커를 담을 배열입니다
		var markers = [];
		
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
	
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    var start = $("#sPlace");
		    var end = $("#ePlace");
		    
		    if (start.val() != null && end.val() == "") {
			    ps.keywordSearch(start.val(), placesSearchCB); 
		    } else if (start.val() == "" && end.val() != null) {
			    ps.keywordSearch(end.val(), placesSearchCB); 
		    } else if (start.val() != null && end.val() != null){
		    	$("#footer").css("display", "");
		    	if ($(":focus").attr("id") == "sPlace") {
				    ps.keywordSearch(start.val(), placesSearchCB); 
		    	} else {
				    ps.keywordSearch(end.val(), placesSearchCB); 
		    	}
		    } else {
		    	location.reload();
		    }
		}
		
		// 키워드로 장소를 검색합니다
		
		$("#sPlace").on("keyup", function (key) {
			if(key.keyCode == 13) {
				searchPlaces();
			}
		});

		$("#ePlace").on("keyup", function (key) {
			if(key.keyCode == 13) {
				searchPlaces();
			}
		});
		
		// 장소검색 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);
		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		        alert('검색 결과가 존재하지 않습니다.');
		        return;

		    } else if (status === kakao.maps.services.Status.ERROR) {
		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;

		    } 
		}
	
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
		    
			var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new kakao.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {

		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);

		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });

		            kakao.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });

		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };

		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].place_name);

		        fragment.appendChild(itemEl);
		    }

		    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;

		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}
		
		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5 class="title'+ (index+1) +'" onclick="changePlace('+(index+1)+')">' + places.place_name + '</h5>';

		    if (places.road_address_name) {
		        itemStr += '    <span>' + places.road_address_name + '</span>' +
		                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address_name  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           

		    el.innerHTML = itemStr;
		    el.className = 'item';

		    return el;
		}
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 

		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }

		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;

		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }

		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
		    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}

		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		
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
		
		var sSearch = $("#sPlace").val()
		var eSearch = $("#ePlace").val()
		changePlace = function (value) {
			$(".title"+value).on("click", function() {
				if ($("#sPlace").val() == null || $("#sPlace").val() == "") {
					if ($(".title"+value).text().indexOf(sSearch) != -1) {
						$("#sPlace").val($(".title"+value).text());
						$("#start").text($(".title"+value).text());
					} 
				} else if ($("#ePlace").val() == null || $("#ePlace").val() == "") {
					if ($(".title"+value).text().indexOf(eSearch) != -1) {
						$("#ePlace").val($(".title"+value).text());
						$("#end").text($(".title"+value).text());
					}
				}
			})
		}
	</script>
</body>

</html>