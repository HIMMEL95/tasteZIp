var API_KEY = "746ace58cc2e36018eac5c9fddae1a37";

$(".card_button").on("click", function() {
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	    
	    getWeather(latitude, longitude);
	    
		searchDetailAddrFromCoords(latitude, longitude, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            //$(".address").html(result[0].address.address_name)
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
	console.log(`온도 : ${data.rain}`)
	$(".temper").html(`${data.main.temp}`);
	$(".humidity").html(`${data.main.humidity}` + " %");
	console.log(data['weather'][0]['main'])
	if (`${data.weather[0].main}` == "Rain") {
		var rain = data['weather']['rain']['1h'];
		$(".rain").html(rain + " (시간 당)");
	}
	icon(`${data.weather[0].icon}`)
}

var geocoder = new kakao.maps.services.Geocoder();

function searchDetailAddrFromCoords(lat, lon, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(lon, lat, callback);
}

icon = function(value) {
	if (value == "01d") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/2204/2204346.png)", "오전");
	} else if (value == "01n") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/3703/3703592.png)", "오후");
	} else if (value == "02d") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/2698/2698213.png)", "오전");
	} else if (value == "02n") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/2698/2698213.png)", "오후");
	} else if (value == "03d") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/3236/3236851.png)", "오전");
	} else if (value == "03n") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/3236/3236851.png)", "오후");
	} else if (value == "04d") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/6583/6583049.png)", "오전");
	} else if (value == "04n") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/6583/6583049.png)", "오후");
	} else if (value == "09d") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/414/414966.png)", "오전");
	} else if (value == "09n") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/414/414966.png)", "오후");
	} else if (value == "10d") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/3313/3313888.png)", "오전");
	} else if (value == "10n") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/3314/3314005.png)", "오후");
	} else if (value == "11d") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/7687/7687026.png)", "오전");
	} else if (value == "11n") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/7687/7687026.png)", "오후");
	} else if (value == "13d") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/2204/2204343.png)", "오전");
	} else if (value == "13n") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/2204/2204343.png)", "오후");
	} else if (value == "50d") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/3771/3771274.png)", "오전");
	} else if (value == "50n") {
		iconInfo("url(https://cdn-icons-png.flaticon.com/128/3771/3771274.png)", "오후");
	} 
}

iconInfo = function(url, text) {
	$(".icon_weather1").css("background-image", url)
	$(".time_text").html(text);
}