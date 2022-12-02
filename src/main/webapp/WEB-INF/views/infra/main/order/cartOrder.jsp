<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<%-- <jsp:useBean id="CodeServiceImpl" class="com.spopia.infra.modules.code.CodeServiceImpl"/> --%>

<!doctype html> 
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
    <title>Cart Order</title>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/order/mapBasic.css">
	<link rel="stylesheet" href="/resources/css/order/cart.css">
	<script defer type="text/javascript" src="/resources/js/order/mapBasic.js"></script>
</head>

<body>
    <!-- start -->
    <form id="myForm" name="myForm">
    	<input type="hidden" name="ifmmId" value="${sessId }">
    	<input type="hidden" name="ifmmName" value="${sessName }">
    	<input type="hidden" name="ifstSeq" value="${item.ifstSeq }">
    	<input type="hidden" name="ifstName" value="${item.ifstName }">
	    <section class="h-100 h-custom" style="background-color: #eee;">
			<div class="container h-100 py-5">
				<div class="row d-flex justify-content-center align-items-center h-100">
					<div class="col">
						<div class="card shopping-cart" style="border-radius: 15px;">
							<div class="card-body text-black">
								<div class="row">
									<div class="col-lg-6 px-5 py-4">
										<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">Your Menu</h3>
										<c:forEach items="${list }" var="list" varStatus="status">
											<input type="hidden" class="menuSeq${status.index }" name="ifmnSeq" id="menuSeq${list.ifmnSeq }" value="${list.ifmnSeq }">
											<div class="d-flex align-items-center mb-5 item${list.ifmnSeq }">
												<div class="flex-shrink-0">
													<c:choose>
														<c:when test="${empty list.path }">
															<img src="https://naverbooking-phinf.pstatic.net/20220823_108/166121414680370cPU_PNG/1%C0%CE%BC%BC%C6%AE_1_%B9%CC%BD%BA%C5%CD%BF%A1%B1%D7_1200X1200.png?type=f220_220_60_sharpen"
															class="img-fluid" style="width: 150px;" alt="Generic placeholder image">
														</c:when>
														<c:otherwise>
															<img src="${list.path }${list.uuidName}" class="img-fluid" style="width: 150px;" alt="Generic placeholder image">
														</c:otherwise>
													</c:choose>
												</div>
												<div class="flex-grow-1 ms-3">
													<button type="button" id="delBtn" class="float-end text-black" onclick="delItem(${list.ifmnSeq})"><i class="fas fa-times"></i></button>
													<h5>
														<input type="hidden" name="ifmnName" id="menuName${list.ifmnSeq }" value="${list.ifmnName }">
														<b>${list.ifmnName }</b>
													</h5>
													<div class="d-flex align-items-center">
														<p class="fw-bold mb-0 me-5 pe-3">
															<input type="hidden" name="iforPrice" id="price${status.index }" value="${list.ifmnPrice }">
															<fmt:formatNumber type="number" pattern="#,###" value="${list.ifmnPrice}"/>원
														</p>
														<div class="def-number-input number-input safari_only">
															<button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepDown()" class="minus"></button>
															<input class="quantity${status.index } fw-bold text-black" min="1" name="quantity" value="1" type="number">
															<button type="button" onclick="this.parentNode.querySelector('input[type=number]').stepUp()" class="plus"></button>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<hr class="mb-4" style="height: 2px; background-color: black; opacity: 1;">
										<div class="d-flex justify-content-between p-2 mb-2" style="background-color: #E6E6E6;">
											<input type="hidden" name="totalCount" class="count" value="">  
											<input type="hidden" name="totalPrice" class="total" value="">  
											<input type="hidden" name="ifmnName" class="menu" value="">
											<h5 class="fw-bold mb-0">Total:</h5>
											<h5 class="fw-bold mb-0 totalPrice"></h5>
										</div>
									</div>
									<div class="col-lg-6 px-5 py-4">
										<h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">ORDER</h3>
										<div class="mb-5">
											<div class="container">
												<!-- 주문자정보 -->
												<hr class="hrstyle mt-2 mb-2">
												<div class="wide">
												<div class="row mt-4 mb-3"><h4><b>가게 정보</b></h4></div>
													<div class="row mt-2 mb-4">
														<div class="col-4">
															<c:choose>
																<c:when test="${empty item.path }">
																	<img src="https://ldb-phinf.pstatic.net/20200410_10/1586521245116Ig03n_JPEG/%B3%D7%C0%CC%B9%F6%C6%C4%C6%AE%B3%CA%BD%BA%BC%BE%C5%CD_%C7%A5%C1%A6%C0%CC%B9%CC%C1%F6.jpg" class="storeImg" style="width: 150px; height: 100px;">
																</c:when>
																<c:otherwise>
																	<img src="${item.path }${item.uuidName}" class="storeImg" style="width: 150px; height: 100px;">
																</c:otherwise>
															</c:choose>
														</div>
														<div class="col-8">
															<div><h5><b>${item.ifstName }</b></h5></div>
															<div><p>${item.ifstAddress }</p></div>
														</div>
													</div>
												</div>
												<hr class="hrstyle mt-2 mb-2">
												<!-- 가게 정보 -->
												<div class="wide">
													<div class="row mt-4 mb-3"><h4><b>예약자 정보</b></h4></div>
													<div class="row mb-2">
														<div class="col-7"><span><b>성명</b></span></div>
														<div class="col-5 text-end"><span>${sessName }</span></div>
													</div>
													<div class="row mb-2">
														<div class="col-7"><span><b>전화번호</b></span></div>
														<div class="col-5 text-end"><span>${sessPhone }</span></div>
													</div>
													<div class="row mb-2">
														<div class="col-7"><span><b>이메일</b></span></div>
														<div class="col-5 text-end">${sessEmail }</span></div>
													</div>
												</div>
												<hr class="hrstyle mt-4 mb-4">
												<!-- 가격 정보 -->
												<div class="row justify-content-between mb-2">
													<div class="col-4" id="finalPrice"><h5><b>예상 주문 금액</b></h5></div>
													<div class="col-7 text-end"><input type="text" class="form-control" style="color: red;" name="ifrvPrice" value=""></div>
													<div class="col-1 text-start"><span><b>원</b></span></div>
												</div>
												<hr class="hrstyle mt-4 mb-4">
												<!-- 결제방식 -->
												<div class="row mb-2 mx-2">
													<div class="col-4 form-check" name="pay">
													<input class="form-check-input" type="radio" name="pay" id="pay1" value="6">
													<label class="form-check-label" for="pay1">카카오페이</label>
													</div>
													<div class="col-4 form-check" name="pay">
													<input class="form-check-input" type="radio" name="pay" id="pay2" value="7">
													<label class="form-check-label" for="pay2">무통장 입금</label>
													</div>
												</div>
												<!-- 버튼 -->
												<div class="row justify-content-center mt-5">
													<div class="col-4 text-end"><button type="button" class="btn btn-warning" id="btnRV" style="width: 150px; background-color: #FF8000; color: white;"><b>주문하기</b></button></div>
													<div class="col-4 text-start"><button type="button" class="btn btn-dark" id="btnCancle" onclick="goMenu(${item.ifstSeq})" style="width: 150px;"><b>취소하기</b></button></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
    </form>

    <!-- end -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	
		var goUrlMenu = "/menu";
		var ifstSeq = $("input[name=ifstSeq]");
		var form = $("#myForm");
		
		/* kakaoPay s */
		kakaoPay = function() {
			$.ajax({
				dataType:"json"
				,type: "POST"
				,url: "/order/kakaopayReady"
				,data: {
					ifstName : $("input[name=ifstName]").val()
					,totalCount : $("input[name=totalCount]").val()
					,ifmmName : $("input[name=ifmmName]").val()
					,ifmnName : $("input[name=ifmnName]").val()
					,totalPrice : $("input[name=totalPrice]").val()
					,ifstSeq : $("input[name=ifstSeq]").val()
				}
				,success : function(response) {
					window.location.href = response.next_redirect_pc_url;
				}
				,error : function () {
					alert("ajax error...");
				}
			});
		}
		/* kakaoPay e */
	
		$("#btnRV").on("click", function() {
			if ($("#pay1:checked").is(":checked")) {
				kakaoPay();
			} else {
				alert("무통장 입금 선택 됨");
			}
		})
		
		var basicPrice = [];
		var item = [];
		var price = [];
		var count = [];
		for(var i=0; i<$(".plus").length;i++) {
			item.push($(".menuSeq"+i).val());
			price.push($("#price"+i).val());
			basicPrice.push($("#price"+i).val());
			count.push($(".quantity"+i).val());
		}
		
		var totalPrice = 0;
		for(var i=0; i<$(".plus").length;i++) {
			totalPrice += (parseInt($("#price"+i).val()) * $(".quantity"+i).val());
		}
		
		$(".minus, .plus").on("click", function() {
			item = [];
			price = [];
			count = [];
			totalPrice = 0;
			for(var i=0; i<$(".plus").length;i++) {
				console.log("quantity : " + $(".quantity"+i).val());
				totalPrice += (parseInt(basicPrice[i]) * parseInt($(".quantity"+i).val()));
				console.log(totalPrice)
				$("#price"+i).val(parseInt(basicPrice[i]) * parseInt($(".quantity"+i).val()));
				item.push($(".menuSeq"+i).val());
				price.push($("#price"+i).val());
				count.push($(".quantity"+i).val());
			}
			console.log(item)
			console.log(price)
			console.log(count)
			var a = String(totalPrice);
			totalPrice = String(totalPrice);
			$("input[name=totalPrice]").val(a);
			totalPrice = totalPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			$(".totalPrice").html(totalPrice + " 원");
			$("input[name=ifrvPrice]").val(totalPrice);
		})
		
		$("input[name=totalPrice]").val(totalPrice)
		totalPrice = String(totalPrice);
		totalPrice = totalPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		$(".totalPrice").html(totalPrice + " 원");
		$("input[name=ifrvPrice]").val(totalPrice);
		
		goMenu = function(value) {
			ifstSeq.val(value)
			form.attr("action", goUrlMenu).submit();
		};
		
		delItem = function(value) {
			alert(value)
			for (var i=0; i<item.length;i++) {
				if (item[i] == value) {
					item.splice(i, 1);
					price.splice(i, 1);
					count.splice(i, 1);
					$("div").remove(".item"+value);
					$("input").remove("#menuSeq"+value);
				}
			}
			
			var result = "";
			var resultPrice = "";
			var resultCount = "";
			
			for(var i=0; i<item.length;i++) {
				if (i == item.length-1) {
					result += item[i];
					resultPrice += price[i];
					resultCount += count[i];
				} else {
					result += item[i] + " ";
					resultPrice += price[i] + " ";
					resultCount += count[i] + " ";
				}
			}
			
			console.log("resultPrice : " + resultPrice)
			console.log("resultCount : " + resultCount)
			
			$.ajax({
				type: "POST"
				,url: "/menu/cartDel"
				,data: {
					ifmnSeq : result
					,price : resultPrice
					,totalCount : resultCount
				}
				,success : function(response) {
					if (response.rt == "success") {
						location.reload();
					} 
				}
			});
		}
		
		// 쿠키 값 가져오기 s
		var getCookieValue = (name) => (
			document.cookie.match('(^|;)\\s*' + name + '\\s*=\\s*([^;]+)')?.pop() || ''
		)
		
		var value = getCookieValue("cart");
		
		if (value != "") {
			var cookieArr = value.split(":");
			
			if (cookieArr.length == 1) {
				$(".menu").val($("#menuName"+cookieArr[0]).val());
			} else {
				$(".menu").val($("#menuName"+cookieArr[0]).val() + " 외 " + (cookieArr.length-1));
				$(".count").val(cookieArr.length);
			}
		}
		// 쿠키 값 가져오기 e
	</script>
</body>

</html>