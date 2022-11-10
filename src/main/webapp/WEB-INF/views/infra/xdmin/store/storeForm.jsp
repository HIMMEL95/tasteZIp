<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<jsp:useBean id="CodeServiceImpl" class="com.tasteZip.infra.modules.code.CodeServiceImpl"/>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Owner Store Form</title>
	<link rel="stylesheet" href="/resources/css/xdmin/codeGroup/codeGroupList.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/js/commonXdmin.js"></script>
	<script src="/resources/common/js/common.js"></script>
	<style type="text/css">
		.form-label{
			font-weight: bold;
		}
	</style>
</head>
<body>
	<!-- start -->
	<header class="navbar-light fixed-top header-static bg-mode align-items-center">
        <!-- 상단 -->
        <nav class="navbar navbar-expand-lg bg-dark">
            <div class="container px-3 px-xl-5 pt-1">
                <!-- Logo START -->
                <a class="navbar-brand" href="/sportMain">
                    <img src="/resources/images/main/logo2.png" style="width: 80px;">
					<span class="text-white" id="MATZIP">MATZIP</span>
                </a>
                <!-- Profile START -->
                <div class="dropdown">
                    <ul class="nav flex-nowrap align-items-center ms-sm-3 list-unstyled">
                        <li class="me-2">
                            <a class="p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside"
                                data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
                                <img class="avatar-img rounded-circle" src="/resources/images/diano.jpg" alt="avatar"
                                    style="width: 40px;">
                            </a>
                            <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
                                aria-labelledby="profileDropdown">
                                <!-- Profile info -->
                                <li class="px-3">
                                    <div class="d-flex align-items-center">
                                        <!-- Avatar -->
                                        <div class="avatar mt-2">
                                            <img class="avatar-img rounded-circle shadow" src="/resources/images/diano.jpg"
                                                alt="avatar" style="width: 30px;">
                                        </div>
                                        <div>
                                            <a class="fs-6 fw-bold" href="/member/memberUView?seq=${sessSeq }"><c:out value="${sessName }"/> </a>
                                            <p class="small m-0"><c:out value="${sessEmail }"/> </p>
                                        </div>
                                    </div>
                                    <hr>
                                </li>
                                <!-- Links -->
                                <li>
                                    <a class="dropdown-item" href="/member/memberUView?seq=${sessSeq }">
                                        <i class="fa-solid fa-user me-2"></i>
                                        Edit Profile
                                    </a>
                                </li>
                                <!-- <li>
                                    <a class="dropdown-item" href="#">
                                        <i class="fa-solid fa-gear me-2"></i>
                                        Account Settings
                                    </a>
                                </li> -->
                                <li>
                                    <a class="dropdown-item" href="#">
                                        <i class="fa-solid fa-circle-info me-2"></i>
                                        Help
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item bg-danger-soft-hover" id="signOutBtn" >
                                        <i class="fa-solid fa-power-off me-2"></i>
                                        Sign Out
                                    </a>
                                </li>
                                <!-- Dark mode switch START -->
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- Profile START -->
            </div>
        </nav>
    </header>
	<main>
		<!-- <form name="form" id="form" method="post" enctype="multipart/form-data"> -->
		<form id="myform" name="myform" method="post" autocomplete="off">
			<input type="hidden" name="ifstSeq" value="<c:out value="${vo.ifstSeq}"/>"/>
			<div style="height: 100px"></div>
			<div class="wrapper">
				<div class="container">
					<div class="row" style="height: 800px;">
						<div class="col-lg-3">
	                        <!-- Advanced filter responsive toggler START -->
	                        <nav class="navbar navbar-expand-lg mx-0">
	                            <div class="d-flex align-items-center d-lg-none">
	                                <button class="border-0 bg-transparent" type="button" data-bs-toggle="offcanvas"
	                                    data-bs-target="#offcanvasSideNavbar" aria-controls="offcanvasSideNavbar">
	                                    <i class="btn btn-primary fw-bold fa-solid fa-sliders-h text-white" style="background: #212529;"></i>
	                                    <span class="h6 mb-0 fw-bold d-lg-none ms-2">항목</span>
	                                </button>
	                            </div>
	                            <nav class="navbar navbar-expand-lg mx-0">
	                                <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasSideNavbar"
	                                    style="visibility: visible; width:250px;" aria-modal="true" role="dialog">
	                                    <div class="offcanvas-header">
	                                        <button type="button" class="btn-close text-reset ms-auto" data-bs-dismiss="offcanvas"
	                                            aria-label="Close"></button>
	                                    </div>
	                                    <div class="offcanvas-body d-block px-2 px-lg-0">
	                                        <div class="card overflow-hidden">
	                                            <img src="https://cdn.pixabay.com/photo/2017/03/27/14/21/chairs-2179044__340.jpg" class="card-img-top" alt="background"
	                                                style="height: 200px; background-position: center; background-size: cover; background-repeat: no-repeat;">
	                                            <div class="card-body pt-0">
	                                                <div class="text-center">
	                                                    <hr>
	                                                    <ul class="nav nav-link-secondary flex-column fw-bold gap-2">
	                                                        <li class="nav-item">
	                                                            <a class="nav-link" href="/member/memberList">
	                                                                <span class="icon"><i class="fas fa-home" style="color: black;"></i></span>
																	<span class="item" style="color: black;" id="sidebar">Home</span>
	                                                            </a>
	                                                        </li>
	                                                        <li class="nav-item">
	                                                            <a class="nav-link" href="/member/memberList">
	                                                                <span class="icon"><i class="fa-solid fa-user"></i></span>
																	<span class="item" style="color: black;" id="sidebar">Member</span>
	                                                            </a>
	                                                        </li>
	                                                        <li class="nav-item">
	                                                            <a class="nav-link" href="/order/orderList">
	                                                                <span class="icon"><i class="fa-solid fa-cart-shopping"></i></span>
																	<span class="item" style="color: black;" id="sidebar">Order</span>
	                                                            </a>
	                                                        </li>
	                                                        <li class="nav-item">
	                                                            <a class="nav-link" href="/store/xdminStoreList">
	                                                                <span class="icon"><i class="fa-solid fa-store"></i></span>
																	<span class="item" style="color: black;" id="sidebar">Store</span>
	                                                            </a>
	                                                        </li>
	                                                        <li class="nav-item">
	                                                            <a class="nav-link" href="#">
	                                                                <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
																	<span class="item" style="color: black;" id="sidebar">Story</span>
	                                                            </a>
	                                                        </li>
	                                                        <li class="nav-item">
	                                                            <a class="nav-link" href="/menu/menuList">
	                                                                <span class="icon"><i class="fa-solid fa-utensils"></i></span>
																	<span class="item" style="color: black;" id="sidebar">Menu</span>
	                                                            </a>
	                                                        </li>
	                                                        <li class="nav-item">
	                                                            <a class="nav-link" href="/code/codeList">
	                                                                <span class="icon"><i class="fa-solid fa-code"></i></span>
																	<span class="item" style="color: black;" id="sidebar">Code</span>
	                                                            </a>
	                                                        </li>
	                                                        <li class="nav-item">
	                                                            <a class="nav-link" href="/codeGroup/codeGroupList">
	                                                                <span class="icon"><i class="fa-solid fa-layer-group"></i></span>
																	<span class="item" style="color: black;" id="sidebar">CodeGroup</span>
	                                                            </a>
	                                                        </li>
	                                                    </ul>
	                                                </div>
	                                            </div>
	                                        </div>
	                                        <p class="small text-center mt-1">©2022 <a class="text-body" target="_blank" href="#"> TASTEZIP
	                                            </a></p>
	                                    </div>
	                                </div>
	                            </nav>
	                        </nav>
	                    </div>
						<div class="col" style="padding-top: 20px;">
							<h2 class="needs-validation mt-2">My Store Form</h2>
							<div class="content">
								<div class="row">
									<div class="col">
										<div class="accordion" id="accordionExample">
											<div class="accordion-item">
												<h2 class="accordion-header" id="headingOne">
													<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
														 오픈 시간
													</button>
												</h2>
												<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
													<div class="accordion-body">
														<c:choose>
															<c:when test="${item.ifstSeq eq 0 or empty item.ifstSeq }">
															<input type="hidden" id="test" value="${item.ifstSeq }">
																<c:forEach items="${day }" var="list2" varStatus="status">
																	<div class="row">
																		<div class="col-2">
																			<c:set var="listCodeDay" value="${CodeServiceImpl.selectListCachedCode('6') }" />
																			<select class="form-select" id="ifrtDayArray" name="ifrtDayArray">
																				<option value="">선택</option>
																				<c:forEach items="${listCodeDay}" var="listDay" varStatus="statusDay">
																					<option value="${listDay.ifccSeq }" <c:if test="${list2.ifrtDay eq listDay.ifccSeq}">selected</c:if>><c:out value="${listDay.ifccName }"/></option>
																				</c:forEach>
																			</select>
																		</div>
																		<div class="col-2">
																			<c:set var="listCodeClose" value="${CodeServiceImpl.selectListCachedCode('8') }" />
																			<select class="form-select" id="ifrtOpeningArray" name="ifrtOpeningArray">
																				<option value="">선택</option>
																				<c:forEach items="${listCodeClose}" var="listClose" varStatus="statusClose">
																					<option value="${listClose.ifccSeq }" <c:if test="${list.ifrtOpening eq listClose.ifccSeq}">selected</c:if>><c:out value="${listClose.ifccName }"/></option>
																				</c:forEach>
																			</select>
																		</div>
																		<div class="col">
																			<input type="time" class="form-control" id="ifrtStartTimeArray" name="ifrtStartTimeArray" value="${list.ifrtStartTime }">
																		</div>
																		~
																		<div class="col">
																			<input type="time" class="form-control" id="ifrtEndTimeArray" name="ifrtEndTimeArray" value="${list.ifrtEndTime }">
																		</div>
																	</div>
																</c:forEach>
															</c:when>	
															<c:otherwise>
																<c:forEach items="${running }" var="list" varStatus="status">
																	<div class="row">
																		<div class="col-2">
																			<c:set var="listCodeDay" value="${CodeServiceImpl.selectListCachedCode('6') }" />
																			<select class="form-select" id="ifrtDayArray" name="ifrtDayArray" disabled>
																				<option value="">선택</option>
																				<c:forEach items="${listCodeDay}" var="listDay" varStatus="statusDay">
																					<option value="${listDay.ifccSeq }" <c:if test="${list.ifrtDay eq listDay.ifccSeq}">selected</c:if>><c:out value="${listDay.ifccName }"/></option>
																				</c:forEach>
																			</select>
																		</div>
																		<div class="col-2">
																			<c:set var="listCodeClose" value="${CodeServiceImpl.selectListCachedCode('8') }" />
																			<select class="form-select" id="ifrtOpeningArray" name="ifrtOpeningArray">
																				<option value="">선택</option>
																				<c:forEach items="${listCodeClose}" var="listClose" varStatus="statusClose">
																					<option value="${listClose.ifccSeq }" <c:if test="${list.ifrtOpening eq listClose.ifccSeq}">selected</c:if>><c:out value="${listClose.ifccName }"/></option>
																				</c:forEach>
																			</select>
																		</div>
																		<div class="col">
																			<input type="time" class="form-control" id="ifrtStartTimeArray" name="ifrtStartTimeArray" value="${list.ifrtStartTime }">
																		</div>
																		~
																		<div class="col">
																			<input type="time" class="form-control" id="ifrtEndTimeArray" name="ifrtEndTimeArray" value="${list.ifrtEndTime }">
																		</div>
																	</div>
																</c:forEach>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<div class="col">
										<label for="ifstName" class="form-label">이름</label> 
										<input type="text" class="form-control" id="ifstName" name="ifstName" value="${item.ifstName }">
									</div>
									<div class="col">
										<label for="ifstPhone" class="form-label">전화번호</label> 
										<input type="text" class="form-control" id="ifstPhone" name="ifstPhone" placeholder="01000000000" value="${item.ifstPhone }">
									</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<label for="ifstOrderNy" class="form-label">주문제공여부</label> 
					   				<div class="col-6">
										<select class="form-select" id="ifstOrderNy" name="ifstOrderNy">
											<option value="">선택</option>
											<option value="0" <c:if test="${vo.shOptionDate eq 0 }">selected</c:if>>X</option>
											<option value="1" <c:if test="${vo.shOptionDate eq 1 }">selected</c:if>>O</option>
										</select>
									</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<label for="ifstZipCode" class="form-label">우편번호</label> 
									<div class="col-6">	
						   				<input type="text" class="form-control" id="ifstZipCode" name="ifstZipCode" value="${item.ifstZipCode }">
						   			</div>
						   			<div class="col">
						   				<button type="button" class="btn btn-outline-dark" id="searchBtn"> 우편번호 검색 </button>
						   				<button class="btn btn-outline-dark" type="button" id="" style="height: 2.4rem;"><i class="fa-solid fa-rotate-left"></i></button>
					   				</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<label for="ifstAddress" class="form-label">주소</label> 
									<div class="col">	
						   				<input type="text" class="form-control" id="ifstAddress" name="ifstAddress" value="${item.ifstAddress }">
						   			</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<div class="col-6">	
										<label for="v" class="form-label">상세주소</label> 
						   				<input type="text" class="form-control" id="ifstAddressDetail" name="ifstAddressDetail" value="${item.ifstAddressDetail }">
						   			</div>
						   			<div class="col-6">
						   				<label for="ifstAddressExtra" class="form-label">참고 항목</label>
						   				<input type="text" class="form-control" id="ifstAddressExtra" name="ifstAddressExtra" value="${item.ifstAddressExtra }"> 
					   				</div>
								</div>
								<div class="row">
				                	<div class="col">
				                		<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
											<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1;width: 20px;" onclick="foldDaumPostcode()" alt="접기 버튼">
										</div>
				                	</div>
				                </div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<div class="col-12">
										<label for="ifstDirections" class="form-label">간편 길안내</label> 
										<input type="text" class="form-control" id="ifstDirections" name="ifstDirections" placeholder="" value="${item.ifstDirections }">
									</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<div class="col-12">
										<label for="ifstInfo" class="form-label">가게 소개글</label> 
										<input type="text" class="form-control" id="ifstInfo" name="ifstInfo" placeholder="" value="${item.ifstInfo }">
									</div>
								</div>
							</div>
							<div class="row align-items-center mt-5">
	                            <div class="col-2">
	                                <button class="border-0 btn bg-secondary shadow" type="button" id="btnList">
	                                    <i class="fa-solid fa-bars" style="color: white;"></i>
	                                </button>
	                                <button id="btnUel" class="border-0 btn btn-dark shadow" type="button" data-bs-toggle="modal"
	                                    data-bs-target="#deleteModal">
	                                    <i class="fa-solid fa-xmark text-white"></i>
	                                </button>
	                            </div>
	                            <div class="col-3 offset-7" align="right">
	                                <div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false"
		                                tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		                                <div class="modal-dialog">
		                                    <div class="modal-content">
		                                        <div class="modal-header">
		                                            <h5 class="modal-title fw-bold" id="staticBackdropLabel">게시물 삭제</h5>
		                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
		                                                aria-label="Close"></button>
		                                        </div>
		                                        <div class="modal-body fs-6">
		                                       		선택하신 게시물을 정말로 삭제하시겠습니까?
		                                        </div>
		                                        <div class="modal-footer">
		                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		                                            <button id="delBtn" type="button" class="btn btn-primary">삭제</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
	                                <button id="btnDel" value="Del" class="border-0 btn bg-danger shadow" type="button" data-bs-toggle="modal"
	                                    data-bs-target="#deleteModal">
	                                    <i class="fa-solid fa-trash-can" style="color: white;"></i>
	                                </button>
	                                <button id="btnSave" class="border-0 btn bg-success shadow" type="button">
	                                    <i class="fa-regular fa-bookmark" style="color: white;"></i>
	                                </button>
	                            </div>
	                        </div>
						</div>
					</div>
				</form>
		
		 <form name="formVo" id="formVo" method="post">
			<!-- *Vo.jsp s -->
			<!-- #-> -->
			<!-- *Vo.jsp e -->
		</form> 
	</main>

	<!-- end -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd29bc43140391b0206f367d2b8c01eb&libraries=services"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>

		var goUrlList = "/store/xdminStoreList"; /* #-> */
		var goUrlInst = "/store/storeInst"; /* #-> */
		var goUrlUpdt = "/store/storeUpdt"; /* #-> */
		var goUrlUel = "/store/storeUele";
        var goUrlDel = "/store/storeDele";

		var ifstSeq = $("input:hidden[name=ifstSeq]"); /* #-> */

		var form = $("form[name=myform]");
		var formVo = $("form[name=formVo]");
		
		$("#btnList").on("click", function() {
			formVo.attr("action", goUrlList).submit();
		});

		$("#btnUel").on("click", function() {
			DelValidation("#delBtn", goUrlUel, "선택하신 게시물을 삭제하시겠습니까?");
		})
		
		$("#btnDel").on("click", function() {
			DelValidation("#delBtn", goUrlDel, "선택하신 게시물을 진짜로 삭제하시겠습니까?");		
		})
		
		DelValidation = function(confirm, url, msg) {
			$(".modal-body").html(msg);
			$(confirm).on("click", function() {
				form.attr("action", url).submit();
			})
		}
		
		$("#btnSave").on("click", function() {
			if (ifstSeq.val() == "0" || ifstSeq.val() == "") {
				form.attr("action", goUrlInst).submit();
			} else {
				form.attr("action", goUrlUpdt).submit();
			}
		})
		
	</script>
	<script type="text/javascript">
		var element_wrap = document.getElementById('wrap');
	    
	    function foldDaumPostcode() {
	        // iframe을 넣은 element를 안보이게 한다.
	        element_wrap.style.display = 'none';
	    }
	    
	    function daumPostCode() {
	    	var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("ifstAddressExtra").value = extraAddr;
	                
	                } else {
	                    document.getElementById("ifstAddressExtra").value = '';
	                }
	
	            	// 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('ifstZipCode').value = data.zonecode;
	                document.getElementById("ifstAddress").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("ifstAddressDetail").focus();
	                
	    			/* var geocoder = new daum.maps.services.Geocoder();
	    			
	    			geocoder.addressSearch(addr, function(result, status) {
	    				if(status === daum.maps.services.Status.OK) {
	    					$("#lat").val(result[0].y);
	    					$("#long").val(result[0].x);
	    				}
	    			}); */
	
	                // iframe을 넣은 element를 안보이게 한다.
	                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
	                element_wrap.style.display = 'none';
	
	                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
	                document.body.scrollTop = currentScroll;
	            },
	            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
	            onresize : function(size) {
	                element_wrap.style.height = size.height+'px';
	            },
	            width : '100%',
	            height : '100%'
	        }).embed(element_wrap);
	
	        // iframe을 넣은 element를 보이게 한다.
	        element_wrap.style.display = 'block';
	    	
	    };
	    
	    $("#refresh").on("click", function() {
			$("#ifstZipCode").val('');
			$("#ifstAddress").val('');
			$("#ifstAddressDetail").val('');
			$("#ifstAddressExtra").val('');
		});
	    
	    $("#searchBtn").on("click", function() {
        	daumPostCode();
		});
	</script>
</body>
</html>
