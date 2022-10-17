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
    <title>네이버 스포츠</title>
    <script>"Microsoft Internet Explorer" === navigator.appName && (window.onload = function () { "false" !== window.sessionStorage.getItem("gameCenterIeAlert") && (window.sessionStorage.setItem("gameCenterIeAlert", "false"), alert("Internet Explorer 10 이하 버전의 유저에게는 일부 서비스가 정상 작동하지 않을 수 있습니다. 원활한 서비스를 위해 상위 버전으로 업그레이드 후 이용해 주시기를 권해드립니다.")) })</script>
    <link
        href="https://ssl.pstatic.net/static.sports/resources/web-ui/game/220804-183157/static/css/main.5632a96e.chunk.css"
        rel="stylesheet">
    <link rel="stylesheet" type="text/css"
        href="https://ssl.pstatic.net/static.sports/resources/web-ui/game/220804-183157/static/css/14.ec71709b.chunk.css">
    <script charset="utf-8"
        src="https://ssl.pstatic.net/static.sports/resources/web-ui/game/220804-183157/static/js/14.956e9981.chunk.js"></script>
    <link id="naver-splugin-css" rel="stylesheet" type="text/css"
        href="https://ssl.pstatic.net/spi/css/20210531/spi_standard_m_https.css">
    <script type="text/javascript" charset="utf-8"
        src="https://ssl.pstatic.net/static.cbox/js/cbox.core.js?v=1383187"></script>
    <style type="text/css" id="_cbox_default_style_"></style>
    <link type="text/css" rel="stylesheet"
        href="https://ssl.pstatic.net/static.cbox/20220804143236/css/comment_sports_talk.css" charset="utf-8">
    <title>Game View</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="/resources/css/user/game.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/user/gameView.css" rel="stylesheet" type="text/css">
    <link href="/resources/css/user/comment.css" rel="stylesheet" type="text/css">
</head>

<body>
    <!-- start -->
    <header id="header">
		<div class="hd">
			<h1>
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                    <img src="/resources/images/main/logo2.png" style="width: 100px;">
                </button>
			</h1>
            <div class="offcanvas offcanvas-start bg-dark" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Offcanvas</h5>
                    <button type="button" class="btn-close bg-white" data-bs-dismiss="offcanvas" aria-label="Close" ></button>
                </div>
                <div class="offcanvas-body">
                    <form class="d-flex" role="search">
                        <input class="form-control me-2 search" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success searchBtn border-0" type="submit"><i class="fa-solid fa-magnifying-glass-location fa-2x"></i></button>
                    </form>
                    <ul class="navbar-nav justify-content-end flex-grow-1 pe-3 mt-2">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Order</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Favorite</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Crew Chat</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Story</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">My Review</a>
                        </li>
                        <hr>
                        <li class="nav-item">
                            <a class="nav-link" href="/login">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/signUp">SignUp</a>
                        </li>
                    </ul>
                </div>
            </div>
			<div class="ham_menu">
				<a href="javascript:;" class="ham_open_btn"><span class="ham_icon ham_open"></span></a>
			</div>
			<nav>
				<ul>
					<li>
						<a href="javascript:;" id="intro_menu" class="cate" data-id="intro">
							Intro
						</a>
					</li>
					<li>
						<a href="javascript:;" id="overview_menu" class="cate" data-id="overview">
							Recently Visited
						</a>
					</li>
					<li>
						<a href="javascript:;" id="recording_menu" class="cate" data-id="recording">
							Recommend
						</a>
					</li>
				</ul>
			</nav>
		</div>
	</header>

    <main>
    </main>

    <footer>
        <footer id="footer">
            <div class="ft_hd">
            <h1><img src="/resources/images/main/logo2.png" style="width: 80px;"></h1>
            <nav>
                <h2 class="family_button">FAMILY<span class="footnav fnav_top"></span>
                    <ul class="family_site_list">
                        <li>
                            <a href="http://www.leferi.com/">Homepage</a>
                        </li>
                        <li>
                            <a href="http://leferimarketing.com">Marketing</a>
                        </li>
                    </ul>
                </h2>
            </nav>
            </div>
            <div id="ft_company">
                <div class="ft_info">
                    <div>
                        <p>서울 서초구 서초대로 77길 55, 에이프로 스퀘어 3층(서초동)</p>
                        <p>사업자등록번호 111-11-11111</p>
                    </div>
                    <div>
                        <p>bbluesky7738@gmail.com</p>
                        <p>gottkfkd@gmail.com</p>
                        <p>skwlsrud3@gmail.com</p>
                        <p>heejee.yun@gmail.com</p>
                    </div>
                    <div>
                        <p>
                            +82 2 532 6509
                        </p>
                    </div>
                </div>
            </div>
        </footer>
    </footer>

    <!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>

</html>