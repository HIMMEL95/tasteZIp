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
	<title>ZipCodeForm</title>
	<link rel="stylesheet" href="/resources/css/codeList.css">
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
			<%-- <%@include file="codeVo.jsp"%> --%>
			<!-- *Vo.jsp e -->
			
			<div style="height: 70px"></div>
			<div class="wrapper">
				<div class="container">
					<div class="row">
						<div class="col-3">
							<div class="sidebar">
								<!--menu item-->
								<ul>
									<li><a href="#" class="active"> <span class="icon"><i class="fa-solid fa-angle-right"></i></span> <span class="item">Home</span>
									</a></li>
									<li><a href="#"> <span class="icon"><i class="fa-solid fa-angle-right"></i></span> <span class="item">Dashboard</span>
									</a></li>
									<li><a href="#"> <span class="icon"><i class="fa-solid fa-angle-right"></i></span> <span class="item">Orders</span>
									</a></li>
									<li><hr class="dropdown-divider" style="color: lightgray;"></li>
									<li><a href="#"> <span class="icon"><i class="fa-solid fa-angle-right"></i></span> <span class="item">Account</span>
									</a></li>
								</ul>
							</div>
						</div>
						<div class="col">
							<h2 class="needs-validation mt-2">코드 관리</h2>
							<div class="content">
								<div class="row">
									<div class="col">
										<label for="ccgSeq" class="form-label">코드그룹 코드</label> <input type="text" class="form-control" id="ccgSeq" placeholder="영문(대소문자),숫자">
									</div>
									<div class="col">
										<label for="code_another" class="form-label">코드그룹 코드(Another)</label> <input type="text" class="form-control" id="code_another" name="code_another" placeholder="영문(대소문자),숫자" value="">
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
										<label for="code_use" class="form-label">사용여부</label> <select class="form-select" id="code_use" name="code_use">
											<%-- <option selected disabled value="">선택</option>
											<option value="0" <c:if test = "${item.code_use eq 0}">selected</c:if>>N</option>
											<option value="1" <c:if test = "${item.code_use eq 1}">selected</c:if>>Y</option> --%>
											<option value=""> 선택</option>
										</select>
									</div>
									<div class="col">
										<label for="code_or" class="form-label">순서</label> <input type="text" class="form-control" id="code_or" name="code_or" placeholder="숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="code_con" class="form-label">설명</label>
										<textarea class="form-control" id="code_con" placeholder="Required example textarea"></textarea>
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
										<label for="code_V1" class="form-label">예비1(Varchar type)</label> <input type="text" class="form-control" id="code_V1" name="code_V1" placeholder="영문(대소문자),숫자">
									</div>
									<div class="col">
										<label for="code_V2" class="form-label">예비2(Varchar type)</label> <input type="text" class="form-control" id="code_V2" name="code_V2" placeholder="영문(대소문자),숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-6">
										<label for="code_V3" class="form-label">예비3(Varchar type)</label><input type="text" class="form-control" id="code_V3" name="code_V3" placeholder="영문(대소문자),숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label for="code_I1" class="form-label">예비1 (Int type)</label><input type="text" class="form-control" id="code_I1" name="code_I1" placeholder="숫자">
									</div>
									<div class="col">
										<label for="code_I2" class="form-label">예비2 (Int type)</label><input type="text" class="form-control" id="code_I2" name="code_I2" placeholder="숫자">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<div class="row mt-3">
			<div class="col-md-2 offset-3">
				<button class="btn" type="button" name="btnList" id="btnList" style="background-color: gray">
					<i class="fas fa-thin fa-list-ul"></i>
				</button>
			</div>
			<div class="col-md-6 offset-md-4" align="right">
				<button class="btn btn-danger del" type="button" name="ueleteBtn" onclick=deleteValue(); data-bs-toggle="modal" data-bs-target="#exampleModalCenter1">
					<i class="fa-solid fa-xmark"></i>
				</button>
				<div class="modal fade" id="exampleModalCenter1" tabindex="-1" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">삭제하시겠습니까?</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body" align="center">
								<i class="fas fa-light fa-triangle-exclamation me-2" style="color: red;"></i> 그룹 리스트에서 해당 정보가 사라집니다.
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-danger" id="ueleteBtn" name="ueleteBtn">삭제</button>
							</div>
						</div>
					</div>
				</div>
				<button class="btn btn-danger" type="button" onclick=deleteValue(); data-bs-toggle="modal" data-bs-target="#exampleModalCenter">
					<i class="fa-solid fa-trash-can"></i>
				</button>
				<div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalCenterTitle">삭제하시겠습니까?</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body" align="center">
								<i class="fas fa-light fa-triangle-exclamation me-2" style="color: red;"></i> 삭제된 정보는 복구할 수가 없습니다.
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-danger" id="deleteBtn" name="deleteBtn">삭제</button>
							</div>
						</div>
					</div>
				</div>
				<button type="button" id="btnSave" name="btnSave" class="btn btn-success">
					<i class="fa-regular fa-bookmark"></i>
				</button>
				<button type="button" id="btnSave1" name="btnSave" class="btn btn-success">t</button>
				<!-- <button class="btn btn-success" type="button" href="../admin/codeModForm.html" onclick=here()><i class="fa-regular fa-bookmark"></i></button> -->
			</div>
		</div>
		<%-- <form name="formVo" id="formVo" method="post">
			<!-- *Vo.jsp s -->
			<%@include file="codeVo.jsp"%>
			<!-- #-> -->
			<!-- *Vo.jsp e -->
		</form> --%>
	</main>

	<!-- end -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd29bc43140391b0206f367d2b8c01eb&libraries=services"></script>
	<script>

		var goUrlList = "/code/codeList"; 

		 

		$("#btnList").on("click", function() {
			formVo.attr("action", goUrlList).submit();
		});

	</script>
</body>
</html>
