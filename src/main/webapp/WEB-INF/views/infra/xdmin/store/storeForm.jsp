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
	<header>
			<div class="header bg-dark">
				<div class="container">
					<div class="row">
						<nav class="navbar col" style="padding-bottom : 0px;">
							<div class="col">
								<a class="navbar-brand" href="#">
									<img class="" src="/resources/images/main/logo2.png" style="width: 80px;">
									<span class="text-white" id="MATZIP">MATZIP</span>
								</a>
							</div>
							<div class="row offset-5">
								<div class="userimg col">
									<img alt="" src="../resources/image/user.png" style=" width: 60px; height: 40px;border-radius: 100px;" class="me-4 mb-4 ">
									<span class="d-inline-block text-white" id="MATZIP">Tony Chang <br> Administrator</span>
								</div>
							</div>
						</nav>
					</div>
				</div>
				<div class="bg-dark">
					<div class="container">
						<nav class="navbar navbar-expand-lg">
							<div class="collapse navbar-collapse" id="navbarNavAltMarkup" style="padding-left: 350px;">
								<div class="navbar-nav">
									<a class="nav-link active text-white me-3" aria-current="page" href="#">Code</a>
									<a class="nav-link text-white me-3" href="#">회원관리</a>
									<a class="nav-link text-white me-3" href="#">사장님관리</a>
									<a class="nav-link text-white me-3" href="#">매장관리</a>
									<a class="nav-link text-white me-3" href="#">story관리</a>
									<a class="nav-link text-white" href="#">시스템관리</a>
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
											<span class="icon"><i class="fas fa-home" style="color: black;"></i></span>
											<span class="item" style="color: black;" id="sidebar">Home</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="icon"><i class="fas fa-desktop"></i></span>
											<span class="item" style="color: black;" id="sidebar">Dashboard</span>
										</a>
									</li>
									<li>
										<a href="#">
											<span class="icon"><i class="fas fa-user-friends"></i></span>
											<span class="item" style="color: black;" id="sidebar">Orders</span>
										</a>
									</li>
									<li><hr class="dropdown-divider" style="color: lightgray;"></li>
									<li>
										<a href="#">
											<span class="icon"><i class="fas fa-tachometer-alt"></i></span>
											<span class="item" style="color: black;" id="sidebar">Account</span>
										</a>
									</li>
								</ul>
							</div>
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
														<div class="row">
															<div class="col-2">
																<label for="ccgSeq" class="form-label">일요일</label> 
															</div>
															<div class="col-2">
																<select class="form-select" id="shOptionDate" name="shOptionDate">
																	<option value="0" <c:if test="${vo.shOptionDate eq 0 }">selected</c:if>>휴무</option>
																	<option value="1" <c:if test="${vo.shOptionDate eq 1 }">selected</c:if>>영업</option>
																</select>
															</div>
															<div class="col">
																<input type="time" class="form-control" id="ifrtStartTime" name="ifrtStartTime">
															</div>
															~
															<div class="col">
																<input type="time" class="form-control" id="ifrtEndTime" name="ifrtEndTime">
															</div>
														</div>
														<div class="row">
															<div class="col-2">
																<label for="ccgSeq" class="form-label">월요일</label> 
															</div>
															<div class="col-2">
																<select class="form-select" id="shOptionDate" name="shOptionDate">
																	<option value="0" <c:if test="${vo.shOptionDate eq 0 }">selected</c:if>>휴무</option>
																	<option value="1" <c:if test="${vo.shOptionDate eq 1 }">selected</c:if>>영업</option>
																</select>
															</div>
															<div class="col">
																<input type="time" class="form-control" id="ifrtStartTime" name="ifrtStartTime">
															</div>
															~
															<div class="col">
																<input type="time" class="form-control" id="ifrtEndTime" name="ifrtEndTime">
															</div>
														</div>
														<div class="row">
															<div class="col-2">
																<label for="ccgSeq" class="form-label">화요일</label> 
															</div>
															<div class="col-2">
																<select class="form-select" id="shOptionDate" name="shOptionDate">
																	<option value="0" <c:if test="${vo.shOptionDate eq 0 }">selected</c:if>>휴무</option>
																	<option value="1" <c:if test="${vo.shOptionDate eq 1 }">selected</c:if>>영업</option>
																</select>
															</div>
															<div class="col">
																<input type="time" class="form-control" id="ifrtStartTime" name="ifrtStartTime">
															</div>
															~
															<div class="col">
																<input type="time" class="form-control" id="ifrtEndTime" name="ifrtEndTime">
															</div>
														</div>
														<div class="row">
															<div class="col-2">
																<label for="ccgSeq" class="form-label">수요일</label> 
															</div>
															<div class="col-2">
																<select class="form-select" id="shOptionDate" name="shOptionDate">
																	<option value="0" <c:if test="${vo.shOptionDate eq 0 }">selected</c:if>>휴무</option>
																	<option value="1" <c:if test="${vo.shOptionDate eq 1 }">selected</c:if>>영업</option>
																</select>
															</div>
															<div class="col">
																<input type="time" class="form-control" id="ifrtStartTime" name="ifrtStartTime">
															</div>
															~
															<div class="col">
																<input type="time" class="form-control" id="ifrtEndTime" name="ifrtEndTime">
															</div>
														</div>
														<div class="row">
															<div class="col-2">
																<label for="ccgSeq" class="form-label">목요일</label> 
															</div>
															<div class="col-2">
																<select class="form-select" id="shOptionDate" name="shOptionDate">
																	<option value="0" <c:if test="${vo.shOptionDate eq 0 }">selected</c:if>>휴무</option>
																	<option value="1" <c:if test="${vo.shOptionDate eq 1 }">selected</c:if>>영업</option>
																</select>
															</div>
															<div class="col">
																<input type="time" class="form-control" id="ifrtStartTime" name="ifrtStartTime">
															</div>
															~
															<div class="col">
																<input type="time" class="form-control" id="ifrtEndTime" name="ifrtEndTime">
															</div>
														</div>
														<div class="row">
															<div class="col-2">
																<label for="ccgSeq" class="form-label">금요일</label> 
															</div>
															<div class="col-2">
																<select class="form-select" id="shOptionDate" name="shOptionDate">
																	<option value="0" <c:if test="${vo.shOptionDate eq 0 }">selected</c:if>>휴무</option>
																	<option value="1" <c:if test="${vo.shOptionDate eq 1 }">selected</c:if>>영업</option>
																</select>
															</div>
															<div class="col">
																<input type="time" class="form-control" id="ifrtStartTime" name="ifrtStartTime">
															</div>
															~
															<div class="col">
																<input type="time" class="form-control" id="ifrtEndTime" name="ifrtEndTime">
															</div>
														</div>
														<div class="row">
															<div class="col-2">
																<label for="ccgSeq" class="form-label">토요일</label> 
															</div>
															<div class="col-2">
																<select class="form-select" id="shOptionDate" name="shOptionDate">
																	<option value="0" <c:if test="${vo.shOptionDate eq 0 }">selected</c:if>>휴무</option>
																	<option value="1" <c:if test="${vo.shOptionDate eq 1 }">selected</c:if>>영업</option>
																</select>
															</div>
															<div class="col">
																<input type="time" class="form-control" id="ifrtStartTime" name="ifrtStartTime">
															</div>
															~
															<div class="col">
																<input type="time" class="form-control" id="ifrtEndTime" name="ifrtEndTime">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<div class="col-6">
										<label for="name" class="form-label">전화번호</label> 
										<input type="text" class="form-control" id="" name="" placeholder="01000000000">
									</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<label for="name" class="form-label">우편번호</label> 
									<div class="col-8">	
						   				<input type="text" class="form-control" id="" name="" value="">
						   			</div>
						   			<div class="col-4">
						   				<button type="button" class="btn btn-outline-dark" onclick=""> 우편번호 검색 </button>
						   				<button class="btn btn-outline-dark" type="button" id="" style="height: 2.4rem;"><i class="fa-solid fa-rotate-left"></i></button>
					   				</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<div class="col-6">	
										<label for="name" class="form-label">상세주소</label> 
						   				<input type="text" class="form-control" id="" name="" value="">
						   			</div>
						   			<div class="col-6">
						   				<label for="name" class="form-label">참고 항목</label>
						   				<input type="text" class="form-control" id="" name="" value=""> 
					   				</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<div class="col-12">
										<label for="name" class="form-label">간편 길안내</label> 
										<input type="text" class="form-control" id="" name="" placeholder="">
									</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<div class="col-12">
										<label for="name" class="form-label">가게 소개글</label> 
										<input type="text" class="form-control" id="" name="" placeholder="">
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
