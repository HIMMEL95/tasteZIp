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
</head>

<body>
	<!-- 상단 -->
		<nav class="navbar navbar-expand-lg bg-dark">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="/tasteMain"><img class="img-fluid mb-3" src="/resources/images/main/logo2.png" alt="..." style="max-width: 4rem;"></a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
		      <!-- <div class="navbar-nav">
		        <a class="nav-link" aria-current="page" href="#">Main</a>
		        <a class="nav-link" href="#">My Order</a>
		        <a class="nav-link" href="#">My Review</a>
		        <a class="nav-link" href="#">My Story</a>
		      </div> -->
		    </div>
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
          <!-- Sidebar-->
          <aside class="col-lg-4 pt-4 pt-lg-0 pe-xl-5 mt-3">
            <div class="bg-white rounded-3 shadow-lg pt-1 mb-5 mb-lg-0">
              <div class="d-md-flex justify-content-between align-items-center text-center text-md-start p-4">
                <div class="d-md-flex align-items-center">
                  <div class="mx-auto mb-2 mx-md-0 mb-md-0" style="width: 7rem;">
                  	<img class="rounded-circle" src="https://intermusicakorea.com/common/img/default_profile.png" alt="Susan Gardner">
                  </div>
                  <div class="ps-md-3">
                    <h3 class="fs-base mb-0">아이디</h3><span class="text-accent fs-sm font">이메일@example.com</span>
                  </div>
                </div><a class="btn btn-primary d-lg-none mb-2 mt-3 mt-md-0" href="#account-menu" data-bs-toggle="collapse" aria-expanded="false"><i class="ci-menu me-2"></i>Account menu</a>
              </div>
              <div class="d-lg-block collapse" id="account-menu">
                <ul class="list-unstyled mb-0">
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/member/mypageMemberForm"><b>My Information</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/order/mypageOrder"><b>My Order</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/reservation/mypageReservation"><b>My Reservation</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/comment/mypageReview"><b>My Review</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/mypage/mypageBucket"><b>My Bucket</b></a></li>
                  <li class="mt-5 pb-3"><button type="button" class="btn btn-dark text-center" id="logout"><b>Log out</b></buttton></li>
                </ul>
              </div>
            </div>
          </aside>
          <!-- Content  -->
          <section class="col-lg-8">
            <!-- list-->
           	
           		<div class="container">
           			<div class="row mt-5 menuTitle"><h3><b>Mypage Review</b></h3></div>
           		</div>
           		<div class="container">
           			<div class="row justify-content-between mt-5">
           				<div class="col-1 text-start"><a href="#"><i class="fa-solid fa-bars"></i>&nbsp;전체</a></div>
           				<div class="col-9 text-start"><a href="#"><i class="fa-regular fa-images"></i>&nbsp;사진</a></div>
           				<div class="col-2 text-end">
           					<select class="form-select" aria-label="Default select example">
							  <option selected>최신순</option>
							  <option value="최신순">최신순</option>
							  <option value="오래된순">오래된순</option>
							</select>
           				</div>
           			</div>
           			
           			<!-- review List -->
           			<div class="row mt-5">
           				<div class="card shadow bg-body rounded cardBorder">
						  <div class="card-body">
						    <div class="row justify-content-between">
						    	<h4><b>힘난다 버거</b></h4>
						    	<div class="col-3 text-start"><span>서울시 강남구 신논현점</span></div>
						    	<div class="col-9 text-start" id="starValue">
							    	<i class="fa-solid fa-star"></i>
							    	<i class="fa-solid fa-star"></i>
							    	<i class="fa-solid fa-star"></i>
							    	<i class="fa-solid fa-star"></i>
							    	<i class="fa-solid fa-star"></i>
							    	&nbsp;<span><b>5점</b></span>
						    	</div>
						    </div>
						    <p class="card-text mt-4">Content: Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						  </div>
						</div>
           			</div>
           			
           			<div class="row mt-3">
           				<div class="card shadow bg-body rounded cardBorder">
						  <div class="card-body">
						    <div class="row justify-content-between">
						    	<h4><b>힘난다 버거</b></h4>
						    	<div class="col-3 text-start"><span>서울시 강남구 신논현점</span></div>
						    	<div class="col-9 text-start" id="starValue">
							    	<i class="fa-solid fa-star"></i>
							    	<i class="fa-solid fa-star"></i>
							    	<i class="fa-solid fa-star"></i>
							    	<i class="fa-solid fa-star"></i>
							    	<i class="fa-solid fa-star"></i>
							    	&nbsp;<span><b>5점</b></span>
						    	</div>
						    </div>
						    <p class="card-text mt-4">Content: Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						  </div>
						</div>
           			</div>
           			
           			<div class="row mt-3">
           				<div class="card shadow bg-body rounded cardBorder">
						  <div class="card-body">
						    <div class="row justify-content-between">
						    	<h4><b>힘난다 버거</b></h4>
						    	<div class="col-3 text-start"><span>서울시 강남구 신논현점</span></div>
						    	<div class="col-9 text-start" id="starValue">
							    	<i class="fa-solid fa-star"></i>
							    	<i class="fa-solid fa-star"></i>
							    	<i class="fa-solid fa-star"></i>
							    	<i class="fa-solid fa-star"></i>
							    	<i class="fa-solid fa-star"></i>
							    	&nbsp;<span><b>5점</b></span>
						    	</div>
						    </div>
						    <p class="card-text mt-4">Content: Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						  </div>
						</div>
           			</div>
           		</div>
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
</body>
</html>