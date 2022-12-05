<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">

<head>
    <title>맛Zip Mypage</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/mypage/mypage.css">
</head>

<body>
	<!-- 상단 -->
	<form id="myform" name="myform" method="post">
		<nav class="navbar navbar-expand-lg bg-dark">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="/tasteMain"><img class="img-fluid mb-3" src="/resources/images/main/logo2.png" alt="..." style="max-width: 4rem;"></a>
		  </div>
		</nav>
	
		<div class="page-title-overlap bg-dark pt-4">
			<div class="container d-lg-flex justify-content-between py-2 py-lg-3">
				<div class="order-lg-1 pe-lg-4 text-center text-lg-start">
					<h1 class="h3 text-white mb-0 mb-4 titlefont">My page</h1>
				</div>
			</div>
		</div>
		
		<div class="container pt-4 pb-5 mb-2 mb-md-4 font">
        <div class="row">
          	<!-- sidebar s -->
    		<%@include file="../../xdmin/includeV1/mypageSidebar.jsp"%>
			<!-- sidebar e -->
			
          <!-- Content  -->
          <section class="col-lg-8">
            <!-- list-->
            <form id="myForm" name="myForm">
            	<input type="hidden" name="ifmmSeq" value="${sessSeq}">
            	<input type="hidden" name="ifstSeq" id="ifstSeq"/>
           		<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
           		<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
           		<div class="container">
           			<div class="row mt-5 menuTitle"><h3><b>Mypage Favorite</b></h3></div>
           		</div>
           		<div class="container">
           			<!-- favorite List -->
          			
          			<div class="mt-4"><h4><b>My Favorite Restaurants</b></h4></div>
	           			<c:choose>
							<c:when test="${fn:length(favorite) eq 0}">
								<div class="col text-center mt-4 mb-2"><h5><b>좋아요한 스토어가 존재하지 않습니다.</b></h5></div>
							</c:when>
							<c:otherwise>
								<c:forEach items="${favorite}" var="favorite" varStatus="status">
									<div id="fvItem${favorite.ifstSeq}">
									<input type="hidden" name="ifstSeq" value="${favorite.ifstSeq}"/>
										<div class="card_wrap" style="width: 95%; padding-left: 30px;">
						           			<div class="row pt-3">
							           			<div class="card shadow bg-body rounded border border-0">
												    <div class="card-body cardcc">
												    	<div class="row">
															<div class="col-3">
																<img class="rounded-4" src="${favorite.path}${favorite.uuidName}" style="width: 150px; height: 120px;">
															</div>
															<div class="col-7">
																<h5 class="card-title"><b>${favorite.ifstName}</b></h5>
																<p class="card-text">${favorite.ifstAddress}</p>
																<div class="row justify-content-between">
																	<div class="col text-start"><p class="card-text">${favorite.ifstPhone}</p></div>
																</div> 
															</div>
															<div class="col-2 text-end">
																<button class="learn-more2 mt-4" type="button" onclick="openModal(${favorite.ifstSeq})"><i class="fa-solid fa-trash-can"></i> 삭제</button>
															</div>
														</div>
												   	</div>
											    </div>
											</div>
										</div>
									</div>
								</c:forEach>	
								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 1000;">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="fa-solid fa-file-zipper"></i> MATZIP</h1>
								      </div>
								      <div class="modal-body text-start">
								        정말로 삭제하시겠습니까?
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-light"  onclick="closeModal()">닫기</button>
								        <button type="button" class="btn btn-dark" onclick="favoriteDele()">삭제하기</button>
								      </div>
								    </div>
								  </div>
								</div>
							</c:otherwise>
						</c:choose>
          				<div class="row justify-content-center mt-5 mb-3">
				       		<%@include file="../../xdmin/includeV1/pagination.jsp"%>
						</div>
						
           		</div>
			</form>
          </section>
        </div>
      </div>


<!-- 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    
<!-- Like 버튼 구현 -->
	
		var goUrlList = "/mypage/mypageFavorite"
		
		var form = $("#myForm");
		
		goList = function(thisPage){
			$("input:hidden[name=thisPage]").val(thisPage);
			form.attr("action", goUrlList).submit();
		}
		
		function favoriteDele(){
	
			$.ajax({
					async: true 
					,cache: false
					,type: "post"
					/* ,dataType:"json" */
					,url:"/store/favoriteDele"
					/* ,data : $("#formLogin").serialize() */
					,data : { "ifstSeq" : $("#ifstSeq").val(), "ifmmSeq" : $("input[name=ifmmSeq]").val()}
					,success: function(response) {
						$("#exampleModal").removeClass("show");
						$("#fvItem"+ $("#ifstSeq").val()).remove();
					}
					,error : function(jqXHR, textStatus, errorThrown){
						alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
					}
				});
		}
		
		function openModal(seq){
			$("#ifstSeq").val(seq);
			$("div").removeClass("modal-backdrop");
			$("#exampleModal").addClass("show");
			$("#exampleModal").css("display","block");
			
		}
		
		function closeModal(){
			$("#exampleModal").css("display","none");
		}
    </script>
</body>
</html>
