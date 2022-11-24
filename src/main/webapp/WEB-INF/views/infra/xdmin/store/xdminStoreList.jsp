<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

	<!DOCTYPE html>
	<html lang="ko" >
	<head>
		<title>xdmin Store List</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
		<!-- datepicker s -->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<!-- datepicker e -->
		<link rel="stylesheet" href="/resources/css/xdmin/store/xdminStoreList.css">
	</head>
<body>
<div class="hero">
 	<!-- snow -->
	<%@include file="/resources/js/snow/snow.jsp"%>
	<div class="hero__content">
		<!-- <h1>SVG Snow</h1> -->
		<!-- partial:index.partial.html -->
		<link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet">
		<div class="task-manager">
		<!-- sidebar -->
		 <%@include file="/resources/js/sideBar/sideBar.jsp"%>
		  <!-- content s -->
		  <div class="page-content">
		  	<form id="formList" name="formList" method="post">
				<input type="hidden" name="thisPage" value="1">
               	<input type="hidden" name="rowNumToShow" value="${vo.rowNumToShow }">
               	<input type="hidden" name="ifstSeq" value="${vo.ifstSeq}">
				<div class="wrapper">
					<div class="container">
						<div class="row">
							<div class="col">
								<div class="content">
									<h2 class="row needs-validation ms-3">Store List</h2>
									<div class="row needs-validation ms-3 me-3 mt-3 mb-5 p-3 bg-dark rounded" id="selecBox" novalidate>
										<div class="row mb-2">
											<div class="col-md-3">
												<select class="form-select" id="shDelNy" name="shDelNy">
			                                       	<option value="" >선택</option>
			                                        <option value="0" selected>N</option>
			                                        <option value="1" >Y</option>
			                                    </select>
											</div>
											<div class="col-md-3">
												<select class="form-select" id="shOptionDate" name="shOptionDate">
													<option value="" selected>선택</option>
													<option value="1" >등록일</option>
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
			                                        <option value="" selected>선택</option>
			                                        <option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>가게 이름</option>
			                                        <option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>전화번호</option>
			                                        <option value="3" <c:if test="${vo.shOption eq 3 }">selected</c:if>>주소</option>
			                                    </select>
											</div>
											<div class="col-md-3">
												<input type="text" class="form-control" name="shValue" id="shValue" value="${vo.shValue }" autocomplete="off">
											</div>
											<div class="col-md-2">
												<button class="btn btn-light" type="submit" id="searching"><i class="fa-solid fa-magnifying-glass"></i></button>
												<button class="btn btn-secondary" type="reset" id="btnReset" name="btnReset"><i class="fa-solid fa-rotate-right"></i></button>
											</div>
										</div>
									</div>
									<!-- storeLita 시작 -->
									<div id="storeLita"></div>
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
			                            </div>
			                        </div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		  </div>
		   <!-- content e -->
		</div>
		<!-- partial -->
	</div>
</div>

<!-- <footer class="bg-dark">
	        <div class="footer">
	            <div class="footer_inner">
	                [주]고객센터,제휴문의,서비스안내
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
	    </footer> -->
	
		<!-- end --> 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			
			var goUrlList = "/store/xdminStoreList";
			var goUrlForm = "/store/xdminStoreForm";
			var excelUri = "/store/excelDownload";
			var goUrlUel = "/store/storeUele";
	        var goUrlDel = "/store/storeDele";		
			
			var ifstSeq = $("input[name=ifstSeq]");
			
			var form = $("form[name=formList]");
			
			/* $(function() {
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
		  	}) */
			
			$("#btnReset").on("click", function() {
				$(location).attr("href", goUrlList);
			})
		 
			// 페이지 네이션 만들기
			goList = function(thisPage) {
				$("input[name=thisPage]").val(thisPage);
				form.attr("action", goUrlList).submit();
			}
	 		
	 		/* var seq = $("input:hidden[name=ccgSeq]"); */
			
	 		$("#excelBtn").on("click", function() {
				form.attr("action", goUrlExcel).submit();
			})
			
			$("#btnUel").on("click", function() {
				DelValidation("#delBtn", goUrlUele, "선택하신 게시물을 삭제하시겠습니까?");
				alert("uel")
			})
			
			$("#btnDel").on("click", function() {
				DelValidation("#delBtn", goUrlDele, "선택하신 게시물을 진짜로 삭제하시겠습니까?");		
				alert("del")
			})
			
			 $("#btnForm").on("click", function(){
				 $(location).attr("href", goUrlForm);
			 });

	 		
			DelValidation = function(confirm, url, msg) {
				$(".modal-body").html(msg);
				$(confirm).on("click", function() {
					form.attr("action", url).submit();
				})
			}
	 		
 		</script>
	 		
	 	<script type="text/javascript">
	 		
			var goUrlLita = "/store/xdminStoreLita";	
			
	 	// ----- Lita ajax -----
	 		$(document).ready(function(){
	 			setStoreLita();
	 		}); 
	 		
	 		function setStoreLita() {
	 			$.ajax({
	 				async: true 
	 				,cache: false
	 				,type: "post"
	 				/* ,dataType:"json" */
	 				,url: goUrlLita
	 				,data : $("#formList").serialize()
	 				/* ,data : {  } */
	 				,success: function(response) {
	 					$("#storeLita").empty();
	 					$("#storeLita").append(response);
	 					/* window.location.hash = '#page' + page;
	 					page++; */

	 				}
	 				,error : function(jqXHR, textStatus, errorThrown){
	 					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
	 				}
	 			});
	 		}
	 		
	 		$("#btnSearch").on("click", function(){
	 			if (validationList() == false) return false;
	 			setStoreLita();
	 		});
	 		

	 		validationList = function() {
	 			/* if(!checkNull($.trim($("input[name=searchValue]").val()), "searchValue")) return false; */
	 		}
		</script>
</body>
</html>
