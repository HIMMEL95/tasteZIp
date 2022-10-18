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
	<title>ZipCodeGroupForm</title>
	<link rel="stylesheet" href="/resources/css/xdmin/codeGroup/codeGroupList.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/resources/js/commonXdmin.js"></script>
	<script src="/resources/common/js/common.js"></script>
</head>
<body>
	<!-- start -->
	<header>
		<div class="header bg-light">
			<div class="container">
				<div class="row d">
					<nav class="navbar col">
						<div class="col">
							<a class="navbar-brand" href="#"> <img src="https://getbootstrap.com/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="align-text-top ms-5"> <span></span> Management System
							</a>
						</div>
						<div class="row offset-5">
							<div class="userimg col">
								<img alt="" src="../../user/img/user.png" style="width: 60px; height: 40px; border-radius: 100px;" class="me-4 mb-4 "> <span id="nm" class="d-inline-block">Tony Chang <br> Administrator
								</span>
							</div>
						</div>
					</nav>
				</div>
			</div>
			<div style="background-color: #e3f2fd;">
				<div class="container">
					<nav class="navbar navbar-expand-lg">
						<a class="navbar-brand" href="#">Navbar</a>
						<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
							<div class="navbar-nav">
								<a class="nav-link active" aria-current="page" href="#">회원관리</a> <a class="nav-link" href="#">서비스관리</a> <a class="nav-link" href="#">사이트관리</a> <a class="nav-link" href="#">로그관리</a> <a class="nav-link" href="#">시스템관리</a> <a class="nav-link" href="#">시스템관리</a>
							</div>
						</div>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<main>
		<!-- <form name="form" id="form" method="post" enctype="multipart/form-data"> -->
		<form id="myform" name="myform" method="post" autocomplete="off">
			<!-- *Vo.jsp s -->
			<%-- <%@include file="codeGroupVo.jsp"%> --%>
			<!-- *Vo.jsp e -->
			
			<div style="height: 70px"></div>
			<div class="wrapper">
				<div class="container">
					<div class="row" style="height: 800px;">
						<div class="col-3">
							<div class="sidebar">
								<!--menu item-->
								<ul>
									<li>
										<a href="#" class="active">
											<span class="icon"><i class="fas fa-home"></i></span>
											<span class="item">Home</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="icon"><i class="fas fa-desktop"></i></span>
											<span class="item">Dashboard</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="icon"><i class="fas fa-user-friends"></i></span>
											<span class="item">Orders</span>
										</a>
									</li>
									<li><hr class="dropdown-divider" style="color: lightgray;"></li>
									<li>
										<a href="#">
											<span class="icon"><i class="fas fa-tachometer-alt"></i></span>
											<span class="item">Account</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
						<div class="col">
							<h2 class="needs-validation mt-2">코드그룹 관리</h2>
							<div class="content">
								<div class="row">
									<div class="col">
										<label for="ccgSeq" class="form-label">코드그룹 코드</label> <input type="text" class="form-control" id="ccgSeq" placeholder="영문(대소문자),숫자">
									</div>
									<div class="col">
										<label for="codeGroup_another" class="form-label">코드그룹 코드(Another)</label> <input type="text" class="form-control" id="codeGroup_another" name="codeGroup_another" placeholder="영문(대소문자),숫자" value="">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="name" class="form-label">코드그룹 이름(한글)</label> 
										<input type="text" class="form-control" id="name" name="name" placeholder="한글,숫자">
									</div>
									<div class="col">
										<label for="name_eng" class="form-label">코드그룹 이름(영문)</label> <input type="text" class="form-control" id="name_eng" name="name_eng" placeholder="영문(대소문자),숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="codeGroup_use" class="form-label">사용여부</label> <select class="form-select" id="codeGroup_use" name="codeGroup_use">
											<%-- <option selected disabled value="">선택</option>
											<option value="0" <c:if test = "${item.codeGroup_use eq 0}">selected</c:if>>N</option>
											<option value="1" <c:if test = "${item.codeGroup_use eq 1}">selected</c:if>>Y</option> --%>
											<option value=""> 선택</option>
										</select>
									</div>
									<div class="col">
										<label for="codeGroup_or" class="form-label">순서</label> <input type="text" class="form-control" id="codeGroup_or" name="codeGroup_or" placeholder="숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="codeGroup_con" class="form-label">설명</label>
										<textarea class="form-control" id="codeGroup_con" placeholder="Required example textarea"></textarea>
									</div>
									<div class="col">
										<label for="ifcgDelNy" class="form-label">삭제여부</label> <select class="form-select" id="ifcgDelNy" name="ifcgDelNy">
											<option value="0">N</option>
											<option value="1">Y</option>
										</select>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="codeGroup_V1" class="form-label">예비1(Varchar type)</label> <input type="text" class="form-control" id="codeGroup_V1" name="codeGroup_V1" placeholder="영문(대소문자),숫자">
									</div>
									<div class="col">
										<label for="codeGroup_V2" class="form-label">예비2(Varchar type)</label> <input type="text" class="form-control" id="codeGroup_V2" name="codeGroup_V2" placeholder="영문(대소문자),숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-6">
										<label for="codeGroup_V3" class="form-label">예비3(Varchar type)</label><input type="text" class="form-control" id="codeGroup_V3" name="codeGroup_V3" placeholder="영문(대소문자),숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="codeGroup_I1" class="form-label">예비1 (Int type)</label><input type="text" class="form-control" id="codeGroup_I1" name="codeGroup_I1" placeholder="숫자">
									</div>
									<div class="col">
										<label for="codeGroup_I2" class="form-label">예비2 (Int type)</label><input type="text" class="form-control" id="codeGroup_I2" name="codeGroup_I2" placeholder="숫자">
									</div>
								</div>
							</div>
							<div class="row align-items-center mt-5">
	                            <div class="col-2">
	                                <button class="border-0 btn bg-secondary shadow" type="button" id="btnList">
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
			<%@include file="codeGroupVo.jsp"%>
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

		var goUrlList = "/codeGroup/codeGroupList"; /* #-> */
		var goUrlInst = "/codeGroup/codeGroupInst"; /* #-> */
		var goUrlUpdt = "/codeGroup/codeGroupUpdt"; /* #-> */
		var goUrlUele = "/codeGroup/codeGroupUele"; /* #-> */
		var goUrlDele = "/codeGroup/codeGroupDele"; /* #-> */

		var ccgSeq = $("input:hidden[name=ccgSeq]"); /* #-> */

		var form = $("form[name=myform]");
		var formVo = $("form[name=formVo]");
		
		$("#btnList").on("click", function() {
			formVo.attr("action", goUrlList).submit();
		});

		 
		
		
	</script>
</body>
</html>
