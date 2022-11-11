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
	<title>CodeGroupForm</title>
	<link rel="stylesheet" href="/resources/css/xdmin/codeGroup/codeGroupList.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/js/commonXdmin.js"></script>
	<script src="/resources/common/js/common.js"></script>
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
		<form  id="form" name="form" method="post" >
		<input type="hidden" name="formNY" value="1">
		<%-- <input type="hidden" name="ifcgSeq" value="<c:out value="${vo.ifcgSeq}"/>"/> --%>
			<!-- *Vo.jsp s -->
			<%@include file="codeGroupVo.jsp"%>
			<!-- *Vo.jsp e -->
			
			<div style="height: 70px"></div>
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
		                                                            <a class="nav-link" href="/reservation/reservationList">
		                                                                <span class="icon"><i class="fa-solid fa-comments"></i></span>
																		<span class="item" style="color: black;" id="sidebar">Reservation</span>
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
		                                                            <a class="nav-link" href="/comment/commentList">
		                                                                <span class="icon"><i class="fa-solid fa-comments"></i></span>
																		<span class="item" style="color: black;" id="sidebar">Comment</span>
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
							<h2 class="needs-validation mt-2">CodeGroup Form</h2>
							<div class="content">
								<div class="row">
									<div class="col">
										<label for="ccgSeq" class="form-label">코드그룹 코드</label>
										<input type="text" class="form-control" name="ifcgSeq" value="<c:out value="${item.ifcgSeq}"/>" placeholder="영문(대소문자),숫자">
									</div>
									<div class="col">
										<label for="codeGroup_another" class="form-label">코드그룹 코드(Another)</label> 
										<input type="text" class="form-control" id="codeGroup_another" placeholder="영문(대소문자),숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="name" class="form-label">코드그룹 이름(한글)</label> 
										<input type="text" class="form-control" id="name" name="ifcgName" value="<c:out value="${item.ifcgName}"/>" placeholder="한글,숫자">
									</div>
									<div class="col">
										<label for="name_eng" class="form-label">코드그룹 이름(영문)</label> 
										<input type="text" class="form-control" id="name_eng" name="ifcgNameEng" value="<c:out value="${item.ifcgNameEng}"/>" placeholder="영문(대소문자),숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="codeGroup_use" class="form-label">사용여부</label>
										<select class="form-select" aria-label="Default select example" name="ifcgUseNy" id="ifcgUseNy">
										  <option value="1" <c:if test="${item.ifcgUseNy eq 1 }"> selected</c:if>>Y</option>
										  <option value="0" <c:if test="${item.ifcgUseNy eq 0 }"> selected</c:if>>N</option>
									  	</select>
									</div>
									<div class="col">
										<label for="codeGroup_or" class="form-label">순서</label> 
										<input type="text" class="form-control" id="codeGroup_or" name="ifcgOrder" value="<c:out value="${item.ifcgOrder}"/>" placeholder="숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="codeGroup_con" class="form-label">설명</label>
										<input class="form-control" name="ifcgExplanation" value="<c:out value="${item.ifcgExplanation}"/>"placeholder="코드그룹 설명">
									</div>
									<div class="col">
										<label for="ifcgDelNy" class="form-label">삭제여부</label>
										<select class="form-select" name="ifcgDelNy" aria-label="Default select example">
										  <option value="1" <c:if test="${item.ifcgDelNy eq 1 }"> selected</c:if>>Y</option>
										  <option value="0" <c:if test="${item.ifcgDelNy eq 0 }"> selected</c:if>>N</option>
									  	</select>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="codeGroup_V1" class="form-label">예비1(Varchar type)</label> 
										<input type="text" class="form-control" id="ifcgReferenceV1" placeholder="영문(대소문자),숫자">
									</div>
									<div class="col">
										<label for="codeGroup_V2" class="form-label">예비2(Varchar type)</label> 
										<input type="text" class="form-control" id="ifcgReferenceV2" placeholder="영문(대소문자),숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-6">
										<label for="codeGroup_V3" class="form-label">예비3(Varchar type)</label>
										<input type="text" class="form-control" id="ifcgReferenceV3"  placeholder="영문(대소문자),숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="codeGroup_I1" class="form-label">예비1 (Int type)</label>
										<input type="text" class="form-control" id="ifcgReferenceI1" name="codeGroup_I1" placeholder="숫자">
									</div>
									<div class="col">
										<label for="codeGroup_I2" class="form-label">예비2 (Int type)</label>
										<input type="text" class="form-control" id="ifcgReferenceI2" name="codeGroup_I2" placeholder="숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-6">
										<label for="codeGroup_V3" class="form-label">예비3 (Int type)</label>
										<input type="text" class="form-control" id="ifcgReferenceI3"  placeholder="영문(대소문자),숫자">
									</div>
								</div>
							</div>
							<div class="row align-items-center mt-5 mb-5">
	                            <div class="col-2">
	                                <button class="border-0 btn bg-secondary shadow" type="button" id="btnList">
	                                    <i class="fa-solid fa-bars" style="color: white;"></i>
	                                </button>
	                                <button class="border-0 btn bg-danger shadow" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal2">
	                                    <i class="fa-solid fa-xmark" style="color: white;"></i>
	                                </button>
	                            </div>
	                            
	                            <!-- uele -->
	                            <div class="col-3 offset-7" align="right">
	                               <!-- x버튼 Modal -->
									<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalLabel2"><b>MATZIP</b></h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
									        정말로 삭제하시겠습니까?
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									        <button type="button" class="btn btn-dark" id="btnUelete">삭제 </button>
									      </div>
									    </div>
									  </div>
									</div>
	                                
	                                <button class="border-0 btn bg-danger shadow" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">
	                                    <i class="fa-solid fa-trash-can" style="color: white;"></i>
	                                </button>
	                                <button id="btnSave" class="border-0 btn bg-success shadow" type="button">
	                                    <i class="fa-regular fa-bookmark" style="color: white;"></i>
	                                </button>
	                                
	                                <!-- 휴지통 Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalLabel"><b>MATZIP</b></h5>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
									        정말로 삭제하시겠습니까?
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									        <button type="button" class="btn btn-dark" id="btnDelete">삭제 </button>
									      </div>
									    </div>
									  </div>
									</div>
	                            </div>
	                        </div>
						</div>
					</div>
				</form>
				
		
		 <form name="formVo" id="formVo" method="post">
			<!-- *Vo.jsp s -->
			<%@include file="codeGroupVo.jsp"%>
			<input type="hidden" name="ifcgSeq" value="<c:out value="${vo.ifcgSeq}"/>"/>
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
	<script type="text/javascript">
		
		var goUrlList = "/codeGroup/codeGroupList"; 			
		var goUrlInst = "/codeGroup/codeGroupInst"; 			
		var goUrlUpdt = "/codeGroup/codeGroupUpdt";				
		var goUrlUele = "/codeGroup/codeGroupUele";				
		var goUrlDele = "/codeGroup/codeGroupDele";				
		
		var seq = $("input:hidden[name=ifcgSeq]");				
		
		var form = $("form[name=form]");
		var formVo = $("form[name=formVo]");
		
		$("#btnSave").on("click", function(){

			if (seq.val() == "0" || seq.val() == ""){
		   		form.attr("action", goUrlInst).submit();
		   	} else {
		   		form.attr("action", goUrlUpdt).submit();
		   	}
		});
		
		$("#btnList").on("click", function(){
			formVo.attr("action", goUrlList).submit();
		});
	 	
	</script>
	<script>
		$("#btnUelete").on("click", function() {
			form.attr("action", goUrlUele).submit();
		});
		
		$("#btnDelete").on("click", function() {
			form.attr("action", goUrlDele).submit();
		});
	</script>
</body>
</html>
