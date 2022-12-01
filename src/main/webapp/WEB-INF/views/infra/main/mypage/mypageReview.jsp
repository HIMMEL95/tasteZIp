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
          <!-- Sidebar-->
          <aside class="col-lg-4 pt-4 pt-lg-0 pe-xl-5 mt-3">
            <div class="bg-white rounded-3 shadow-lg pt-1 mb-5 mb-lg-0">
              <div class="d-md-flex justify-content-between align-items-center text-center text-md-start p-4">
                <div class="d-md-flex align-items-center">
                  <div class="mx-auto mb-2 mx-md-0 mb-md-0" style="width: 7rem;">
                  	<img class="rounded-circle" src="https://intermusicakorea.com/common/img/default_profile.png" alt="Susan Gardner">
                  </div>
                  <div class="ps-md-3">
                    <h3 class="fs-base mb-0"><c:out value="${sessId}"/></h3><span class="text-accent fs-sm font"><c:out value="${sessEmail}"/></span>
                  </div>
                </div><a class="btn btn-dark d-lg-none mb-2 mt-3 mt-md-0" href="#account-menu" data-bs-toggle="collapse" aria-expanded="false"><i class="ci-menu me-2"></i>Account menu</a>
              </div>
              <div class="d-lg-block collapse" id="account-menu">
                <ul class="list-unstyled mb-0">
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/member/mypageMemberForm"><b>My Information</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/order/mypageOrder"><b>My Order</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/reservation/mypageReservation"><b>My Reservation</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="comment/mypageReview"><b>My Review</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/mypage/mypageBucket"><b>My Bucket</b></a></li>
                  <li class="mt-5 pb-3"><button type="button" class="btn btn-dark text-center" id="signOutBtn"><b>Log out</b></buttton></li>
                </ul>
              </div>
            </div>
          </aside>
          <!-- Content  -->
          <section class="col-lg-8">
            <!-- list-->
           		<input type="hidden" name="ifmmSeq" value="${sessSeq }">
           		<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
           		<div class="container">
           			<div class="row mt-5 menuTitle"><h3><b>Mypage Review</b></h3></div>
           		</div>
           		<div class="container">
           			<!-- <div class="row justify-content-between mt-5">
           				<div class="col-1 text-start"><a href="#"><i class="fa-solid fa-bars"></i>&nbsp;전체</a></div>
           				<div class="col-9 text-start"><a href="#"><i class="fa-regular fa-images"></i>&nbsp;사진</a></div>
           				<div class="col-2 text-end">
           					<select class="form-select" aria-label="Default select example">
							  <option selected>최신순</option>
							  <option value="최신순">최신순</option>
							  <option value="오래된순">오래된순</option>
							</select>
           				</div>
           			</div> -->
           			
           			<!-- review List -->
          			
          			<div class="mt-4"><h3><b>내가 작성한 후기</b></h3></div>
						<c:choose>
							<c:when test="${fn:length(list) eq 0}">
	          					<h5 class="text-center">작성한 리뷰가 없습니다.</h5>
	          				</c:when>
				           <c:otherwise>
								<c:forEach items="${list}" var="list" varStatus="status">
									<div class="row mt-3">
				           				<div class="card shadow bg-body rounded cardBorder">
										  <div class="card-body">
										    <div class="row justify-content-between">
										    	<h4><b>${list.ifstName}</b></h4>
										    	<div class="col-3 text-start"><span>${list.ifstAddress}</span></div>
										    	<div class="col-9 text-start" id="starValue">
											    	<c:forEach begin="1" end="${list.ifcmGrade}" varStatus="status">
														<i class="fa-solid fa-star"></i>  
													</c:forEach>
											    	&nbsp;<span><b><c:out value="${list.ifcmGrade}"/>점</b></span>
										    	</div>
										    </div>
										    <p class="card-text mt-2"><b>작성 내용:</b> ${list.ifcmComment}</p>
										    <div class="row justify-content-between">
											    <div class="col text-start">
											    	<p><b>(작성 날짜:</b> ${list.ifcmCreatedAt})</p>
											    </div>
											    <div class="col text-end">
											    	<button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#exampleModal" data-id="${list.ifcmSeq }" onclick="test(${list.ifcmSeq })">
											    		<i class="fa-solid fa-trash-can"></i> 
											    		 삭제하기
											    	</button>
											    </div>
											    <!-- Modal -->
												<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
												  <div class="modal-dialog">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h1 class="modal-title fs-5" id="exampleModalLabel"><i class="fa-solid fa-file-zipper"></i> MATZIP</h1>
												        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
												      </div>
												      <div class="modal-body text-start">
												      <input type="hidden" name="ifcmSeq" value=""/>
												        정말로 삭제하시겠습니까?
												      </div>
												      <div class="modal-footer">
												        <button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
												        <button type="button" class="btn btn-dark" onclick="commentUeleteMypage()">삭제하기</button>
												      </div>
												    </div>
												  </div>
												</div>
											</div>
										  </div>
										</div>
				           			</div>
			           			</c:forEach>
		           			</c:otherwise>
	           			</c:choose>
          				<div class="row justify-content-center mt-5 mb-3">
				       		<%@include file="../../xdmin/includeV1/pagination.jsp"%>
						</div>
          			
          			
           		</div>
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
    
    	var goUrlList = "/comment/mypageReview";
    	var goUrlUele="/comment/commentUele";
    	var form = $("#myform");
    	
    	
    	var seq = $("input:hidden[name=ifcmSeq]");
		var ifmmSeq = $("input[name=ifmmSeq]").val();
    	
    	
    	goList = function(thisPage) {
			$("input:hidden[name=thisPage2]").val(thisPage);
			form.attr("action", goUrlList).submit();
		};
		
		/* goUele = function(keyValue) {
			seq.val(keyValue);
			
			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				,url: "/comment/commentUeleMypage"
   				,data : {"seq" : $("input[name=ifcmSeq]").val(), "ifmmSeq" : $("input[name=ifmmSeq]").val()}
   				,success: function(response) {
   					if (response.rt == "success") {
   						location.href = "/comment/mypageReview?ifmmSeq="+ $("input[name=ifmmSeq]").val();
   					} else {
   						alert(" ");
   					}
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
		} */
		
		function commentUeleteMypage() {
			
			$.ajax({
   				async: true 
   				,cache: false
   				,type: "post"
   				/* ,dataType:"json" */
   				,url: "/comment/commentUeleMypage"
   				/* ,data : $("#formLogin").serialize() */
   				,data : {"ifcmSeq" : $("input[name=ifcmSeq]").val(), "ifmmSeq" : $("input[name=ifmmSeq]").val()}
   				,success: function(response) {
   					if (response.rt == "success") {
   						location.href = "/comment/mypageReview?ifmmSeq="+ $("input[name=ifmmSeq]").val();
   					} else {
   						alert("댓글을 입력하시오!!");
   					}
   				}
   				,error : function(jqXHR, textStatus, errorThrown){
   					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
   				}
   			});
		}

		test = function(seq) {
			$("input[name=ifcmSeq]").val(seq);
		}
		
    </script>
</body>
</html>
