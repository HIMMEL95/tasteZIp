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
    <link rel="stylesheet" href="/resources/css/mypage/mypageMemberForm.css">
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
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/mypage/mypageMain"><b>My Page</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/mypage/mypageOrder"><b>My Order</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/mypage/mypageStory"><b>My Story</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/mypage/mypageReview"><b>My Review</b></a></li>
                  <li class="mt-5 pb-3"><button type="button" class="btn btn-dark text-center" id="logout"><b>Log out</b></buttton></li>
                </ul>
              </div>
            </div>
          </aside>
          <!-- Content  -->
          <section class="col-lg-8">
            <!-- list-->
           	
           		<div class="cotainer">
           			<div class="row mt-5 mb-5 menuTitle"><h3><b>내 정보 수정</b></h3></div>
           			<div class="container text-center mb-5" style="margin-top: 2rem;">
					<label class="form-label">프로필 사진</label>
						<div class="row justify-content-center">
							<div class="col-3 text-center">
				    			<img id="preview-image" src="https://intermusicakorea.com/common/img/default_profile.png" class="profile">
							</div>
						</div>
					</div>
				
				
				<!-- 항목 -->
				
				
				<div class="container">
					<div class="row gy-3" id="firstrow">
						<div class="col-6">
							<label class="form-label">이름</label>
				   			<input type="text" class="form-control" value="" placeholder="이름" name ="name" id="name" readonly>
						</div>
						<div class="col-6">
							<label class="form-label">아이디</label>
				   			<input type="text" class="form-control"	value="" placeholder="아이디" name ="id" id="id" readonly>
						</div>
						<div class="col-6">
							<label class="form-label">생년월일</label>
				   			<input type="text" class="form-control" value="" placeholder ="1990-01-01" name="dob" id="dob">
						</div>
						<div class="col-6">
							<label class="form-label">성별</label>
							<div class="row" style="margin-left: 10px;">
								<div class="col-3 form-check form-check-inline" name="gender">
								  <input class="form-check-input" type="radio" value="" name="gender" id="gender1">
								  <label class="form-check-label" for="gender1">
								    남성
								  </label>
								</div>
								<div class="col-3 form-check form-check-inline" name="gender">
								  <input class="form-check-input" type="radio" value="" name="gender" id="gender2">
								  <label class="form-check-label" for="gender2">
								    여성
								  </label>
								</div>
							</div>
						</div>
						<div class="col-6">
							<label class="form-label">연락처</label>
							<div class="input-group">
							  <select class="form-select col-2" aria-label="Default select example" name="telCompany" id="telCompany">
								  <option selected>통신사</option>
								  <option value="1">SKT</option>
								  <option value="2">LGT</option>
								  <option value="3">KT</option>
							  </select>
							  <input type="mobile" class="form-control" style="width: 50%" placeholder="01000000000" name="phone" value="" id="phone">
							</div>
						</div>
						<div class="col-6">
							<label for="email" class="form-label">이메일</label>
							<div class="input-group">
						   		<input type="text" class="form-control" placeholder="example@naver.com" value="" name="emailInsert" id="emailInsert">
					   		</div>
						</div>
						<div class="col-6">
							<label class="form-label">이메일 수신동의</label>
							<div class="row" style="margin-left: 10px;">
								<div class="col-6 form-check" name="emailNY">
								  <input class="form-check-input" type="radio" name="emailNY" value="1" <c:if test="${item.emailNY eq 1 }"> checked</c:if> id="flexRadioDefault1" >
								  <label class="form-check-label" for="flexRadioDefault1">
								    동의
								  </label>
								</div>
								<div class="col-6 form-check">
								  <input class="form-check-input" type="radio" name="emailNY" value="0" <c:if test="${item.emailNY eq 0 }"> checked</c:if> id="flexRadioDefault2">
								  <label class="form-check-label" for="flexRadioDefault2">
								    비동의
								  </label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container" id="aaa">
					<div class="row justify-content-center">
						<button type="button" class="btn" id="Modification">수정하기</button>&emsp;<button type="button" class="btn btn-dark" id="Cancel">최소하기</button>
					</div>
				</div>
				<br>
				<br>
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