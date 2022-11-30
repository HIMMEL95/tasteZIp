<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">

<head>
    <title>맛Zip</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/main/login/login.css">
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
				              	<h2>Welcome back</h2>
				            </div>
			            	<form class="form-validate">
								<div class="mb-4">
				                	<label class="form-label" for="ifmmId"> Id </label>
				                	<input class="form-control" name="ifmmId" id="ifmmId" type="text" placeholder="Id" value="skylee" autocomplete="off" data-msg="Please enter your id" tabindex="1">
				              	</div>
								<div class="mb-4">
									<div class="row">
										<div class="col">
											<label class="form-label" for="ifmmPwd"> Password</label>
										</div>
										<div class="col-auto">
											<a class="form-text small" href="#" style="color: #FF5733;">Forgot password?</a>
										</div>
									</div>
									<input class="form-control" name="ifmmPwd" id="ifmmPwd" placeholder="Password" value="1234" type="password" data-msg="Please enter your password" tabindex="2">
		              			</div>
			              	<!-- Submit-->
				             	<div class="d-grid">
				              		<button type="button" class="btn btn-lg text-white" id="loginBtn" style="background: #FF5733; border: none;" tabindex="3">Sign in</button>
				              	</div>
				              	<hr class="my-3 hr-text letter-spacing-2" data-content="OR">
				              	<div class="d-grid gap-2">
					                <button type="button" class="btn btn btn-outline-dark" id="kakao"><i class="fa-solid fa-comment-dots"></i> Connect <span class="d-none d-sm-inline">with Kakao</span></button>
					                <button type="button" class="btn btn btn-outline-success" id="naver"><i class="fa-solid fa-n"></i> Connect <span class="d-none d-sm-inline">with Naver</span></button>
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
						    	<div class="carousel-item" data-bs-interval="5000">	
						      		<img src="https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80" class="d-block w-100" alt="...">
						    	</div>
						  		<div class="carousel-item active" data-bs-interval="5000">
						      		<img src="https://images.unsplash.com/photo-1615796701805-2094ac54bbf9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80" class="d-block w-100" alt="...">
						    	</div>
						    	<div class="carousel-item" data-bs-interval="5000">
						     		<img src="https://images.unsplash.com/photo-1625631980644-062c9a959279?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80" class="d-block w-100" alt="...">
						    	</div>
						  	</div>
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="gender"/>
		</form>
    </main>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <!-- kakao login s -->
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <!-- kakao login e -->
    <!-- naver login s -->
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    <!-- naver login e -->
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
		
    	$("#loginBtn").on("click", function() {
			$.ajax({
				async: true
				,cache: false
				,type:"POST"
				,url: "/loginCheck"
				,data: {"ifmmId": $("#ifmmId").val(), "ifmmPwd": $("#ifmmPwd").val()}
				,success : function(response) {
					if (response.rt == "success") {
						window.location.href = "/tasteMain";
					} else {
						alert("fail")
					}
				},
				error : function(jqXHR, status, error) {
					alert("알 수 없는 에러 [ " + error + " ]");
				}
			});
		});
    </script>
    <script type="text/javascript">
    	/* sns login s */
    	/* kakao login s */
     	Kakao.init('77c9d237ea96142d7fda7576f0a0fc7e'); // test 용
    	console.log(Kakao.isInitialized());
    	
    	$("#kakao").on("click", function() {
    		/* Kakao.Auth.authorize({
   		      redirectUri: 'http://localhost:8080/member/kakaoCallback',
   		    }); */
    		
    		Kakao.Auth.login({
   		      success: function (response) {
   		        Kakao.API.request({
   		          url: '/v2/user/me',
   		          success: function (response) {
   		        		Kakao.Auth.authorize({
				   		  redirectUri: 'http://localhost:8080/tasteMain',
				   		  scope: 'friends',
				   		});
   		        	  
   		        	  console.log(response)
   		        	  
   		        	  var accessToken = Kakao.Auth.getAccessToken();
   		        	  console.log(accessToken)
   		        	  Kakao.Auth.setAccessToken(accessToken);
   		        	  
   		        	  var account = response.kakao_account;
   		        	  
	  	        	  if (account.gender === "male") {
	  	        		  $("input[name=gender]").val(4);
	          		  } else {
	          			  $("input[name=gender]").val(5);
         			  } 
	  	        	  
	  	        	 /*  $("form[name=form]").attr("action", "/member/kakaoLoginProc").submit(); */
	  	        	  $.ajax({
						async: true
						,cache: false
						,type:"POST"
						,url: "snsLoginProc"
						,data: {
							ifmmName: account.profile.nickname
							,ifmmId: "카카오로그인"
							,ifmmPhone: account.profile.phone_number
							,ifmmEmail: account.email
							,ifmmGender: $("input[name=gender]").val()
							,ifmmDob: account.birthday.substring(0,2) + "-" + account.birthday.substring(2,account.birthday.length)
							,ifmmSnsImg: account.profile.thumbnail_image_url
							,ifmmSnsDiv: 1
							,kakaoToken : "Bearer:" + accessToken
						}
						,success : function(response) {
							if (response.rt == "fail") {
								alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
								return false;
							} else {
								window.location.href = "/tasteMain";
							}
						},
						error : function(jqXHR, status, error) {
							alert("알 수 없는 에러 [ " + error + " ]");
						}
					});
   		          },
   		          fail: function (error) {
   		            console.log(error)
   		          },
   		        })
   		      },
   		      fail: function (error) {
   		        console.log(error)
   		      },
   		    })
		});
    	/* kakao login e */
    	
    	/* naver login s */
    	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "6GWqP8GXHwyr9bTe9WXc",
				callbackUrl: "http://localhost:8080/login",
				isPopup: false,
			}
		); 

   		naverLogin.init();
   		
   		$("#naver").on("click", function() {
   			naverLogin.getLoginStatus(function (status) {
  				if (!status) {
  					naverLogin.authorize();
  				} else {
					setLoginStatus();
  				}
  			});
		})
   		
		window.addEventListener('load', function () {
			if (naverLogin.accessToken != null) { 
	  			naverLogin.getLoginStatus(function (status) {
	  				if (status) {
	  					setLoginStatus();
	  				}
  				});
			}
   		});
		
   		function setLoginStatus() {
			if (naverLogin.user.gender == 'M'){
				$("input[name=gender]").val(4);
			} else {
				$("input[name=gender]").val(5);
			}
			$.ajax({
				async: true
				,cache: false
				,type:"POST"
				,url: "snsLoginProc"
				,data: {
					ifmmName: naverLogin.user.name
					,ifmmId: "네이버로그인"
					,ifmmPhone: naverLogin.user.mobile
					,ifmmEmail: naverLogin.user.email
					,ifmmGender: $("input[name=gender]").val()
					,ifmmDob: naverLogin.user.birthyear+"-"+naverLogin.user.birthday
					,ifmmSnsImg: naverLogin.user.profile_image
					,ifmmSnsDiv : 2
				}
				,success : function(response) {
					if (response.rt == "fail") {
						alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
						return false;
					} else {
						window.location.href = "/tasteMain";
					}
				},
				error : function(jqXHR, status, error) {
					alert("알 수 없는 에러 [ " + error + " ]");
				}
			});
		}
    	/* naver login e */
    	/* sns login e */
    </script>
</body>

</html>