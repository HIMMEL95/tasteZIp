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
					<th scope="col">
						<input type="checkbox" name="chk_all" id="chk_all" href="">
					</th>
					<th class="text-white">#</th>
					<th class="text-white">번호</th>
					<th class="text-white" scope="col">이름</th>
					<th class="text-white" scope="col">전화번호</th>
					<th class="text-white" scope="col">주소</th>
					<th class="text-white" scope="col">정보</th>
					<th class="text-white" scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) eq 0}">
						<tr>
							<td class="text-center" colspan="8">There is no data!</td>
						</tr>
					</c:when>
					<c:otherwise>		
						<c:forEach items="${list}" var="list" varStatus="status">
							<tr onclick="goForm(${list.ifstSeq})" class="info" style="cursor: pointer;">
								<th scope="row" class="td1" src="/">
									<input type="checkbox" name="chk_box" onclick="checkSelectAll(this)">
								</th>
								<td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
								<td>${list.ifstSeq}</td>
								<td>${list.ifstName }</td>
								<td>${list.ifstPhone}</td>
								<td>${list.ifstAddress}</td>
								<td class="text-truncate">${list.ifstInfo }</td>
								<td>${list.ifstCreatedAt }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<%@include file="../includeV1/pagination.jsp"%>
	</div>
		<!-- end --> 
		<script>
			// 페이지 네이션 만들기
			
			goForm = function(keyValue) {
				/* if(key != 0) seq.val(btoa(key)); */
				seq.val(keyValue);
				form.attr("action", goUrlForm).submit();
			}


			goList = function(thisPage) {
				$("input:hidden[name=thisPage]").val(thisPage);
				setLita();
			}


			$("#changeRowNum").on("change", function(){
				$("input:hidden[name=rowNumToShow]").val($("#changeRowNum option:selected").val());
				setLita();
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
