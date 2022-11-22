// // 마커를 담을 배열입니다
// var markers = [];

// // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
// var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
// var options = { //지도를 생성할 때 필요한 기본 옵션
// 	center: new kakao.maps.LatLng(37.5021008334827, 127.024465815419), //지도의 중심좌표.
// 	level: 3 //지도의 레벨(확대, 축소 정도)
// };

// var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

// var mapTypeControl = new kakao.maps.MapTypeControl();

// // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
// map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
// var zoomControl = new kakao.maps.ZoomControl();
// map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// // 지도에 교통정보를 표시하도록 지도타입을 추가합니다
// map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);    

// // 마커가 표시될 위치입니다 
// var markerPosition  = new kakao.maps.LatLng(37.5021008334827, 127.024465815419); 

// // 마커를 생성합니다
// var marker = new kakao.maps.Marker({
//     position: markerPosition
// });

// // 마커가 지도 위에 표시되도록 설정합니다
// marker.setMap(map);
// // 장소 검색 객체를 생성합니다
// var ps = new kakao.maps.services.Places();  

// // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
// var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// $("#sPlace, #ePlace").on("keyup", function (key) {
// 	if(key.keyCode == 13) {
// 		searchPlaces($("#sPlace").val(), $("#ePlace").val());
// 	}
// });

// // 키워드 검색을 요청하는 함수입니다
// function searchPlaces(value1, value2) {

//     if (value1 != null && value2 == "") {
// 	    ps.keywordSearch(value1, placesSearchCB); 
//     } else if (value1 == "" && value2 != null) {
// 	    ps.keywordSearch(end.val(), placesSearchCB); 
//     } else if (value1 != null && value2 != null){
//     	$("#footer").css("display", "");
//     	if ($(":focus").attr("id") == "sPlace") {
// 		    ps.keywordSearch(value1, placesSearchCB); 
//     	} else {
// 		    ps.keywordSearch(value2, placesSearchCB); 
//     	}
//     } else {
//     	location.reload();
//     }
// }

// // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
// function placesSearchCB(data, status, pagination) {
//     if (status === kakao.maps.services.Status.OK) {

//         // 정상적으로 검색이 완료됐으면
//         // 검색 목록과 마커를 표출합니다
//         displayPlaces(data);

//         // 페이지 번호를 표출합니다
//         displayPagination(pagination);

//     } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

//         alert('검색 결과가 존재하지 않습니다.');
//         return;

//     } else if (status === kakao.maps.services.Status.ERROR) {

//         alert('검색 결과 중 오류가 발생했습니다.');
//         return;

//     }
// }

// // 검색 결과 목록과 마커를 표출하는 함수입니다
// function displayPlaces(places) {

//     var listEl = document.getElementById('placesList'), 
//     menuEl = document.getElementById('menu_wrap'),
//     fragment = document.createDocumentFragment(), 
//     bounds = new kakao.maps.LatLngBounds(), 
//     listStr = '';
    
//     // 검색 결과 목록에 추가된 항목들을 제거합니다
//     removeAllChildNods(listEl);

//     // 지도에 표시되고 있는 마커를 제거합니다
//     removeMarker();
    
//     for ( var i=0; i<places.length; i++ ) {

//         // 마커를 생성하고 지도에 표시합니다
//         var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
//             marker = addMarker(placePosition, i), 
//             itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

//         // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
//         // LatLngBounds 객체에 좌표를 추가합니다
//         bounds.extend(placePosition);

//         // 마커와 검색결과 항목에 mouseover 했을때
//         // 해당 장소에 인포윈도우에 장소명을 표시합니다
//         // mouseout 했을 때는 인포윈도우를 닫습니다
//         (function(marker, title) {
//             kakao.maps.event.addListener(marker, 'mouseover', function() {
//                 displayInfowindow(marker, title);
//             });

//             kakao.maps.event.addListener(marker, 'mouseout', function() {
//                 infowindow.close();
//             });

//             itemEl.onmouseover =  function () {
//                 displayInfowindow(marker, title);
//             };

