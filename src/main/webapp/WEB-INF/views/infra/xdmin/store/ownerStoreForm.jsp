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
		<title>Owner Store Form</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
		<!-- datepicker s -->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<!-- datepicker e -->
		<link rel="stylesheet" href="/resources/css/xdmin/member/xdminForm.css">
	</head>
<body>
<div class="hero">
 	 <!-- snow -->
	<%@include file="/resources/js/snow/snow.jsp"%>
	<div class="hero__content">
		<!-- <h1>SVG Snow</h1> -->
		<!-- partial:index.partial.html -->
		<link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet">
		<div class="task-manager">
		<!-- sidebar -->
		 <%@include file="/resources/js/sideBar/sideBar.jsp"%>
		  <!-- content s -->
		  <form id="formList" name="formList" method="post" enctype="multipart/form-data">
		  	<input type="hidden" name="ifstSeq" value="<c:out value="${vo.ifstSeq}"/>"/>
				<div class="row" style="width: 1022px; height: 100%">
					<h2 class="needs-validation mt-5 ms-5">Owner Store Form</h2>
					<div class="content" style="height: 500px; width: 1010px; overflow-y: scroll;">
						<div class="start" style="margin-left: auto; margin-right: auto; width: 690px; display: grid;">
							<div class="row">
								<div class="card col">
									<p class="fw-bold" style="margin: 20px 15px; font-size: 15px;">
										<i class="fa-solid fa-star-of-life"></i> 
										휴무 날도 영엽일과 동일하게 영업 시간을 작성해주세요!
									</p>
								</div>
							</div>
							<div class="row mt-3"">
								<div class="col">
									<div class="accordion" id="accordionExample">
										<div class="accordion-item">
											<h2 class="accordion-header" id="headingOne">
												<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
													 오픈 시간
												</button>
											</h2>
											<div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
												<div class="accordion-body">
													<c:choose>
														<c:when test="${item.ifstSeq eq 0 or empty item.ifstSeq }">
														<input type="hidden" id="test" value="${item.ifstSeq }">
															<c:forEach items="${day }" var="list2" varStatus="status">
																<div class="row">
																	<div class="col-2">
																		<c:set var="listCodeDay" value="${CodeServiceImpl.selectListCachedCode('6') }" />
																		<select class="form-select" id="ifrtDayArray" name="ifrtDayArray">
																			<option value="">선택</option>
																			<c:forEach items="${listCodeDay}" var="listDay" varStatus="statusDay">
																				<option value="${listDay.ifccSeq }" <c:if test="${list2.ifrtDay eq listDay.ifccSeq}">selected</c:if>><c:out value="${listDay.ifccName }"/></option>
																			</c:forEach>
																		</select>
																	</div>
																	<div class="col-2">
																		<c:set var="listCodeClose" value="${CodeServiceImpl.selectListCachedCode('8') }" />
																		<select class="form-select" id="ifrtOpeningArray" name="ifrtOpeningArray" onchange="refreshTime(${status.index})">
																			<option value="">선택</option>
																			<c:forEach items="${listCodeClose}" var="listClose" varStatus="statusClose">
																				<option value="${listClose.ifccSeq }" <c:if test="${list.ifrtOpening eq listClose.ifccSeq}">selected</c:if>><c:out value="${listClose.ifccName }"/></option>
																			</c:forEach>
																		</select>
																	</div>
																	<div class="col">
																		<input type="time" class="form-control" id="ifrtStartTimeArray${status.index }" name="ifrtStartTimeArray" value="${list.ifrtStartTime }">
																	</div>
																	~
																	<div class="col">
																		<input type="time" class="form-control" id="ifrtEndTimeArray${status.index }" name="ifrtEndTimeArray" value="${list.ifrtEndTime }">
																	</div>
																</div>
															</c:forEach>
														</c:when>	
														<c:otherwise>
															<c:forEach items="${running }" var="list" varStatus="status">
																<div class="row">
																	<div class="col-2">
																		<c:set var="listCodeDay" value="${CodeServiceImpl.selectListCachedCode('6') }" />
																		<select class="form-select" id="ifrtDayArray" name="ifrtDayArray" readonly>
																			<option value="">선택</option>
																			<c:forEach items="${listCodeDay}" var="listDay" varStatus="statusDay">
																				<option value="${listDay.ifccSeq }" <c:if test="${list.ifrtDay eq listDay.ifccSeq}">selected</c:if>><c:out value="${listDay.ifccName }"/></option>
																			</c:forEach>
																		</select>
																	</div>
																	<div class="col-2">
																		<c:set var="listCodeClose" value="${CodeServiceImpl.selectListCachedCode('8') }" />
																		<select class="form-select" id="ifrtOpeningArray" name="ifrtOpeningArray" onchange="refreshTime(${status.index})">
																			<option value="">선택</option>
																			<c:forEach items="${listCodeClose}" var="listClose" varStatus="statusClose">
																				<option value="${listClose.ifccSeq }" <c:if test="${list.ifrtOpening eq listClose.ifccSeq}">selected</c:if>><c:out value="${listClose.ifccName }"/></option>
																			</c:forEach>
																		</select>
																	</div>
																	<div class="col">
																		<input type="time" class="form-control" id="ifrtStartTimeArray${status.index }" name="ifrtStartTimeArray" value="${list.ifrtStartTime }">
																	</div>
																	~
																	<div class="col">
																		<input type="time" class="form-control" id="ifrtEndTimeArray${status.index }" name="ifrtEndTimeArray" value="${list.ifrtEndTime }">
																	</div>
																</div>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col">
									<label class="form-label">이름</label> 
									<input type="text" class="form-control" id="ifstName" name="ifstName" value="${item.ifstName }">
								</div>
								<div class="col">
									<label class="form-label">가게 전화번호</label> 
									<input type="text" class="form-control" id="ifstPhone" name="ifstPhone" placeholder="01000000000" oninput="autoHyphen1(this)" maxlength="12" value="${item.ifstPhone }">
								</div>
							</div>
							<div class="row mt-3">
								<div class="col">
									<label class="form-label">주문제공여부</label> 
									<select class="form-select" id="ifstOrderNy" name="ifstOrderNy">
										<option value="">선택</option>
										<option value="0" <c:if test="${item.ifstOrderNy eq 0 }">selected</c:if>>X</option>
										<option value="1" <c:if test="${item.ifstOrderNy eq 1 }">selected</c:if>>O</option>
									</select>
								</div>
							</div>
							<div class="row mt-3">
								<label for="ifstZipCode" class="form-label">우편번호</label> 
								<div class="col-6">	
					   				<input type="text" class="form-control" id="ifstZipCode" name="ifstZipCode" value="${item.ifstZipCode }">
					   			</div>
					   			<div class="col">
					   				<button type="button" class="btn btn-outline-dark" id="searchBtn"> 우편번호 검색 </button>
					   				<button class="btn btn-outline-dark" type="button" id="" style="height: 2.4rem;"><i class="fa-solid fa-rotate-left"></i></button>
				   				</div>
							</div>
							<div class="row mt-3" style="margin-top: 3rem;">
								<div class="col-6">	
									<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
										<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1;width: 20px;" onclick="foldDaumPostcode()" alt="접기 버튼">
									</div>
					   			</div>
							</div>
							<div class="row mt-3">
								<div class="col">
									<label for="ifstAddress" class="form-label">주소</label> 
									<input type="text" class="form-control" id="ifstAddress" name="ifstAddress" value="${item.ifstAddress }">
								</div>
							</div>
							<div class="row mt-3" style="margin-top: 3rem;">
								<div class="col-6">	
									<label for="ifstAddressDetail" class="form-label">상세주소</label> 
					   				<input type="text" class="form-control" id="ifstAddressDetail" name="ifstAddressDetail" value="${item.ifstAddressDetail }">
					   			</div>
					   			<div class="col-6">
					   				<label for="ifstAddressExtra" class="form-label">참고 항목</label>
					   				<input type="text" class="form-control" id="ifstAddressExtra" name="ifstAddressExtra" value="${item.ifstAddressExtra }"> 
				   				</div>
				   				<div class="col-6 mt-3">
					   				<input type="text" class="form-control" id="ifstLat" name="ifstLat" placeholder="위도" value="${item.ifstLat }"> 
				   				</div>
				   				<div class="col-6 mt-3">
					   				<input type="text" class="form-control" id="ifstLng" name="ifstLng" placeholder="경도" value="${item.ifstLng }">
				   				</div>
							</div>
							<div class="row mt-3" style="margin-top: 3rem;">
								<div class="col">	
									<label class="form-label">간편길안내</label> 
					   				<input type="text" class="form-control" id="ifstDirections" name="ifstDirections" placeholder="간편 길안내" value="${item.ifstDirections }">
					   			</div>
							</div>
							<div class="row mt-3" style="margin-top: 3rem;">
								<div class="col">	
									<label class="form-label">가게 소개글</label> 
					   				<textarea class="form-control" id="ifstInfo" name="ifstInfo" aria-label="With textarea" rows="5">${item.ifstInfo }</textarea>
					   			</div>
							</div>
							<div class="row mt-3" style="margin-top: 3rem;">
								<div class="col">	
									<label class="form-label">가게 이미지(2개 첨부)</label> 
					   				<div class="d-flex flex-row">  
							    		<div style="margin-right:40px;"> 
							    			<div class="justify-content-center text-center" style="border-radius:10px; width:200px; height:200px; background:#1F2122; position:relative; ">
							    				<i class="fa-solid fa-camera" style="font-size:40pt; position:absolute; top:30%; right:36%;"></i> 
							    				<br>
							    				<span id="imageCounter" style="font-size:16pt; font-weight:bold; position:absolute; top:60%; right:38%;">0/10</span>
							    				<input type="file" multiple="multiple"  id="storeImage" name="storeImage" onChange="upload('storeImage');" style="position:absolute; opacity:0%; width:100px; height:100px; top:10%; right:20%; cursor:pointer;">    
							    			</div>
							    			<!-- <div style="background:red; width:200px; height:200px;"></div> -->			 
							    		</div> 
							    		<div class="d-flex flex-row slimscroll" style="overflow:auto;" id="imgContainer">			     		
								    		<!-- 첨부 이미지들 들어오는 곳 -->
							    		</div>  
							    	</div>
					   			</div>
							</div>
						</div>
					</div>
					<div class="row align-items-center mt-5">
                           <div class="col-2" style="margin-left: 85px;">
                               <button class="border-0 btn bg-secondary shadow" type="button" id="btnList">
                                   <i class="fa-solid fa-bars" style="color: white;"></i>
                               </button>
                               <button id="btnUel" value="Uel" class="border-0 btn bg-danger shadow" type="button" data-bs-toggle="modal"
                                   data-bs-target="#deleteModal">
                                   <i class="fa-solid fa-xmark" style="color: white;"></i>
                               </button>
                           </div>
                           <div class="col-3 offset-5" align="right">
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
				</form>				
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
		 <form name="formVo" id="formVo" method="post">
			<!-- *Vo.jsp s -->
			<%-- <%@include file="memberVo.jsp"%> --%>
			<!-- #-> -->
			<!-- *Vo.jsp e -->
		</form> 
		   <!-- content e -->
		<!-- partial -->
	
		<!-- end --> 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd29bc43140391b0206f367d2b8c01eb&libraries=services"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			
			var goUrlList = "/store/ownerStoreList";
			var goUrlForm = "/store/ownerStoreForm";
			var goUrlInst = "/store/storeInst"; /* #-> */
			var goUrlUpdt = "/store/storeUpdt"; /* #-> */
			var goUrlUel = "/store/storeUele";
	        var goUrlDel = "/store/storeDele";	
			
			var form = $("form[name=formList]");
			var formVo = $("form[name=formVo]");
			
			var ifstSeq = $("input[name=ifstSeq]");
	        
			$("#btnList").on("click", function() {
				formVo.attr("action", goUrlList).submit();
			});
			
			$("#btnUel").on("click", function() {
				DelValidation("#delBtn", goUrlUel, "선택하신 게시물을 삭제하시겠습니까?");
			})
			
			$("#btnDel").on("click", function() {
				DelValidation("#delBtn", goUrlDel, "선택하신 게시물을 진짜로 삭제하시겠습니까?");		
			})
			
			DelValidation = function(confirm, url, msg) {
				$(".modal-body").html(msg);
				$(confirm).on("click", function() {
					form.attr("action", url).submit();
				})
			}
			
			$("#btnSave").on("click", function() {
				if (ifstSeq.val() == "0" || ifstSeq.val() == "") {
					form.attr("action", goUrlInst).submit();
				} else {
					form.attr("action", goUrlUpdt).submit();
				}
			})
			
		</script>
		<script type="text/javascript">
		
		/* 우편번호 api */
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
	                    document.getElementById("ifstAddressExtra").value = extraAddr;
	                
	                } else {
	                    document.getElementById("ifstAddressExtra").value = '';
	                }
	
	            	// 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('ifstZipCode').value = data.zonecode;
	                document.getElementById("ifstAddress").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("ifstAddressDetail").focus();
	                
	    			var geocoder = new daum.maps.services.Geocoder();
	    			
	    			geocoder.addressSearch(addr, function(result, status) {
	    				if(status === daum.maps.services.Status.OK) {
	    					$("#ifstLat").val(result[0].y);
	    					$("#ifstLng").val(result[0].x);
	    				}
	    			});
	
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
	    
	    $("#refresh").on("click", function() {
			$("#ifstZipCode").val('');
			$("#ifstAddress").val('');
			$("#ifstAddressDetail").val('');
			$("#ifstAddressExtra").val('');
			$("#ifstLat").val('');
			$("#ifstLng").val('');
		});
	    
	    $("#searchBtn").on("click", function() {
        	daumPostCode();
		});
	    
		refreshTime = function(keyValue) {
	    	$("#ifrtStartTimeArray"+keyValue).val("");
			$("#ifrtEndTimeArray"+keyValue).val("");
	    }
	</script>
	<script type="text/javascript">
		const autoHyphen1 = (target) => {
	 		 target.value = target.value
	 		   .replace(/[^0-9]/g, '')
	 		  .replace(/^(\d{0,2})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	 		}
	</script>
	<script type="text/javascript">
		upload = function(objName) {
			
			var files = $("#" + objName +"")[0].files;
			console.log(files);
			
			for(var i = 0; i<files.length; i++){
				
				var file = files[i];
				var picReader = new FileReader();
				
			    picReader.addEventListener("load", addEventListenerCustom (i, file));
			    picReader.readAsDataURL(file);
			}
			
			$("#imageCounter").html(files.length+"/10"); 
		};
		
		delImg = function(seq){
			
			$("#img"+seq).remove();
			
			return;
			var imgs = $("div[name=img]");
			for(var i = 0 ; i < imgs.length; i ++){
				imgs[i].children[1].onclick="delImg("+i+")";
				imgs[i].id="img"+i;
			}
			
		};
		
		addEventListenerCustom = function (i, file) { 
			return function(event) {
				var imageFile = event.target;
				var sort = i;
				var txt = "";
				
				txt += '<div style="margin-right:10px; position:relative;" name="img" id="img'+i+'">';
				txt += '<div class="justify-content-center text-center" style="border-radius:10px; width:200px; height:200px; background:#1F2122; position:relative; ">';
				txt += '<img alt="" src="'; 
				txt += imageFile.result;
				txt += '" style="width:100%; height:100%; border-radius:10px;"></div>';
				txt += '<i style="font-size: 16pt; color:red; position:absolute; top:3%; right:5%; cursor:pointer;" class="fa-regular fa-circle-xmark" onclick="delImg('+i+')"></i></div>';
				
				$("#imgContainer").append(txt);
		    };
		};
	</script>
</body>
</html>
