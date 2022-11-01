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
    <title>menuOrder</title>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="../../../css/order/mapBasic.css">
	<link rel="stylesheet" href="../../../css/order/menuOrder.css">
	<script defer type="text/javascript" src="../../../js/order/mapBasic.js"></script>
</head>

<body>
    <!-- start -->
    
    <main class="clearfix">
		<div id="sidebar" class="sidebar">
			<div class="d-flex flex-column flex-shrink-0 bg-dark align-center" style="width: 4.5rem; height: 100vh;">
				<a href="/tasteMain" class="d-block p-3 link-dark text-decoration-none" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Icon-only">
					<img alt="" src="../../../images/main/logo2.png" width="40" height="30">
					<span class="visually-hidden">Icon-only</span>
				</a>
				<ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
					<li class="nav-item">
						<a href="/order" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-credit-card text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="/favorite" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-heart text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="/chat" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-comments text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="/story" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-pen-to-square text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="/comment" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fa-regular fa-thumbs-up text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="/findWay" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fa-solid fa-signs-post text-white" style="font-size: 22px;"></i>
						</a>
					</li>
				</ul>
				<div class="dropdown">
					<a href="#" class="d-flex align-items-center justify-content-center p-3 link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						<img src="https://github.com/mdo.png" alt="mdo" width="30" height="30" class="rounded-circle">
					</a>
					<ul class="dropdown-menu text-small shadow" style="">
						<li><a class="dropdown-item" href="#">New project...</a></li>
						<li><a class="dropdown-item" href="#">Settings</a></li>
						<li><a class="dropdown-item" href="#">Profile</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">Sign out</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="map_container" id="container">
			<form id="myForm" name="myForm">
				<div class="sideInfo">
					<div class="handle">
						<input type="hidden" name="handle_value" id="handle_value" value="1">
						<button type="button" id="handle" class="btn_fold expand">ì ê¸°</button>
					</div>
					<div class="panel">
						<div class="panel_top">
							<!-- search s -->
							<div class="search">
								<div class="search_wrap">
									<div class="search_box">
										<button class="search_btn" type="button">ê²ì</button>
										<div class="input_box">
											<label class="label_search">ì¥ì, ë²ì¤, ì§íì² , ëë¡ ê²ì</label>
											<input type="text" id="placeSearch" autocomplete="none" autofocus class="input_search">
										</div>
									</div>
								</div>
							</div>
							<!-- search e -->
							<div class="ng-star-inserted entry-layout">
								<!-- content s -->
								<div class="row">
									<div href="#" role="button" class="DDfpb col-2">
										<img class="back" alt="" src="https://cdn-icons-png.flaticon.com/512/54/54321.png"> 
									</div>
									<div class="col">
										<h4 class="col" style="margin-top: 12px;">ìê·¸ëë ì ë¼íì­ì </h4>
									</div>
								</div>
								<div class="place_fixed_maintab">
									<div class="Jxtsc MpTT1" role="tablist" data-nclicks-area-code="tab">
										<div class="ngGKH">
											<div class="flicking-viewport" style="user-select: none; -webkit-user-drag: none; touch-action: pan-y;">
												<div class="flicking-camera" style="transform: translate(0px);">
													<a href="/restaurant/1470422298/home?from=map&amp;fromPanelNum=2&amp;ts=1666591774818" role="tab" class="tpj9w _tab-menu" aria-selected="false" title="" id="" style="width: 200px;">
														<span class="veBoZ">í</span>
													</a>
													<a href="/restaurant/1470422298/menu?from=map&amp;fromPanelNum=2&amp;ts=1666591774818" role="tab" class="tpj9w _tab-menu" aria-selected="true" title="" id="" style="width: 200px;">
														<span class="veBoZ">ë©ë´</span>
													</a>
													<a href="/restaurant/1470422298/review?from=map&amp;fromPanelNum=2&amp;ts=1666591774818" role="tab" class="tpj9w _tab-menu" aria-selected="false" title="" id="" style="width: 200px;">
														<span class="veBoZ">ìì½</span>
													</a>
													<a href="/restaurant/1470422298/review?from=map&amp;fromPanelNum=2&amp;ts=1666591774818" role="tab" class="tpj9w _tab-menu" aria-selected="false" title="" id="" style="width: 200px;">
														<span class="veBoZ">ë¦¬ë·°</span>
													</a>
												</div>
											</div>
										</div>
										<div class="naver_order place">
											<div class="order_info_area">
												<div class="info_main">
													<div class="info_main_title">
														<div class="title">
															<svg viewBox="0 0 18 18" class="ico_n_logo">
																<path fill-rule="evenodd" d="M18 0v18H0V0h18zM7.255 4.582H4.473v9.054h2.915V8.79l3.357 4.846h2.782V4.582h-2.915v4.846L7.255 4.582z"></path>
															</svg>
															ì£¼ë¬¸
														</div>
														<div class="title_logo">
															<div class="logo_thumb">
																<img class="thumb" src="https://naverbooking-phinf.pstatic.net/20210525_218/162190971282744RH1_PNG/image.png?type=f110_110" width="39" height="39" alt="brand logo">
															</div>
														</div>
													</div>
													<div class="info_main_notice">
														<div class="notice_desc">
															<div class="desc_type ico_takeout">
																í¬ì¥ì£¼ë¬¸ì´ ê°ë¥í ê°ê²ìëë¤.
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="naver_order_contents">
											<div class="section_contents local_pay place">
												<div class="order_area">
													<div class="smart_category slick-slider general_place">
														<div class="category_box">
															<div class="category_box_inner">
																<div class="category_scroll">
																	<span class="blur_left"></span>
																	<button class="slick-arrow slick-prev slick-disabled" type="button">
																		<svg viewBox="0 0 10 13" class="ico_arrow">
																			<path d="M3.1 12.2L2 11.1l4.2-4.2L2 2.6l1.1-1.1 5.4 5.4-5.4 5.3z"></path>
																		</svg>
																		<span class="blind">ì´ì </span>
																	</button>
																	<ul class="category_list" style="position: relative;">
																		<div class="category_active" style="height: 29px; transform: translate3d(18px, 0px, 0px); width: 55px;"></div>
																		<li id="category_3234748_PICKUP" class="category_item" data-active="true">
																			<a href="#" class="tab active">
																				<span class="tab_text" data-active="true" style="transition: color 0.3s ease 0s;">ì¶ì²</span>
																			</a>
																		</li>
																		<li id="category_2575392_PICKUP" class="category_item" data-active="false">
																			<a href="#" class="tab">
																				<span class="tab_text" data-active="false" style="transition: color 0.3s ease 0s;">1ì¸ ì¸í¸ë©ë´</span>
																			</a>
																		</li>
																		<li id="category_3234751_PICKUP" class="category_item" data-active="false">
																			<a href="#" class="tab">
																				<span class="tab_text" data-active="false" style="transition: color 0.3s ease 0s;">NEW EGG DROP</span>
																			</a>
																		</li>
																		<li id="category_3234752_PICKUP" class="category_item" data-active="false">
																			<a href="#" class="tab">
																				<span class="tab_text" data-active="false" style="transition: color 0.3s ease 0s;">EGG SANDWICH</span>
																			</a>
																		</li>
																		<li id="category_2575392_PICKUP" class="category_item" data-active="false">
																			<a href="#" class="tab">
																				<span class="tab_text" data-active="false" style="transition: color 0.3s ease 0s;">1ì¸ ì¸í¸ë©ë´</span>
																			</a>
																		</li>
																		<li id="category_3234751_PICKUP" class="category_item" data-active="false">
																			<a href="#" class="tab">
																				<span class="tab_text" data-active="false" style="transition: color 0.3s ease 0s;">NEW EGG DROP</span>
																			</a>
																		</li>
																		<li id="category_3234752_PICKUP" class="category_item" data-active="false">
																			<a href="#" class="tab">
																				<span class="tab_text" data-active="false" style="transition: color 0.3s ease 0s;">EGG SANDWICH</span>
																			</a>
																		</li>
																	</ul>
																	<button class="slick-arrow slick-next" type="button">
																		<svg viewBox="0 0 10 13" class="ico_arrow">
																			<path d="M3.1 12.2L2 11.1l4.2-4.2L2 2.6l1.1-1.1 5.4 5.4-5.4 5.3z"></path>
																		</svg>
																		<span class="blind">ë¤ì</span>
																	</button>
																	<span class="blur_right"></span>
																</div>
															</div>
														</div>
													</div>
													<div class="order_list" style="overflow-y: scroll; height: 453px;">
														<div class="order_list_wrap">
															<div class="order_list_inner">
																<div class="order_list_tit">
																	<span class="title">ìë¡ ëì¨ ë©ë´</span>
																</div>
																<ul class="order_list_area">
																	<li class="order_list_item">
																		<div class="item_info">
																			<a href="#" class="info_link">
																				<div class="info_img">
																					<span class="img_box">
																						<img class="img" src="https://naverbooking-phinf.pstatic.net/20220729_261/16590576950643sgnW_PNG/3_%C0%DA%B8%F9%BF%A1%C0%CC%B5%E5_A_1200X1200.png?type=f220_220_60_sharpen" width="100%" height="100%" alt="ì¬ë¤ì¼">
																					</span>
																				</div>
																				<div class="info_detail">
																					<div class="tit">
																						ìëª½ ìì´ë
																						<span class="ico_group">
																							<i class="ico_new">N</i>
																						</span>
																					</div>
																					<div class="detail">
																						<span class="detail_txt">
																							ìëª½ì ìí¼í¨ì ê°ë ë´ì ììí ìëª½ ìì´ë
																						</span>
																					</div>
																					<div class="price">
																						3,600<!-- -->ì
																					</div>
																				</div>
																			</a>
																			<a href="#" class="btn_shop" role="button">
																				<div class="btn_box">
																					<svg viewBox="0 0 16 16" class="ico_cart" aria-label="ì£¼ë¬¸íê¸°">
																						<path fill-rule="evenodd" d="M6.14 12.519A1.74 1.74 0 116.139 16a1.74 1.74 0 01.001-3.481zm4.8 0A1.74 1.74 0 1110.939 16a1.74 1.74 0 01.001-3.481zm-4.8 1.052a.688.688 0 100 1.376.688.688 0 000-1.376zm4.8 0a.688.688 0 100 1.376.688.688 0 000-1.376zM2.506 2.4c.24 0 .449.173.5.415l.376 1.784h11.306c.342 0 .588.34.49.677l-1.829 6.3a.512.512 0 01-.49.376h-8.56a.515.515 0 01-.501-.414L2.093 3.452H.512A.519.519 0 010 2.926c0-.29.23-.526.512-.526zM14 5.651H3.604L4.711 10.9h7.766l1.524-5.249z"></path>
																					</svg>
																				</div>
																			</a>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
														<div class="order_list_wrap store_delivery">
															<div class="order_list_inner">
																<div class="order_list_tit">
																	<span class="title">1ì¸ ì¸í¸ë©ë´</span>
																	<button type="button" class="btn_fold2">
																		<i class="fa-solid fa-angle-down"></i>
																	</button>
																</div>
																<ul class="order_list_area mb-3">
																	<li class="order_list_item">
																		<div class="item_info">
																			<a href="#" class="info_link">
																				<div class="info_img">
																					<span class="img_box">
																						<img class="img" src="https://naverbooking-phinf.pstatic.net/20220823_108/166121414680370cPU_PNG/1%C0%CE%BC%BC%C6%AE_1_%B9%CC%BD%BA%C5%CD%BF%A1%B1%D7_1200X1200.png?type=f220_220_60_sharpen" width="100%" height="100%" alt="ì¬ë¤ì¼">
																					</span>
																				</div>
																				<div class="info_detail">
																					<div class="tit">
																						ë¯¸ì¤í°ìê·¸ ì¸í¸
																						<span class="ico_group"></span>
																					</div>
																					<div class="detail">
																						<span class="detail_txt">&lt;ë¯¸ì¤í°ìê·¸ + í´ì¬ë¸ë¼ì´ + ìë©ë¦¬ì¹´ë¸&gt; ë¶ëë¬ì´ ì¤í¬ë¨ë¸ ìê·¸ì ë¸ë¦¬ì¤ì¬, ìê·¸ëëì í¹ì  ìì¤ê° ì´ì°ë¬ì§ ìëìì¹ì ê³ ìíê³  ë¶ëë¬ì´ í´ì¬ë¸ë¼ì´, ìë©ë¦¬ì¹´ë¸ë¥¼ í©ë¦¬ì ì¸ ê°ê²©ì¼ë¡ ì¦ê¸¸ ì ìë â»ì¸í¸ë©ë´ìë£ ë³ê²½ ì ìì´ëì íì°ìë£ë HOTì ì ííì¬ë ì°¨ê°ì´ ìë£ë¡ ì ê³µë©ëë¤.</span>
																					</div>
																					<div class="price">7,400ì</div>
																				</div>
																			</a>
																			<a href="#" class="btn_shop" role="button">
																				<div class="btn_box">
																					<svg viewBox="0 0 16 16" class="ico_cart" aria-label="ì£¼ë¬¸íê¸°">
																						<path fill-rule="evenodd" d="M6.14 12.519A1.74 1.74 0 116.139 16a1.74 1.74 0 01.001-3.481zm4.8 0A1.74 1.74 0 1110.939 16a1.74 1.74 0 01.001-3.481zm-4.8 1.052a.688.688 0 100 1.376.688.688 0 000-1.376zm4.8 0a.688.688 0 100 1.376.688.688 0 000-1.376zM2.506 2.4c.24 0 .449.173.5.415l.376 1.784h11.306c.342 0 .588.34.49.677l-1.829 6.3a.512.512 0 01-.49.376h-8.56a.515.515 0 01-.501-.414L2.093 3.452H.512A.519.519 0 010 2.926c0-.29.23-.526.512-.526zM14 5.651H3.604L4.711 10.9h7.766l1.524-5.249z"></path>
																					</svg>
																				</div>
																			</a>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
														<div class="order_list_wrap store_delivery">
															<div class="order_list_inner">
																<div class="order_list_tit">
																	<span class="title">1ì¸ ì¸í¸ë©ë´</span>
																	<button type="button" class="btn_fold2">
																		<i class="fa-solid fa-angle-down"></i>
																	</button>
																</div>
																<ul class="order_list_area mb-3">
																	<li class="order_list_item">
																		<div class="item_info">
																			<a href="#" class="info_link">
																				<div class="info_img">
																					<span class="img_box">
																						<img class="img" src="https://naverbooking-phinf.pstatic.net/20220823_108/166121414680370cPU_PNG/1%C0%CE%BC%BC%C6%AE_1_%B9%CC%BD%BA%C5%CD%BF%A1%B1%D7_1200X1200.png?type=f220_220_60_sharpen" width="100%" height="100%" alt="ì¬ë¤ì¼">
																					</span>
																				</div>
																				<div class="info_detail">
																					<div class="tit">
																						ë¯¸ì¤í°ìê·¸ ì¸í¸
																						<span class="ico_group"></span>
																					</div>
																					<div class="detail">
																						<span class="detail_txt">&lt;ë¯¸ì¤í°ìê·¸ + í´ì¬ë¸ë¼ì´ + ìë©ë¦¬ì¹´ë¸&gt; ë¶ëë¬ì´ ì¤í¬ë¨ë¸ ìê·¸ì ë¸ë¦¬ì¤ì¬, ìê·¸ëëì í¹ì  ìì¤ê° ì´ì°ë¬ì§ ìëìì¹ì ê³ ìíê³  ë¶ëë¬ì´ í´ì¬ë¸ë¼ì´, ìë©ë¦¬ì¹´ë¸ë¥¼ í©ë¦¬ì ì¸ ê°ê²©ì¼ë¡ ì¦ê¸¸ ì ìë â»ì¸í¸ë©ë´ìë£ ë³ê²½ ì ìì´ëì íì°ìë£ë HOTì ì ííì¬ë ì°¨ê°ì´ ìë£ë¡ ì ê³µë©ëë¤.</span>
																					</div>
																					<div class="price">7,400ì</div>
																				</div>
																			</a>
																			<a href="#" class="btn_shop" role="button">
																				<div class="btn_box">
																					<svg viewBox="0 0 16 16" class="ico_cart" aria-label="ì£¼ë¬¸íê¸°">
																						<path fill-rule="evenodd" d="M6.14 12.519A1.74 1.74 0 116.139 16a1.74 1.74 0 01.001-3.481zm4.8 0A1.74 1.74 0 1110.939 16a1.74 1.74 0 01.001-3.481zm-4.8 1.052a.688.688 0 100 1.376.688.688 0 000-1.376zm4.8 0a.688.688 0 100 1.376.688.688 0 000-1.376zM2.506 2.4c.24 0 .449.173.5.415l.376 1.784h11.306c.342 0 .588.34.49.677l-1.829 6.3a.512.512 0 01-.49.376h-8.56a.515.515 0 01-.501-.414L2.093 3.452H.512A.519.519 0 010 2.926c0-.29.23-.526.512-.526zM14 5.651H3.604L4.711 10.9h7.766l1.524-5.249z"></path>
																					</svg>
																				</div>
																			</a>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
														<div class="order_list_wrap store_delivery">
															<div class="order_list_inner">
																<div class="order_list_tit">
																	<span class="title">1ì¸ ì¸í¸ë©ë´</span>
																	<button type="button" class="btn_fold2">
																		<i class="fa-solid fa-angle-down"></i>
																	</button>
																</div>
																<ul class="order_list_area mb-3">
																	<li class="order_list_item">
																		<div class="item_info">
																			<a href="#" class="info_link">
																				<div class="info_img">
																					<span class="img_box">
																						<img class="img" src="https://naverbooking-phinf.pstatic.net/20220823_108/166121414680370cPU_PNG/1%C0%CE%BC%BC%C6%AE_1_%B9%CC%BD%BA%C5%CD%BF%A1%B1%D7_1200X1200.png?type=f220_220_60_sharpen" width="100%" height="100%" alt="ì¬ë¤ì¼">
																					</span>
																				</div>
																				<div class="info_detail">
																					<div class="tit">
																						ë¯¸ì¤í°ìê·¸ ì¸í¸
																						<span class="ico_group"></span>
																					</div>
																					<div class="detail">
																						<span class="detail_txt">&lt;ë¯¸ì¤í°ìê·¸ + í´ì¬ë¸ë¼ì´ + ìë©ë¦¬ì¹´ë¸&gt; ë¶ëë¬ì´ ì¤í¬ë¨ë¸ ìê·¸ì ë¸ë¦¬ì¤ì¬, ìê·¸ëëì í¹ì  ìì¤ê° ì´ì°ë¬ì§ ìëìì¹ì ê³ ìíê³  ë¶ëë¬ì´ í´ì¬ë¸ë¼ì´, ìë©ë¦¬ì¹´ë¸ë¥¼ í©ë¦¬ì ì¸ ê°ê²©ì¼ë¡ ì¦ê¸¸ ì ìë â»ì¸í¸ë©ë´ìë£ ë³ê²½ ì ìì´ëì íì°ìë£ë HOTì ì ííì¬ë ì°¨ê°ì´ ìë£ë¡ ì ê³µë©ëë¤.</span>
																					</div>
																					<div class="price">7,400ì</div>
																				</div>
																			</a>
																			<a href="#" class="btn_shop" role="button">
																				<div class="btn_box">
																					<svg viewBox="0 0 16 16" class="ico_cart" aria-label="ì£¼ë¬¸íê¸°">
																						<path fill-rule="evenodd" d="M6.14 12.519A1.74 1.74 0 116.139 16a1.74 1.74 0 01.001-3.481zm4.8 0A1.74 1.74 0 1110.939 16a1.74 1.74 0 01.001-3.481zm-4.8 1.052a.688.688 0 100 1.376.688.688 0 000-1.376zm4.8 0a.688.688 0 100 1.376.688.688 0 000-1.376zM2.506 2.4c.24 0 .449.173.5.415l.376 1.784h11.306c.342 0 .588.34.49.677l-1.829 6.3a.512.512 0 01-.49.376h-8.56a.515.515 0 01-.501-.414L2.093 3.452H.512A.519.519 0 010 2.926c0-.29.23-.526.512-.526zM14 5.651H3.604L4.711 10.9h7.766l1.524-5.249z"></path>
																					</svg>
																				</div>
																			</a>
																		</div>
																	</li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="fixed-bottom bg-white" style="position: relative; box-shadow: 0px -3px 5px lightgrey; z-index: 6000;">
									<div style="height: 170px;">
										<div class="pt-3">
											<span class="ps-5">ìëª½ìì´ë</span>
											<button type="button" class=" btn btnOrder position-relative">
												ì£¼ë¬¸íê¸°
												<i class="fa-solid fa-cart-plus"></i>
												<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">1</span>
											</button>
										</div>
										<span class="ps-5" style="font-weight: bold; color: red;">3,600ì</span>
									</div>
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
	<!-- <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=YOUR_CLIENT_ID"></script> -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ec2655da82c3779d622f0aff959060e6&libraries=services"></script>
	<script>
	
		// ë§ì»¤ë¥¼ í´ë¦­íë©´ ì¥ìëªì íì¶í  ì¸í¬ìëì° ìëë¤
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		var container = document.getElementById('map'); //ì§ëë¥¼ ë´ì ìì­ì DOM ë í¼ë°ì¤
		var options = { //ì§ëë¥¼ ìì±í  ë íìí ê¸°ë³¸ ìµì
			center: new kakao.maps.LatLng(37.5021008334827, 127.024465815419), //ì§ëì ì¤ì¬ì¢í.
			level: 3 //ì§ëì ë ë²¨(íë, ì¶ì ì ë)
		};
	
		var map = new kakao.maps.Map(container, options); //ì§ë ìì± ë° ê°ì²´ ë¦¬í´
	
		var mapTypeControl = new kakao.maps.MapTypeControl();
	
		// ì§ëì ì»¨í¸ë¡¤ì ì¶ê°í´ì¼ ì§ëìì íìë©ëë¤
		// kakao.maps.ControlPositionì ì»¨í¸ë¡¤ì´ íìë  ìì¹ë¥¼ ì ìíëë° TOPRIGHTë ì¤ë¥¸ìª½ ìë¥¼ ìë¯¸í©ëë¤
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
		// ì§ë íë ì¶ìë¥¼ ì ì´í  ì ìë  ì¤ ì»¨í¸ë¡¤ì ìì±í©ëë¤
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
		// ì§ëì êµíµì ë³´ë¥¼ íìíëë¡ ì§ëíìì ì¶ê°í©ëë¤
		map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);    
		
		// ì§ëë¥¼ ìì±í©ëë¤    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
	</script>
</body>

</html>