//             itemEl.onmouseout =  function () {
//                 infowindow.close();
//             };
//         })(marker, places[i].place_name);

//         fragment.appendChild(itemEl);
//     }

//     // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
//     listEl.appendChild(fragment);
//     menuEl.scrollTop = 0;

//     // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
//     map.setBounds(bounds);
// }

// // 검색결과 항목을 Element로 반환하는 함수입니다
// function getListItem(index, places) {

//     var el = document.createElement('li'),
//     itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
//                 '<div class="info">' +
//                 '   <h5 class="title'+ (index+1) +'" onclick="changePlace('+(index+1)+')">' + places.place_name + '</h5>';

//     if (places.road_address_name) {
//         itemStr += '    <span>' + places.road_address_name + '</span>' +
//                     '   <span class="jibun gray">' +  places.address_name  + '</span>';
//     } else {
//         itemStr += '    <span>' +  places.address_name  + '</span>'; 
//     }
                 
//       itemStr += '  <span class="tel">' + places.phone  + '</span>' +
//                 '</div>';           

//     el.innerHTML = itemStr;
//     el.className = 'item';

//     return el;
// }

// // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
// function addMarker(position, idx, title) {
//     var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
//         imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
//         imgOptions =  {
//             spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
//             spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
//             offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
//         },
//         markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
//             marker = new kakao.maps.Marker({
//             position: position, // 마커의 위치
//             image: markerImage 
//         });

//     marker.setMap(map); // 지도 위에 마커를 표출합니다
//     markers.push(marker);  // 배열에 생성된 마커를 추가합니다

//     return marker;
// }

// // 지도 위에 표시되고 있는 마커를 모두 제거합니다
// function removeMarker() {
//     for ( var i = 0; i < markers.length; i++ ) {
//         markers[i].setMap(null);
//     }   
//     markers = [];
// }

// // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
// function displayPagination(pagination) {
//     var paginationEl = document.getElementById('pagination'),
//         fragment = document.createDocumentFragment(),
//         i; 

//     // 기존에 추가된 페이지번호를 삭제합니다
//     while (paginationEl.hasChildNodes()) {
//         paginationEl.removeChild (paginationEl.lastChild);
//     }

//     for (i=1; i<=pagination.last; i++) {
//         var el = document.createElement('a');
//         el.href = "#";
//         el.innerHTML = i;

//         if (i===pagination.current) {
//             el.className = 'on';
//         } else {
//             el.onclick = (function(i) {
//                 return function() {
//                     pagination.gotoPage(i);
//                 }
//             })(i);
//         }

//         fragment.appendChild(el);
//     }
//     paginationEl.appendChild(fragment);
// }

// // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// // 인포윈도우에 장소명을 표시합니다
// function displayInfowindow(marker, title) {
//     var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

//     infowindow.setContent(content);
//     infowindow.open(map, marker);
// }

//  // 검색결과 목록의 자식 Element를 제거하는 함수입니다
// function removeAllChildNods(el) {   
//     while (el.hasChildNodes()) {
//         el.removeChild (el.lastChild);
//     }
// }

// ------------------------------------

var map, marker;
var marker_s, marker_e, marker_p1, marker_p2;
var totalMarkerArr = [];
var drawInfoArr = [];
var resultdrawArr = [];
var markerArr = [];
var lat, lon;
var resultpoisData;

