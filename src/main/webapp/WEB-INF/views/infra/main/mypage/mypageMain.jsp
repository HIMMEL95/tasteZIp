<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">

<head>
    <title>맛Zip Mypage</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/mypage/mypage.css">
    <script defer type="text/javascript" src="/resources/js/main/mypageMain.js"></script>
</head>

<body>
	<!-- 상단 -->
		<nav class="navbar navbar-expand-lg bg-dark">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="/tasteMain"><img class="img-fluid mb-3" src="/resources/images/main/logo2.png" alt="..." style="max-width: 4rem;"></a>
		  </div>
		</nav>
	
		<div class="page-title-overlap bg-dark pt-4">
			<div class="container d-lg-flex justify-content-between py-2 py-lg-3">
				<div class="order-lg-1 pe-lg-4 text-center text-lg-start">
					<h1 class="h3 text-white mb-0 mb-4 titlefont">My page</h1>
				</div>
			</div>
		</div>
		
		<div class="container pt-4 pb-5 mb-2 mb-md-4 font">
        <div class="row">
        	<!-- sidebar s -->
    		<%@include file="../../xdmin/includeV1/mypageSidebar.jsp"%>
			<!-- sidebar e -->
         
          <!-- Content  -->
          <section class="col-lg-8">
            <!-- list-->
           	
           		<div class="cotainer">
           			<div class="row mt-4 menuTitle"><h3><b>Mypage Main</b></h3></div>
           			<div class="mt-3 font dashBord">
           				<img src="/resources/images/main/store.png" style="width: 150px; height: 135px; z-index:10; position: absolute; margin: 5px 0 0 10px;">
           				<div class="pt-4" style="margin-left: 170px;">
	           				<h4 class="mb-3" style="display: inline-block;">Welcome back <c:out value="${sessName}"/>!</h4>
	           				<br>
	           				<span class="mb-2" style="display: inline-block;">You visited <strong style="color: #ff7f00;">MATZIP</strong> 3 times this week.</span>
	           				<br>
	           				<span>We will always strive for the best service for you.</span>
           				</div>
           			</div>
           			<div class="row pt-5 mb-3 font"><h4><b>My activities</b></h4></div>
           			<div class="row">
	           			<div class="col" style="text-align: center;">
		       				<h3>My Order</h3>
		       				<!-- <hr style="margin-bottom: 10px; margin-top: 5px;"> -->
		       				<div style="border-style: solid; border-radius: 20px; border-width: thin;">
		       					<img src="/resources/images/main/icecream.jpg" style="width: 150px; height: 135px; margin: 10px 0 15px 0;">
		           				<br>
		           				<span style="display: block; margin-bottom: 10px;">스케줄합정</span>
		           				<span style="display: block; margin-bottom: 10px;">2022-12-06 01:47:41</span>
		           				<a style="font-size: 13px; display: block; margin-bottom: 10px;">전제보기 <i class="fa-solid fa-caret-right"></i></a>
	           				</div>
	           			</div>
	           			<div class="col" style="text-align: center;">
		       				<h3>My Favorite</h3>
		       				<!-- <hr style="margin-bottom: 10px; margin-top: 5px;"> -->
		       				<div style="border-style: solid; border-radius: 20px; border-width: thin;">
		           				<img src="/resources/images/main/icecream.jpg" style="width: 150px; height: 135px; margin: 10px 0 15px 0;">
		           				<br>
		           				<span style="display: block; margin-bottom: 10px;">노티드청담</span>
		           				<span style="display: block; margin-bottom: 10px;">서울 강남구 도산대로53길 15</span>
		           				<a style="font-size: 13px; display: block; margin-bottom: 10px;">전제보기 <i class="fa-solid fa-caret-right"></i></a>
		       				</div>
	           			</div>
	           			<div class="col" style="text-align: center;">
		       				<h3>My Review</h3>
		       				<!-- hr style="margin-bottom: 10px; margin-top: 5px;"> -->
		       				<div style="border-style: solid; border-radius: 20px; border-width: thin;">
		           				<img src="/resources/images/main/icecream.jpg" style="width: 150px; height: 135px; margin: 10px 0 15px 0;">
		           				<br>
		           				<span style="display: block; margin-bottom: 10px;">천하보쌈</span>
		           				<span style="display: block; margin-bottom: 10px;">보쌈 넘 맛있어요</span>
		           				<a style="font-size: 13px; display: block; margin-bottom: 10px;">전제보기 <i class="fa-solid fa-caret-right"></i></a>
	           				</div>
	           			</div>
           			</div>
					<!-- <div class="container cont">
					  <div class="weather-side">
					    <div class="weather-gradient"></div>
					    <div class="date-container">
					      <h2 class="date-dayname">Tuesday</h2><span class="date-day">15 Jan 2019</span><i class="location-icon" data-feather="map-pin"></i><span class="location">Paris, FR</span>
					    </div>
					    <div class="weather-container"><i class="weather-icon" data-feather="sun"></i>
					      <h1 class="weather-temp">29°C</h1>
					      <h3 class="weather-desc">Sunny</h3>
					    </div>
					  </div>
					  <div class="info-side">
					    <div class="today-info-container">
					      <div class="today-info">
					        <div class="precipitation"> <span class="title">PRECIPITATION</span><span class="value">0 %</span>
					          <div class="clear"></div>
					        </div>
					        <div class="humidity"> <span class="title">HUMIDITY</span><span class="value">34 %</span>
					          <div class="clear"></div>
					        </div>
					        <div class="wind"> <span class="title">WIND</span><span class="value">0 km/h</span>
					          <div class="clear"></div>
					        </div>
					      </div>
					    </div>
					    <div class="week-container">
					      <ul class="week-list">
					        <li class="active"><i class="day-icon" data-feather="sun"></i><span class="day-name">Tue</span><span class="day-temp">29°C</span></li>
					        <li><i class="day-icon" data-feather="cloud"></i><span class="day-name">Wed</span><span class="day-temp">21°C</span></li>
					        <li><i class="day-icon" data-feather="cloud-snow"></i><span class="day-name">Thu</span><span class="day-temp">08°C</span></li>
					        <li><i class="day-icon" data-feather="cloud-rain"></i><span class="day-name">Fry</span><span class="day-temp">19°C</span></li>
					        <div class="clear"></div>
					      </ul>
					    </div>
					    <div class="location-container">
					      <button class="location-button"> <i data-feather="map-pin"></i><span>Change location</span></button>
					    </div>
					  </div>
					</div> -->
	         </section>
	       </div>
	     </div>
	


<!-- 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    
    	feather.replace()
    
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
    </script>
	<script type="text/javascript">
	
	 	
	</script>
</body>
</html>