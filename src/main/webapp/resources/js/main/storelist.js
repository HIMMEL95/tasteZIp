var API_KEY = "746ace58cc2e36018eac5c9fddae1a37";

window.addEventListener('load', function() {
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	    
	    getWeather(latitude, longitude);
	    
		searchDetailAddrFromCoords(latitude, longitude, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            $(".address").html(result[0].road_address.address_name)
	        }   
	    });
	});
})

$(".card_button").on("click", function() {
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	    
	    getWeather(latitude, longitude);
	    
		searchDetailAddrFromCoords(latitude, longitude, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            $(".address").html(result[0].road_address.address_name)
	        }   
	    });
	});
})

getWeather = function(lat, lon) {
	fetch(
    `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`
  )
  	.then(function(res) {
		return res.json()	
	})
	.then(function(json) {
		renderWeatherData(json);
	});
  	//.then(data => console.log(`온도 : ${data.main.temp}, 날씨 : ${data.weather[0].main}, test : ${data.weather[0].icon}`));
}

function renderWeatherData(data) {
	console.log(`온도 : ${data.main.temp}, 날씨 : ${data.weather[0].main}, test : ${data.weather[0].icon}`)
	$(".temper").html(`${data.main.temp}`);
	$(".humidity").html(`${data.main.humidity}` + " %");
	$(".detail").html(`${data.weather[0].description}`)
	console.log(data['weather'][0]['main'])
	
	if (`${data.weather[0].main}` == "Rain") {
		var rain = data['weather']['rain']['1h'];
		$(".rain").html(rain + "mm (시간 당)");
		$(".rainLabel").html("강수량")
		$(".rainDust").css("display", "");
	} else if (`${data.weather[0].main}` == "Snow") {
		var rain = data['weather']['snow']['1h'];
		$(".rain").html(rain + "cm (시간 당)");
		$(".rainLabel").html("적설량")
		$(".rainDust").css("display", "");
	} 
	icon(`${data.weather[0].icon}`)
	description(`${data.weather[0].description}`)
}

var geocoder = new kakao.maps.services.Geocoder();

function searchDetailAddrFromCoords(lat, lon, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(lon, lat, callback);
}

icon = function(value) {
	if (value == "01d") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/2204/2204346.png", "오전");
	} else if (value == "01n") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/3703/3703592.png", "오후");
	} else if (value == "02d") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/2698/2698213.png", "오전");
	} else if (value == "02n") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/2698/2698213.png", "오후");
	} else if (value == "03d") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/3236/3236851.png", "오전");
	} else if (value == "03n") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/3236/3236851.png", "오후");
	} else if (value == "04d") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/6583/6583049.png", "오전");
	} else if (value == "04n") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/6583/6583049.png", "오후");
	} else if (value == "09d") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/414/414966.png", "오전");
	} else if (value == "09n") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/414/414966.png", "오후");
	} else if (value == "10d") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/3313/3313888.png", "오전");
	} else if (value == "10n") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/3314/3314005.png", "오후");
	} else if (value == "11d") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/7687/7687026.png", "오전");
	} else if (value == "11n") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/7687/7687026.png", "오후");
	} else if (value == "13d") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/2204/2204343.png", "오전");
	} else if (value == "13n") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/2204/2204343.png", "오후");
	} else if (value == "50d") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/3771/3771274.png", "오전");
	} else if (value == "50n") {
		iconInfo("https://cdn-icons-png.flaticon.com/128/3771/3771274.png", "오후");
	} 
}

iconInfo = function(url, text) {
	$(".icon_weather1").attr("src", url)
	$(".time_text").html(text);
}

description = function(info) {
	if (info == "clear sky") {
		$(".detail").html("맑음")
	} else if (info == "few clouds") {
		$(".detail").html("약간 흐림")
	} else if (info == "scattered clouds" || info == "broken clouds") {
		$(".detail").html("흐림")
	} else if (info == "overcast clouds") {
		$(".detail").html("완전 흐림")
	} else if (info == "shower rain") {
		$(".detail").html("소나기")
	} else if (info == "rain") {
		$(".detail").html("비")
	} else if (info == "thunderstorm") {
		$(".detail").html("천둥/번개")
	} else if (info == "snow") {
		$(".detail").html("눈")
	} else if (info == "mist") {
		$(".detail").html("안개")
	}
}

// 주소를 통한 

$(".card_button").on("click", function() {
	var geocoder = new kakao.maps.services.Geocoder();
	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	
	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	            
	            var content = '<div class="bAddr">' +
	                            '<span class="title">법정동 주소정보</span>' + 
	                            detailAddr + 
	                        '</div>';
	
	            // 마커를 클릭한 위치에 표시합니다 
	            marker.setPosition(mouseEvent.latLng);
	            marker.setMap(map);
	
	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            infowindow.setContent(content);
	            infowindow.open(map, marker);

	            $(".address").html(result[0].road_address.address_name);
	        }   
	    });
	});
	
	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});
	
	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback); 
	    getWeather(coords.getLat(), coords.getLng());        
	}
	
	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	    getWeather(coords.getLat(), coords.getLng());
	}
	
	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var infoDiv = document.getElementById('centerAddr');
	
	        for(var i = 0; i < result.length; i++) {
	            // 행정동의 region_type 값은 'H' 이므로
	            if (result[i].region_type === 'H') {
	                infoDiv.innerHTML = result[i].address_name;
	                break;
	            }
	        }
	    }    
	}

	// 현재 위치 마크 
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
	        
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message);
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}
	
	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {
	
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({  
	        map: map, 
	        position: locPosition
	    }); 
	    
	    var iwContent = message, // 인포윈도우에 표시할 내용
	        iwRemoveable = true;
	
	    // 인포윈도우를 생성합니다
	    var infowindow = new kakao.maps.InfoWindow({
	        content : iwContent,
	        removable : iwRemoveable
	    });
	    
	    // 인포윈도우를 마커위에 표시합니다 
	    infowindow.open(map, marker);
	    
	    // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition);      
	}    
})
