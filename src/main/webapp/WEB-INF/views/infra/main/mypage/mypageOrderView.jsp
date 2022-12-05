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
	<form id="myform" name="myform" method="post">
		<input type="hidden" name="iforSeq" value="${item.iforSeq}"/>
		<input type="hidden" name="ifmmSeq" value="${sessSeq}">
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
           	
           		<div class="container">
           			<div class="row mt-5 menuTitle"><h3><b>Mypage Order</b></h3></div>
           		</div>
           		<div class="container">
           		<%-- <input type="hidden" name="ifmmSeq" value="${sessSeq }"> --%>
           			<div class="row pt-5 mb-3 font"><h4><b>주문 상세 내역</b></h4></div>
           			
           			<!-- 주문자정보 -->
					<hr class="hrstyle mt-2 mb-2">
           			<div class="wide">
	           			<div class="row mt-4 mb-3"><h4><b>가게 정보</b></h4></div>
	           			<div class="row mt-2 mb-4">
							<div class="col-2">
								<c:choose>
									<c:when test="${empty item.path }">
										<img src="https://ldb-phinf.pstatic.net/20200410_10/1586521245116Ig03n_JPEG/%B3%D7%C0%CC%B9%F6%C6%C4%C6%AE%B3%CA%BD%BA%BC%BE%C5%CD_%C7%A5%C1%A6%C0%CC%B9%CC%C1%F6.jpg" class="storeImg">
									</c:when>
									<c:otherwise>
										<img src="${item.path }${item.uuidName}" class="storeImg">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="col-10">
								<div><h5><b>가게 명 : ${item.ifstName}</b></h5></div>
								<div><span>주문날짜: ${item.iforCreatedAt}</span></div>
							</div>
						</div>
					</div>
					<!-- 주문자정보 -->
					<hr class="hrstyle mt-2 mb-2">
           			<div class="wide">
	           			<div class="row mt-4 mb-3"><h4><b>메뉴 정보</b></h4></div>
	           			<div class="row mt-2 mb-4">
	           				<c:forEach items="${list}" var="list" varStatus="status">
								<div class="col-2 mt-3">
									<c:choose>
										<c:when test="${empty list.path }">
											<img src="https://www.tobedone.co.kr/uploads/8d0771dbf95f31d6cba1a63d14666d1c.jpg" class="storeImg">
										</c:when>
										<c:otherwise>
											<img src="${list.path }${list.uuidName}" class="storeImg">
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-10 mt-3">
									<div><h5><b>메뉴 : ${list.ifmnName}</b></h5></div>
									<div><span>수량: ${list.ifbyCount}</span></div>
									<div><span>가격: ${list.ifbyPrice}</span></div>
								</div>
	           				</c:forEach>
						</div>
					</div>
           			<hr class="hrstyle mt-2 mb-2">
           			<!-- 가게 정보 -->
           			<div class="wide">
	           			<div class="row mt-4 mb-3"><h4><b>주문자 정보</b></h4></div>
	           			<div class="row mb-2">
							<div class="col-10"><span><b>주문자</b></span></div>
							<div class="col-2 text-end"><span>${item.ifmmName}</span></div>
						</div>
						<div class="row mb-2">
							<div class="col-10"><span><b>전화번호</b></span></div>
							<div class="col-2 text-end"><span>${item.ifmmPhone}</span></div>
						</div>
						<div class="row mb-4">
							<div class="col-8"><span><b>이메일</b></span></div>
							<div class="col-4 text-end"><span>${item.ifmmEmail}</span></div>
						</div>
           			</div>
           			<hr class="hrstyle mt-2 mb-2">
           			<!-- 가격 정보 -->
           			<div class="wide">
	           			<div class="row mt-4 mb-3"><h4><b>주문 정보</b></h4></div>
						<div class="row mb-2">
							<div class="col-10"><span>총 상품금액</span></div>
							<div class="col-2 text-end"><span><fmt:formatNumber type="number" value="${item.iforPrice}" pattern="#,###"/>원</span></div>
						</div>
						<!-- <div class="row mb-2">
							<div class="col-10"><span>상품 할인 금액</span></div>
							<div class="col-2 text-end"><span> - 63,400원</span></div>
						</div>
						<div class="row mb-2">
							<div class="col-10"><span>쿠폰 할인 금액</span></div>
							<div class="col-2 text-end"><span> - 40,000원</span></div>
						</div> -->
						<hr style="margin-top: 1rem;">
						<div class="row justify-content-between mb-2" style="color: red;">
							<div class="col-2" id="finalPrice"><h5><b>총 결제 금액</b></h5></div>
							<div class="col-2 text-end" id="finalPrice"><span><h5><b><fmt:formatNumber type="number" value="${item.iforPrice}" pattern="#,###"/>원</b></h5></span></div>
						</div>
						<div class="row justify-content-between mb-4">
							<div class="col-3"><span>카카오 페이 결제 금액</span></div>
							<div class="col-2 text-end" id="finalPrice"><span><fmt:formatNumber type="number" value="${item.iforPrice}" pattern="#,###"/>원</span></div>
						</div>				
						<div class="row justify-content-center mt-5">
							<div class="col text-center"><a type="button" href="/order/mypageOrder" class="btn btn-outline-dark" style="width: 400px;"><b>주문리스트로 돌아가기</b></a></div>
						</div>
           			</div>
           		</div>
          </section>
        </div>
      </div>
    </form>
	


<!-- 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    
    	var goUrlList = "/order/mypageOrder";
    	var form = $("form[name=myform]");
    	
    	var seq = $("input:hidden[name=iforSeq]");
    	
    	goList = function() {
			form.attr("action", goUrlList).submit();
		};
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