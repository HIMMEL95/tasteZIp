<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<jsp:useBean id="CodeServiceImpl" class="com.tasteZip.infra.modules.code.CodeServiceImpl" />

<!DOCTYPE html>
	<html lang="ko" >
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Owner Menu Form</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
		<!-- datepicker s -->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		<!-- datepicker e -->
		<link rel="stylesheet" href="/resources/css/xdmin/member/xdminForm.css">
		<script src="/resources/js/main/imageUpload.js"></script>
		<!-- <link rel="stylesheet" href="/resources/css/xdmin/member/memberList.css"> -->
		<style>
		</style>
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
			 <%@include file="/resources/js/sideBar/sideBar.jsp"%>		  <!-- content s -->
		  <form id="formList" name="formList" method="post" enctype="multipart/form-data">
		  <input type="hidden" name="ifmnSeq" value="<c:out value="${vo.ifmnSeq}"/>"/>
				<div class="row" style="width: 1022px; height: 100%">
					<h2 class="needs-validation mt-5 ms-5">Owner Menu Form</h2>
					<div class="content" style="height: 500px; width: 1010px; overflow-y: scroll;">
						<div class="start" style="margin-left: auto; margin-right: auto; width: 690px; display: grid;">
							<div class="row">
								<div class="col-6">
									<label class="form-label">메뉴이름</label> 
									<input class="form-control" value="<c:out value="${item.ifmnName}"/>" name="ifmnName">
								</div>
								<div class="col-6">
									<label class="form-label">가게번호</label> 
									<input class="form-control" value="<c:out value="${item.ifstSeq}"/>" name="ifstSeq">
								</div>
							</div>
							<div class="row mt-3">
								<div class="col">
									<label class="form-label">메뉴가격</label> 
									<input type="text" value="<c:out value="${item.ifmnPrice}"/>" class="form-control" name="ifmnPrice">
								</div>
								<div class="col">
									<label class="form-label">세트여부</label> 
									<select class="form-select" name="ifmnSet_div">
										  <option value="23" <c:if test="${item.ifmnSet_div eq 23 }"> selected</c:if>>세트메뉴</option>
										  <option value="24" <c:if test="${item.ifmnSet_div eq 24 }"> selected</c:if>>단품메뉴</option>
									</select>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col">
									<label class="form-label">메뉴정보</label> 
									<textarea class="form-control" id="ifmnInfo" row="30" name="ifmnInfo" wrap="hard"><c:out value="${item.ifmnInfo}"/></textarea>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col">
									<label class="form-label">할인여부</label> 
									<select class="form-select" name="ifmnDiscount">
										  <option value="1" <c:if test="${item.ifmnDiscount eq 1 }"> selected</c:if>>Y</option>
										  <option value="0" <c:if test="${item.ifmnDiscount eq 0 }"> selected</c:if>>N</option>
									</select>
								</div>
								<div class="col">
									<label class="form-label">삭제여부</label> 
									<select class="form-select" name="ifmnDelNy">
										  <option value="1" <c:if test="${item.ifmnDelNy eq 1 }"> selected</c:if>>Y</option>
										  <option value="0" <c:if test="${item.ifmnDelNy eq 0 }"> selected</c:if>>N</option>
									</select>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col">
					            	<label class="form-label">메뉴 사진</label>
									<div class="row">
										<div class="col-3">
							    			<img id="preview-image" class="profile" src="${img.path}${img.uuidName}" style="width: 400px; height: 200px;">
							    			<div>
												<input type="file" id="menuImage" name="menuImage" multiple="multiple" onChange="upload('menuImage', 1, 0, 1, 0, 0, 1);">
							    			</div>
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
		 <form name="formVo" id="formVo" method="post">
		</form> 
		   <!-- content e -->
		<!-- partial -->
	
		<!-- end --> 
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			
			var goUrlList = "/menu/ownerMenuList"; 
			var goUrlForm = "/menu/ownerMenuForm"; 
			var goUrlInst = "/menu/menuInst"; /* #-> */
			var goUrlUpdt = "/menu/menuUpdt"; /* #-> */
			var goUrlUele = "/menu/menuUele"; /* #-> */
			var goUrlDele = "/menu/menuDele"; /* #-> */
			
			var seq = $("input:hidden[name=ifmnSeq]"); /* #-> */
			
			var form = $("form[name=formList]");
			var formVo = $("form[name=formVo]");
			
			$("#btnList").on("click", function() {
				formVo.attr("action", goUrlList).submit();
			});
			
			$("#btnSave").on("click", function(){
				if (seq.val() == "0" || seq.val() == ""){
			   		form.attr("action", goUrlInst).submit();
			   	} else {
			   		form.attr("action", goUrlUpdt).submit();
			   	}
			}); 
			
			$("btnDel").on("click", function() {
				form.attr("action", goUrlList).submit();
			});

			$("btnUel").on("click", function() {
				form.attr("action", goUrlList).submit();
			});


	</script>
	<script type="text/javascript">
		const autoHyphen1 = (target) => {
	 		 target.value = target.value
	 		   .replace(/[^0-9]/g, '')
	 		  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	 		}
		
		function readImage(input) {
		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		        // 이미지 파일인지 검사 (생략)
		        // FileReader 인스턴스 생성
		        const reader = new FileReader()
		        // 이미지가 로드가 된 경우
		        reader.onload = e => {
		            const previewImage = document.getElementById("preview-image")
		            previewImage.src = e.target.result
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0])
		    }
		}
		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("menuImage")
		inputImage.addEventListener("change", e => {
		    readImage(e.target)
		})
	</script>
</body>

</html>
