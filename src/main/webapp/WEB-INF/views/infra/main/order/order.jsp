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
    <title>Game View</title>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/order/order.css">
</head>

<body>
    <!-- start -->
    
    <main>
    	<div id="sidebar" class="sidebar">
	    	<div class="d-flex flex-column flex-shrink-0 bg-dark align-center" style="width: 4.5rem; height: 100vh;">
			    <a href="/" class="d-block p-3 link-dark text-decoration-none" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Icon-only">
					<img alt="" src="/resources/images/main/logo2.png" width="40" height="30">
					<span class="visually-hidden">Icon-only</span>
			    </a>
			    <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
					<li class="nav-item">
						<a href="#" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-credit-card text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="#" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-heart text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="#" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-comments text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="#" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-pen-to-square text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="#" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
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
		
		<div class="container" id="container">
			<div class="sideInfo">
				<div class="handle">
					<button type="button" class="btn_fold expand">접기</button>
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
										<input type="text" autocomplete="none" autofocus class="input_search">
									</div>
								</div>
							</div>
						</div>
						<!-- search e -->
						<div class="ng-star-inserted">
							<div class="main -top_space">
								<!-- weather s -->
								<div class="weather">
									<div class="weather_card">
										<div class="card_hearder">
											<a class="address">강남구 역삼1동</a>
											<button type="button" class="card_button">위치수정</button>
										</div>
										<div class="card_content">
											<a class="date_info_wrap"> 
												<dl class="weather_area">
													<div class="half">
														<dt class="time_text">오전</dt>
														<dd class="icon_weather1">
															<span class="blind">맑음</span>
														</dd>
													</div>
													<div class="half">
														<dt class="time_text">오후</dt>
														<dd class="icon_weather1">
															<span class="blind">맑음</span>
														</dd>
													</div>
												</dl>
												<dl class="temper_area">
													<div class="half">
														<dt class="blind">오전</dt>
														<dd class="temper">2</dd>
													</div>
													<div class="half">
														<dt class="blind">오후</dt>
														<dd class="temper">14</dd>
													</div>
												</dl>
											</a>
											<a class="dust_area ng-star-inserted">
												<dl class="dust_info_list">
													<div class="dust">
														<dt class="label">미세</dt>
														<dd class="value -good">좋음</dd>
													</div>
												</dl>
												<dl class="dust_info_list">
													<div class="dust">
														<dt class="label">초미세</dt>
														<dd class="value -good">좋음</dd>
													</div>
												</dl>
											</a>
										</div>
									</div>
								</div>
								<!-- weather e -->
								<!-- contents s -->
								<div class="contents">
									<div class="around_wrap">
										<h3 _ngcontent-ahg-c90="" class="heading">
											<span _ngcontent-ahg-c90="" class="blind">Smart Around</span>
										</h3>
										<div class="around_content">
											<div class="around_place_card ng-star-inserted">
												<h3 _ngcontent-ahg-c89="" class="heading">주변</h3>
											</div>
										</div>
									</div>
								</div>
								<!-- contents e -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
    </main>

    <!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>

</html>