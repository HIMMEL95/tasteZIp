<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>


	<!DOCTYPE html>
	<html lang="ko" >
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>xdmin Member Form</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
		<!-- datepicker s -->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<!-- datepicker e -->
		<link rel="stylesheet" href="/resources/css/home/homeTest.css">
		<style>
			.overflow-x-auto {
				overflow-x: auto;
			}
					
			.overflow-x-auto table {
				width: auto!important; 
				white-space: nowrap;
			}
		</style>
	</head>
<body>
<div class="hero">
    <div class="snow">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1536" preserveAspectRatio="xMidYMax slice">
		    <g fill="#FFF" fill-opacity=".15" transform="translate(55 42)">
			   <g id="snow-bottom-layer">
				  <ellipse cx="6" cy="1009.5" rx="6" ry="5.5"/>
				  <ellipse cx="138" cy="1110.5" rx="6" ry="5.5"/>
				  <ellipse cx="398" cy="1055.5" rx="6" ry="5.5"/>
				  <ellipse cx="719" cy="1284.5" rx="6" ry="5.5"/>
				  <ellipse cx="760" cy="1155.5" rx="6" ry="5.5"/>
				  <ellipse cx="635" cy="1459.5" rx="6" ry="5.5"/>
				  <ellipse cx="478" cy="1335.5" rx="6" ry="5.5"/>
				  <ellipse cx="322" cy="1414.5" rx="6" ry="5.5"/>
				  <ellipse cx="247" cy="1234.5" rx="6" ry="5.5"/>
				  <ellipse cx="154" cy="1425.5" rx="6" ry="5.5"/>
				  <ellipse cx="731" cy="773.5" rx="6" ry="5.5"/>
				  <ellipse cx="599" cy="874.5" rx="6" ry="5.5"/>
				  <ellipse cx="339" cy="819.5" rx="6" ry="5.5"/>
				  <ellipse cx="239" cy="1004.5" rx="6" ry="5.5"/>
				  <ellipse cx="113" cy="863.5" rx="6" ry="5.5"/>
				  <ellipse cx="102" cy="1223.5" rx="6" ry="5.5"/>
				  <ellipse cx="395" cy="1155.5" rx="6" ry="5.5"/>
				  <ellipse cx="826" cy="943.5" rx="6" ry="5.5"/>
				  <ellipse cx="626" cy="1054.5" rx="6" ry="5.5"/>
				  <ellipse cx="887" cy="1366.5" rx="6" ry="5.5"/>
				  <ellipse cx="6" cy="241.5" rx="6" ry="5.5"/>
				  <ellipse cx="138" cy="342.5" rx="6" ry="5.5"/>
				  <ellipse cx="398" cy="287.5" rx="6" ry="5.5"/>
				  <ellipse cx="719" cy="516.5" rx="6" ry="5.5"/>
				  <ellipse cx="760" cy="387.5" rx="6" ry="5.5"/>
				  <ellipse cx="635" cy="691.5" rx="6" ry="5.5"/>
				  <ellipse cx="478" cy="567.5" rx="6" ry="5.5"/>
				  <ellipse cx="322" cy="646.5" rx="6" ry="5.5"/>
				  <ellipse cx="247" cy="466.5" rx="6" ry="5.5"/>
				  <ellipse cx="154" cy="657.5" rx="6" ry="5.5"/>
				  <ellipse cx="731" cy="5.5" rx="6" ry="5.5"/>
				  <ellipse cx="599" cy="106.5" rx="6" ry="5.5"/>
				  <ellipse cx="339" cy="51.5" rx="6" ry="5.5"/>
				  <ellipse cx="239" cy="236.5" rx="6" ry="5.5"/>
				  <ellipse cx="113" cy="95.5" rx="6" ry="5.5"/>
				  <ellipse cx="102" cy="455.5" rx="6" ry="5.5"/>
				  <ellipse cx="395" cy="387.5" rx="6" ry="5.5"/>
				  <ellipse cx="826" cy="175.5" rx="6" ry="5.5"/>
				  <ellipse cx="626" cy="286.5" rx="6" ry="5.5"/>
				  <ellipse cx="887" cy="598.5" rx="6" ry="5.5"/>
			   </g>
		    </g>
		    <g fill="#FFF" fill-opacity=".3" transform="translate(65 63)">
			   <g id="snow-top-layer">
				  <circle cx="8" cy="776" r="8"/>
				  <circle cx="189" cy="925" r="8"/>
				  <circle cx="548" cy="844" r="8"/>
				  <circle cx="685" cy="1115" r="8"/>
				  <circle cx="858" cy="909" r="8"/>
				  <circle cx="874" cy="1438" r="8" transform="rotate(180 874 1438)"/>
				  <circle cx="657" cy="1256" r="8" transform="rotate(180 657 1256)"/>
				  <circle cx="443" cy="1372" r="8" transform="rotate(180 443 1372)"/>
				  <circle cx="339" cy="1107" r="8" transform="rotate(180 339 1107)"/>
				  <circle cx="24" cy="1305" r="8" transform="rotate(180 24 1305)"/>
				  <circle cx="8" cy="8" r="8"/>
				  <circle cx="189" cy="157" r="8"/>
				  <circle cx="548" cy="76" r="8"/>
				  <circle cx="685" cy="347" r="8"/>
				  <circle cx="858" cy="141" r="8"/>
				  <circle cx="874" cy="670" r="8" transform="rotate(180 874 670)"/>
				  <circle cx="657" cy="488" r="8" transform="rotate(180 657 488)"/>
				  <circle cx="443" cy="604" r="8" transform="rotate(180 443 604)"/>
				  <circle cx="339" cy="339" r="8" transform="rotate(180 339 339)"/>
				  <circle cx="24" cy="537" r="8" transform="rotate(180 24 537)"/>
			   </g>
		    </g>
		</svg>
    </div>
	
	<div class="hero__content">
		<!-- <h1>SVG Snow</h1> -->
		<!-- partial:index.partial.html -->
		<link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet">
		<div class="task-manager">
		  <div class="left-bar">
		    <div class="upper-part">
		      <div class="actions">
		        <div class="circle"></div>
		        <div class="circle-2"></div>
		      </div>
		    </div>
		    <div class="left-content">
		      <ul class="action-list">
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
		            stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-inbox"
		            viewBox="0 0 24 24">
		            <path d="M22 12h-6l-2 3h-4l-2-3H2" />
		            <path
		              d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z" />
		          </svg>
		          <span>Home</span>
		        </li>
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-star">
		            <polygon
		              points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
		            </svg>
		            <a href="/member/xdminMemberList" style="text-decoration: none; color: #f7f8fc;">
			          <span> Member</span>
		            </a>
		        </li>
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
		            stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-calendar"
		            viewBox="0 0 24 24">
		            <rect width="18" height="18" x="3" y="4" rx="2" ry="2" />
		            <path d="M16 2v4M8 2v4m-5 4h18" />
		          </svg>
		          <span>Order</span>
		        </li>
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-hash">
		            <line x1="4" y1="9" x2="20" y2="9" />
		            <line x1="4" y1="15" x2="20" y2="15" />
		            <line x1="10" y1="3" x2="8" y2="21" />
		            <line x1="16" y1="3" x2="14" y2="21" /></svg>
		          <span>Reservation</span>
		        </li>
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-users">
		            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
		            <circle cx="9" cy="7" r="4" />
		            <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
		            <path d="M16 3.13a4 4 0 0 1 0 7.75" /></svg>
		          <span>store</span>
		        </li>
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
		            stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-trash"
		            viewBox="0 0 24 24">
		            <path d="M3 6h18m-2 0v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
		          </svg>
		          <span>Menu</span>
		        </li>
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
		            stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-users"
		            viewBox="0 0 24 24">
		            <path d="M3 6h18m-2 0v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2" />
		          </svg>
		          <span>Comment</span>
		        </li>
		      </ul>
		      <ul class="category-list">
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
		            stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-sun"
		            viewBox="0 0 24 24">
		            <circle cx="12" cy="12" r="5" />
		            <path
		              d="M12 1v2m0 18v2M4.22 4.22l1.42 1.42m12.72 12.72l1.42 1.42M1 12h2m18 0h2M4.22 19.78l1.42-1.42M18.36 5.64l1.42-1.42" />
		          </svg>
		          <span>Code</span>
		        </li>
		        <li class="item">
		          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
		            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
		            class="feather feather-trending-up">
		            <polyline points="23 6 13.5 15.5 8.5 10.5 1 18" />
		            <polyline points="17 6 23 6 23 12" /></svg>
		            <a href="/code/codeList" style="text-decoration: none; color: #8891a4;">
			          <span>CodeGroup</span>
		            </a>
		        </li>
		      </ul>
		    </div>
		  </div>
		  <!-- content s -->
		  <form id="formList" name="formList" method="post" autocomplete="off" style="margin-left: 60px; margin-top: 30px;">
			<!-- *Vo.jsp s -->
			<%-- <%@include file="codeVo.jsp"%> --%>
			<!-- *Vo.jsp e -->
			
			<div class="wrapper">
				<div class="container">
					<div class="row" style="height: 800px;">
						<div class="col" style="padding-top: 20px;">
							<h2 class="needs-validation mt-2">Member Form</h2>
							<div class="content">
								<div class="row">
									<div class="col">
										<label class="form-label">코드</label> <input type="text" class="form-control"  placeholder="자동완성">
									</div>
									<div class="col">
										<label class="form-label">아이디</label> <input type="text" class="form-control" placeholder="영문(대소문자),숫자" value="">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label class="form-label">이름</label> 
										<input class="form-control" placeholder="한글">
									</div>
									<div class="col">
										<label class="form-label">비밀번호</label> <input type="text" class="form-control" placeholder="영문(대소문자),숫자">
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label class="form-label">생일</label> <input type="date" class="form-control" placeholder="생년월일">
									</div>
									<div class="col">
										<label class="form-label">성별</label> <select class="form-select">
											<option selected disabled value="">선택</option>
											<option>남</option>
											<option>여</option>
										</select>
									</div>
									<div class="col">
										<label class="form-label">통신사</label> <select class="form-select">
											<option selected disabled value="">선택</option>
											<option>SKT</option>
											<option>KT</option>
											<option>LGT</option>
										</select>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label class="form-label">이메일</label> <input type="text" class="form-control" placeholder="영문(대소문자),숫자, @이후 전체 이메일 주소 포함 ">
									</div>
									<div class="col">
										<label class="form-label">전화번호</label> <input type="text" class="form-control" placeholder="- 를 제외한 숫자만">
									</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<label class="form-label">우편번호</label> 
									<div class="col-8">	
						   				<input type="text" class="form-control">
						   			</div>
						   			<div class="col-4">
						   				<button type="button" class="btn btn-outline-dark" onclick=""> 우편번호 검색 </button>
						   				<button class="btn btn-outline-dark" type="button" id="" style="height: 2.4rem;"><i class="fa-solid fa-rotate-left"></i></button>
					   				</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<div class="col-12">	
										<label class="form-label">주소</label> 
						   				<input type="text" class="form-control" id="" name="" value="">
						   			</div>
								</div>
								<div class="row mt-3" style="margin-top: 3rem;">
									<div class="col-6">	
										<label class="form-label">상세주소</label> 
						   				<input type="text" class="form-control" id="" name="" value="">
						   			</div>
						   			<div class="col-6">
						   				<label class="form-label">참고 항목</label>
						   				<input type="text" class="form-control" id="" name="" value=""> 
					   				</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label class="form-label">사용자 구분</label> <select class="form-select" >
											<option selected disabled value="">선택</option>
											<option>고객</option>
											<option>사장님</option>
											<option>관리자</option>
										</select>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col">
										<label class="form-label">SNS</label> <select class="form-select" >
											<option selected disabled value="">선택</option>
											<option>일반</option>
											<option>네이버</option>
											<option>구글</option>
											<option>페이스북</option>
											<option>카카오</option>
										</select>
									</div>
									<div class="col">
										<label class="form-label">이메일여부</label> <select class="form-select">
											<option selected disabled value="">선택</option>
											<option>N</option>
											<option>Y</option>
										</select>
									</div>
									<div class="col">
										<label class="form-label">삭제여부</label> <select class="form-select">
											<option selected disabled value="">선택</option>
											<option>N</option>
											<option>Y</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row align-items-center mt-5">
	                            <div class="col-2">
	                                <button class="border-0 btn bg-secondary shadow" type="button" id="btnList">
	                                    <i class="fa-solid fa-bars" style="color: white;"></i>
	                                </button>
	                                <button id="btnUel" value="Uel" class="border-0 btn bg-danger shadow" type="button" data-bs-toggle="modal"
	                                    data-bs-target="#deleteModal">
	                                    <i class="fa-solid fa-xmark" style="color: white;"></i>
	                                </button>
	                            </div>
	                            <div class="col-3 offset-7" align="right">
	                                <div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false"
	                                    tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	                                    <div class="modal-dialog">
	                                        <div class="modal-content">
	                                            <div class="modal-header">
	                                                <h5 class="modal-title fw-bold" id="staticBackdropLabel">게시물 삭제</h5>
	                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
	                                                    aria-label="Close"></button>
	                                            </div>
	                                            <div class="modal-body fs-6">
	                                           		선택하신 게시물을 정말로 삭제하시겠습니까?
	                                            </div>
	                                            <div class="modal-footer">
	                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	                                                <button id="delBtn" type="button" class="btn btn-primary">삭제</button>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <button id="btnDel" value="Del" class="border-0 btn bg-danger shadow" type="button" data-bs-toggle="modal"
	                                    data-bs-target="#deleteModal">
	                                    <i class="fa-solid fa-trash-can" style="color: white;"></i>
	                                </button>
	                                <button id="btnSave" class="border-0 btn bg-success shadow" type="button">
	                                    <i class="fa-regular fa-bookmark" style="color: white;"></i>
	                                </button>
	                            </div>
	                        </div>
						</div>
					</div>
				</form>
				
			 <form name="formVo" id="formVo" method="post">
				<!-- *Vo.jsp s -->
				<%-- <%@include file="memberVo.jsp"%> --%>
				<!-- #-> -->
				<!-- *Vo.jsp e -->
			</form> 
		   <!-- content e -->
		</div>
		<!-- partial -->
	</div>
