<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<style type="text/css">
	.mypageImg{
	width: 70px;
	height: 70px;
	border-radius: 100%;
	margin-left: 2rem;
}
</style>

		<aside class="col-lg-4 pt-4 pt-lg-0 pe-xl-5 mt-3">
            <div class="bg-white rounded-3 shadow-lg pt-1 mb-5 mb-lg-0">
              <div class="d-md-flex justify-content-between align-items-center text-center text-md-start p-4">
                <div class="d-md-flex align-items-center">
                  <div class="mx-auto mb-2 mx-md-0 mb-md-0" style="width: 7rem;">
                  	<img class="mypageImg" src="
	                  	<c:choose>
							<c:when test = "${itemImg ne null}">${itemImg.path}${itemImg.uuidName}</c:when>
							<c:otherwise>https://intermusicakorea.com/common/img/default_profile.png</c:otherwise>
						</c:choose>
					">
                  </div>
                  <div class="ps-md-3">
                    <h3 class="fs-base mb-0"><c:out value="${sessId}"/></h3><span class="text-accent fs-sm font"><c:out value="${sessEmail}"/></span>
                  </div>
                </div><a class="btn btn-dark d-lg-none mb-2 mt-3 mt-md-0" href="#account-menu" data-bs-toggle="collapse" aria-expanded="false"><i class="ci-menu me-2"></i>Account menu</a>
              </div>
              <div class="d-lg-block collapse" id="account-menu">
                <ul class="list-unstyled mb-0">
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/mypage/mypageMain"><b>My Page</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/member/mypageMemberForm"><b>My Information</b></a></li>
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/order/mypageOrder"><b>My Order</b></a></li>
                  <!-- <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/reservation/mypageReservation"><b>My Reservation</b></a></li> -->
                  <li class="border-bottom mb-0 px-4"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="/comment/mypageReview"><b>My Review</b></a></li>
                  <li class="mt-5 pb-3"><button type="button" class="btn btn-dark text-center" id="signOutBtn"><b>Log out</b></buttton></li>
                </ul>
              </div>
            </div>
          </aside>