<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<style type="text/css">
	.rounded-pill{
	   background-color: #FF5600; 
	   width: 70%; 
	   color: white
	}
</style>


		<div id="sidebar" class="sidebar">
			<div class="d-flex flex-column flex-shrink-0 bg-dark align-center" style="width: 4.5rem; height: 100vh;">
				<a href="/tasteMain" class="d-block p-3 link-dark text-decoration-none" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Icon-only">
					<img alt="" src="/resources/images/main/logo2.png" width="40" height="30">
					<span class="visually-hidden">Icon-only</span>
				</a>
				<ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
					<li class="nav-item">
						<a href="/storeList" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-credit-card text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="/favorite" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-heart text-white" style="font-size: 22px;"></i>
						</a>
					</li>
					<li>
						<a href="/chatRoom" class="nav-link py-3 rounded-0 align-center" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="right" aria-label="Home" data-bs-original-title="Home">
							<i class="fas fa-light fa-comments text-white" style="font-size: 22px;"></i>
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
						<img src="https://intermusicakorea.com/common/img/default_profile.png" width="30" height="30" class="rounded-circle">  
					</a>
					<c:choose>
						<c:when test="${sessSeq ne null }">
							<div class="dropdown-menu text-small shadow">
								<div class="container">
									<div class="row mb-2" style="margin-right: 0px; padding-top: 5px; margin-left: 0px;">
										<div class="col-4 text-center">
											<img src="https://intermusicakorea.com/common/img/default_profile.png"  width="30" height="30" class="rounded-circle"> 
										</div>
										<div class="col-7 text-center">
											<span><b><c:out value="${sessName}"/></b></span>
										</div>
									</div>
									<a href="/mypage/mypageMain" class="dropdown-item text-center" style="color: #FF5600"><i class="fa-solid fa-user-gear"></i> <b>Mypage</b></a> 
									<hr class="dropdown-divider">
									<div class="row justify-content-center">
										<button type="button" class="btn btn-light rounded rounded-pill" id="signOutBtn">
											Logout
										</button>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="dropdown-menu text-small shadow">
								<div class="container">
									<div class="row mb-2 justify-content-center" style="margin-right: 0px; padding-top: 5px; margin-left: 0px;">
										<div class="col text-center"><span><b>로그인 후</b><br>이용하시기<br>바랍니다.</span></div>
									</div>
									<hr class="dropdown-divider">
									<div class="row justify-content-center">
										<button type="button" class="btn btn-light rounded rounded-pill" id="loginBtn">
											Login
										</button>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>