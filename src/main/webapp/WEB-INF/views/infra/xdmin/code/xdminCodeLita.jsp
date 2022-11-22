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
					<th class="text-white" scope="col">코드 이름(한글)</th>
					<th class="text-white" scope="col">코드 이름(영문)</th>
					<th class="text-white" scope="col">순서</th>
					<th class="text-white" scope="col">설명</th>
					<th class="text-white" scope="col">사용 여부</th>
					<th class="text-white" scope="col">삭제 여부</th>
					<th class="text-white" scope="col">등록일</th>
					<th class="text-white" scope="col">수정일</th>
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
							<tr onclick="goForm(${list.ifccSeq})" class="info" style="cursor: pointer;">
								<th scope="row" class="td1" src="#">
									<input class="check" type="checkbox" name="check" onclick="checkSelectAll(this)">
								</th>
								<td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
								<td>${list.ifccName}</td>
								<td>${list.ifccNameEng }</td>
								<td>${list.ifccOrder }</td>
								<td>${list.ifccExplanation }</td>
								<td>
									<c:choose>
										<c:when test="${list.ifccUseNy eq 0}">N</c:when>
										<c:otherwise>Y</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${list.ifccDelNy eq 0}">N</c:when>
										<c:otherwise>Y</c:otherwise>
									</c:choose>
								</td>
								<td><c:out value="${list.ifccCreatedAt }"/></td>
								<td><c:out value="${list.ifccModifiedAt }"/></td>
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
		
		var goUrlForm = "/code/xdminCodeForm"; 
		
		var form = $("form[name=formList]");
		
		var ifccSeq = $("input[name=ifccSeq]");
			
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
				setCodeLita();
			}

			$("#changeRowNum").on("change", function(){
				$("input:hidden[name=rowNumToShow]").val($("#changeRowNum option:selected").val());
				setCodeLita();
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
