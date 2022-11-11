<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Menu Form</title>
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
	                                <img class="avatar-img rounded-circle" src="/resources/images/diano.jpg" alt="avatar" style="width: 40px;">
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
			<input type="hidden" name="ifmnSeq" value="<c:out value="${vo.ifmnSeq}"/>"/>
			<div style="height: 100px"></div>
			<div class="wrapper">
				<div class="container" style="height: 100vh;">
					<div class="row" >
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
		                                            <img src="https://images.pexels.com/photos/313700/pexels-photo-313700.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" class="card-img-top" alt="background"
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
		                                        <p class="small text-center mt-1">©2022 
			                                        <a class="text-body" target="_blank" href="#"> 
			                                        	TASTEZIP
		                                            </a>
	                                            </p>
		                                    </div>
		                                </div>
		                            </nav>
		                        </nav>
		                    </div>
						<div class="col" style="padding-top: 20px;">
							<h2 class="needs-validation mt-2">Menu Form</h2>
							<div class="content">
								<div class="row">
									<div class="col-6">
										<label class="form-label">코드</label> 
										<input type="text" class="form-control" value="<c:out value="${item.ifmnSeq}"/>">
									</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<div class="col-12">	
										<label class="form-label">메뉴이름</label> 
						   				<input type="text" class="form-control" id="" name="" value="<c:out value="${item.ifmnName}"/>">
						   			</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label class="form-label">가격</label> 
										<input class="form-control" value="<c:out value="${item.ifmnPrice}"/>">
									</div>
									<div class="col">
										<label class="form-label">할인가</label> 
										<input type="text" class="form-control" value="<c:out value="${item.ifmnDiscount}"/>">
									</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<div class="col-12">	
										<label class="form-label">정보</label> 
						   				<textarea class="form-control" aria-label="With textarea">${item.ifmnInfo}</textarea>
						   			</div>
								</div>
								<div class="row mt-3">
									<div class="col-6">
										<label class="form-label">세트여부</label> 
										<select class="form-select" value="<c:out value="${item.ifmnSet_div}"/>">
											<option selected disabled value="">선택</option>
											<option>N</option>
											<option>Y</option>
										</select>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-2">
										<label class="form-label">통신사</label> 
										<select class="form-select">
											<option selected disabled value="">선택</option>
											<option>KT</option>
											<option>SKT</option>
											<option>LGT</option>
											<option>...</option>
										</select>
									</div>
									<div class="col">
										<label class="form-label">전화번호</label> 
										<input type="text" class="form-control" placeholder="특수문자(-)없이 숫자만 입력 ">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-12">
										<label class="form-label">이메일</label> 
										<input type="text" class="form-control" placeholder="영문(대소문자),숫자, @이후 전체 이메일 주소 포함 ">
									</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<label class="form-label">우편번호</label> 
									<div class="col-8">	
						   				<input type="text" class="form-control">
						   			</div>
						   			<div class="col-4">
						   				<button type="button" class="btn btn-outline-dark" onclick=""> 우편번호 검색 </button>
						   				<button class="btn btn-outline-dark" type="button" id="" style="height: 2.4rem;"><i class="fa-solid fa-rotate-left"></i></button>
					   				</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<div class="col-12">	
										<label class="form-label">주소</label> 
						   				<input type="text" class="form-control" id="" name="" value="">
						   			</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<div class="col-6">	
										<label class="form-label">상세주소</label> 
						   				<input type="text" class="form-control" id="" name="" value="">
						   			</div>
						   			<div class="col-6">
						   				<label class="form-label">참고 항목</label>
						   				<input type="text" class="form-control" id="" name="" value=""> 
					   				</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label class="form-label">사용자 구분</label> <select class="form-select" >
											<option selected disabled value="">선택</option>
											<option>고객</option>
											<option>사장님</option>
											<option>관리자</option>
										</select>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label class="form-label">SNS</label> <select class="form-select" >
											<option selected disabled value="">선택</option>
											<option>일반</option>
											<option>네이버</option>
											<option>구글</option>
											<option>페이스북</option>
											<option>카카오</option>
										</select>
									</div>
									<div class="col">
										<label class="form-label">이메일여부</label> <select class="form-select">
											<option selected disabled value="">선택</option>
											<option>N</option>
											<option>Y</option>
										</select>
									</div>
									<div class="col">
										<label class="form-label">삭제여부</label> <select class="form-select">
											<option selected disabled value="">선택</option>
											<option>N</option>
											<option>Y</option>
										</select>
									</div>
								</div>
								 <div class="row mt-sm-4">
							        <div class="col-sm-6 mt-3 mt-sm-0">
							        	<c:set var="type" value="2"/>		<!-- #-> -->
							        	<c:set var="name" value="uploadImg"/>		<!-- #-> -->
							        	<input type="hidden" id="<c:out value="${name }"/>Type" name="<c:out value="${name }"/>Type" value="<c:out value="${type }"/>"/>
							        	<input type="hidden" id="<c:out value="${name }"/>MaxNumber" name="<c:out value="${name }"/>MaxNumber" value="0"/>
							        	<input type="hidden" id="<c:out value="${name }"/>DeleteSeq" name="<c:out value="${name }"/>DeleteSeq"/>
							        	<input type="hidden" id="<c:out value="${name }"/>DeletePathFile" name="<c:out value="${name }"/>DeletePathFile"/>
							            <label for="uploadImg" class="form-label input-file-button">이미지첨부</label>
							 			<input class="form-control form-control-sm" id="<c:out value="${name }"/>" name="<c:out value="${name }"/>" type="file" multiple="multiple" style="display: none;" onChange="upload('<c:out value="${name }"/>', <c:out value="${type }"/>, 0, 1, 0, 0, 1);">
										<div id="<c:out value="${name }"/>Preview" class="addScroll">
											<c:forEach items="${listUploaded}" var="listUploaded" varStatus="statusUploaded">
												<c:if test="${listUploaded.type eq type }">
													<div id="imgDiv_<c:out value="${type }"/>_<c:out value="${listUploaded.sort }"/>" style="display: inline-block; height: 95px;">
														<img src="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>" class="rounded" width= "85px" height="85px" style="cursor:pointer;" onClick="openViewer(<c:out value="${listUploaded.type }"/>, <c:out value="${listUploaded. sort }"/>);">
														<div style="position: relative; top:-85px; left:5px"><span style="color: red; cursor:pointer;" onClick="delImgDiv('<c:out value="${name }"/>', <c:out value="${type }"/>,<c:out value="${listUploaded.sort }"/>, <c:out value="${listUploaded.seq }"/>, '<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>')">X</span></div>
													</div>
												</c:if>
											</c:forEach>
										</div>
							        </div>
							        <div class="col-sm-6 mt-3 mt-sm-0">
							        	<c:set var="type" value="3"/>		<!-- #-> -->
							        	<c:set var="name" value="uploadFile"/>		<!-- #-> -->
							        	<input type="hidden" id="<c:out value="${name }"/>Type" name="<c:out value="${name }"/>Type" value="<c:out value="${type }"/>"/>
							        	<input type="hidden" id="<c:out value="${name }"/>MaxNumber" name="<c:out value="${name }"/>MaxNumber" value="0"/>
							        	<input type="hidden" id="<c:out value="${name }"/>DeleteSeq" name="<c:out value="${name }"/>DeleteSeq"/>
							        	<input type="hidden" id="<c:out value="${name }"/>DeletePathFile" name="<c:out value="${name }"/>DeletePathFile"/>   	
										<label for="uploadFile" class="form-label input-file-button">파일첨부</label>
										<input class="form-control form-control-sm" id="<c:out value="${name }"/>" name="<c:out value="${name }"/>" type="file" multiple="multiple" style="display: none;" onChange="upload('<c:out value="${name }"/>', <c:out value="${type }"/>, 0, 2, 0, 0, 2);" >
										<div class="addScroll">
											<ul id="<c:out value="${name }"/>Preview" class="list-group">
												<c:forEach items="${listUploaded}" var="listUploaded" varStatus="statusUploaded">
													<c:if test="${listUploaded.type eq type }">
														<li id="li_<c:out value="${type }"/>_<c:out value="${listUploaded.sort }"/>" class="list-group-item d-flex justify-content-between align-items-center">
														<a href="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>" download="<c:out value="${listUploaded.originalName }"/>" class="text-decoration-none"><c:out value="${listUploaded.originalName }"/></a>
														<span class="badge bg-danger rounded-pill" onClick="delLi('<c:out value="${name }"/>', <c:out value="${type }"/>,<c:out value="${listUploaded.sort }"/>, <c:out value="${listUploaded.seq }"/>, '<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>')"><i class="fa-solid fa-x" style="cursor: pointer;"></i></span>
														</li>
													</c:if>
												</c:forEach>				
											</ul>
										</div>
							        </div>
    							</div>
							</div>
							<div class="row align-items-center mt-5">
	                            <div class="col-2">
	                                <button  class="border-0 btn bg-secondary shadow" type="button" id="btnList">
	                                    <i class="fa-solid fa-bars" style="color: white;"></i>
	                                </button>
	                                <button id="btnUel" value="Uel" class="border-0 btn bg-danger shadow" type="button" data-bs-toggle="modal"
	                                    data-bs-target="#deleteModal">
	                                    <i class="fa-solid fa-xmark" style="color: white;"></i>
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
	                                <button id="btnDel" value="Del" class="border-0 btn bg-danger shadow" type="button" data-bs-toggle="modal" data-bs-target="#deleteModal">
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
			<%-- <%@include file="menuVo.jsp"%> --%>
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
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
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>
	<script>

		var goUrlList = "/menu/menuList"; /* #-> */
		var goUrlInst = "/menu/menuInst"; /* #-> */
		var goUrlUpdt = "/menu/menuUpdt"; /* #-> */
		var goUrlUele = "/menu/menuUele"; /* #-> */
		var goUrlDele = "/menu/menuDele"; /* #-> */

		var ccgSeq = $("input:hidden[name=ccgSeq]"); /* #-> */

		var form = $("form[name=myform]");
		var formVo = $("form[name=formVo]");
		
		 
	 	$("#btnSave").on("click", function() {
			if (ccgSeq.val() == "0" || ccgSeq.val() == "") {
				form.attr("action", goUrlInst).submit();
			} else {
				form.attr("action", goUrlUpdt).submit();
			}
		});
		
		$("#btnList").on("click", function() {
			formVo.attr("action", goUrlList).submit();
		});
		
		$("#deleteBtn").on("click", function() {
			formVo.attr("action", goUrlDele).submit();
		});

		$("#ueleteBtn").on("click", function() {
			formVo.attr("action", goUrlUele).submit();
		});
		
	// ----- 게시물 삭제 -----
	 	
	 	$("#btnUel").on("click", function() {
			DelValidation("#delBtn", goUrlUele, "선택하신 게시물을 삭제하시겠습니까?");
		})
		
		$("#btnDel").on("click", function() {
			DelValidation("#delBtn", goUrlDele, "선택하신 게시물을 진짜로 삭제하시겠습니까?");		
		})
		
		DelValidation = function(confirm, url, msg) {
			$(".modal-body").html(msg);
			$(confirm).on("click", function() {
				form.attr("action", goUrlList).submit();
			})
		}

	</script>
</body>
</html>
