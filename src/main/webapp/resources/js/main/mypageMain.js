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
	console.log(data)
	
	if (`${data.weather[0].main}` == "Rain") {
		var rain = data['rain']['1h'];
		$(".rain").html(rain + "mm (시간 당)");
		$(".rainLabel").html("강수량")
		$(".rainDust").css("display", "");
	} else if (`${data.weather[0].main}` == "Snow") {
		var rain = data['snow']['1h'];
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