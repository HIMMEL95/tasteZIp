<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">

<head>
    <title>맛Zip SignUp</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/main/login/signup.css">
</head>

<body>

    <main>
    	<form method="post" id="myForm" name="myForm">
	    	<div class="container-fluid px-3">
		      	<div class="row min-vh-100">
		        	<div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
		         		<div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
				            <div class="mb-5">
				            	<button class="homeBtn" id="homeBtn" type="button">		            	
				            		<img class="img-fluid mb-3" src="/resources/images/main/logo2.png" alt="..." style="max-width: 4rem;">
				            	</button>
				              	<h2>Create Account</h2>
				            </div>
				            <form class="form-validate">
								<div class="mb-4">
									<div class="row">
										<div class="col">	
											<div class="input-control">
					                            <label class="form-label" for="ifmmId"> Id <span class="text-danger">*</span></label>
						                		<input class="form-control" name="ifmmId" id="ifmmId" type="text" autocomplete="off" data-msg="Please enter your Id">
					                            <div class="msg" id="ifmmId_msg" name="ifmmId_msg" style="display: none;"></div>
					                        </div>									
										</div>
										<div class="col">										
						                	<label class="form-label" for="ifmmName"> Name <span class="text-danger">*</span></label>
						                	<input class="form-control" name="ifmmName" id="ifmmName" type="text" autocomplete="off" data-msg="Please enter your Name">
										</div>
									</div>
				              	</div>
								<div class="mb-4">
									<div class="row">
										<div class="col">
											<label class="form-label" for="ifmmPwd"> Password <span class="text-danger">*</span></label>
											<input class="form-control" name="ifmmPwd" id="ifmmPwd" placeholder="Password" type="password" data-msg="Please enter your password">
										</div>
										<div class="col">
											<label class="form-label" for="passwordCheck"> Password Confirm <span class="text-danger">*</span></label>
											<input class="form-control" name="passwordCheck" id="passwordCheck" placeholder="Password" type="password" data-msg="Please enter your password">
										</div>
									</div>
		              			</div>
								<div class="mb-4">
									<div class="row">
										<div class="col">
											<label class="form-label" for="ifmmDob"> Birth <span class="text-danger">*</span></label>
											<input class="form-control" name="ifmmDob" id="ifmmDob" placeholder="Password" type="text" data-msg="Please enter your password">
										</div>
										<div class="col">
											<label class="form-label" for="ifmmGender"> Gender <span class="text-danger">*</span></label>
											<select id="ifmmGender" name="ifmmGender" class="form-control" aria-label=".form-select-lg example" onfocusout="validationUpdt()">
				                                <option value="" <c:if test="${empty item.gender}">selected</c:if>>선택</option>
				                                <option value="5" <c:if test="${item.gender eq 5 }">selected</c:if>>남성</option>
				                                <option value="6" <c:if test="${item.gender eq 6 }">selected</c:if>>여성</option>
				                            </select>
										</div>
									</div>
		              			</div>
								<div class="mb-4">
									<div class="row">    
								        <div class="col">
								            <label for="ifmmEmail" class="form-label">Email <span class="text-danger">*</span></label>
								            <input type="text" id="ifmmEmail" name="ifmmEmail" maxlength="50" placeholder="account@example.com" class="form-control form-control-sm">
								        </div>
							        </div>
						        </div>
						        <div class="mb-4">
						        	<div class="row">
								        <div class="col">
								            <label for="ifmmEmailCheck" class="form-label">이메일 정보 마케팅 사용 동의</label>
								            <div class="form-check">
								            	<input type="hidden" id="ifmmEmailConsentNy" name="ifmmEmailConsentNy" value="0">
								                <input type="checkbox" id="ifmmEmailCheck" name="ifmmEmailCheck" class="form-check-input" <c:if test="${item.ifmmEmailConsentNy eq 1 }">checked</c:if>>
								                <label for="ifmmEmailConsentNy" class="form-check-label text-muted">
								                    동의합니다
								                </label>
								            </div>
								        </div>
								    </div>
		              			</div>
								<div class="mb-4">
									<div class="row">
										<div class="col">
											<label class="form-label" for="ifmmRadioOperator"> 통신사 <span class="text-danger">*</span></label>
											<select id="ifmmRadioOperator" name="ifmmRadioOperator" class="form-control" aria-label=".form-select-lg example">
				                            	<option value="" <c:if test="${empty item.ifmmRadioOperator}">selected</c:if>>선택</option>
				                                <option value="1" <c:if test="${item.ifmmRadioOperator eq 1 }">selected</c:if>>SKT</option>
				                                <option value="2" <c:if test="${item.ifmmRadioOperator eq 2 }">selected</c:if>>LGT</option>
				                                <option value="3" <c:if test="${item.ifmmRadioOperator eq 3 }">selected</c:if>>KT</option>
				                            </select>
										</div>
										<div class="col" style="margin-top: 31px">
											<input class="form-control" name="gender" id="gender" placeholder="Password" type="text" data-msg="Please enter your phoneNumber">
										</div>
										<div class="col" style="margin-top: 31px">
											<button type="button" class="btn fw-bold text-white certification" style="background-color: #FF5733;">인증번호</button>
										</div>
									</div>
		              			</div>
		              			<div class="mb-4">
		              				 <div class="row" hidden>
					                    <div class="col-6">
					                        <div class="input-control">
					                            <label for="tel_certification">인증번호</label>
					                            <input id="tel_certification" name="tel_certification" type="text" onfocusout="validationUpdt()"> 
					                            <div class="msg" id="tel_certi_msg" name="tel_certi_msg" style="display: none;"></div>
					                        </div>
					                    </div>
					                    <div class="col-2">
					                        <div class="row">
					                            <div class="col">
					                                <button type="button" class="btn fw-bold text-white certification"
					                                    style="background-color: #FF5733;">중복확인</button>
					                            </div>
					                        </div>
					                    </div>
					                </div>
		              			</div>
		              			<div class="mb-4">
		              				<div class="row">
					                    <div class="col-6">
					                        <div class="input-control">
					                        	<label class="form-label" for="ifmmZipCode"> 우편번호 <span class="text-danger">*</span></label>
												<input class="form-control" name="ifmmZipCode" id="ifmmZipCode" placeholder="ZipCode" type="text" autocomplete="off" data-msg="Please enter your ZipCode">
					                        </div>
					                    </div>
					                    <div class="col-6">
					                        <div class="row">
					                            <div class="col">
					                            	<div style="height: 28px;"></div>
					                                <button type="button" id="searchBtn" class="btn fw-bold text-dark certification"
					                                    style="background-color: #0d6efd;">주소검색</button>
					                                <button id="refresh" class="btn btn-danger fw-bold btn-sm shadow" type="button">
					                                        <i class="fa-solid fa-arrow-rotate-right"></i>
					                                </button>
					                            </div>
					                        </div>
					                    </div>
					                </div>
		              			</div>
		              			<div class="mb-4">
		              				<div class="row">
					                    <div class="col">
					                        <div class="input-control">
					                        	<label class="form-label" for="ifmmAddress"> Address <span class="text-danger">*</span></label>
												<input class="form-control" name="ifmmAddress" id="ifmmAddress" placeholder="address" type="text" data-msg="Please enter your address">
					                        </div>
					                    </div>
					                </div>
		              			</div>
		              			<div class="mb-4">
		              				<div class="row">
					                    <div class="col">
					                        <div class="input-control">
					                        	<label class="form-label" for="ifmmDetailAddress"> Detail Address <span class="text-danger">*</span></label>
												<input class="form-control" name="ifmmDetailAddress" id="ifmmDetailAddress" placeholder="address_detail" type="text" data-msg="Please enter your address_detail">
					                        </div>
					                    </div>
					                    <div class="col">
					                        <div class="input-control">
					                        	<label class="form-label" for="ifmmExtraAddress"> Extra Address <span class="text-danger">*</span></label>
												<input class="form-control" name="ifmmExtraAddress" id="ifmmExtraAddress" placeholder="extraAddress" type="text" data-msg="Please enter your extraAddress">
					                        </div>
					                    </div>
					                </div>
		              			</div>
		              			<div class="row">
				                	<div class="col">
				                		<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
											<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1;width: 20px;" onclick="foldDaumPostcode()" alt="접기 버튼">
										</div>
				                	</div>
				                </div>
			              	<!-- Submit-->
				             	<div class="d-grid">
				              		<button class="btn btn-lg btn-primary text-white" type="button" id="saveBtn" style="background: #FF5733; border: none;">Sign Up</button>
				              	</div>
			            	</form>
			            	<a class="close-absolute me-md-5 me-xl-6 pt-5" href="/tasteMain"> 
			              		<i class="fa-solid fa-xmark fa-2x"></i>
		              		</a>
			          	</div>
			        </div>
			        <div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
			          <!-- Image-->
						<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
							<div class="carousel-inner">
						  		<div class="carousel-item active" data-bs-interval="5000">
						      		<img src="https://images.unsplash.com/photo-1594041680534-e8c8cdebd659?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80" class="d-block w-100" alt="...">
						    	</div>
						    	<div class="carousel-item" data-bs-interval="5000">
						     		<img src="https://images.unsplash.com/photo-1551024506-0bccd828d307?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80" class="d-block w-100" alt="...">
						    	</div>
						    	<div class="carousel-item" data-bs-interval="5000">	
						      		<img src="https://images.unsplash.com/photo-1589227365423-d87e646beaac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80" class="d-block w-100" alt="...">
						    	</div>
						  	</div>
						</div>
					</div>
				</div>
			</div>
		</form>
    </main>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
    
    	var goUrlInst = "/signUpInst";
    	var goUrlHome = "/tasteMain";
    	var goUrlSign = "/signUp";
    	var form = $("#myForm");
    
    	$("#homeBtn").on("click", function() {
			form.attr("action", goUrlHome).submit();
		})
		
		$("#signUpBtn").on("click", function() {
			form.attr("action", goUrlSign).submit();
		})
		
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
        
        $("#refresh").on("click", function() {
			$("#ifmmZipCode").val('');
			$("#ifmmAddress").val('');
			$("#ifmmDetailAddress").val('');
			$("#ifmmExtraAddress").val('');
		});
		// 우편번호 e
		
		$("#saveBtn").on("click", function() {
      		form.attr("action", goUrlInst).submit();
      		swAlert("회원가입", "회원가입을 축하합니다.!!!", "success");
		});
		
		 function swAlert(title, text, icon) {
				swal({
					title: title
					,text: text
					,icon: icon
					,buttons: "확인"
				}).then((value) => {
					if (value) {
						loaction.href = "/tasteMain";
					}
				})
			}
    </script>
</body>

</html>