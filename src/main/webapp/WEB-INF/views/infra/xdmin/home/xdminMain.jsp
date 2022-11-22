<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html lang="ko" >
<head>
  <meta charset="UTF-8">
  <title>xdmin Main</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" href="/resources/css/home/style.css">	
</head>
<body>
	<form action="formList" name="formList" method="post">
		<input type="hidden" name="thisPage" value="1">
	   	<input type="hidden" name="rowNumToShow" value="${vo.rowNumToShow }">
	   <%-- <input type="hidden" name="ifmmSeq" value="${vo.ifmmSeq}"> --%>
		<div class="hero">
			<%@include file="/resources/js/snow/snow.jsp"%>
			<div class="hero__content">
		<!-- partial:index.partial.html -->
			<link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet">
			<div class="task-manager">
			 <!-- sidebar -->
			 <%@include file="/resources/js/sideBar/sideBar.jsp"%>
			  <div class="page-content">
			    <div class="header">Today Tasks</div>
			    <div class="content-categories">
			      <div class="label-wrapper">
			        <input class="nav-item" name="nav" type="radio" id="opt-1" checked>
			        <label class="category" for="opt-1">All</label>
			      </div>
			      <div class="label-wrapper">
			        <input class="nav-item" name="nav" type="radio" id="opt-2">
			        <label class="category" for="opt-2">Important</label>
			      </div>
			      <div class="label-wrapper">
			        <input class="nav-item" name="nav" type="radio" id="opt-3">
			        <label class="category" for="opt-3">Notes</label>
			      </div>
			      <div class="label-wrapper">
			        <input class="nav-item" name="nav" type="radio" id="opt-4">
			        <label class="category" for="opt-4">Links</label>
			      </div>
			    </div>
			     <div class="header upcoming">New Member</div>
			    <div class="tasks-wrapper">
			      <div class="task">
			      	<i class="fa-solid fa-user-plus"></i>
			        <!-- <input class="task-item" name="task" type="checkbox" id="item-1" checked> -->
			        <label>
			          <span class="text ms-2">이름 : <strong>value="${vo.ifmmName}"</strong></span>
			          &nbsp; &nbsp; 
			          <span class="text">닉네임 : <strong>lalala</strong></span>
			          &nbsp; &nbsp; 
			          <span class="text">이메일 : <strong>lala@naver.com</strong></span>
			          &nbsp; &nbsp; 
			          <span class="text">가입일 : <strong>2022-11-22</strong></span>
			        </label>
			      </div>
			      <div class="task">
			      <i class="fa-solid fa-user-plus"></i>
			        <!-- <input class="task-item" name="task" type="checkbox" id="item-3"> -->
			        <label>
			          <span class="text ms-2">이름 : <strong>고*지</strong></span>
			          &nbsp; &nbsp; 
			          <span class="text">닉네임 : <strong>nct127</strong></span>
			          &nbsp; &nbsp; 
			          <span class="text">이메일 : <strong>jaehyun@naver.com</strong></span>
			          &nbsp; &nbsp; 
			          <span class="text">가입일 : <strong>2022-11-22</strong></span>
			        </label>
			      </div>
		      	</div>
		      <div class="header upcoming">New Store</div>
		       	<div class="tasks-wrapper">
			      <div class="task">
			      	<i class="fa-solid fa-store"></i>
			        <!-- <input class="task-item" name="task" type="checkbox" id="item-3"> -->
			        <label>
			          <span>이름 : <strong>참이맛감자탕 강남점</strong></span>
			          &nbsp; &nbsp; 
			          <span>전화번호 : <strong>02-3481-3399</strong></span>
			          &nbsp; &nbsp; 
			          <span>주소 : <strong>서울 서초구 사평대로56길 10</strong></span>
			        </label>
			      </div>
			      <div class="task">
			      	<i class="fa-solid fa-store"></i>
			        <!-- <input class="task-item" name="task" type="checkbox" id="item-3"> -->
			        <label>
			          <span>이름 : <strong>봉구스밥버거 아현점</strong></span>
			          &nbsp; &nbsp; 
			          <span>전화번호 : <strong>010-2737-7551</strong></span>
			          &nbsp; &nbsp; 
			          <span>주소 : <strong>서울 마포구 마포대로 196</strong></span>
			        </label>
			      </div>
			    </div>
			  </div>
			  <div class="right-bar">
			    <div class="top-part">
			    	<div class="dropdown">
		                    <ul class="nav flex-nowrap align-items-center ms-sm-3 list-unstyled">
		                        <li class="me-2">
		                            <a class="p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside"
		                                data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
		                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
									        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
									        class="feather feather-users">
									        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
									        <circle cx="9" cy="7" r="4" />
									        <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
									        <path d="M16 3.13a4 4 0 0 1 0 7.75" />
								        </svg>
		                            </a>
		                            <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3"
		                                aria-labelledby="profileDropdown">
		                                <!-- Profile info -->
		                                <li class="px-3">
		                                    <div class="d-flex align-items-center">
		                                        <!-- Avatar -->
		                                        <div class="avatar mt-3">
		                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
												        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
												        class="feather feather-users">
												        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
												        <circle cx="9" cy="7" r="4" />
												        <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
												        <path d="M16 3.13a4 4 0 0 1 0 7.75" />
											        </svg>
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
			      <div class="count">6</div>
			    </div>
			    <div class="header">Schedule</div>
			    <div class="right-content">
			      <div class="task-box yellow">
			        <div class="description-task">
			          <div class="time">08:00 - 09:00 AM</div>
			          <div class="task-name">Product Review</div>
			        </div>
			        <div class="more-button"></div>
			        <div class="members">
			          <img
			            src="https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"
			            alt="member">
			          <img
			            src="https://images.unsplash.com/photo-1476657680631-c07285ff2581?ixlib=rb-1.2.1&auto=format&fit=crop&w=2210&q=80"
			            alt="member-2">
			          <img
			            src="https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80"
			            alt="member-3">
			          <img
			            src="https://images.unsplash.com/photo-1455504490126-80ed4d83b3b9?ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80"
			            alt="member-4">
			        </div>
			      </div>
			      <div class="task-box blue">
			        <div class="description-task">
			          <div class="time">10:00 - 11:00 AM</div>
			          <div class="task-name">Design Meeting</div>
			        </div>
			        <div class="more-button"></div>
			        <div class="members">
			          <img
			            src="https://images.unsplash.com/photo-1484688493527-670f98f9b195?ixlib=rb-1.2.1&auto=format&fit=crop&w=2230&q=80"
			            alt="member">
			          <img
			            src="https://images.unsplash.com/photo-1469334031218-e382a71b716b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80"
			            alt="member-2">
			          <img
			            src="https://images.unsplash.com/photo-1455504490126-80ed4d83b3b9?ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80"
			            alt="member-3">
			        </div>
			      </div>
			      <div class="task-box red">
			        <div class="description-task">
			          <div class="time">01:00 - 02:00 PM</div>
			          <div class="task-name">Team Meeting</div>
			        </div>
			        <div class="more-button"></div>
			        <div class="members">
			          <img
			            src="https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"
			            alt="member">
			          <img
			            src="https://images.unsplash.com/photo-1475552113915-6fcb52652ba2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1934&q=80"
			            alt="member-2">
			          <img
			            src="https://images.unsplash.com/photo-1493752603190-08d8b5d1781d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=80"
			            alt="member-3">
			          <img
			            src="https://images.unsplash.com/photo-1484688493527-670f98f9b195?ixlib=rb-1.2.1&auto=format&fit=crop&w=2230&q=80"
			            alt="member-4">
			        </div>
			      </div>
			      <div class="task-box green">
			        <div class="description-task">
			          <div class="time">03:00 - 04:00 PM</div>
			          <div class="task-name">Release Event</div>
			        </div>
			        <div class="more-button"></div>
			        <div class="members">
			          <img
			            src="https://images.unsplash.com/photo-1523419409543-a5e549c1faa8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=943&q=80"
			            alt="member">
			          <img
			            src="https://images.unsplash.com/photo-1519742866993-66d3cfef4bbd?ixlib=rb-1.2.1&auto=format&fit=crop&w=881&q=80"
			            alt="member-2">
			          <img
			            src="https://images.unsplash.com/photo-1521122872341-065792fb2fa0?ixlib=rb-1.2.1&auto=format&fit=crop&w=2208&q=80"
			            alt="member-3">
			          <img
			            src="https://images.unsplash.com/photo-1486302913014-862923f5fd48?ixlib=rb-1.2.1&auto=format&fit=crop&w=3400&q=80"
			            alt="member-4">
			          <img
			            src="https://images.unsplash.com/photo-1484187216010-59798e9cc726?ixlib=rb-1.2.1&auto=format&fit=crop&w=955&q=80"
			            alt="member-5">
			        </div>
			      </div>
			      <div class="task-box blue">
			        <div class="description-task">
			          <div class="time">08:00 - 09:00 PM</div>
			          <div class="task-name">Release Event</div>
			        </div>
			        <div class="more-button"></div>
			        <div class="members">
			          <img
			            src="https://images.unsplash.com/photo-1523419409543-a5e549c1faa8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=943&q=80"
			            alt="member">
			          <img
			            src="https://images.unsplash.com/photo-1519742866993-66d3cfef4bbd?ixlib=rb-1.2.1&auto=format&fit=crop&w=881&q=80"
			            alt="member-2">
			          <img
			            src="https://images.unsplash.com/photo-1521122872341-065792fb2fa0?ixlib=rb-1.2.1&auto=format&fit=crop&w=2208&q=80"
			            alt="member-3">
			          <img
			            src="https://images.unsplash.com/photo-1486302913014-862923f5fd48?ixlib=rb-1.2.1&auto=format&fit=crop&w=3400&q=80"
			            alt="member-4">
			          <img
			            src="https://images.unsplash.com/photo-1484187216010-59798e9cc726?ixlib=rb-1.2.1&auto=format&fit=crop&w=955&q=80"
			            alt="member-5">
			        </div>
			      </div>
			      <div class="task-box yellow">
			        <div class="description-task">
			          <div class="time">11:00 - 12:00 PM</div>
			          <div class="task-name">Practise</div>
			        </div>
			        <div class="more-button"></div>
			        <div class="members">
			          <img
			            src="https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80"
			            alt="member">
			          <img
			            src="https://images.unsplash.com/photo-1476657680631-c07285ff2581?ixlib=rb-1.2.1&auto=format&fit=crop&w=2210&q=80"
			            alt="member-2">
			          <img
			            src="https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80"
			            alt="member-3">
			          <img
			            src="https://images.unsplash.com/photo-1455504490126-80ed4d83b3b9?ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80"
			            alt="member-4">
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
		</div>
	</div>
</form>

<!-- partial -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  
</body>
</html>