function initTmap(){
	// 1. 지도 띄우기
   map = new Tmapv2.Map("map_div", {
	   center: new Tmapv2.LatLng(37.5021008334827, 127.024465815419),
	   width : "100%",
	   height : "100vh",
	   zoom : 17,
	   zoomControl : true,
	   scrollwheel : true
	   
   });
   
   // 2. POI 통합 검색 API 요청
	keywordSearch = function(value) {
	   
	   $.ajax({
		   method:"GET",
		   url:"https://apis.openapi.sk.com/tmap/pois?version=1&format=json&callback=result",
		   async:false,
		   data:{
			   "appKey" : "l7xx7374d191e9e54abca56a605a9dcc9c85",
			   "searchKeyword" : value,
			   "resCoordType" : "EPSG3857",
			   "reqCoordType" : "WGS84GEO",
			   "count" : 10
		   },
		   success:function(response){
			   resultpoisData = response.searchPoiInfo.pois.poi;
			   
			   // 기존 마커, 팝업 제거
			   if(markerArr.length > 0){
				   for(var i in markerArr){
					   markerArr[i].setMap(null);
				   }
			   }
			   var innerHtml ="";	// Search Reulsts 결과값 노출 위한 변수
			   var positionBounds = new Tmapv2.LatLngBounds();		//맵에 결과물 확인 하기 위한 LatLngBounds객체 생성
			   
			   for(var k in resultpoisData){
				   
				   var noorLat = Number(resultpoisData[k].noorLat);
				   var noorLon = Number(resultpoisData[k].noorLon);
				   var name = resultpoisData[k].name;
				   alert(noorLat + ", " + noorLon + " : " + name)
				   
				   var pointCng = new Tmapv2.Point(noorLon, noorLat);
				   var projectionCng = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(pointCng);
				   
				   lat = projectionCng._lat;
				   lon = projectionCng._lng;
				   
				   var markerPosition = new Tmapv2.LatLng(lat, lon);
				   
				   marker = new Tmapv2.Marker({
						position : markerPosition,
						//icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_a.png",
						icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_" + k + ".png",
					   iconSize : new Tmapv2.Size(24, 38),
					   title : name,
					   map:map
					});
				   
				   innerHtml += "<li><img src='http://tmapapi.sktelecom.com/upload/tmap/marker/pin_b_m_" + k + ".png' style='vertical-align:middle;'/><span class='align-middle title"+k+"' onclick='changePlace("+k+")'>"+name+"</span></li>";
				   
				   markerArr.push(marker);
				   positionBounds.extend(markerPosition);	// LatLngBounds의 객체 확장
			   }
			   
			   $("#placesList").html(innerHtml);	//searchResult 결과값 노출
			   map.panToBounds(positionBounds);	// 확장된 bounds의 중심으로 이동시키기
			   map.zoomOut();
			   
		   },
		   error:function(request,status,error){
			   console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		   }
	   });
   };
}

