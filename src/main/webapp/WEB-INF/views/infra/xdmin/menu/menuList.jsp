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
		<title>Menu List</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/xdmin/codeGroup/codeGroupList.css">
		<link rel="stylesheet" href="/code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<style>
			.overflow-x-auto {
				overflow-x: auto;
			}
					
			.overflow-x-auto table {
				width: auto!important; 
				white-space: nowrap;
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
			<form id="myForm" name="myForm" method="post">
				<input type="hidden" name="thisPage2" value="<c:out value="${vo.thisPage2}" default="1"/>">
				<input type="hidden" name="rowNumToShow2" value="${vo.rowNumToShow2}">
				<input type="hidden" name="ifmnSeq" value="<c:out value="${vo.ifmnSeq}"/>"/>
				<div style="height: 100px"></div>
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
		                                                            <a class="nav-link" href="/comment/commentList">
		                                                                <span class="icon"><i class="fa-solid fa-comment-dots"></i></span>
																		<span class="item" style="color: black;" id="sidebar">Comment</span>
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
							<div class="col">
								<div class="content">
									<h2 class="row needs-validation ms-3">Menu List</h2>
									<div class="row needs-validation ms-3 me-3 mt-3 mb-3 p-3 bg-dark rounded" id="selecBox" novalidate>
										<div class="row mb-2">
											<div class="col-md-3">
												<select class="form-select" id="shDelNy" name="shDelNy">
			                                      <option value="" <c:if test="${empty vo.shDelNy }">selected</c:if>>삭제여부</option>
			                                        <option value="0" <c:if test="${vo.shDelNy eq 0 }">selected</c:if>>N</option>
			                                        <option value="1" <c:if test="${vo.shDelNy eq 1 }">selected</c:if>>Y</option>
			                                    </select>
											</div>
											<div class="col-md-3">
												<select class="form-select" id="shUpdt" name="shUpdt">
 													<option value="" <c:if test="${empty vo.shUpdt }">selected</c:if>>선택</option>
													<option value="1" <c:if test="${vo.shUpdt eq 1 }">selected</c:if>>등록일</option>
												</select>
											</div>
											<div class="col-md-3">
												<input type="text" class="form-control" id="shDateStart" placeholder="시작일">
											</div>
											<div class="col-md-3">
												<input type="text" class="form-control" id="shDateEnd" placeholder="종료일">
											</div>
										</div>
										<div class="row">
											<div class="col-md-3">
			                                    <select class="form-select" id="shOption" name="shOption">
			                                        <option value="" <c:if test="${empty vo.shOption }">selected</c:if>>선택</option>
			                                        <option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>메뉴이름</option>
			                                        <option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>메뉴가격</option>
			                                        <option value="3" <c:if test="${vo.shOption eq 3 }">selected</c:if>>메뉴정보</option>
			                                        <option value="4" <c:if test="${vo.shOption eq 4 }">selected</c:if>>세트정보</option>
			                                    </select>
											</div>
											<div class="col-md-3">
												<input placeholder="검색어를 입력해주세요." type="text" class="form-control" name="shValue" id="shValue" value="${vo.shValue }">
											</div>
											<div class="col-md-2">
												<button class="btn btn-light" type="submit" id="searching"><i class="fa-solid fa-magnifying-glass"></i></button>
												<button class="btn btn-secondary" type="reset" id="btnReset" name="btnReset"><i class="fa-solid fa-rotate-right"></i></button>
											</div>
										</div>
									</div>
									<span class="ms-3" id="Total">Total: ${vo.totalRows2}</span>
									<div class=" ms-3 me-3 mt-3 mb-4 shadow-lg bg-body rounded">
										<table class="table table-striped table-hover text-center" id="selecBox">
											<thead>
												<tr class="bg-dark">
													<th scope="col">
														<input type="checkbox" name="chk_all" id="chk_all" href="">
													</th>
													<th class="text-white">#</th>
													<th class="text-white" scope="col">Seq</th>
													<th class="text-white" scope="col">Name</th>
													<th class="text-white" scope="col">Price</th>
													<th class="text-white" scope="col">Info</th>
													<th class="text-white" scope="col">Set_Menu</th>
													<th class="text-white" scope="col">Created At</th>
												</tr>
											</thead>
											<tbody>
												<c:choose>
													<c:when test="${fn:length(list) eq 0}">
														<tr>
															<td class="text-center" colspan="8">There is no data!</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach items="${list}" var="list" varStatus="status">
																<tr onclick="goForm(${list.ifmnSeq})" class="info">
																	<td scope="row" src="#">
																		<input type="checkbox" name="chk_box" onclick="checkSelectAll(this)">
																	</td>
																	<td>
																		<c:out value="${vo.totalRows2 - ((vo.thisPage2 - 1) * vo.rowNumToShow2 + status.index) }"/>
																	</td>
																	<td>${list.ifmnSeq}</td>
																	<td>${list.ifmnName }</td>
																	<td>
																		<fmt:formatNumber type="number" pattern="#,###" value="${list.ifmnPrice}"/>
																	</td>
																	<td>${list.ifmnInfo}</td>
																	<td>${list.ifmnSet_div}</td>
																	<td>${list.ifmnCreatedAt}</td>
																</tr>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</tbody>
										</table>
										<%@include file="../../xdmin/includeV1/pagination2.jsp"%>
									</div>
									<div class="row align-items-center m-2">
			                            <div class="col-2">
			                                <button id="btnDel" class="border-0 btn shadow" type="button" data-bs-toggle="modal" data-bs-target="#deleteModal">
			                                    <i class="fa-solid fa-trash fa-lg"></i>
			                                </button>
			                                <div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false"
			                                    tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			                                    <div class="modal-dialog">
			                                        <div class="modal-content">
			                                            <div class="modal-header">
			                                                <h5 class="modal-title fw-bold" id="staticBackdropLabel">게시물 삭제</h5>
			                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			                                            </div>
			                                            <div class="modal-body fs-6">
			                                                선택하신 게시물을 정말로 삭제하시겠습니까?
			                                            </div>
			                                            <div class="modal-footer">
			                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
			                                                <button id="delBtn"  type="button" class="btn btn-dager">삭제</button>
			                                            </div>
			                                        </div>
			                                    </div>
			                                </div>
			                                <button id="btnUel" class="border-0 btn btn-dark shadow" type="button" data-bs-toggle="modal" data-bs-target="#deleteModal">
			                                    <i class="fa-solid fa-xmark text-white"></i>
			                                </button>
			                            </div>
			                            <div class="col-2 offset-8" align="right">
			                                <button class="border-0 btn bg-success shadow" type="button" data-bs-toggle="modal" data-bs-target="#deleteModal" id="btnExcel" name="btnExcel">
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
		                    <li>
		                    	<a target="_blank" class="footer_item" href="#" id="fot.agreement">
		                    		<span class="text">이용약관</span>
		                    	</a>
	                    	</li>
		                    <li>
		                    	<a target="_blank" class="footer_item" href="#l" id="fot.privacy">
		                    		<span class="text"><strong>개인정보처리방침</strong></span>
	                    		</a>
	                		</li>
		                    <li>
		                    	<a target="_blank" class="footer_item" href="#" id="fot.disclaimer">
		                    		<span class="text">책임의 한계와 법적고지</span>
	                            </a>
                            </li>
		                    <li>
		                    	<a target="_blank" class="footer_item"href="#" id="fot.help">
		                    		<span class="text">회원정보 고객센터</span>
	                    		</a>
                    		</li>
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
	</form>
	
		<!-- end --> 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
		<script>
		
		var goUrlForm = "/menu/menuForm"; 
		var goUrlList = "/menu/menuList";
		var goUrlInst = "/menu/menuInst";
		var goUrlUpdt = "/menu/menuUpdt";	
		var goUrlUele = "/menu/menuUele";	
		var goUrlDele = "/menu/menuDele";	
		
		var excelUri = "/menu/excelDownload";
		
		var form = $("form[name=myForm]");
    	var ifmnSeq = $("input:hidden[name=ifmnSeq]");
    	
		$("#btnReset").on("click", function(){
			 $(location).attr("href", goUrlList);
		 });
		
		$(function() {
	   		$("#shDateStart").datepicker({
	   			dateFormat: "yy-mm-dd"
	   			,showMonthAfterYear: true
	   			,showOtherMonths: true
	   		});
	   		$("#shDateEnd").datepicker({
	   			dateFormat: "yy-mm-dd"
      			,showMonthAfterYear: true
      			,showOtherMonths: true
      		});
	   	})
		
    	 // ----- 페이지 네이션 -----
    	 
    	goList = function(thisPage) {
			$("input:hidden[name=thisPage2]").val(thisPage);
			form.attr("action", goUrlList).submit();
		};
		
		// ----- form으로 이동 -----
 		
 		 $('#').on("click", function() {
 			goForm(0);                
 		});
 		
 		 goForm = function(keyValue) {
 			ifmnSeq.val(keyValue);
 			form.attr("action", goUrlForm).submit();
 		} 
 		 
	 	// ----- 체크박스 -----
	 	
	 	$("#checkboxAll").click(function() {
			if($("#checkboxAll").is(":checked")) $("input[name=checkboxSeq]").prop("checked", true);
			else $("input[name=checkboxSeq]").prop("checked", false);
		});
	
		$("input[name=checkboxSeq]").click(function() {
			var total = $("input[name=checkboxSeq]").length;
			var checked = $("input[name=checkboxSeq]:checked").length;
			
			event.stopImmediatePropagation()
			if(total != checked) $("#checkboxAll").prop("checked", false);
			else $("#checkboxAll").prop("checked", true); 
		});

	 	// ----- 엑셀 다운 -----
	 	
	 	$("#btnExcel").click(function() {
			form.attr("action", excelUri).submit();
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
