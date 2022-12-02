<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">

<head>
    <title>FIND ID & PWD</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10,user-scalable=yes">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/mypage/mypage.css">
</head>

<style>
	.nav {
	    --bs-nav-link-padding-x: 1rem;
	    --bs-nav-link-padding-y: 0.5rem;
	    --bs-nav-link-font-weight: ;
	    --bs-nav-link-color: #ff8800;
	    --bs-nav-link-hover-color: #ff8800;
	    --bs-nav-link-disabled-color: #6c757d;
	    display: flex;
	    flex-wrap: wrap;
	    padding-left: 0;
	    margin-bottom: 0;
	    list-style: none;
	}
	
	.nav-link {
   		color: #ff8800;
	}

</style>

<body>
	<!-- 상단 -->
		<nav class="navbar navbar-expand-lg bg-dark">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="/tasteMain"><img class="img-fluid mb-3" src="/resources/images/main/logo2.png" alt="..." style="max-width: 4rem;"></a>
		  </div>
		</nav>
	
		<div class="page-title-overlap bg-dark pt-4">
			<div class="container d-lg-flex justify-content-between py-2 py-lg-3">
				<div class="order-lg-1 pe-lg-4 text-center text-lg-start">
					<h1 class="h3 text-white mb-0 mb-4 titlefont">Find Id & Password</h1>
				</div>
			</div>
		</div>
		
		<div class="container pt-4 pb-5 mb-2 mb-md-4 font">
	        <div class="row">
	         	 <main>
			        <form method="post" id="myForm" name="myForm">
			            <div style="height: 100px;"></div>
			            <div class="container container1">
			                <p class="fs-2 fw-bold">계정 정보 찾기</p>
			                <div class="card shadow ps-5 pt-5 pe-5 pb-2">
			                    <ul class="nav nav-tabs" id="myTab" role="tablist">
			                        <li class="nav-item" role="presentation">
			                            <button class="nav-link active fw-bold" id="home-tab" data-bs-toggle="tab"
			                                data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane"
			                                aria-selected="true">아이디 찾기</button>
			                        </li>
			                        <li class="nav-item" role="presentation">
			                            <button class="nav-link fw-bold" id="profile-tab" data-bs-toggle="tab"
			                                data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane"
			                                aria-selected="false">비밀번호 찾기</button>
			                        </li>
			                    </ul>
			                    <div class="tab-content pt-4 ps-4" id="myTabContent">
			                        <!-- 아이디 찾기 영역 -->
			                        <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab"
			                            tabindex="0">
			                            <div class="border rounded p-3">
			                                <span><i class="fa-solid fa-check"></i> 아이디를 찾기 위해서는 등록된 <strong>이름, 생년월일 그리고 전화번호</strong>를 정확하게 입력하시오.</span><br>
			                            </div>
			                            <div class="row rounded align-items-center" style="height: 350px;">
			                                <table class="table text-center align-middle">
			                                    <tr>
			                                        <td>
			                                            <label for="ifmmName" class="form-label fs-4 fw-bolds">이 름</label>
			                                        </td>
			                                        <td>
			                                            <input type="text" class="form-control" id="ifmmName" name="ifmmName" value="">
			                                        </td>
			                                    </tr>
			                                    <tr>
			                                        <td>
			                                            <label for="ifmmDob" class="form-label fs-4 fw-bolds">생년월일</label>
			                                        </td>
			                                        <td>
			                                            <input type="text" class="form-control" id="ifmmDob" name="ifmmDob" placeholder="1900-01-01" value="">
			                                        </td>
			                                    </tr>
			                                    <tr>
			                                        <td>
			                                            <label for="ifmmPhone" class="form-label fs-4 fw-bolds">전화번호</label>
			                                        </td>
			                                        <td>
			                                            <input type="text" class="form-control" id="ifmmPhone" name="ifmmPhone" placeholder="010-0000-0000" value="">
			                                        </td>
			                                    </tr>
			                                    <tr id="idHidden" style="display: none;">
			                                    	<td colspan="2">
			                                    		<h4>회원님의 아이디는 <strong class="personerId"></strong> 입니다. </h4>
			                                    	</td>
			                                    </tr>
			                                </table>
			                                <div class="text-center">
			                                    <button class="btn btn-dark" type="button" id="findId">아이디  찾기</button>
			                                </div>
			                            </div>
			                        </div>
			                        <!-- 비밀번호 찾기 영역 -->
			                        <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab"
			                            tabindex="0">
			                            <div class="border rounded p-3">
			                                <span><i class="fa-solid fa-check"></i> 비밀번호의 경우 <strong>암호화</strong> 저장되어 분실 시 찾아드릴 수
			                                    없는 정보입니다.</span><br>
			                                <span><i class="fa-solid fa-check"></i><strong> 본인 확인</strong> 을 통해 비밀번호를 재설정 하실 수
			                                    있습니다.</span>
			                            </div>
			                            <div class="mt-4 table-responsive">
			                                <table class="table text-center align-middle">
			                                    <tr>
			                                        <td>
			                                            <label for="ifmmName" class="form-label fs-4 fw-bolds">이 름</label>
			                                        </td>
			                                        <td>
			                                            <input type="text" class="form-control" id="pwdName" name="ifmmName" value="">
			                                        </td>
			                                    </tr>
			                                    <tr>
			                                        <td>
			                                            <label for="ifmmId" class="form-label fs-4 fw-bolds">아이디</label>
			                                        </td>
			                                        <td>
			                                            <input type="text" class="form-control" id="pwdId" name="ifmmId" value="">
			                                        </td>
			                                    </tr>
			                                    <tr>
			                                        <td>
			                                            <label for="ifmmDob" class="form-label fs-4 fw-bolds">생년월일</label>
			                                        </td>
			                                        <td>
			                                            <input type="text" class="form-control" id="pwdDob" name="ifmmDob" value="">
			                                        </td>
			                                    </tr>
			                                    <tr class="updatePwd" style="display: none;">
			                                        <td colspan="2">
							                            <label for="ifmmPwd" class="form-label fs-4 fw-bolds col-4 col-form-label" style="float: left;">새로운 비밀번호</label>
			                                        	<div class="input-control col">
								                            <input id="ifmmPwd" name="ifmmPwd" class="form-control" type="password" onkeypress="validationUpdt()" autocomplete="off">
								                            <div class="msg" id="pwd_msg" name="pwd_msg" style="display: none;"></div>
								                        </div>
			                                        </td>
			                                    </tr>
			                                    <tr class="updatePwd" style="display: none;">
			                                        <td colspan="2">
							                            <label for="pwdCheck" class="form-label fs-4 fw-bolds col-4 col-form-label" style="float: left;">새로운 비밀번호 확인</label>
			                                        	<div class="input-control col">
								                            <input id="pwdCheck" class="form-control" type="password" onkeypress="validationUpdt()" autocomplete="off">
								                            <div class="msg" id="pwdCheck_msg" name="pwdCheck_msg" style="display: none;"></div>
								                        </div>
			                                        </td>
			                                    </tr>
			                                </table>
			                                <div class="text-center">
			                                    <button class="btn btn-dark" type="button" id="findPwd">비밀번호 수정</button>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="mt-3 ms-3">
			                        <button class="btn btn-dark text-white shadow fw-bold mb-3" type="button" id="backBtn">
			                            뒤로
			                        </button>
			                    </div>
			                </div>
			            </div>
			            <div style="height: 50px;"></div>
			        </form>
			        
			    </main>
		          
		    </div>
	    </div>
	


