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
		<title>Home Main</title>
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
	            </div>
	        </nav>
	    </header>
		<main>
			<form id="myForm" name="myForm" method="post">
				<input type="hidden" name="thisPage2" value="<c:out value="${vo.thisPage2}" default="1"/>">
				<input type="hidden" name="rowNumToShow2" value="${vo.rowNumToShow2}">
				<input type="hidden" name="ifcmSeq" value="<c:out value="${vo.ifcmSeq}"/>"/>
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
		                            <nav class="navbar navbar-expand-lg mx-0" style="width: 250px;">
		                                <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasSideNavbar"
		                                    style="visibility: visible; width:250px;" aria-modal="true" role="dialog">
		                                    <div class="offcanvas-header">
		                                        <button type="button" class="btn-close text-reset ms-auto" data-bs-dismiss="offcanvas"
		                                            aria-label="Close"></button>
		                                    </div>
		                                    <div class="offcanvas-body d-block px-2 px-lg-0">
		                                        <div class="card overflow-hidden">
		                                        	 <!-- Profile START -->
									                <div class="dropdown">
									                    <ul class="align-items-center ms-sm-3 list-unstyled">
									                        <li class="me-2">
									                            <a class="p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
									                                <img class="avatar-img rounded-circle shadow row mt-3 mb-3" src="/resources/images/diano.jpg" alt="avatar" style="width: 100px; display: block; margin: auto;">
									                            </a>
									                            <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
									                                aria-labelledby="profileDropdown">
									                                <!-- Profile info -->
									                                <li style="display: none;">
									                                    <div class="d-flex align-items-center">
									                                        <!-- Avatar -->
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
	                                                <span style="text-align: center;" >ㅇㅇㅇ관리자님</span>
	                                               	<br>
	                                               	<span style="text-align: center;">반갑습니다.</span>
		                                            <!-- <img src="https://cdn.pixabay.com/photo/2014/02/13/07/28/cms-265128_960_720.jpg" class="card-img-top" alt="background"
		                                                style="height: 200px; background-position: center; background-size: cover; background-repeat: no-repeat;"> -->
		                                            <div class="card-body pt-0">
		                                                <div class="text-center">
		                                                    <hr>
		                                                    <ul class="nav nav-link-secondary flex-column fw-bold gap-2">
		                                                        <li class="nav-item">
		                                                            <a class="nav-link" href="/homeMain">
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
									<h2 class="row needs-validation ms-3">Home Main</h2>
									이제 내용을 넣어봅시다
									
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
		
		</script>
	</body>
</html>
