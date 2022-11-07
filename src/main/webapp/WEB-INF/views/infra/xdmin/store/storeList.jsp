<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>ZipStoreList</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/xdmin/codeGroup/codeGroupList.css">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	</head>
	
	<body>
		<!-- start -->
		<header>
			<div class="header bg-dark">
				<div class="container">
					<div class="row">
						<nav class="navbar col" style="padding-bottom : 0px;">
							<div class="col">
								<a class="navbar-brand">
									<img src="/resources/images/main/logo2.png" style="width: 80px;">
									<span class="text-white" id="MATZIP">MATZIP</span>
								</a>
							</div>
							<div class="row offset-5">
								<div class="userimg col">
									<img alt="" src="../resources/image/user.png" style=" width: 60px; height: 40px;border-radius: 100px;" class="me-4 mb-4 ">
									<span id="MATZIP" class="d-inline-block text-white">Tony Chang <br> Administrator</span>
								</div>
							</div>
						</nav>
					</div>
				</div>
				<div class="bg-dark">
					<div class="container">
						<nav class="navbar navbar-expand-lg">
							<div class="collapse navbar-collapse" id="navbar" style="padding-left: 350px;">
								<div class="navbar-nav">
									<a class="nav-link text-white me-3 topNav" aria-current="page" href="/code/codeList">Code</a>
									<a class="nav-link text-white me-3 topNav" href="/codeGroup/codeGroupList" style="color: #ff7f00">CodeGroup</a>
									<a class="nav-link text-white me-3 topNav" href="/member/memberList">Member</a>
									<a class="nav-link text-white me-3 topNav" href="/order/orderList">Order</a>
									<a class="nav-link me-3 topNav" href="/store/xdminStoreList" style="color: #ff7f00">Store</a>
									<a class="nav-link text-white me-3 topNav" href="#">Story</a>
									<a class="nav-link text-white me-3 topNav" href="#">Menu</a>
									<a class="nav-link text-white" href="#">시스템관리</a>
								</div>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</header>
		<main>
			<form id="myForm" name="myForm" method="post">
				<input type="hidden" name="thisPage2" value="<c:out value="${vo.thisPage2 }" default="1"/>">
             	<input type="hidden" name="rowNumToShow2" value="${vo.rowNumToShow2 }">
				<input type="hidden" name="ifstSeq" value='<c:out value="${vo.ifstSeq }"></c:out>'>
				<div style="height: 55px"></div>
				<div class="wrapper">
					<div class="container" style="height: 100vh;">
						<div class="row">
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
		                                                    <%-- <div class="avatar avatar-lg mt-n5 mb-3">
		                                                        <a href="#"><img class="avatar-img rounded border border-white border-3"
		                                                                src="/resources/images/diano.jpg" style="width: 50px;" alt=""></a>
		                                                    </div>
		                                                    <div class="mt-2 mb-4">
		                                                        <span class="mb-0"><a href="/member/memberUView"><c:out value="${sessName }"/></a></span>
		                                                        <small><c:out value="${sessId }"/></small><br>
		                                                        <small><c:out value="${sessEmail }"/></small>
		                                                    </div> --%>
		                                                    <hr>
		                                                    <ul class="nav nav-link-secondary flex-column fw-bold gap-2">
		                                                        <li class="nav-item">
		                                                            <a class="nav-link" href="/member/memberList">
		                                                                <span class="icon"><i class="fas fa-home" style="color: black;"></i></span>
																		<span class="item" style="color: black;" id="sidebar">Home</span>
		                                                            </a>
		                                                        </li>
		                                                        <li class="nav-item">
		                                                            <a class="nav-link" href="/article/articleList">
		                                                                <span class="icon"><i class="fas fa-desktop"></i></span>
																		<span class="item" style="color: black;" id="sidebar">Dashboard</span>
		                                                            </a>
		                                                        </li>
		                                                        <li class="nav-item">
		                                                            <a class="nav-link" href="/comment/commentList">
		                                                                <span class="icon"><i class="fas fa-user-friends"></i></span>
																		<span class="item" style="color: black;" id="sidebar">Orders</span>
		                                                            </a>
		                                                        </li>
		                                                        <li class="nav-item">
		                                                            <a class="nav-link" href="/game/gameList">
		                                                                <span class="icon"><i class="fas fa-tachometer-alt"></i></span>
																		<span class="item" style="color: black;" id="sidebar">Account</span>
		                                                            </a>
		                                                        </li>
		                                                    </ul>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <ul class="nav small mt-4 justify-content-center lh-1">
		                                            <li class="nav-item">
		                                                <a class="nav-link" href="my-profile-about.html">About</a>
		                                            </li>
		                                            <li class="nav-item">
		                                                <a class="nav-link" href="settings.html">Settings</a>
		                                            </li>
		                                            <li class="nav-item">
		                                                <a class="nav-link" target="_blank" href="https://support.webestica.com/login">Support
		                                                </a>
		                                            </li>
		                                            <li class="nav-item">
		                                                <a class="nav-link" target="_blank" href="docs/index.html">Docs </a>
		                                            </li>
		                                            <li class="nav-item">
		                                                <a class="nav-link" href="help.html">Help</a>
		                                            </li>
		                                            <li class="nav-item">
		                                                <a class="nav-link" href="privacy-and-terms.html">Privacy &amp; terms</a>
		                                            </li>
		                                        </ul>
		                                        <p class="small text-center mt-1">©2022 <a class="text-body" target="_blank" href="#"> TASTEZIP
		                                            </a></p>
		                                    </div>
		                                </div>
		                            </nav>
		                        </nav>
		                    </div>
							<div class="col-md col-lg-9 mt-3">
								<div class="content">
									<h2 class="row needs-validation ms-3 mt-5">Store List</h2>
									<div class="row needs-validation ms-3 me-3 mt-3 mb-5 p-3 bg-dark rounded" id="selecBox" novalidate>
										<div class="row mb-2">
											<div class="col-md-3">
												<select class="form-select" id="shDelNy" name="shDelNy">
			                                       	<option value="" <c:if test="${empty vo.shDelNy }">selected</c:if>>선택</option>
			                                        <option value="0" <c:if test="${vo.shDelNy eq 0 }">selected</c:if>>N</option>
			                                        <option value="1" <c:if test="${vo.shDelNy eq 1 }">selected</c:if>>Y</option>
			                                    </select>
											</div>
											<div class="col-md-3">
												<select class="form-select" id="shOptionDate" name="shOptionDate">
													<option value="" <c:if test="${empty vo.shOptionDate }">selected</c:if>>선택</option>
													<option value="1" <c:if test="${vo.shOptionDate eq 1 }">selected</c:if>>등록일</option>
												</select>
											</div>
											<div class="col-md-3">
												<input type="text" class="form-control" id="datepickerS" name="shDateStart" placeholder="시작일">
											</div>
											<div class="col-md-3">
												<input type="text" class="form-control" id="datepickerE" name="shDateEnd" placeholder="종료일">
											</div>
										</div>
										<div class="row">
											<div class="col-md-3">
												<select class="form-select" id="shOption" name="shOption">
			                                        <option value="" <c:if test="${empty vo.shOption }">selected</c:if>>선택</option>
			                                        <option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>가게 이름</option>
			                                        <option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>전화번호</option>
			                                        <option value="3" <c:if test="${vo.shOption eq 3 }">selected</c:if>>가게 주소</option>
			                                    </select>
											</div>
											<div class="col-md-3">
												<input type="text" class="form-control" name="shValue" id="shValue" value="<c:out value="${vo.shValue }"/>" autocomplete="off">
											</div>
											<div class="col-md-2">
												<button class="btn btn-light" type="submit" id="searching"><i class="fa-solid fa-magnifying-glass"></i></button>
												<button class="btn btn-secondary" type="reset" id="btnReset" name="btnReset"><i class="fa-solid fa-rotate-right"></i></button>
											</div>
										</div>
									</div>
									<span class="ms-3 mt-5" id="Total">Total: </span>
									<div class=" ms-3 me-3 mt-3 mb-4 shadow-lg bg-body rounded">
										<table class="table table-striped table-hover text-center" id="selecBox">
											<thead>
												<tr class="bg-dark">
													<th scope="col">
														<input type="checkbox" name="chk_all" id="chk_all" href="">
													</th>
													<th class="text-white">#</th>
													<th class="text-white">번호</th>
													<th class="text-white" scope="col">이름</th>
													<th class="text-white" scope="col">전화번호</th>
													<th class="text-white" scope="col">주소</th>
													<th class="text-white" scope="col">정보</th>
													<th class="text-white" scope="col">등록일</th>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${fn:length(list) eq 0}">
														<tr>
															<td class="text-center" colspan="7">There is no data!</td>
														</tr>
													</c:when>
													<c:otherwise>		
														<c:forEach items="${list}" var="list" varStatus="status">
															<tr onclick="newPage()" class="info">
																<th scope="row" class="td1" src="./memberMod.html">
																	<input type="checkbox" name="chk_box" onclick="checkSelectAll(this)">
																</th>
																<td><c:out value="${vo.totalRows2 - ((vo.thisPage2 - 1) * vo.rowNumToShow2 + status.index) }"/></td>
																<td>${list.ifstSeq}</td>
																<td>${list.ifstName }</td>
																<td>${list.ifstPhone}</td>
																<td>${list.ifstAddress}</td>
																<td>${list.ifstInfo }</td>
																<td>${list.ifstCreatedAt }</td>
															</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
										<%@include file="../includeV1/pagination2.jsp"%>
									</div>
									<div class="row align-items-center m-2">
			                            <div class="col-2">
			                                <button id="btnDel" class="border-0 btn shadow" type="button" data-bs-toggle="modal"
			                                    data-bs-target="#deleteModal">
			                                    <i class="fa-solid fa-trash fa-lg"></i>
			                                </button>
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
			                                <button id="btnUel" class="border-0 btn btn-dark shadow" type="button" data-bs-toggle="modal"
			                                    data-bs-target="#deleteModal">
			                                    <i class="fa-solid fa-xmark text-white"></i>
			                                </button>
			                            </div>
			                            <div class="col-2 offset-8" align="right">
			                                <button class="border-0 btn bg-success shadow" id="excelBtn" type="button">
			                                    <i class="fa-regular fa-file-excel" style="color: white;"></i>
			                                </button>
			                                <a class="border-0 btn shadow bg-dark" role="button" id="btnForm">
			                                    <i class="fa-regular fa-plus fa-1x" style="color: white;"></i>
			                                </a>
			                            </div>
			                        </div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			<footer class="bg-dark">
		        <div class="footer">
		            <div class="footer_inner">
		                <!--[주]고객센터,제휴문의,서비스안내-->
		                <ul class="footer_link" id="footer_link">
		                    <li><a target="_blank" class="footer_item" href="#"
		                            id="fot.agreement"><span class="text text-white">이용약관</span></a></li>
		                    <li><a target="_blank" class="footer_item" href="#l"
		                            id="fot.privacy"><span class="text text-white">개인정보처리방침</span></a></li>
		                    <li><a target="_blank" class="footer_item" href="#"
		                            id="fot.disclaimer"><span class="text text-white">책임의 한계와 법적고지</span></a></li>
		                    <li><a target="_blank" class="footer_item"
		                            href="#" id="fot.help"><span
		                                class="text text-white">회원정보 고객센터</span></a></li>
		                </ul>
		                <div class="footer_copy">
		                    <a  id="fot.naver" target="_blank" href="https://www.navercorp.com">
		                        <img src="/resources/images/main/logo2.png" alt="logo" style="width: 45px;">
		                    </a>
		                    <span class="text text-white">Copyright</span>
		                    <span class="corp text-white">© MATZIP Corp.</span>
		                    <span class="text text-white">All Rights Reserved.</span>
		                </div>
		            </div>
		        </div>
		    </footer>
		</main>
	
		<!-- end --> 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			var goUrlList = "/store/xdminStoreList";
			var goUrlForm = "/store/xdminStoreForm";
			var excelUri = "/store/excelDownload";
			var goUrlUel = "/store/storeUele";
	        var goUrlDel = "/store/storeDele";
			
			var form = $("#myForm");
			
			$("#btnReset").on("click", function() {
				$(location).attr("href", goUrlList);
			});
			
			$(function() {
		   		$("#datepickerS").datepicker({
		   			dateFormat: "yy-mm-dd"
		   			,showMonthAfterYear: true
		   			,showOtherMonths: true
		   		});
		   		$("#datepickerE").datepicker({
		   			dateFormat: "yy-mm-dd"
	      			,showMonthAfterYear: true
	      			,showOtherMonths: true
	      		});
		   	})
			
			var seq = $("input[name=ifstSeq]");
			
			$("#btnForm").on("click", function() {
				goForm(0);
			})
			
			goForm = function(keyValue) {
				seq.val(keyValue);
				form.attr("action", goUrlForm).submit();
			}
			
			$("#excelBtn").on("click", function() {
				form.attr("action", excelUri).submit();
			})
			
			goList = function(thisPage) {
				$("input[name=thisPage]").val(thisPage);
				form.attr("action", goUrlList).submit();
			}
			
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
	
		</script>
	</body>
</html>
