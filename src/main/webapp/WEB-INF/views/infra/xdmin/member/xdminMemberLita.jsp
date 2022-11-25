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
					<th class="text-white" scope="col">이름</th>
					<th class="text-white" scope="col">아이디</th>
					<th class="text-white" scope="col">생년월일</th>
					<th class="text-white" scope="col">이메일</th>
					<th class="text-white" scope="col">주소</th>
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
							<tr onclick="goForm(${list.ifmmSeq})" class="info" style="cursor: pointer;">
								<th scope="row" class="td1" src="#">
									<input type="checkbox" name="checkboxSeq" id="checkboxSeq">
								</th>
								<td><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }"/></td>
								<td>${list.ifmmName }</td>
								<td>${list.ifmmId}</td>
								<td>${list.ifmmDob}</td>
								<td>${list.ifmmEmail }</td>
								<td>${list.ifmmAddress }</td>
								<td>${list.ifmmCreatedAt }</td>
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
		
		var goUrlForm = "/member/xdminMemberForm"; 
		
		var form = $("form[name=formList]");
		
		var ifmmSeq = $("input[name=ifmmSeq]");
			
			// ----- form으로 이동 -----
			
			$('#btnForm').on("click", function() {
	 			goForm(0);                
	 		});
			
			goForm = function(keyValue) {
				/* if(key != 0) seq.val(btoa(key)); */
				ifmmSeq.val(keyValue);
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
				event.stopPropagation()
				var total = $("input[name=checkboxSeq]").length;
				var checked = $("input[name=checkboxSeq]:checked").length;
				
				if(total != checked) $("#checkboxAll").prop("checked", false);
				else $("#checkboxAll").prop("checked", true); 
			});
 		</script>
 		<!-- <script type="text/javascript">
 		
 		 $("#btnDelete").on("click", function(){
 			if($("input[name=checkboxSeq]:checked").length > 0 ) {
 				$("input:hidden[name=exDeleteType]").val(2);
 				$(".modal-title").text("확 인");
 				$(".modal-body").text("해당 데이터를 삭제하시겠습니까 ?");
 				$("#btnModalUelete").hide();
 				$("#btnModalDelete").show();
 				$("#modalConfirm").modal("show");
 			} else {
 				$(".modal-title").text("확 인");
 				$(".modal-body").text("데이터를 선택해 주세요!");
 				$("#modalAlert").modal("show");
 			}
 		});
 		
 		$("#btnModalDelete").on("click", function(){
 			$("input[name=checkboxSeq]:checked").each(function() { 
 				checkboxSeqArray.push($(this).val());
 			});
 			
 			$("input:hidden[name=checkboxSeqArray]").val(checkboxSeqArray);
 			
 			$("#modalConfirm").modal("hide");
 								
 			form.attr("action", goUrlMultiDele).submit();
 		}); 
 		
 		 $("#btnUelete").on("click", function(){
 			if($("input[name=checkboxSeq]:checked").length > 0 ) {
 				$("input:hidden[name=exDeleteType]").val(1);
 				$(".modal-title").text("확 인");
 				$(".modal-body").text("해당 데이터를 삭제하시겠습니까 ?");
 				$("#btnModalUelete").show();
 				$("#btnModalDelete").hide();
 				$("#modalConfirm").modal("show");
 			} else {
 				$(".modal-title").text("확 인");
 				$(".modal-body").text("데이터를 선택해 주세요!");
 				$("#modalAlert").modal("show");
 			}
 		});
 		
 		$("#btnModalUelete").on("click", function(){
 			$("input[name=checkboxSeq]:checked").each(function() { 
 				checkboxSeqArray.push($(this).val());
 			});
 			
 			$("input:hidden[name=checkboxSeqArray]").val(checkboxSeqArray);
 			
 			$("#modalConfirm").modal("hide");
 			
 			form.attr("action", goUrlMultiUele).submit();
 		});
 		
 		</script> -->
</body>
</html>
