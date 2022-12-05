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
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/mypage/mypage.css">
</head>

<body>
	<!-- 상단 -->
	<form id="myform" name="myform" method="post">
		<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
      	<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
      	<input type="hidden" name="iforSeq" value="${vo.iforSeq}">
      	<input type="hidden" name="ifmmSeq" value="${sessSeq}">
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
       			<input type="hidden" name="ifmmSeq" value="${sessSeq }">
           		<div class="cotainer">
           			<div class="row mt-5 menuTitle"><h3><b>Mypage Order</b></h3></div>
           			<div class="row pt-5 mb-3 font"><h4><b>Order List</b></h4></div>
           			<c:choose>
           				<c:when test="${fn:length(list) eq 0}">
          					<h4 class="text-center">주문 내역이 존재하지 않습니다.</t4>
          				</c:when>
          				<c:otherwise>
          					<c:forEach items="${list}" var="list" varStatus="status">
			           			<div class="row pt-3">
				           			<div class="card">
								      <div class="card-body cardcc">
								        <h5 class="card-title"><b>${list.ifstName}</b></h5>
								        <p class="card-text">주문날짜: ${list.iforCreatedAt}</p>
								      	<button type="button" onclick="goForm(${list.iforSeq})" class="btn btn-dark">주문 내역 보기</button>
								      </div>
								    </div>
								</div>
          					</c:forEach>
          				</c:otherwise>
           			</c:choose>
           		</div>
           		<%@include file="../../xdmin/includeV1/pagination.jsp"%>
          </section>
        </div>
     </div>
   </form>
	


<!-- 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    
		var goUrlList = "/order/mypageOrder";
		var goUrlForm = "/order/mypageOrderView";
		var seq = $("input[name=iforSeq]");

		var form = $("#myform");
		
		goForm = function (keyValue) {
			seq.val(keyValue);
			form.attr("action", goUrlForm).submit();
		}
		
		goList = function (thisPage) {
			$("input:hidden[name=thisPage]").val(thisPage);
			form.attr("action", goUrlList).submit();
		}
		
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
    </script>
</body>
</html>