</div>

<!-- <footer class="bg-dark">
	        <div class="footer">
	            <div class="footer_inner">
	                [주]고객센터,제휴문의,서비스안내
	                <ul class="footer_link" id="footer_link">
	                    <li><a target="_blank" class="footer_item" href="#"
	                            id="fot.agreement"><span class="text text-white">이용약관</span></a></li>
	                    <li><a target="_blank" class="footer_item" href="#l"
	                            id="fot.privacy"><span class="text text-white">개인정보처리방침</span></a></li>
	                    <li><a target="_blank" class="footer_item" href="#"
	                            id="fot.disclaimer"><span class="text text-white">책임의 한계와 법적고지</span></a></li>
	                    <li><a target="_blank" class="footer_item"
	                            href="#" id="fot.help"><span
	                                class="text text-white">회원정보 고객센터</span></a></li>
	                </ul>
	                <div class="footer_copy">
	                    <a  id="fot.naver" target="_blank" href="https://www.navercorp.com">
	                        <img src="/resources/images/main/logo2.png" alt="logo" style="width: 45px;">
	                    </a>
	                    <span class="text text-white">Copyright</span>
	                    <span class="corp text-white">© MATZIP Corp.</span>
	                    <span class="text text-white">All Rights Reserved.</span>
	                </div>
	            </div>
	        </div>
	    </footer> -->
	
		<!-- end --> 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			
			var goUrlList = "/member/xdminMemberList"; 
			var goUrlForm = "/member/xdminMemberForm"; 
			var goUrlInst = "/member/memberInst"; /* #-> */
			var goUrlUpdt = "/member/memberUpdt"; /* #-> */
			var goUrlUele = "/member/memberUele"; /* #-> */
			var goUrlDele = "/member/memberDele"; /* #-> */
			
			var ccgSeq = $("input:hidden[name=ccgSeq]"); /* #-> */
			
			var form = $("form[name=formList]");
			var formVo = $("form[name=formVo]");
			
			var ifmmSeq = $("input[name=ifmmSeq]");
			
			$("#btnList").on("click", function() {
				formVo.attr("action", goUrlList).submit();
			});
			
		  function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
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
		                    document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample6_postcode').value = data.zonecode;
		                document.getElementById("sample6_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("sample6_detailAddress").focus();
		            }
		        }).open();
		    }


	</script>
</body>
</html>
