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
		<div class="container-fluid px-3">
			<div class="row min-vh-100">
				<div class="col-md-8 col-lg-6 col-xl-5 d-flex align-items-center">
						<div class="w-100 py-5 px-md-5 px-xxl-6 position-relative">
							<div class="mb-5"><img class="img-fluid mb-3" src="https://d19m59y37dris4.cloudfront.net/directory/2-0-1/img/logo-square.svg" alt="..." style="max-width: 4rem;">
								<h2>Welcome back</h2>
							</div>	
							<form class="form-validate">
								<div class="mb-4">
									<label class="form-label" for="loginUsername"> Email Address</label>
									<input class="form-control" name="loginUsername" id="loginUsername" type="email" placeholder="name@address.com" autocomplete="off" required="" data-msg="Please enter your email">
								</div>
								<div class="mb-4">
									<div class="row">
										<div class="col">
											<label class="form-label" for="loginPassword"> Password</label>
										</div>
										<div class="col-auto"><a class="form-text small text-primary" href="#">Forgot password?</a></div>
									</div>
									<input class="form-control" name="loginPassword" id="loginPassword" placeholder="Password" type="password" required="" data-msg="Please enter your password">
								</div>
								<div class="mb-4">
									<div class="form-check">
										<input class="form-check-input" id="loginRemember" type="checkbox">
										<label class="form-check-label text-muted" for="loginRemember"> <span class="text-sm">Remember me for 30 days</span></label>
									</div>
								</div>
								<!-- Submit-->
								<div class="d-grid">
										<button class="btn btn-lg btn-primary">Sign in</button>
								</div>
								<hr class="my-3 hr-text letter-spacing-2" data-content="OR">
								<div class="d-grid gap-2">
									<button class="btn btn-outline-primary btn-social"><i class="fa-2x fa-facebook-f fab btn-social-icon"> </i>Connect <span class="d-none d-sm-inline">with Facebook</span></button>
									<button class="btn btn-outline-muted btn-social"><i class="fa-2x fa-google fab btn-social-icon"> </i>Connect <span class="d-none d-sm-inline">with Google</span></button>
								</div>
								<hr class="my-4">
								<p class="text-center"><small class="text-muted text-center">Don't have an account yet? <a href="signup.html">Sign Up                </a></small></p>
							</form>
							<a class="close-absolute me-md-5 me-xl-6 pt-5" href="index.html"> 
								<svg class="svg-icon w-3rem h-3rem">
									<use xlink:href="#close-1"> </use>
								</svg>
							</a>
						</div>
					</div>
				<div class="col-md-4 col-lg-6 col-xl-7 d-none d-md-block">
					<!-- Image-->
					<div class="bg-cover h-100 me-n3" style="background-image: url(https://d19m59y37dris4.cloudfront.net/directory/2-0-1/img/photo/photo-1497436072909-60f360e1d4b1.jpg);"></div>
				</div>
			</div>
		</div>        
    </main>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
</body>

</html>