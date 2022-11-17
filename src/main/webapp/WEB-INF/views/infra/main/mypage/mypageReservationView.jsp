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
            <div class="bg-white rounded-3 shadow-lg pt-1 mb-5 mb-lg-0">
              <div class="d-md-flex justify-content-between align-items-center text-center text-md-start p-4">
                <div class="d-md-flex align-items-center">
                  <div class="mx-auto mb-2 mx-md-0 mb-md-0" style="width: 7rem;">
                  	<img class="rounded-circle" src="https://intermusicakorea.com/common/img/default_profile.png" alt="Susan Gardner">
                  </div>
                  <div class="ps-md-3">
                    <h3 class="fs-base mb-0"><c:out value="${sessId}"/></h3><span class="text-accent fs-sm font"><c:out value="${sessEmail}"/></span>
                  </div>
                </div><a class="btn btn-dark d-lg-none mb-2 mt-3 mt-md-0" href="#account-menu" data-bs-toggle="collapse" aria-expanded="false"><i class="ci-menu me-2"></i>Menu List</a>
              </div>
              <div class="d-lg-block collapse" id="account-menu">
                <ul class="list-unstyled mb-0">
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/member/mypageMemberForm"><b>My Information</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/order/mypageOrder"><b>My Order</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/reservation/mypageReservation"><b>My Reservation</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/comment/mypageReview"><b>My Review</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/mypage/mypageBucket"><b>My Bucket</b></a></li>
                  <li class="mt-5 pb-3"><button type="button" class="btn btn-dark text-center" id="signOutBtn"><b>Log out</b></buttton></li>
                </ul>
              </div>
            </div>
          </aside>
          <!-- Content  -->
          <section class="col-lg-8">
            <!-- list-->
           	
           		<div class="container">
           			<div class="row mt-5 menuTitle"><h3><b>Mypage Reservation</b></h3></div>
           		</div>
           		<div class="container">
           			<div class="row pt-5 mb-3 font"><h4><b>예약 상세 내역</b></h4></div>
           			
           			<!-- 주문자정보 -->
           			<form  id="form" name="form" method="post">
           			<%-- <input type="hidden" name="ifmmSeq" value="${sessSeq}"/>  --%>
					<input type="hidden" name="ifrvSeq" value="${item.ifrvSeq}"/> 
           			<hr class="hrstyle mt-2 mb-2">
           			<div class="wide">
	           			<div class="row mt-4 mb-3"><h4><b>가게 정보</b></h4></div>
	           			<div class="row mt-2 mb-4">
							<div class="col-2">
								<img src="https://ldb-phinf.pstatic.net/20200410_10/1586521245116Ig03n_JPEG/%B3%D7%C0%CC%B9%F6%C6%C4%C6%AE%B3%CA%BD%BA%BC%BE%C5%CD_%C7%A5%C1%A6%C0%CC%B9%CC%C1%F6.jpg" class="storeImg">
							</div>
							<div class="col-10">
								<div><h5><b><c:out value="${item.ifstName}"/></b></h5></div>
								<div><span>예약일정: <c:out value="${item.ifrvDate}"/></span></div>
								<div><span>예약인원: <c:out value="${item.ifrvPerson}"/>명</span></div>
								<div><span>가게주소: <c:out value="${item.ifstAddress}"/></span></div>
							</div>
						</div>
					</div>
           			<hr class="hrstyle mt-2 mb-2">
           			<!-- 가게 정보 -->
           			<div class="wide">
	           			<div class="row mt-4 mb-3"><h4><b>예약자 정보</b></h4></div>
	           			<div class="row mb-2">
							<div class="col-10"><span><b>성명</b></span></div>
							<div class="col-2 text-end"><span><c:out value="${item.ifmmName}"/></span></div>
						</div>
						<div class="row mb-2">
							<div class="col-10"><span><b>전화번호</b></span></div>
							<div class="col-2 text-end"><span><c:out value="${item.ifmmPhone}"/></span></div>
						</div>
						<div class="row mb-2">
							<div class="col-8"><span><b>이메일</b></span></div>
							<div class="col-4 text-end"><span><c:out value="${item.ifmmEmail}"/></span></div>
						</div>
           			</div>
           			<hr class="hrstyle mt-4 mb-4">
           			<!-- 가게 정보 -->
           			<div class="wide">
	           			<div class="row mt-3 mb-3"><h4><b>예약 정보</b></h4></div>
	           			<div class="row">
							<div class="col-5"><span><c:out value="${item.ifmnName}"/></span></div>
							<div class="col-2 text-end"><span><b>수량:</b> <c:out value="${item.ifrvCount}"/>명</span></div>
							<div class="col-2 text-end"><span><b>인원:</b> <c:out value="${item.ifrvPerson}"/>명</span></div>
							<div class="col-3 text-end"><span style="color: red;"><b>총 예약 금액: <fmt:formatNumber type="number" value="${item.ifrvPrice}" pattern="#,###"/>원</b></span></div>
						</div>
	           			<hr class="mt-4 mb-4">
	          			<!-- 가격 정보 -->
						<div class="row justify-content-between mb-2">
							<div class="col-2" id="finalPrice"><h5><b>예상 결제 금액</b></h5></div>
							<div class="col-2 text-end" id="finalPrice"><span style="color: red;"><h5><b><fmt:formatNumber type="number" value="${item.ifrvPrice}" pattern="#,###"/>원</b></h5></span></div>
						</div>
						<div class="row justify-content-center mt-5">
							<div class="col text-center"><button type="button" class="btn btn-outline-dark" id="BtnBack" style="width: 400px;"><b>예약리스트로 돌아가기</b></button></div>
						</div>
					</div>
           		</div>
           		</form>
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
    	
    	var goUrlView = "/reservation/mypageReservation";
    	var form = $("form[name=form]");
    	var seq = $("input:hidden[name=ifmmSeq]");
    	var seq = $("input:hidden[name=ifrvSeq]");
    	
    	$("#BtnBack").on("click", function(){
			form.attr("action", goUrlView).submit();
		});
    </script>
    <script type="text/javascript">
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
</body>
</html>