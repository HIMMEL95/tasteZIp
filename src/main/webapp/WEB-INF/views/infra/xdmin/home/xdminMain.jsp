<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html lang="ko" >
<head>
  <meta charset="UTF-8">
  <title>xdmin New Member</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link href="https://cdn-icons-png.flaticon.com/128/553/553416.png" rel="shortcut icon" type="image/x-icon">
	<link rel="stylesheet" href="/resources/css/home/style.css">	
</head>
<body>
	<div class="hero">
		<%@include file="/resources/js/snow/snow.jsp"%>
		<div class="hero__content">
		<!-- partial:index.partial.html -->
			<link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet">
			<div class="task-manager">
			 	<!-- sidebar -->
				<%@include file="/resources/js/sideBar/sideBar.jsp"%>
				<!-- content s -->
				<form action="formList" name="formList" method="post">
					<input type="hidden" name="thisPage" value="1">
					<input type="hidden" name="rowNumToShow" value="${vo.rowNumToShow }">
				 	<input type="hidden" name="ifmmSeq" value="${vo.ifmmSeq}">
					<div class="page-content">
						<div class="content-categories">
							<div class="label-wrapper">
								<input class="nav-item" name="nav" type="radio" id="opt-1" onclick="location.href='/xdminMain';" href="#" checked>
								<label class="category" for="opt-1">New Member</label>
							</div>
							<div class="label-wrapper">
								<input class="nav-item" name="nav" type="radio" id="opt-2" onclick="location.href='/xdminMainNewStore';" href="#">
								<label class="category" for="opt-2">New Store</label>
							</div>
							<div class="label-wrapper">
								<input class="nav-item" name="nav" type="radio" id="opt-3">
								<label class="category" for="opt-3">Notes</label>
							</div>
						</div>
						<div class="container">
							<div class="header upcoming">New Member
								<a class="forMore" onclick="location.href='member/xdminMemberList';" href="#">
									더보기
									<i class="fa-solid fa-caret-right"></i>
								</a>
							</div>
							<div class="tasks-wrapper">
								<div class="task">
									<c:forEach items="${list}" var="list" varStatus="status">
										<label class="text row" style="display: block; margin-bottom: 5px;">
											<span class="ms-2 col-3"><i class="fa-solid fa-user-plus"></i>
												이름 : <strong>${list.ifmmName}</strong>
											</span>
											<span class="col-3">아이디 : <strong>${list.ifmmId}</strong></span>
											<span class="col-3">이메일 : <strong>${list.ifmmEmail}</strong></span>
											<span class="col-3">가입일 : <strong>${list.ifmmCreatedAt}</strong></span>
										</label>
									</c:forEach>
								</div>
							</div>
							<div style="width: 900px; height: 600px;">
								<!--차트가 그려질 부분-->
								<canvas id="myChart"></canvas>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

<!-- partial -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<script src="https://kit.fontawesome.com/a33686bef4.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script type="text/javascript">
            var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '월','화','수','목','금','토','일'
                    ],
                    datasets: [
                        { //데이터
                            label: '주간 신규 가입자 차트', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                            	20, 30, 40, 50, 10, 5, 55 //x축 label에 대응되는 데이터 값
                            ],
                            /* {mb_id:"${member.ifmmSeq}"} */
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
  
</body>
</html>
