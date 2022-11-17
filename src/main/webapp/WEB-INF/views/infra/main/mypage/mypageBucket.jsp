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
                </div><a class="btn btn-dark d-lg-none mb-2 mt-3 mt-md-0" href="#account-menu" data-bs-toggle="collapse" aria-expanded="false"><i class="ci-menu me-2"></i>Account menu</a>
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
           	
           		<div class="cotainer">
           			<div class="row mt-5 mb-5 menuTitle"><h3><b><i class="fa-solid fa-bucket"></i> Mypage Bucket</b></h3></div>
           			<div class="row mb-2 justify-content-between">
           				<div class="col-3 text-start"><h5><b><input class="check" type="checkbox" name="check" onclick="selectAll(this)"> 전체선택</b></h5></div>
           				<div class="col-9 text-end"><button type="button" class="btn btn-outline-dark">전체 삭제</button></div>
           			</div> 
           			<hr>
           			<form method="post" name="formList" id="formList">
           			<input type="hidden" name="ifmmSeq" value="${sessSeq }">
	           		<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
	           		<c:choose>
						<c:when test="${fn:length(list) eq 0}">
							<div class="col-12 text-center"><h5>장바구니 내역이 존재하지 않습니다.</h5></div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="list" varStatus="status">
			           			<div class="row mt-3 mb-3">
									<div class="col-1 text-center"><input class="check" type="checkbox" name="check"></div>
			           				<div class="col-11">
				           				<div class="card shadow bg-body rounded cardBorder">
										  <div class="card-body">
										    <div class="row justify-content-center">
										    	<div class="col-3 text-center">
										    		<h5><b>가게이름</b></h5>
										    		<h6><b><c:out value="${list.ifstName}"/></b></h6>
										    	</div>
										    	<div class="col-3 text-center">
										    		<h5><b>메뉴이름</b></h5>
										    		<h6><c:out value="${list.ifmnName}"/></h6>
										    	</div>
										    	<div class="col-6 text-center">
										    		<h5><b>가격</b></h5>
										    		<h6 style="color: red;"><b><fmt:formatNumber type="number" value="${list.iforPrice}" pattern="#,###"/>원</b> (수량: <c:out value="${list.iforCount}"/>개)</h6>
										    	</div>
										    </div>
										  </div>
										</div>
									</div>
			           			</div>
			          		</c:forEach>
			          </c:otherwise>
				</c:choose>
				</form>
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
    <script type="text/javascript">
    
		function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('check');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		}
    </script>
    <script type="text/javascript">
    
   		var goUrlList = "/mypage/mypageBucket";
   		var form = $("form[name=formList]");
   		 
   		 
    </script>
</body>
</html>