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
    <link rel="stylesheet" href="/resources/css/mypage/mypageMemberForm.css">
</head>

<body>
	<!-- 상단 -->
		<nav class="navbar navbar-expand-lg bg-dark">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="/tasteMain"><img class="img-fluid mb-3" src="/resources/images/main/logo2.png" alt="..." style="max-width: 4rem;"></a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
		      <!-- <div class="navbar-nav">
		        <a class="nav-link" aria-current="page" href="#">Main</a>
		        <a class="nav-link" href="#">My Order</a>
		        <a class="nav-link" href="#">My Review</a>
		        <a class="nav-link" href="#">My Story</a>
		      </div> -->
		    </div>
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
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/comment/mypageReview"><b>My Review</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/mypage/mypageBucket"><b>My Bucket</b></a></li>
                  <li class="mt-5 pb-3"><button type="button" class="btn btn-dark text-center" id="signOutBtn"><b>Log out</b></buttton></li>
                </ul>
              </div>
            </div>
          </aside>
          <!-- Content  -->
          <section class="col-lg-8">
            <!-- list-->
           		<form  id="form" name="form" method="post">
				<input type="hidden" name="ifmmSeq" value="${sessSeq}"> 
           		<div class="cotainer">
           			<div class="row mt-5 mb-5 menuTitle"><h3><b>내 정보 수정</b></h3></div>
           			<div class="container text-center mb-5" style="margin-top: 2rem;">
					<label class="form-label">프로필 사진</label>
						<div class="row justify-content-center">
							<div class="col-3 text-center">
				    			<img id="preview-image" src="
								<c:choose>
									<c:when test = "${itemImg ne null}">${itemImg.path}${itemImg.uuidName}</c:when>
									<c:otherwise>https://intermusicakorea.com/common/img/default_profile.png</c:otherwise>
								</c:choose>
								" class="profile">
							</div>
						</div>
					</div>
				
				
				<!-- 항목 -->
				
				
				<div class="container font">
					<div class="row gy-3" id="firstrow">
						<div class="col-6">
							<label class="form-label">아이디</label>
				   			<input type="text" class="form-control" value="<c:out value="${item.ifmmId}"/>" placeholder="아이디" name="ifmmId" readonly>
						</div>
						<div class="col-6">
							<label class="form-label">이름</label>
				   			<input type="text" class="form-control"	value="<c:out value="${item.ifmmName}"/>" placeholder="이름" name="ifmmName" readonly>
						</div>
						<div class="col-6">
							<label class="form-label">생년월일</label>
				   			<input type="text" class="form-control" value="<c:out value="${item.ifmmDob}"/>" placeholder ="1990-01-01" name="ifmmDob">
						</div>
						<div class="col-6">
							<label class="form-label">성별</label>
							<select id="ifmmGender" name="ifmmGender" class="form-control" aria-label=".form-select-lg example">
                                <option value="" <c:if test="${empty item.ifmmGender}">selected</c:if>>선택</option>
                                <option value="4" <c:if test="${item.ifmmGender eq 4 }">selected</c:if>>남성</option>
                                <option value="5" <c:if test="${item.ifmmGender eq 5 }">selected</c:if>>여성</option>
                            </select>
						</div>
						<div class="col-6">
							<label class="form-label">연락처</label>
							<div class="input-group">
							  <select class="form-select col-2" aria-label="Default select example" name="ifmmRadioOperator" id="ifmmRadioOperator">
								  <option value="" <c:if test="${empty item.ifmmRadioOperator}">selected</c:if>>통신사 선택</option>
	                              <option value="1" <c:if test="${item.ifmmRadioOperator eq 1 }">selected</c:if>>SKT</option>
	                              <option value="2" <c:if test="${item.ifmmRadioOperator eq 2 }">selected</c:if>>LGT</option>
	                              <option value="3" <c:if test="${item.ifmmRadioOperator eq 3 }">selected</c:if>>KT</option>
							  </select>
							  <input type="mobile" class="form-control" style="width: 50%" placeholder="01000000000" name="ifmmPhone" value="<c:out value="${item.ifmmPhone}"/>" id="phone">
							</div>
						</div>
						<div class="col-6">
							<label for="email" class="form-label">이메일</label>
							<div class="input-group">
						   		<input type="text" class="form-control" placeholder="example@naver.com" value="<c:out value="${item.ifmmEmail}"/>" name="ifmmEmail">
					   		</div>
						</div>
						<div class="col-6">
							<div class="row"><label class="form-label">주소</label></div>
							<div class="row input-group gy-3">
								<div class="col-7">	
					   				<input type="text" class="form-control" id="ifmmZipCode" name="ifmmZipCode" value="<c:out value="${item.ifmmZipCode}"/>">
					   			</div>
					   			<div class="col-5">
					   				<button type="button" class="btn btn-outline-dark" id="searchBtn">주소검색</button>
					   				<button class="btn btn-outline-dark" type="button" id="clear" style="height: 2.4rem;"><i class="fa-solid fa-rotate-left"></i></button>
				   				</div>
				   				<div class="col-12 gy-3"><input type="text" class="form-control" id="ifmmAddress" name="ifmmAddress" value="<c:out value="${item.ifmmAddress}"/>" placeholder="주소" readonly></div>
				   				<div class="col-12 gy-3"><input type="text" class="form-control" id="ifmmDetailAddress" name="ifmmDetailAddress" value="<c:out value="${item.ifmmDetailAddress}"/>" aria-label="addressDetail" placeholder="상세주소"></div>
				   				<div class="col-12 gy-3"><input type="text" class="form-control" id="ifmmExtraAddress" name="ifmmExtraAddress" value="<c:out value="${item.ifmmExtraAddress}"/>" placeholder="참고사항"></div>
				   			</div>
						</div>
						<div class="col-6">
							<div class="row">
			                	<div class="col">
			                		<div id="wrap" style="display:none;border:1px solid;width:404px;height:300px;margin:5px 0;position:relative">
										<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1;width: 20px;" onclick="foldDaumPostcode()" alt="접기 버튼">
									</div>
			                	</div>
			                </div>
						</div>
						<div class="col-6">
							<label for="ifmmEmailCheck" class="form-label">이메일 정보 마케팅 사용 동의</label>
				            <div class="form-check">
				            	<input type="hidden" id="ifmmEmailCheck" name="ifmmEmailCheck" value="${item.ifmmEmailCheck }">
				                <input type="checkbox" id="emailCheck" name="emailCheck" class="form-check-input" <c:if test="${item.ifmmEmailCheck eq 1 }">checked</c:if>>
				                <label for="emailCheck" class="form-check-label text-muted">
				                    동의합니다
				                </label>
				            </div>
						</div>
				</div>
				<div class="container" id="aaa">
					<div class="row justify-content-center">
						<button type="button" class="btn" id="Modification">수정하기</button>&emsp;<button type="button" class="btn btn-dark" id="Cancel">최소하기</button>
					</div>
				</div>
				<br>
				<br>
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
	
		var goUrlList = "/mypage/mypageMain";
		var goUrlUpdt = "/member/mypageUpdt";
		
		var seq = $("input:hidden[name=ifmmSeq]");			
		
		var form = $("form[name=form]");
		
		$("#Modification").on("click", function(){
			form.attr("action", goUrlUpdt).submit();
		});
		
		/* goForm = function (keyValue) {
			seq.val(keyValue);
			form.attr("action", goUrlUpdt).submit();
		} */
		
		$("#Cancel").on("click", function(){
			form.attr("action", goUrlList).submit();
		});
		
		$("#emailCheck").on("change", function() {
			if ($('#ifmmEmailCheck').val() == "1") {
				$('#ifmmEmailCheck').val("0");
			} else {
				$('#ifmmEmailCheck').val("1");
			}
	    	alert($("#ifmmEmailCheck").val())
		})
		
	</script>
	<script>
		$("#clear").on("click", function() {
			$("#ifmmZipCode").val('');
			$("#ifmmAddress").val('');
			$("#ifmmDetailAddress").val('');
			$("#ifmmExtraAddress").val('');
		});
	</script>
	<script>
	// 우편번호 s
	var element_wrap = document.getElementById('wrap');
    
    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }
    
    function daumPostCode() {
    	var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("ifmmExtraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("ifmmExtraAddress").value = '';
                }

            	// 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('ifmmZipCode').value = data.zonecode;
                document.getElementById("ifmmAddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("ifmmDetailAddress").focus();
                
    			/* var geocoder = new daum.maps.services.Geocoder();
    			
    			geocoder.addressSearch(addr, function(result, status) {
    				if(status === daum.maps.services.Status.OK) {
    					$("#lat").val(result[0].y);
    					$("#long").val(result[0].x);
    				}
    			}); */

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    	
    };
    
    $("#searchBtn").on("click", function() {
    	daumPostCode();
	});
    
	// 우편번호 e
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