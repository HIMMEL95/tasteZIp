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
					<th scope="col" style="width: 50px;">
						<input type="checkbox" name="checkboxAll" id="checkboxAll">
					</th>
					<th class="text-white" style="width: 50px;">#</th>
					<th class="text-white" scope="col" style="width: 160px;">Name</th>
					<th class="text-white" scope="col" style="width: 120px;">Price</th>
					<th class="text-white" scope="col" style="width: 200px;">Info</th>
					<th class="text-white" scope="col" style="width: 50px">Set_Menu</th>
					<th class="text-white" scope="col" style="width: 150px;">Created At</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) eq 0}">
						<tr>
							<td class="text-center" colspan="7">There is no data!</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="list" varStatus="status">
								<tr onclick="goForm(${list.ifmnSeq})" class="info">
									<td scope="row" src="#">
										<input type="checkbox" name="checkboxSeq" id="checkboxSeq" value="${list.ifmnSeq }">
									</td>
									<td>
										<c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/>
									</td>
									<td>${list.ifmnName }</td>
									<td>
										<fmt:formatNumber type="number" pattern="#,###" value="${list.ifmnPrice}"/>
									</td>
									<td>${list.ifmnInfo}</td>
									<td>${list.ifmnSet_div}</td>
									<td>${list.ifmnCreatedAt}</td>
								</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<%@include file="../../xdmin/includeV1/pagination.jsp"%>
	</div>
		<!-- end --> 
	<script>
		
		var goUrlForm = "/menu/xdminMenuForm"; 
		
		var form = $("form[name=formList]");
		
		var ifmnSeq = $("input[name=ifmnSeq]");
			
		// ----- form으로 이동 -----
		
		$('#btnForm').on("click", function() {
 			goForm(0);                
 		});
		
		goForm = function(keyValue) {
			/* if(key != 0) seq.val(btoa(key)); */
			ifmnSeq.val(keyValue);
			form.attr("action", goUrlForm).submit();
		}

		goList = function(thisPage) {
			$("input:hidden[name=thisPage]").val(thisPage);
			setMenuLita();
		}

		$("#changeRowNum").on("change", function(){
			$("input:hidden[name=rowNumToShow]").val($("#changeRowNum option:selected").val());
			setMenuLita();
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
