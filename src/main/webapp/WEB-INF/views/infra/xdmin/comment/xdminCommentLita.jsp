<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

		  <!-- content s -->
  	<%@include file="../includeV1/totalAndRowNum.jsp" %>
	<div class=" ms-3 me-3 mt-3 mb-4 shadow-lg bg-body rounded">
		<table class="table table-striped table-hover text-center" id="selecBox">
			<thead>
				<tr class="bg-dark">
					<th scope="col">
						<input type="checkbox" name="chk_all" id="chk_all" href="">
					</th>
					<th class="text-white">#</th>
					<th class="text-white" scope="col">Seq</th>
					<th class="text-white" scope="col">Comment</th>
					<th class="text-white" scope="col">Grade</th>
					<th class="text-white" scope="col">Member</th>
					<th class="text-white" scope="col">Store</th>
					<th class="text-white" scope="col">Created At</th>
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
								<tr class="info">
									<td scope="row" src="#">
										<input type="checkbox" name="chk_box" onclick="checkSelectAll(this)">
									</td>
									 <td>
										<c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/>
									</td>
									<td>${list.ifcmSeq}</td>
									<td>${list.ifcmComment }</td>
									<td>${list.ifcmGrade }</td>
									<td>${list.ifmmName}</td>
									<td>${list.ifstName}</td>
									<td>${list.ifcmCreatedAt}</td>
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
		
		var goUrlForm = "/comment/xdminCommentForm"; 
		
		var form = $("form[name=formList]");
		
		var ifcmSeq = $("input[name=ifcmSeq]");
			
			// ----- form으로 이동 -----
			
			$('#btnForm').on("click", function() {
	 			goForm(0);                
	 		});
			
			goForm = function(keyValue) {
				/* if(key != 0) seq.val(btoa(key)); */
				ifcmSeq.val(keyValue);
				form.attr("action", goUrlForm).submit();
			}

			goList = function(thisPage) {
				$("input:hidden[name=thisPage]").val(thisPage);
				setCommentLita();
			}

			$("#changeRowNum").on("change", function(){
				$("input:hidden[name=rowNumToShow]").val($("#changeRowNum option:selected").val());
				setCommentLita();
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
