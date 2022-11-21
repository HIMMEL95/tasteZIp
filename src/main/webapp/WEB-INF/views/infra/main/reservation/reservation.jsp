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
	<link rel="stylesheet" href="/resources/css/order/mapBasic.css">
	<script defer type="text/javascript" src="/resources/js/order/mapBasic.js"></script>
</head>

<body>
    <!-- start -->
    
    <main class="clearfix">
		<div id="sidebar" class="sidebar">
			<div class="d-flex flex-column flex-shrink-0 bg-dark align-center" style="width: 4.5rem; height: 100vh;">
				<a href="/tasteMain" class="d-block p-3 link-dark text-decoration-none" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Icon-only">
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
		<div class="map_container" id="container">
			<div class="sideInfo">
				<div class="handle">
					<input type="hidden" name="handle_value" id="handle_value" value="1">
					<button type="button" id="handle" class="btn_fold expand">접기</button>
				</div>
				<div class="panel">
					<div class="panel_top">
						<div class="ng-star-inserted">
							<div class="main">
								<!-- contents s -->
								<form  id="form" name="form" method="post">
								<input type="hidden" name="ifrvseq" value="${vo.ifrvSeq}"/>  
								<input type="hidden" name="ifmmSeq" value="${sessSeq}"/>
								<div class="container">
				           			<div class="row pt-5 mb-3 font"><h4><b>예약 하기</b></h4></div>
				           			
				           			<!-- 주문자정보 -->
				           			<hr class="hrstyle mt-2 mb-2">
				           			<div class="wide">
					           			<div class="row mt-4 mb-3"><h4><b>가게 정보</b></h4></div>
					           			<div class="row mt-2 mb-4">
											<div class="col-2">
												<img src="https://ldb-phinf.pstatic.net/20200410_10/1586521245116Ig03n_JPEG/%B3%D7%C0%CC%B9%F6%C6%C4%C6%AE%B3%CA%BD%BA%BC%BE%C5%CD_%C7%A5%C1%A6%C0%CC%B9%CC%C1%F6.jpg" class="storeImg" style="width: 200px; height: 100px;">
											</div>
											<div class="col-10">
												<div><h5><b><c:out value="${itemRV.ifstName}"/></b></h5></div>
												<div><h5><b><c:out value="${itemRV.ifstAddress}"/></b></h5></div>
											</div>
										</div>
									</div>
				           			<hr class="hrstyle mt-2 mb-2">
				           			<!-- 가게 정보 -->
				           			<div class="wide">
					           			<div class="row mt-4 mb-3"><h4><b>예약자 정보</b></h4></div>
					           			<div class="row mb-2">
											<div class="col-10"><span><b>성명</b></span></div>
											<div class="col-2 text-end"><span><c:out value="${itemRV.ifmmName}"/></span></div>
										</div>
										<div class="row mb-2">
											<div class="col-10"><span><b>전화번호</b></span></div>
											<div class="col-2 text-end"><span><c:out value="${itemRV.ifmmPhone}"/></span></div>
										</div>
										<div class="row mb-2">
											<div class="col-8"><span><b>이메일</b></span></div>
											<div class="col-4 text-end"><span><c:out value="${itemRV.ifmmEmail}"/></span></div>
										</div>
				           			</div>
				           			<hr class="hrstyle mt-4 mb-4">
				           			<!-- 가게 정보 -->
				           			<div class="wide">
					           			<div class="row mt-3 mb-3"><h4><b>예약 정보</b></h4></div>
					           			<div class="row">
											<div class="col-5"><span><c:out value="${itemRV.ifmnName}"/></span></div>
										</div>	
					           			<div class="row" style="margin-top: 1rem;">
											<div class="col-4"><span><b>수량</b></span></div>
											<div class="col-7 text-end"><input type="text" class="form-control" name="ifrvCount" value="${itemRV.ifrvCount}"></div>
											<div class="col-1 text-start"><span><b>개</b></span></div>
										</div>
										<div class="row" style="margin-top: 1rem;">
											<div class="col-4"><span><b>인원</b></span></div>
											<div class="col-7 text-end"><input type="text" class="form-control" name="ifrvPerson" value="${itemRV.ifrvPerson}"></div>
											<div class="col-1 text-start"><span><b>명</b></span></div>
										</div>
					           			<hr class="mt-4 mb-4">
					          			<!-- 가격 정보 -->
										<div class="row justify-content-between mb-2">
											<div class="col-4" id="finalPrice"><h5><b>예상 예약 금액</b></h5></div>
											<c:set var="varfinalPrice" value="${(itemRV.ifrvCount)*(itemRV.ifrvPerson)*(itemRV.ifmnPrice)}" />
											<fmt:parseNumber value="${varfinalPrice}" type="number" var="numfinalPrice" integerOnly="true"/>
											<div class="col-7 text-end"><input type="text" class="form-control" style="color: red;" name="ifrvPrice" value="${numfinalPrice }"></div>
											<div class="col-1 text-start"><span><b>원</b></span></div>
											<input type="hidden" name="ifrvSeq" value="${vo.ifrvSeq}"/> 
											<input type="hidden" name="ifmmSeq" value="${sessSeq}"/> 
											<input type="hidden" name="ifstSeq" value=""/>
											<input type="hidden" name="ifmnSeq" value=""/>  
										</div>
										<div class="row justify-content-center mt-5">
											<div class="col-4 text-end"><button type="button" class="btn btn-danger" id="btnRV" style="width: 150px;"><b>예약하기</b></button></div>
											<div class="col-4 text-start"><button type="button" class="btn btn-dark" id="btnCancle" style="width: 150px;"><b>취소하기</b></button></div>
										</div>
									</div>
				           		</div>
				           		</form>
								<!-- contents e -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="map" style="width:100%;height:100%;"></div>
		</div>
    </main>

    <!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=YOUR_CLIENT_ID"></script> -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec2655da82c3779d622f0aff959060e6&libraries=services"></script>
	<script type="text/javascript">
	
		var goUrlInst = "/reservation/RVInst"; 			
		var goUrlList= "/menu"; 			
		
		var form = $("form[name=form]");
		
		
		$("#btnRV").on("click", function(){
		   form.attr("action", goUrlInst).submit();
		}); 
		
		$("#btnCancle").on("click", function(){
			form.attr("action", goUrlList).submit();
		});
		
	</script>
	<script>
	
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.5021008334827, 127.024465815419), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
		var mapTypeControl = new kakao.maps.MapTypeControl();
	
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
		// 지도에 교통정보를 표시하도록 지도타입을 추가합니다
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);    
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

	</script>
</body>

</html>