$("#sPlace, #ePlace").on("keyup", function (key) {
 	if(key.keyCode == 13) {
 		searchPlaces($("#sPlace").val(), $("#ePlace").val());
 	}
 });

 // 키워드 검색을 요청하는 함수입니다
 function searchPlaces(value1, value2) {

     if (value1 != null && value2 == "") {
 	    keywordSearch(value1);
     } else if (value1 == "" && value2 != null) {
 	    keywordSearch(end.val()); 
     } else if (value1 != null && value2 != null){
     	$("#footer").css("display", "");
     	if ($(":focus").attr("id") == "sPlace") {
 		    keywordSearch(value1); 
     	} else {
 		    keywordSearch(value2); 
     	}
     } else {
     	location.reload();
     }
 }
 
 var sLat, sLon, eLat, eLon;
 
 $("#findWay").on("click", function() {
	alert(resultpoisData)
	for (var k=0; k<resultpoisData.length; k++) {
		if ($("#start").val() == resultpoisData[k].name) {
			sLat = resultpoisData[k].noorLat;
			sLon = resultpoisData[k].noorLon;
		} else if ($("#end").val() == resultpoisData[k].name) {
			eLat = resultpoisData[k].noorLat;
			eLon = resultpoisData[k].noorLon;
		}
	}

	alert(sLat + " " + sLat)
	alert(eLat + " " + eLat)
	marker_s = new Tmapv2.Marker(
	{
		position : new Tmapv2.LatLng(sLat,sLon),
		icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
		iconSize : new Tmapv2.Size(24, 38),
		map : map
	});

	// 도착
	marker_e = new Tmapv2.Marker(
	{
		position : new Tmapv2.LatLng(eLat,eLon),
		icon : "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
		iconSize : new Tmapv2.Size(24, 38),
		map : map
	});

	// 3. 경로탐색 API 사용요청
	$.ajax({
		method : "POST",
		url : "https://apis.openapi.sk.com/tmap/routes/pedestrian?version=1&format=json&callback=result",
		async : false,
		data : {
			"appKey" : "l7xx7374d191e9e54abca56a605a9dcc9c85",
			"startX" : "126.983937",
			"startY" : "37.564991",
			"endX" : "126.988940",
			"endY" : "37.566158",
			"reqCoordType" : "WGS84GEO",
			"resCoordType" : "EPSG3857",
			"startName" : "출발지",
			"endName" : "도착지"
		},
		success : function(response) {
			var resultData = response.features;

			//결과 출력
			var tDistance = "총 거리 : "
					+ ((resultData[0].properties.totalDistance) / 1000)
							.toFixed(1) + "km,";
			var tTime = " 총 시간 : "
					+ ((resultData[0].properties.totalTime) / 60)
							.toFixed(0) + "분";

			$("#result").text(tDistance + tTime);
			
			//기존 그려진 라인 & 마커가 있다면 초기화
			if (resultdrawArr.length > 0) {
				for ( var i in resultdrawArr) {
					resultdrawArr[i]
							.setMap(null);
				}
				resultdrawArr = [];
			}
			
			drawInfoArr = [];

			for ( var i in resultData) { //for문 [S]
				var geometry = resultData[i].geometry;
				var properties = resultData[i].properties;
				var polyline_;


				if (geometry.type == "LineString") {
					for ( var j in geometry.coordinates) {
						// 경로들의 결과값(구간)들을 포인트 객체로 변환 
						var latlng = new Tmapv2.Point(
								geometry.coordinates[j][0],
								geometry.coordinates[j][1]);
						// 포인트 객체를 받아 좌표값으로 변환
						var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
								latlng);
						// 포인트객체의 정보로 좌표값 변환 객체로 저장
						var convertChange = new Tmapv2.LatLng(
								convertPoint._lat,
								convertPoint._lng);
						// 배열에 담기
						drawInfoArr.push(convertChange);
					}
				} else {
					var markerImg = "";
					var pType = "";
					var size;

					if (properties.pointType == "S") { //출발지 마커
						markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
						pType = "S";
						size = new Tmapv2.Size(24, 38);
					} else if (properties.pointType == "E") { //도착지 마커
						markerImg = "http://tmapapi.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
						pType = "E";
						size = new Tmapv2.Size(24, 38);
					} else { //각 포인트 마커
						markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
						pType = "P";
						size = new Tmapv2.Size(8, 8);
					}

					// 경로들의 결과값들을 포인트 객체로 변환 
					var latlon = new Tmapv2.Point(
							geometry.coordinates[0],
							geometry.coordinates[1]);

					// 포인트 객체를 받아 좌표값으로 다시 변환
					var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
							latlon);

					var routeInfoObj = {
						markerImage : markerImg,
						lng : convertPoint._lng,
						lat : convertPoint._lat,
						pointType : pType
					};

					// Marker 추가
					marker_p = new Tmapv2.Marker(
							{
								position : new Tmapv2.LatLng(
										routeInfoObj.lat,
										routeInfoObj.lng),
								icon : routeInfoObj.markerImage,
								iconSize : size,
								map : map
							});
				}
			}//for문 [E]
			drawLine(drawInfoArr);
		},
		error : function(request, status, error) {
			console.log("code:" + request.status + "\n"
					+ "message:" + request.responseText + "\n"
					+ "error:" + error);
		}
	});
})
function addComma(num) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}

function drawLine(arrPoint) {
	var polyline_;

	polyline_ = new Tmapv2.Polyline({
		path : arrPoint,
		strokeColor : "#DD0000",
		strokeWeight : 6,
		map : map
	});
	resultdrawArr.push(polyline_);
}