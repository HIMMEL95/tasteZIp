<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">

<head>
    <title>맛Zip</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/main/homePage/common.css">
    <link rel="stylesheet" href="/resources/css/main/homePage/animate.css">
    <link rel="stylesheet" href="/resources/css/main/homePage/font.css">
    <script defer type="text/javascript" src="/resources/js/main/common.js"></script>
    <script defer type="text/javascript" src="/resources/js/main/extend.js"></script>
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
</head>

<body>

    <header id="header">
		<div class="hd">
			<h1>
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                    <img src="/resources/images/main/tasteZip_logo.png" style="width: 100px;">
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
        <section id="intro">
            <div class="introVideo">
                <h1 class="wow fadeInUp" data-wow-delay="0.5s" style="z-index: 9; visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp; top: 50px;">
                    There's never been<br>
                    a review of<br>
                    such a good restaurant.
                </h1>
                <video autoplay muted volume="10" playsinline="" preload="meta" width="100%" class="intro_video">
                    <source src="/resources/images/main/matzip.mp4" type="video/mp4">
                    지원하지 않는 웹 브라우저 입니다.
                </video>
            </div>
        </section>
        
        <section id="overview">
            <div class="overview_title">
                <h1 class="wow fadeInUp" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">Recently Visited</h1>
            </div>
            <div class="content">
                <div class="row">
                    <div class="col">
                        <a href="#">
                            <div class="card recentCard">
                                <img src="/resources/images/main/restaurant.jpg" class="card-img-top" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">힘난다 버거</h5>
                                <p class="card-text">서울 서초구 사평대로56길 7</p>
                                <p class="card-text">한일유앤아이 1층</p>
                                <p class="card-text">02-595-6768</p>
                            </div>
                        </a>
                    </div>
                    <div class="col">
                        <a href="#">
                            <div class="card recentCard">
                                <img src="/resources/images/main/restaurant.jpg" class="card-img-top" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">힘난다 버거</h5>
                                <p class="card-text">서울 서초구 사평대로56길 7</p>
                                <p class="card-text">한일유앤아이 1층</p>
                                <p class="card-text">02-595-6768</p>
                            </div>
                        </a>
                    </div>
                    <div class="col">
                        <a href="#">
                            <div class="card recentCard">
                                <img src="/resources/images/main/restaurant.jpg" class="card-img-top" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">힘난다 버거</h5>
                                <p class="card-text">서울 서초구 사평대로56길 7</p>
                                <p class="card-text">한일유앤아이 1층</p>
                                <p class="card-text">02-595-6768</p>
                            </div>
                        </a>
                    </div>
                </div>
                <!-- <div class="row">
                    <div class="col">
                        <a href="#">
                            <div class="card recentCard">
                                <img src="/resources/images/main/restaurant.jpg" class="card-img-top" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">힘난다 버거</h5>
                                <p class="card-text">서울 서초구 사평대로56길 7</p>
                                <p class="card-text">한일유앤아이 1층</p>
                                <p class="card-text">02-595-6768</p>
                            </div>
                        </a>
                    </div>
                    <div class="col">
                        <a href="#">
                            <div class="card recentCard">
                                <img src="/resources/images/main/restaurant.jpg" class="card-img-top" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">힘난다 버거</h5>
                                <p class="card-text">서울 서초구 사평대로56길 7</p>
                                <p class="card-text">한일유앤아이 1층</p>
                                <p class="card-text">02-595-6768</p>
                            </div>
                        </a>
                    </div>
                    <div class="col">
                        <a href="#">
                            <div class="card recentCard">
                                <img src="/resources/images/main/restaurant.jpg" class="card-img-top" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">힘난다 버거</h5>
                                <p class="card-text">서울 서초구 사평대로56길 7</p>
                                <p class="card-text">한일유앤아이 1층</p>
                                <p class="card-text">02-595-6768</p>
                            </div>
                        </a>
                    </div>
                    <div class="col">
                        <a href="#">
                            <div class="card recentCard">
                                <img src="/resources/images/main/restaurant.jpg" class="card-img-top" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">힘난다 버거</h5>
                                <p class="card-text">서울 서초구 사평대로56길 7</p>
                                <p class="card-text">한일유앤아이 1층</p>
                                <p class="card-text">02-595-6768</p>
                            </div>
                        </a>
                    </div>
                </div> -->
            </div>
        </section>
        <section id="recording">
            <div class="recording_title">
                <h1 class="wow fadeInUp" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">Recommend</h1>
            </div>
            <div class="recommend_content">
                <div class="sub_title">
                    <h2>Menu</h2>
                    <div class="row">
                        <div class="col">
                            <a href="#">
                                <div class="card recommendCard">
                                    <img src="/resources/images/main/icecream.jpg" class="card-img-top" alt="...">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">아이스크림</h5>
                                </div>
                            </a>
                        </div>
                        <div class="col">
                            <a href="#">
                                <div class="card recommendCard">
                                    <img src="/resources/images/main/meat.jpg" class="card-img-top" alt="...">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">스테이크</h5>
                                </div>
                            </a>
                        </div>
                        <div class="col">
                            <a href="#">
                                <div class="card recommendCard">
                                    <img src="/resources/images/main/pasta.jpg" class="card-img-top" alt="...">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">파스타</h5>
                                </div>
                            </a>
                        </div>
                        <div class="col">
                            <a href="#">
                                <div class="card recommendCard">
                                    <img src="https://cdn.pixabay.com/photo/2017/08/06/06/43/pizza-2589575_960_720.jpg" class="card-img-top" alt="...">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">피자</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="sub_title">
                    <h2>Restaurant</h2> 
                    <div class="row">
                        <div class="col">
                            <a href="#">
                                <div class="card recommendCard">
                                    <img src="/resources/images/main/family_restaurant.jpg" class="card-img-top" alt="...">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">패밀리 레스토랑</h5>
                                </div>
                            </a>
                        </div>
                        <div class="col">
                            <a href="#">
                                <div class="card recommendCard">
                                    <img src="/resources/images/main/black_restaurant.jpg" class="card-img-top" alt="...">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">블랙 레스토랑</h5>
                                </div>
                            </a>
                        </div>
                        <div class="col">
                            <a href="#">
                                <div class="card recommendCard">
                                    <img src="/resources/images/main/santorini.jpg" class="card-img-top" alt="...">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">산토리니</h5>
                                </div>
                            </a>
                        </div>
                        <div class="col">
                            <a href="#">
                                <div class="card recommendCard">
                                    <img src="https://images.unsplash.com/photo-1613946069412-38f7f1ff0b65?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80" class="card-img-top" alt="...">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">산토리니</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>                       
                </div>
            </div>
        </section>
    </main>

    <footer>
        <footer id="footer">
            <div class="ft_hd">
            <h1><img src="/resources/images/main/tasteZip_logo.png" style="width: 80px;"></h1>
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
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
</body>

</html>