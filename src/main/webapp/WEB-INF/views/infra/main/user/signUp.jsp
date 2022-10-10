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
				            		<img class="img-fluid mb-3" src="https://cdn-icons-png.flaticon.com/128/553/553416.png" alt="..." style="max-width: 4rem;">
				            	</button>
				              	<h2>Create Account</h2>
				            </div>
				            <form class="form-validate">
								<div class="mb-4">
									<div class="row">
										<div class="col">	
											<div class="input-control">
					                            <label class="form-label" for="id"> Id <span class="text-danger">*</span></label>
						                		<input class="form-control" name="id" id="id" type="text" autocomplete="off" data-msg="Please enter your Id">
					                            <div class="msg" id="id_msg" name="id_msg" style="display: none;"></div>
					                        </div>									
										</div>
										<div class="col">										
						                	<label class="form-label" for="name"> Name <span class="text-danger">*</span></label>
						                	<input class="form-control" name="name" id="name" type="text" autocomplete="off" data-msg="Please enter your Name">
										</div>
									</div>
				              	</div>
								<div class="mb-4">
									<div class="row">
										<div class="col">
											<label class="form-label" for="password"> Password <span class="text-danger">*</span></label>
											<input class="form-control" name="password" id="password" placeholder="Password" type="password" data-msg="Please enter your password">
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
											<label class="form-label" for="dob"> Birth <span class="text-danger">*</span></label>
											<input class="form-control" name="dob" id="dob" placeholder="Password" type="text" data-msg="Please enter your password">
										</div>
										<div class="col">
											<label class="form-label" for="gender"> Gender <span class="text-danger">*</span></label>
											<input class="form-control" name="gender" id="gender" placeholder="Password" type="password" data-msg="Please enter your password">
										</div>
									</div>
		              			</div>
								<div class="mb-4">
									<div class="row">    
								        <div class="col">
											<input type="hidden" id="ifmeDefaultNyArray0" name="ifmeDefaultNyArray" value="1">
											<input type="hidden" id="ifmeTypeCdArray0" name="ifmeTypeCdArray" value="44">
								            <label for="ifmeEmailFullArray0" class="form-label">Email <span class="text-danger">*</span></label>
								            <input type="text" id="ifmeEmailFullArray0" name="ifmeEmailFullArray" value="<c:out value="${item.ifmeEmailFull }"/>" maxlength="50" placeholder="account@example.com" class="form-control form-control-sm">
								            <div class="invalid-feedback" id="ifmeEmailFullArray0Feedback"></div>
								        </div>
							        </div>
						        </div>
						        <div class="mb-4">
						        	<div class="row">
								        <div class="col">
								            <label for="ifmmEmailConsent" class="form-label">이메일 정보 마케팅 사용 동의</label>
								            <div class="form-check">
								            	<input type="hidden" id="ifmmEmailConsentNy" name="ifmmEmailConsentNy" value="0">
								                <input type="checkbox" id="ifmmEmailConsent" name="ifmmEmailConsent" class="form-check-input" <c:if test="${item.ifmmEmailConsentNy eq 1 }">checked</c:if>>
								                <label for="ifmmEmailConsentNy" class="form-check-label text-muted">
								                    동의합니다
								                </label>
								            </div>
								        </div>
								    </div>
		              			</div>
			              		<div class="mb-4">
			                		<div class="form-check">
			                 	 		<input class="form-check-input" id="loginRemember" type="checkbox">
		                 	 			<label class="form-check-label text-muted" for="loginRemember">
		                	 		 		<span class="text-sm">Remember me for 30 days</span>
	                	 		 		</label>
			                		</div>
			              		</div>
			              	<!-- Submit-->
				             	<div class="d-grid">
				              		<button class="btn btn-lg btn-primary" type="button" id="saveBtn">Sign in</button>
				              	</div>
				              	<hr class="my-3 hr-text letter-spacing-2" data-content="OR">
				              	<div class="d-grid gap-2">
					                <button class="btn btn btn-outline-primary btn-social"><i class="fa-2x fa-facebook-f fab btn-social-icon"> </i>Connect <span class="d-none d-sm-inline">with Facebook</span></button>
					                <button class="btn btn btn-outline-muted btn-social"><i class="fa-2x fa-google fab btn-social-icon"> </i>Connect <span class="d-none d-sm-inline">with Google</span></button>
				              	</div>
				              	<hr class="my-4">
				              	<p class="text-center">
				              		<small class="text-muted text-center">
				              			Don't have an account yet? 
				              			<button class="signUpBtn" id="signUpBtn" type="button">Sign Up</button>
			              			</small>
		              			</p>
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
						      		<img src="https://images.unsplash.com/photo-1481931098730-318b6f776db0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60" class="d-block w-100" alt="...">
						    	</div>
						    	<div class="carousel-item" data-bs-interval="5000">
						     		<img src="https://images.unsplash.com/photo-1432139509613-5c4255815697?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60" class="d-block w-100" alt="...">
						    	</div>
						    	<div class="carousel-item" data-bs-interval="5000">	
						      		<img src="https://images.unsplash.com/photo-1558024920-b41e1887dc32?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjMzfHxmb29kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60" class="d-block w-100" alt="...">
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
    <script type="text/javascript">
    	var goUrlHome = "/tasteMain";
    	var goUrlSign = "/signUp";
    	var form = $("#myForm");
    
    	$("#homeBtn").on("click", function() {
			form.attr("action", goUrlHome).submit();
		})
		
		$("#signUpBtn").on("click", function() {
			form.attr("action", goUrlSign).submit();
		})
    </script>
</body>

</html>