<!-- 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/1d32d56af5.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    
    	/* feather.replace() */
    
	    $("#signOutBtn").on("click", function() {
			$.ajax({
				type: "POST"
				,url: "/logoutProc"
				,data: {}
				,success : function(response) {
					if (response.rt == "success") {
						window.location.href = "/tasteMain";
					} 
				}
			});
		});
    </script>
	<script type="text/javascript">
    	var goUrlBack = "/login";
    	var form = $("#myForm");
    	
    	$("#backBtn").on("click", function() {
			form.attr("action", goUrlBack).submit();
		})
		
		$("#findId").on("click", function() {
			
			$.ajax({
				async: true
				,cache: false
				,type:"POST"
				,url: "/findID"
				,data: {"ifmmName": $("#ifmmName").val(), "ifmmDob": $("#ifmmDob").val(), "ifmmPhone" : $("#ifmmPhone").val()}
				,success : function(response) {
					if (response.rt == "success") {
						console.log(response.id)
						$("#idHidden").css("display", "")
						$(".personerId").html(response.id.ifmmId);
					} else {
						alert("정확한 정보를 입력해주세요!!!");
					}
				},
				error : function(jqXHR, status, error) {
					$(".personerId").html("없는 정보");
					alert("등록된 회원 정보가 없습니다.!!");
				}
			});
		})
		
		$("#pwdDob").focusout(function() {
			$.ajax({
				async: true
				,cache: false
				,type:"POST"
				,url: "/findPwd"
				,data: {"ifmmName": $("#pwdName").val(), "ifmmId": $("#pwdId").val(), "ifmmDob" : $("#pwdDob").val()}
				,success : function(response) {
					if (response.rt == "success") {
						$(".updatePwd").css("display", "");
						$("#profile-tab-pane").prop("aria-selected", true);
					} else {
						alert("정확한 정보를 입력해주세요!!!");
					}
				},
				/* error : function(jqXHR, status, error) {
					alert("알 수 없는 에러 [ " + error + " ]");
				} */
				error : function(jqXHR, status, error) {
					$(".personerId").html("없는 정보");
					alert("등록된 회원 정보가 없습니다.!!");
				}
			});
		});
		$("#findPwd").on("click", function() {
			
			$.ajax({
				async: true
				,cache: false
				,type:"POST"
				,url: "/changePwd"
				,data: {"ifmmName": $("#pwdName").val(), "ifmmId": $("#pwdId").val(), "ifmmDob" : $("#pwdDob").val(), "ifmmPwd": $("#ifmmPwd").val()}
				,success : function(response) {
					if (response.rt == "success") {
						alert("비밀번호 수정이 완료되었습니다.");
						location.href="/login";
					} else {
						alert("정확한 정보를 입력해주세요!!!");
					}
				},
				/* error : function(jqXHR, status, error) {
					alert("알 수 없는 에러 [ " + error + " ]");
				} */
				error : function(jqXHR, status, error) {
					$(".personerId").html("없는 정보");
					alert("등록된 회원 정보가 없습니다.!!");
				}
			});
		})
		
		
	</script>
	<script type="text/javascript">
		pwd_regex = function(obj, value, message, hide) {
			const re = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/g;
		    if (!checkNull(obj, value)) {
		        hide.parent().addClass('error')
		        $(hide).text(message)
		        $(hide).show()
		        return false;
		    } else if (re.test($.trim($(obj).val()))) {
				hide.parent().addClass('error')
		        $(hide).text("최소 8자, 하나 이상의 대문자, 소문자, 숫자 및 하나의 특수 문자 입력하시오")
		        $(hide).show()
		        return false;
			} else if(!(($.trim($(obj).val()).length > 3))) {
		        $(hide).text('4자 이상의 비밀번호를 작성하시오')
		        hide.parent().addClass('error')
		        $(hide).show()
		        return false;
		    } else {
		        hide.parent().removeClass('error')
		        hide.parent().addClass('success')
		        $(hide).hide()
		        return true;
		    }
		}
	
		pwd2_regex = function(obj, value, message, hide) {
			const re = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/g;
		    if (!checkNull(obj, value)) {
		        hide.parent().addClass('error')
		        $(hide).text(message)
		        $(hide).show()
		        return false;
		    }  else if(!(($.trim($(obj).val()).length > 3))) {
		        $(hide).text('4자 이상의 비밀번호를 작성하시오')
		        hide.parent().addClass('error')
		        $(hide).show()
		        return false;
		    } else if(!(($.trim($(obj).val()) == $.trim($('#pwd').val())))) {
		        $(hide).text('비밀번호가 일치하지 않습니다.')
		        hide.parent().addClass('error')
		        $(hide).show()
		        return false;
		    } else {
		        hide.parent().removeClass('error')
		        hide.parent().addClass('success')
		        $(hide).hide()
		        return true;
		    }
		}
	
		validationUpdt = function() {
	        if(!pwd_regex($('input[name=ifmmPwd]'), $('input[name=ifmmPwd]').val(), "비밀번호를 입력하세요!", $('#pwd_msg'))) {
	            return false;
	        } else if(!pwd2_regex($('#pwdCheck')), $('#pwdCheck').val(), "비밀번호를 입력하세요!", $('#pwdCheck_msg')) {
	            return false;
	        } else {
	            return true;
	        }
	       	alert("회원가입이 완료 되었습니다.");
	    };
		
	    
	</script>
</body>
</html>