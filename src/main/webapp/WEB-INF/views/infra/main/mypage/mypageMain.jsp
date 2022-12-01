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
            <div class="bg-white rounded-3 shadow-lg pt-1 mb-5 mb-lg-0" style="height: 600px;">
              <div class="d-md-flex justify-content-between align-items-center text-center text-md-start p-4">
                <div class="d-md-flex align-items-center">
                  <div class="mx-auto mb-2 mx-md-0 mb-md-0" style="width: 7rem;">
                  	<img src="/resources/images/main/user.png" style="width: 80px; height: 77px; margin: 5px 0 0 23px;">
                  	<!-- <img class="user" src="https://intermusicakorea.com/common/img/default_profile.png" alt="Susan Gardner"> -->
                  </div>
                  <div class="ps-md-3">
                    <h3 class="fs-base mb-0"><c:out value="${sessId}"/></h3><span class="text-accent fs-sm font"><c:out value="${sessEmail}"/></span>
                  </div>
                </div><a class="btn btn-dark d-lg-none mb-2 mt-3 mt-md-0" href="#account-menu" data-bs-toggle="collapse" aria-expanded="false"><i class="ci-menu me-2"></i>Account menu</a>
              </div>
              <div class="d-lg-block collapse" id="account-menu">
                <ul class="list-unstyled mb-0">
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/mypage/mypageMain"><b>My Page</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/member/mypageMemberForm"><b>My Information</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/order/mypageOrder"><b>My Order</b></a></li>
                  <!-- <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/reservation/mypageReservation"><b>My Reservation</b></a></li> -->
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/comment/mypageReview"><b>My Review</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/mypage/mypageBucket"><b>My Bucket</b></a></li>
                  <li class="mt-5 pb-3"><button type="button" class="btn btn-dark text-center" id="signOutBtn"><b>Log out</b></buttton></li>
                </ul>
              </div>
				<article class="box weather">
					<div class="icon bubble black" style="margin-bottom: 10px;">
						<div class="spin">
							<img src="https://dl.dropbox.com/s/0qq5anxliaopt8d/sun.png">
						</div>
					</div>
					<h1>Monday</h1>
					<span class="temp">23&deg;</span>
					<span class="high-low">15&deg;/ 28&deg;</span>
				</article>
            </div>
         </aside>
         
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
           			<div class="row pt-5 mb-3 font"><h4><b>Recently Chat</b></h4></div>
           			<!-- <div class="mt-3 font dashBord2 row">
						<div class="col">
							<img src="/resources/images/main/user.png" style="width: 150px; height: 135px; z-index:10; position: relative; margin: 5px 0 0 10px;">
							<br>
							<span style="display: block; margin-left: 61px;">ㅇㅇㅇ</span>
							<span style="text-align: center; margin-left: 20px;">2022-12-01 14:46</span>
							<button type="button" class="btn btn-primary position-relative" style="display: block; margin-left: 52px; margin-top: 10px;">
							 	Reply
								<span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
									<span class="visually-hidden">New alerts</span>
								</span>
							</button>
           				</div>
           				<div class="col">
           					<img src="/resources/images/main/user.png" style="width: 150px; height: 135px; z-index:10; position: relative; margin: 5px 0 0 10px;">
           					<span style="display: block; margin-left: 63px;">ㅇㅇㅇ</span>
           					<span style="text-align: center; margin-left: 20px;">2022-12-01 14:46</span>
           				</div>
           				<div class="col">
           					<img src="/resources/images/main/user.png" style="width: 150px; height: 135px; z-index:10; position: relative; margin: 5px 0 0 10px;">
           					<span style="display: block; margin-left: 65px;">ㅇㅇㅇ</span>
           					<span style="text-align: center; margin-left: 20px;">2022-12-01 14:46</span>
           				</div>
           				<div class="col">
           					<img src="/resources/images/main/user.png" style="width: 150px; height: 135px; z-index:10; position: relative; margin: 5px 0 0 10px;">
           					<span style="display: block; margin-left: 68px;">ㅇㅇㅇ</span>
           					<span style="text-align: center; margin-left: 20px;">2022-12-01 14:46</span>
           				</div>
           				<div class="pt-4" style="margin-left: 170px;">
	           				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev" style="left: 333px; top: 542px; height: 200px;">
								<i class="fa-solid fa-chevron-left" style="color: black;"></i>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next" style="top: 542px; height: 200px;">
								<i class="fa-solid fa-chevron-right" style="color: black;"></i>
								<span class="visually-hidden">Next</span>
							</button>
	           			</div>
	          		</div> -->
					<div id="container">
						<div class="slide_wrap">
							<div class="slide_box">
								<div class="slide_list clearfix">
									<div class="slide_content slide01">
										<img src="/resources/images/main/user.png" style="width: 150px; height: 135px; z-index:10; position: relative; margin: 5px 0 0 10px;">
			           					<span style="display: block; margin-left: 63px;">ㅇㅇㅇ</span>
			           					<span style="text-align: center; margin-left: 20px;">2022-12-01 14:46</span>
										<button type="button" class="btn btn-primary position-relative" style="display: block; margin-left: 52px; margin-top: 10px;">
										 	Reply
											<span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
												<span class="visually-hidden">New alerts</span>
											</span>
										</button>
									</div>
									<div class="slide_content slide02">
										<img src="/resources/images/main/user.png" style="width: 150px; height: 135px; z-index:10; position: relative; margin: 5px 0 0 10px;">
										<br>
										<span style="display: block; margin-left: 61px;">ㅇㅇㅇ</span>
										<span style="text-align: center; margin-left: 20px;">2022-12-01 14:46</span>
										<button type="button" class="btn btn-primary position-relative" style="display: block; margin-left: 52px; margin-top: 10px;">
										 	Reply
										</button>
									</div>
									<div class="slide_content slide03">
										<img src="/resources/images/main/user.png" style="width: 150px; height: 135px; z-index:10; position: relative; margin: 5px 0 0 10px;">
										<br>
										<span style="display: block; margin-left: 61px;">ㅇㅇㅇ</span>
										<span style="text-align: center; margin-left: 20px;">2022-12-01 14:46</span>
										<button type="button" class="btn btn-primary position-relative" style="display: block; margin-left: 52px; margin-top: 10px;">
										 	Reply
										</button>
									</div>
									<div class="slide_content slide04">
										<img src="/resources/images/main/user.png" style="width: 150px; height: 135px; z-index:10; position: relative; margin: 5px 0 0 10px;">
										<br>
										<span style="display: block; margin-left: 61px;">ㅇㅇㅇ</span>
										<span style="text-align: center; margin-left: 20px;">2022-12-01 14:46</span>
										<button type="button" class="btn btn-primary position-relative" style="display: block; margin-left: 52px; margin-top: 10px;">
										 	Reply
										</button>
									</div>
								</div>
       							<!-- // .slide_list -->
      						</div>
							<!-- // .slide_box -->
							<div class="slide_btn_box">
								<button type="button" class="slide_btn_prev">
									<i class="fa-solid fa-chevron-left" style="color: black;"></i>
									<span class="visually-hidden">Previous</span>
								</button>
								<button type="button" class="slide_btn_next">
									<i class="fa-solid fa-chevron-right" style="color: black;"></i>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
						      <!-- // .slide_btn_box -->
							<ul class="slide_pagination"></ul>
						      <!-- // .slide_pagination -->
						</div>
						    <!-- // .slide_wrap -->
					</div>
						  <!-- // .container -->
          		<!-- </div> -->
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
	
	 	(function () {
		      const slideList = document.querySelector('.slide_list');  // Slide parent dom
		      const slideContents = document.querySelectorAll('.slide_content');  // each slide dom
		      const slideBtnNext = document.querySelector('.slide_btn_next'); // next button
		      const slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button
		      const pagination = document.querySelector('.slide_pagination');
		      const slideLen = slideContents.length;  // slide length
		      const slideWidth = 400; // slide width
		      const slideSpeed = 300; // slide speed
		      const startNum = 0; // initial slide index (0 ~ 4)
		      
		      slideList.style.width = slideWidth * (slideLen + 2) + "px";
		      
		      // Copy first and last slide
		      let firstChild = slideList.firstElementChild;
		      let lastChild = slideList.lastElementChild;
		      let clonedFirst = firstChild.cloneNode(true);
		      let clonedLast = lastChild.cloneNode(true);
	
		      // Add copied Slides
		      slideList.appendChild(clonedFirst);
		      slideList.insertBefore(clonedLast, slideList.firstElementChild);
	
		      // Add pagination dynamically
		      let pageChild = '';
		      for (var i = 0; i < slideLen; i++) {
		        pageChild += '<li class="dot';
		        pageChild += (i === startNum) ? ' dot_active' : '';
		        pageChild += '" data-index="' + i + '"><a href="#"></a></li>';
		      }
		      pagination.innerHTML = pageChild;
		      const pageDots = document.querySelectorAll('.dot'); // each dot from pagination
	
		      slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";
	
		      let curIndex = startNum; // current slide index (except copied slide)
		      let curSlide = slideContents[curIndex]; // current slide dom
		      curSlide.classList.add('slide_active');
	
		      /** Next Button Event */
		      slideBtnNext.addEventListener('click', function() {
		        if (curIndex <= slideLen - 1) {
		          slideList.style.transition = slideSpeed + "ms";
		          slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 2)) + "px, 0px, 0px)";
		        }
		        if (curIndex === slideLen - 1) {
		          setTimeout(function() {
		            slideList.style.transition = "0ms";
		            slideList.style.transform = "translate3d(-" + slideWidth + "px, 0px, 0px)";
		          }, slideSpeed);
		          curIndex = -1;
		        }
		        curSlide.classList.remove('slide_active');
		        pageDots[(curIndex === -1) ? slideLen - 1 : curIndex].classList.remove('dot_active');
		        curSlide = slideContents[++curIndex];
		        curSlide.classList.add('slide_active');
		        pageDots[curIndex].classList.add('dot_active');
		      });
	
		      /** Prev Button Event */
		      slideBtnPrev.addEventListener('click', function() {
		        if (curIndex >= 0) {
		          slideList.style.transition = slideSpeed + "ms";
		          slideList.style.transform = "translate3d(-" + (slideWidth * curIndex) + "px, 0px, 0px)";
		        }
		        if (curIndex === 0) {
		          setTimeout(function() {
		            slideList.style.transition = "0ms";
		            slideList.style.transform = "translate3d(-" + (slideWidth * slideLen) + "px, 0px, 0px)";
		          }, slideSpeed);
		          curIndex = slideLen;
		        }
		        curSlide.classList.remove('slide_active');
		        pageDots[(curIndex === slideLen) ? 0 : curIndex].classList.remove('dot_active');
		        curSlide = slideContents[--curIndex];
		        curSlide.classList.add('slide_active');
		        pageDots[curIndex].classList.add('dot_active');
		      });
	
		      /** Pagination Button Event */
		      let curDot;
		      Array.prototype.forEach.call(pageDots, function (dot, i) {
		        dot.addEventListener('click', function (e) {
		          e.preventDefault();
		          curDot = document.querySelector('.dot_active');
		          curDot.classList.remove('dot_active');
		          
		          curDot = this;
		          this.classList.add('dot_active');
	
		          curSlide.classList.remove('slide_active');
		          curIndex = Number(this.getAttribute('data-index'));
		          curSlide = slideContents[curIndex];
		          curSlide.classList.add('slide_active');
		          slideList.style.transition = slideSpeed + "ms";
		          slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 1)) + "px, 0px, 0px)";
		        });
		      });
	    })();
	</script>
</body>
</html>