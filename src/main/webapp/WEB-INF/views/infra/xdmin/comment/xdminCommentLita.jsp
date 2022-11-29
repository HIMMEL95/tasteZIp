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
						<input type="checkbox" name="checkboxAll" id="checkboxAll">
					</th>
					<th class="text-white">#</th>
					<th class="text-white" scope="col">댓글</th>
					<th class="text-white" scope="col">평점</th>
					<th class="text-white" scope="col">사용자이름</th>
					<th class="text-white" scope="col">가게이름</th>
					<th class="text-white" scope="col">작성일</th>
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
								<tr onclick="goForm(${list.ifcmSeq})" class="info" style="cursor: pointer;">
									<td scope="row" class="td1" src="#">
										<input type="checkbox" name="checkboxSeq" id="checkboxSeq" value="${list.ifcmSeq }">
									</td>
									 <td>
										<c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/>
									</td>
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
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script type="text/javascript">
		
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
