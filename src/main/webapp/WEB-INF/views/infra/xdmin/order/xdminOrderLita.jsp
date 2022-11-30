<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

		  <!-- content s -->
  	<%@include file="../includeV1/totalAndRowNum.jsp" %>
  		<div class=" ms-3 mt-3 bg-body rounded">
			<table class="table table-striped table-hover text-center" id="selecBox">
				<thead>
					<tr class="bg-dark">
						<th scope="col" >
							<input type="checkbox" name="checkboxAll" id="checkboxAll" style="width: 50px;">
						</th>
						<th class="text-white" style="width: 50px;">#</th>
						<th class="text-white" scope="col" style="width: 100px;">가게 이름</th>
						<th class="text-white" scope="col" style="width: 110px;">메뉴 이름</th>
						<th class="text-white" scope="col">주문자</th>
						<th class="text-white" scope="col" style="width: 100px">전화번호</th>
						<th class="text-white" scope="col" style="width: 70px;">주문 수량</th>
						<th class="text-white" scope="col">주문 금액</th>
						<th class="text-white" scope="col" style="width: 120px;">결제 수단</th>
						<th class="text-white" scope="col" style="width: 100px;">주문 날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list) eq 0}">
							<tr>
								<td class="text-center" colspan="10">There is no data!</td>
							</tr>
						</c:when>
						<c:otherwise>		
							<c:forEach items="${list}" var="list" varStatus="status">
								<tr onclick="goForm(${list.iforSeq})" class="info" style="cursor: pointer;">
									<th scope="row" class="td1" src="#">
										<input class="check" type="checkbox" name="checkboxSeq" id="checkboxSeq" value="${list.iforSeq }">
									</th>
									<td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
									<td><c:out value="${list.ifstName}"/></td>
									<td><c:out value="${list.ifmnName }"/></td>
									<td><c:out value="${list.ifmmName }"/></td>
									<td><c:out value="${list.ifmmPhone }"/></td>
									<td><c:out value="${list.iforCount }"/></td>
									<td><c:out value="${list.iforPrice }"/></td>
									<td>
										<c:choose>
											<c:when test="${list.iforPay eq 6}">무통장입금</c:when>
											<c:otherwise>카카오페이</c:otherwise>
										</c:choose>
									</td>
									<td><c:out value="${list.iforCreatedAt }"/></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="mb-4"></div>
			<%@include file="../includeV1/pagination.jsp"%>
		</div>
		<!-- end --> 
		<script>
		
		var goUrlForm = "/order/xdminOrderForm";
		
		var form = $("form[name=formList]");
		
		var iforSeq = $("input[name=iforSeq]");
		
		// ----- form으로 이동 -----
			 $("#btnForm").on("click", function(){
				 goForm(0); 
			 });
		
			goForm = function(keyValue) {
				/* if(key != 0) seq.val(btoa(key)); */
				iforSeq.val(keyValue);
				form.attr("action", goUrlForm).submit();
			}

			goList = function(thisPage) {
				$("input:hidden[name=thisPage]").val(thisPage);
				setOrderLita();
			}

			$("#changeRowNum").on("change", function(){
				$("input:hidden[name=rowNumToShow]").val($("#changeRowNum option:selected").val());
				setOrderLita();
			}); 
				

			/* checkbox delete s */
			var checkboxSeqArray = [];
			
			$("#checkboxAll").click(function() {
				
				if($("#checkboxAll").is(":checked")) $("input[name=checkboxSeq]").prop("checked", true);
				else $("input[name=checkboxSeq]").prop("checked", false);
			});
			
			$("input[name=checkboxSeq]").click(function() {
				event.stopPropagation()
				var total = $("input[name=checkboxSeq]").length;
				var checked = $("input[name=checkboxSeq]:checked").length;
				
				if(total != checked) $("#checkboxAll").prop("checked", false);
				else $("#checkboxAll").prop("checked", true); 
			});
			/* checkbox delete e */
	 		</script>
	 		
</body>
</html>
