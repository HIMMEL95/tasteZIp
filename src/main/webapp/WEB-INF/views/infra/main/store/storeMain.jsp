<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<%-- <jsp:useBean id="CodeServiceImpl" class="com.spopia.infra.modules.code.CodeServiceImpl"/> --%>

<!doctype html> 
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <title>Order</title>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/order/mapBasic.css">
	<link rel="stylesheet" href="/resources/css/order/order.css">
	<script defer type="text/javascript" src="/resources/js/order/mapBasic.js"></script>
</head>

<body>
    <!-- start -->
    
    <main class="clearfix">
		
		<!-- sidebar s -->
    	<%@include file="../../xdmin/includeV1/mainSidebar.jsp"%>
		<!-- sidebar e -->
		
		<div class="map_container" id="container">
			<form id="myForm" name="myForm">
				<div class="sideInfo">
					<div class="handle">
						<input type="hidden" name="handle_value" id="handle_value" value="1">
						<button type="button" id="handle" class="btn_fold expand">접기</button>
					</div>
					<div class="panel">
						<div class="panel_top">
							<!-- search s -->
							<div class="search">
								<div class="search_wrap">
									<div class="search_box">
										<button class="search_btn" type="button">검색</button>
										<div class="input_box">
											<label class="label_search">장소, 버스, 지하철, 도로 검색</label>
											<input type="text" id="placeSearch" autocomplete="none" autofocus class="input_search">
										</div>
									</div>
								</div>
							</div>
							<!-- search e -->
							<div class="ng-star-inserted entry-layout">
								<!-- content s -->
		  						<input type="hidden" name="ifstSeq" value="<c:out value="${vo.ifstSeq}"/>"/>
		  						<input type="hidden" name="ifmmSeq" value="<c:out value="${sessSeq}"/>"/>
								<div class="entry-place-bridge">
									<div class="entry_wrap loaded ng-star-inserted">
										<div class="place_on_pcmap">
											<div class="place_didmount" id="app-root">
												<div style="width: 100%; height: 100%;">
													<div class="BXtr_ tAvTy">
														<div class="place_tab_shadow FFTct IOXHr">
															<a href="/storeList" role="button" class="DDfpb">
																<img class="back" alt="" src="https://cdn-icons-png.flaticon.com/512/54/54321.png"> 
															</a>
															<h1 class="bh9OH">${item.ifstName}</h1>
														</div>
														<div role="main" style="width:100%; height: 300px;">
															<div class="place_img">
																<div class="uDR4i fnRPu" style="height: 300px;">
																	<c:forEach items="${img}" var="img" varStatus="status">
																		<div class="fNygA">
																			<a href="#" target="_self" role="button" class="place_thumb QX0J7" id="_autoPlayable">
																				<div class="K0PDV _div" style="width:100%;height:100%;" id="ibu_1">
																					<img src="${img.path }${img.uuidName}" alt="" style="width: 295.1px; height: 300px">
																				</div>
																			</a>
																		</div>
																	</c:forEach>
																</div>
															</div>
															<div class="place_section">
																<div class="zD5Nm f7aZ0">
																	<div class="YouOG">
																		<span class="Fc1rA">${item.ifstName }</span>
																	</div>
																	<div class="dAsGb">
																		<span class="PXMot LXIwF">
																			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 13 13" class="GWkzU" aria-hidden="true">
																				<path d="M8.26 4.68h4.26a.48.48 0 01.28.87L9.35 8.02l1.33 4.01a.48.48 0 01-.18.54.48.48 0 01-.56 0l-3.44-2.5-3.44 2.5a.48.48 0 01-.74-.54l1.33-4L.2 5.54a.48.48 0 01.28-.87h4.26l1.3-4a.48.48 0 01.92 0l1.3 4z"></path>
																			</svg>
																			<span class="place_blind">별점</span>
																			<em>4.35</em>
																			/5
																		</span>
																		<!-- <span class="PXMot">
																			<a href="/restaurant/1470422298/review/visitor" role="button" class="place_bluelink">
																				방문자리뷰
																				<em>414</em>
																			</a>
																		</span>
																		<span class="PXMot">
																			<a href="/restaurant/1470422298/review/ugc" role="button" class="place_bluelink">
																				블로그리뷰 
																				<em>85</em>
																			</a>
																		</span> -->
																	</div>
																</div>
																<div class="X0C1I">
																	<button target="_self" role="button" class="Pcppb" onclick="goWay(${List.ifstSeq})" id="btnDep">
																		<i class="fa-solid fa-location-dot text-primary"></i>
																		출발
																	</button>
																	<button target="_self" role="button" class="gd2MP" onclick="goWay2(${item.ifstSeq})" id="btnArr">		
																		<i class="fa-solid fa-location-dot"></i>
																		도착															
																	</button>
																	&nbsp;&nbsp;<button type="button" id="fv" class="btn btn-danger" onclick="favorite()">		
																		<input type="hidden" name="iffvSeq" id="iffvSeq" value="${item.iffvSeq }">
																		<c:choose>
																			<c:when test="${item.iffvUseNy eq 0}">
																				<input type="hidden" name="iffvUseNy" id="iffvUseNy" value="0">
																				<i class="fa-regular fa-heart"></i> 좋아요
																			</c:when>
																			<c:otherwise>
																				<c:choose>
																					<c:when test="${item.iffvUseNy eq 1 }"> <!-- value(useNy)가 0일때 -->
																						<i class="fa-solid fa-heart"></i> 좋아요
																					</c:when>
																					<c:otherwise>
																						<i class="fa-regular fa-heart"></i> 좋아요
																					</c:otherwise>
																				</c:choose>
																			</c:otherwise>
																		</c:choose>
																	</button>
																</div>
															</div>
															<div style="background: #e2e5e8; height: 10px;"></div>
															<div class="place_fixed_maintab">
																<div class="Jxtsc MpTT1" role="tablist" data-nclicks-area-code="tab">
																	<div class="ngGKH">
																		<div class="flicking-viewport" style="user-select: none; -webkit-user-drag: none; touch-action: pan-y;">
																			<div class="flicking-camera" style="transform: translate(0px);">
																				<a href="/storeMain" role="tab" class="tpj9w _tab-menu" aria-selected="true" title="" id="" style="width: 200px;">
																					<span class="veBoZ">홈</span>
																				</a>
																				<a href="javascript:goForm(${item.ifstSeq})" role="tab" class="tpj9w _tab-menu" aria-selected="false" title="" id="" style="width: 200px;">
																					<span class="veBoZ">메뉴</span>
																				</a>
																				<a href="javascript:goComment(${item.ifstSeq})" role="tab" class="tpj9w _tab-menu" aria-selected="false" title="" id="" style="width: 200px;">
																					<span class="veBoZ">리뷰</span>
																				</a>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div style="min-height: calc(100vh - 50px - 47px)">
																<div data-nclicks-area-code="btp">
																	<div class="place_section no_margin vKA6F">
																		<div class="place_section_content">
																			<ul class="y4sYp">
																				<li class="SF_Mq GFtzE">
																					<strong class="RmIE4">
																						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18" class="nHf7b" aria-hidden="true">
																							<path d="M15 6.97a6.92 6.92 0 01-1.12 3.77l-5.51 7.08a.47.47 0 01-.74 0L2.1 10.71A6.93 6.93 0 011 6.97 7 7 0 018 0v.93V0a7 7 0 017 6.97zm-13 0c0 1.15.4 2.3.99 3.24L8 16.7l5.04-6.5A5.95 5.95 0 008 1C4.66 1 2 3.64 2 6.97zm6-1.54A1.58 1.58 0 008 8.6a1.57 1.57 0 000-3.16zm0-.93a2.51 2.51 0 010 5.02A2.51 2.51 0 118 4.5z"></path>
																						</svg>
																						<span class="place_blind">주소</span>
																					</strong>
																					<div class="x8JmK">
																						<a href="#" target="_self" role="button" class="pAe5G" aria-haspopup="true" aria-expanded="false" style="display: flex;">
																							<div class="addFir" class="btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
																								<span class="IH7VW">${item.ifstAddress}${item.ifstAddressExtra }</span>
																								<span class="KP_NF">
																									<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 7" class="nHf7b" aria-hidden="true">
																										<path d="M11.47.52a.74.74 0 00-1.04 0l-4.4 4.45v.01L1.57.52A.74.74 0 10.53 1.57l5.12 5.08a.5.5 0 00.7 0l5.12-5.08a.74.74 0 000-1.05z"></path>
																									</svg>
																								</span>
																								<div class="collapse" id="collapseExample">
																									<div class="card card-body" style="border-color: transparent; padding-top: 0px; padding-bottom: 0px;">
																										<span class="IH7VW" style="display: block;">${item.ifstAddressDetail}</span>
																									</div>
																								</div>
																							</div>
																						</a>
																						<!-- <div class="jyfLw">
																							<span class="fv9Gn">
																								<span class="nHf7b" style="background: rgb(209, 166, 44); height: 25px; width: 25px;">9</span>
																							</span>
																							<span class="fv9Gn">
																								<span class="nHf7b" style="background: rgb(167, 30, 49);">신분당</span>
																							</span>
																							<strong>신논현역</strong> 9번 출구에서<em>106m</em>
																						</div> -->
																					</div>
																				</li>
																				<c:choose>
																					<c:when test="${empty item.ifstDirections }"></c:when>
																					<c:otherwise>
																						<li class="SF_Mq">
																							<strong class="RmIE4">
																								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18" class="nHf7b" aria-hidden="true">
																									<path d="M10.24 1.08l4.35 4.35-.78.78-3.02-3.02V9.9l-7.69.03v7.14H2V8.84l7.69-.02V3.19L6.67 6.2l-.78-.78 4.35-4.35z"></path>
																								</svg>
																								<span class="place_blind"><b>찾아가는길</b></span>
																							</strong>
																							<div class="x8JmK">
																								<div>
																									<div class="xHaT3" style="display: block;">
																										<span class="zPfVt">${item.ifstDirections }</span>
																									</div>
																								</div>
																							</div>
																						</li>
																					</c:otherwise>
																				</c:choose>
																				<li class="SF_Mq Sg7qM">
																					<strong class="RmIE4">
																						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18" class="nHf7b" aria-hidden="true">
																							<path d="M8 16A7 7 0 108 2a7 7 0 000 14zm0 1A8 8 0 118 1a8 8 0 010 16zm.5-7.8l3.02 1.76a.5.5 0 01.19.68.5.5 0 01-.69.19L7.8 9.96a.5.5 0 01-.3-.46v-5a.5.5 0 011 0v4.7z"></path>
																						</svg>
																						<span class="place_blind">영업시간</span>
																					</strong>
																					<div class="x8JmK">
																						<a href="#" target="_self" role="button" class="vVPEo UGQE_" aria-expanded="false">
																							<div class="nNPOq jS4JO">
																								<div class="X007O">
																									<div class="ob_be">
																										<em>영업 중</em>
																										<span class="MxgIj">
																											<time aria-hidden="true">21:30에 라스트오더</time>
																											<span class="place_blind">21시 30분에 라스트오더</span>
																										</span>
																									</div>
																									<span class="KP_NF">
																										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 7" class="nHf7b" aria-hidden="true">
																											<path d="M11.47.52a.74.74 0 00-1.04 0l-4.4 4.45v.01L1.57.52A.74.74 0 10.53 1.57l5.12 5.08a.5.5 0 00.7 0l5.12-5.08a.74.74 0 000-1.05z"></path>
																										</svg>
																										<span class="place_blind">펼쳐보기</span>
																									</span>
																								</div>
																							</div>
																						</a>
																					</div>
																				</li>
																				<li class="SF_Mq SjF5j">
																					<strong class="RmIE4">
																						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18" class="nHf7b" aria-hidden="true">
																							<path d="M2.92 1.15L.15 3.93a.5.5 0 00-.14.45 16.09 16.09 0 0012.6 12.61.5.5 0 00.46-.14l2.78-2.78a.5.5 0 000-.71l-4.18-4.18-.07-.06a.5.5 0 00-.64.06l-1.9 1.9-.28-.18a9.53 9.53 0 01-2.65-2.63L5.96 8 7.88 6.1a.5.5 0 000-.71L4.41 1.93l-.78-.78a.5.5 0 00-.7 0zm5.62 10.79l.37.21.09.04a.5.5 0 00.49-.13l1.82-1.82 3.48 3.47-2.24 2.24-.07-.01A15.1 15.1 0 011.14 4.84l-.1-.4 2.24-2.23 3.54 3.53-1.84 1.84a.5.5 0 00-.08.6 10.54 10.54 0 003.64 3.76z"></path>
																						</svg>
																					</strong>
																					<div class="x8JmK">
																						<span class="dry01" id="p1">${item.ifstPhone }</span>
																						<span class="mnnPt">
																							<a href="#" target="_self" role="button" onclick="copyToClipboard('#p1')" class="_vIMk" title="복사">
																								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 13" class="pHtH_" aria-hidden="true">
																									<path d="M9 8v.48l-1.98 1.58L6 11H3v1h4.61L10 9.81V3h-.97L9 8zm0-6h1a1 1 0 011 1v7.25L8 13H3a1 1 0 01-1-1v-1H1a1 1 0 01-1-1V1a1 1 0 011-1h7a1 1 0 011 1v1zm-7 8h3.5l.87-.7L8 7.81V1H1v9h1zm0-7h4v1H2V3zm0 2h4v1H2V5zm0 2h2v1H2V7z"></path>
																								</svg>
																								복사
																							</a>
																						</span>
																					</div>
																				</li>
																				<li class="SF_Mq">
																					<strong class="RmIE4">
																						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18" class="nHf7b" aria-hidden="true">
																							<path d="M10.05 15.48h4.45V7.86a3.26 3.26 0 01-2.22.86c-.81 0-1.57-.3-2.15-.81a3.24 3.24 0 01-2.15.81 3.24 3.24 0 01-2.13-.79 3.24 3.24 0 01-2.13.8 3.26 3.26 0 01-2.22-.87v7.62h4.44V11.3a.5.5 0 01.5-.5h3.11a.5.5 0 01.5.5v4.17zm-1 0V11.8h-2.1v3.67h2.1zm6.45-9.79a.5.5 0 010 .04v10.25a.5.5 0 01-.5.5H1a.5.5 0 01-.5-.5V5.73 5.7a3.11 3.11 0 010-.1.5.5 0 01.05-.22L2.3 1.78a.5.5 0 01.45-.28h10.5a.5.5 0 01.45.28l1.75 3.59a.5.5 0 01.05.22v.1zM3.06 2.5L1.5 5.7a2.19 2.19 0 002.22 2.02 2.24 2.24 0 001.74-.82.5.5 0 01.78 0 2.24 2.24 0 001.74.82c.7 0 1.33-.31 1.75-.85a.5.5 0 01.79 0 2.24 2.24 0 001.76.85c1.2 0 2.16-.9 2.22-2.02l-1.56-3.2H3.06z"></path>
																						</svg>
																						<span class="place_blind">편의</span>
																					</strong>
																					<div class="x8JmK">단체석, 주차, 포장, 배달, 예약</div>
																				</li>
																				<li class="SF_Mq nKpE4">
																					<strong class="RmIE4">
																						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18" class="nHf7b" aria-hidden="true">
																							<path d="M2.5 8.38v7.12h-1V9.35l-.79.75L0 9.4 7.99 1.7 16 9.41l-.71.72-.79-.76v6.13h-1V8.4L7.99 3.1 2.5 8.38zm4.2 7.11h-1V10h4.61v5.5h-1V11H6.7v4.5z"></path>
																						</svg>
																						<span class="place_blind">홈페이지</span>
																					</strong>
																					<c:choose>
																						<c:when test="${empty item.ifstSns }">
																							<span>홈페이지가 없습니다.</span>
																						</c:when>
																						<c:otherwise>
																							<div class="x8JmK">
																								<div class="CntGM">
																									<span class="mnnPt">
																										<a name="ifstSns" style="cursor: pointer;" href="${item.ifstSns}">${item.ifstSns} </a>
																									</span>
																								</div>
																							</div>
																						</c:otherwise>
																					</c:choose>
																				</li>
																				<li class="SF_Mq I5Ypx">
																					<strong class="RmIE4">
																						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 18" class="nHf7b" aria-hidden="true">
																							<path d="M11 15V3H2v12h9zm1-6h3v6a1 1 0 01-1 1H2a1 1 0 01-1-1V3a1 1 0 011-1h9a1 1 0 011 1v6zm0 1v5h2v-5h-2zM4 5.5h5v1H4v-1zM4 8h5v1H4V8zm0 2.5h3v1H4v-1z"></path>
																						</svg>
																						<span class="place_blind">설명</span>
																					</strong>
																					<div class="x8JmK">
																						<a target="_self" role="button" aria-expanded="false" class="xHaT3">
																							<span class="zPfVt text-truncate" style="max-width: 480px;">${item.ifstInfo}</span>
																							<span class="rvCSr">
																								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 7" class="Ky28p" aria-hidden="true">
																									<path d="M11.47.52a.74.74 0 00-1.04 0l-4.4 4.45v.01L1.57.52A.74.74 0 10.53 1.57l5.12 5.08a.5.5 0 00.7 0l5.12-5.08a.74.74 0 000-1.05z"></path>
																								</svg>
																								<span class="place_blind">내용 더보기</span>
																							</span>
																						</a>
																					<input type="hidden" name="ifstLat" value="${item.ifstLat} ">
																					<input type="hidden" name="ifstLng" value="${item.ifstLng}">
																					</div>
																				</li>
																				<!-- <li class="SF_Mq DXdyf">
																					<strong class="RmIE4">
																						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 14 13" class="nHf7b" aria-hidden="true">
																							<path d="M7.42 1.92l3.54 3.56L3.55 13H0V9.44l7.42-7.52zM14 12.3v.7H5.6v-.7H14zM10.34 0a2.54 2.54 0 011.91 4.17l-.02.02-.78.79-3.54-3.55.79-.79C9.17.24 9.73 0 10.34 0z"></path>
																						</svg>
																						<span class="place_blind">정보 수정 제안</span>
																					</strong>
																					<div class="x8JmK">
																						<a href="#" target="_self" role="button">
																							정보 수정 제안하기
																							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 8 13" class="nHf7b" aria-hidden="true">
																								<path d="M6.09 6.5L.5 1.15 1.2.5l6.3 6-6.3 6-.7-.65z"></path>
																							</svg>
																						</a>
																					</div>
																				</li> -->
																			</ul>
																		</div>
																	</div>
																	<div class="place_section" data-nclicks-area-code="qmn">
																		<h2 class="place_section_header">
																			메뉴
																			<em class="place_section_count">77</em>
																			<%-- <em class="place_section_count">${vo.totalRows}</em> --%>
																			<div class="rNxBQ">
																				<span class="N5pEx">
																					<a target="_self" class="place_bluelink EMAxw">메뉴판 이미지로 보기</a>
																				</span>
																			</div>
																		</h2>
																		<div class="place_section_content">
																			<ul class="mpoxR">
																				<c:choose>
																					<c:when test="${fn:length(menu) eq 0}">
																						<div class="justify-content-center">
																							<div class="col text-center">
																								<img src="https://yesexpo.co.kr/wp-content/uploads/2021/01/%EC%A4%80%EB%B9%84%EC%A4%91-1200x375.jpg" width="100%" height="auto">
																							</div>
																							<div class="col text-center mt-3 mb-2"><h5><b>메뉴 준비중 입니다</b></h5></div>
																						</div>
																					</c:when>
																					<c:otherwise>
																						<c:forEach items="${menu}" var="menu" varStatus="status">
																							<li class="yhGu6">
																								<a href="#" role="button" class="Ozh8q">
																								<%-- <a href="javascript:goForm('${menu.ifmnseq }')" role="button" class="Ozh8q"> --%>
																									<div class="ZHqBk">
																										<div class="place_thumb">
																											<div class="lazyload-wrapper ">
																												<c:choose>
																													<c:when test="${empty menu.pseq }">
																														<img src="https://www.tobedone.co.kr/uploads/8d0771dbf95f31d6cba1a63d14666d1c.jpg" alt="" width="100%" height="auto">
																													</c:when>
																													<c:otherwise>
																														<img src="${menu.path}${menu.uuidName}" alt="" width="265px;" height="201px;">
																													</c:otherwise>
																												</c:choose>
																											</div>
																										</div>
																									</div>
																									<div class="MN48z">
																										<div class="erVoL">
																											<div class="MENyI">${menu.ifmnName}</div>
																										</div>
																										<div class="Yrsei">
																											<div class="gl2cc">${menu.ifmnPrice}</div>
																										</div>
																										<div class="Qh_eq"></div>
																									</div>
																								</a>
																							</li>
																						</c:forEach>
																					</c:otherwise>
																				</c:choose>
																			</ul>
																		</div>
																		<div class="lfH3O">
																			<a href="javascript:goForm(${item.ifstSeq})" target="_self" role="button" class="fvwqf">
																				<span class="iNSaH">메뉴</span>
																				더보기
																				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 15 13" class="W0cVZ" aria-hidden="true" style="margin-top: 30px; margin-left: 10px">
																					<path fill-rule="evenodd" d="M8.5 0l-.71.7 5.3 5.3H0v1h13.08L7.8 12.3l.7.7L15 6.5z"></path>
																				</svg>
																			</a>
																		</div>
																	</div>
																</div>
															</div>																
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="entry-close-button">
									
								</div>
								<!-- content e -->
							</div>
						</div>
					</div>
				</div>
			</form>
			<div id="map" style="width:100%;height:100%;"></div>
		</div>
    </main>

    <!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77c9d237ea96142d7fda7576f0a0fc7e&libraries=services"></script>
	<script>
	
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.5021008334827, 127.024465815419), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
		var mapTypeControl = new kakao.maps.MapTypeControl();
	
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
		// 지도에 교통정보를 표시하도록 지도타입을 추가합니다
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);    
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(container, options); 
		
	</script>
	<script type="text/javascript">
	 	$("#signOutBtn").on("click", function() {
			$.ajax({
				type: "POST"
				,url: "/logoutProc"
				,data: {}
				,success : function(response) {
					if (response.rt == "success") {
						window.location.href = "/tasteMain";
					} 
				}
			});
		});
	 	
		var goUrlLogin = "/login";
    	
    	$("#loginBtn").on("click", function() {
			window.location.href = goUrlLogin;
		})
	 	
	 	var goUrlForm = "/menu";
	 	var goUrlComment = "/comment/storeComment";
		var seq = $("input[name=ifstSeq]");
		var form = $("#myForm");
		
		goForm = function(keyValue) {
			seq.val(keyValue);
			form.attr("action", goUrlForm).submit();
		}
		
		goComment = function(keyValue) {
			seq.val(keyValue);
			form.attr("action", goUrlComment).submit();
		}
		
	</script>
	<script type="text/javascript">
	<!-- Like 버튼 구현 -->
	function favorite(){
		var url = "";
		if ($(".fa-heart").hasClass("fa-regular")) {
			$(".fa-heart").removeClass("fa-regular");
			$(".fa-heart").addClass("fa-solid");
			url= "/store/favoriteInst";
			/* alert(likeCount) */
		} else {
			$(".fa-heart").addClass("fa-regular");
			$(".fa-heart").removeClass("fa-solid");
			url= "/store/favoriteDele";
		}
		/* form.attr("action", goUrlInst).submit(); */
		$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: url
				/* ,data : $("#formLogin").serialize() */
				,data : { "ifstSeq" : $("input[name=ifstSeq]").val(), "ifmmSeq" : $("input[name=ifmmSeq]").val()}
				,success: function(response) {
					console.log("성공!");
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
	}
	</script>
	<script type="text/javascript">
	
	var goUrlFindWay = "/findWay";
	 /* 
	 	event.preventDefault();
		event.stopPropagation();
		event.stopImmediatePropagation(); 
	*/	

		/* goWay = function(keyValue) {
			formVo.attr("action", goUrlFindWay).submit();
		} */
	
		goWay2 = function(keyValue) {
			form.attr("action", goUrlFindWay).submit();
		}
		
		 $("#btnDep").on("click", function() {
			event.preventDefault();
			$(location).attr("href", goUrlFindWay);
		}); 
		
	</script>
	
	<script>
		function copyToClipboard(element) {
			var $temp = $("<input>");
			  $("body").append($temp);
			  $temp.val($(element).text()).select();
			document.execCommand("copy");
			  $temp.remove();
			/* alert("copy complete"); */ //Optional Alert, 삭제해도 됨
		}
	</script>
</body>

</html>