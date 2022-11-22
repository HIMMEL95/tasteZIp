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
						<input class="check" type="checkbox" name="check" onclick="selectAll(this)">
					</th>
					<th class="text-white">#</th>
					<th class="text-white" scope="col">가게 이름</th>
					<th class="text-white" scope="col">메뉴 이름</th>
					<th class="text-white" scope="col">주문자</th>
					<th class="text-white" scope="col">전화번호</th>
					<th class="text-white" scope="col">예약 수량</th>
					<th class="text-white" scope="col">예약 인원</th>
					<th class="text-white" scope="col">예약 금액</th>
					<th class="text-white" scope="col">예약일</th>
					<th class="text-white" scope="col">예약 시간</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) eq 0}">
						<tr>
							<td class="text-center" colspan="11">There is no data!</td>
						</tr>
					</c:when>
					<c:otherwise>		
						<c:forEach items="${list}" var="list" varStatus="status">
							<tr onclick="goForm(${list.ifstSeq})" class="info" style="cursor: pointer;">
								<td>
									<input class="check" type="checkbox" name="check" onclick="checkSelectAll(this)">
								</td>
								<td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
								<td><c:out value="${list.ifstName}"/></td>
								<td><c:out value="${list.ifmnName }"/></td>
								<td><c:out value="${list.ifmmName }"/></td>
								<td><c:out value="${list.ifmmPhone }"/></td>
								<td><c:out value="${list.ifrvCount }"/></td>
								<td><c:out value="${list.ifrvPerson }"/></td>
								<td><c:out value="${list.ifrvPrice }"/></td>
								<td><c:out value="${list.ifrvDate }"/></td>
								<td><c:out value="${list.ifrvTime }"/></td>
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
		
		var goUrlForm = "/reservation/xdminReservationForm"; 
		
		var form = $("form[name=formList]");
		
		var ifrvSeq = $("input[name=ifrvSeq]");
			
			// ----- form으로 이동 -----
			
			$('#btnForm').on("click", function() {
	 			goForm(0);                
	 		});
			
			goForm = function(keyValue) {
				/* if(key != 0) seq.val(btoa(key)); */
				ifccSeq.val(keyValue);
				form.attr("action", goUrlForm).submit();
			}

			goList = function(thisPage) {
				$("input:hidden[name=thisPage]").val(thisPage);
				setReservationLita();
			}

			$("#changeRowNum").on("change", function(){
				$("input:hidden[name=rowNumToShow]").val($("#changeRowNum option:selected").val());
				setReservationLita();
			}); 
				

			$("#checkboxAll").click(function() {
				if($("#checkboxAll").is(":checked")) $("input[name=checkboxSeq]").prop("checked", true);
				else $("input[name=checkboxSeq]").prop("checked", false);
			});


			$("input[name=checkboxSeq]").click(function() {
				var total = $("input[name=checkboxSeq]").length;
				var checked = $("input[name=checkboxSeq]:checked").length;
				
				if(total != checked) $("#checkboxAll").prop("checked", false);
				else $("#checkboxAll").prop("checked", true); 
			});
	 		</script>
	 		
	 		
	 		
</body>
</html>
