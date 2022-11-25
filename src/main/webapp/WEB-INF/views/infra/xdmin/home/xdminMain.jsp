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
	<style>
	  canvas {
	    -moz-user-select: none;
	    -webkit-user-select: none;
	    -ms-user-select: none;
	  }
	</style>	
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
									<!-- <input class="task-item" name="task" type="checkbox" id="item-1" checked> -->
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
								 <canvas id="canvas"></canvas>
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
	<script src="../../dist/Chart.bundle.js"></script>
	<script src="../utils.js"></script>
	<script type="text/javascript">
	
		const data = [];
		const data2 = [];
		let prev = 100;
		let prev2 = 80;
		for (let i = 0; i < 1000; i++) {
		  prev += 5 - Math.random() * 10;
		  data.push({x: i, y: prev});
		  prev2 += 5 - Math.random() * 10;
		  data2.push({x: i, y: prev2});
		}
		// </block:data>
	
		// <block:animation:1>
		const totalDuration = 10000;
		const delayBetweenPoints = totalDuration / data.length;
		const previousY = (ctx) => ctx.index === 0 ? ctx.chart.scales.y.getPixelForValue(100) : ctx.chart.getDatasetMeta(ctx.datasetIndex).data[ctx.index - 1].getProps(['y'], true).y;
		const animation = {
		  x: {
		    type: 'number',
		    easing: 'linear',
		    duration: delayBetweenPoints,
		    from: NaN, // the point is initially skipped
		    delay(ctx) {
		      if (ctx.type !== 'data' || ctx.xStarted) {
		        return 0;
		      }
		      ctx.xStarted = true;
		      return ctx.index * delayBetweenPoints;
		    }
		  },
		  y: {
		    type: 'number',
		    easing: 'linear',
		    duration: delayBetweenPoints,
		    from: previousY,
		    delay(ctx) {
		      if (ctx.type !== 'data' || ctx.yStarted) {
		        return 0;
		      }
		      ctx.yStarted = true;
		      return ctx.index * delayBetweenPoints;
		    }
		  }
		};
		// </block:animation>
	
		// <block:config:0>
		const config = {
		  type: 'line',
		  data: {
		    datasets: [{
		      borderColor: Utils.CHART_COLORS.red,
		      borderWidth: 1,
		      radius: 0,
		      data: data,
		    },
		    {
		      borderColor: Utils.CHART_COLORS.blue,
		      borderWidth: 1,
		      radius: 0,
		      data: data2,
		    }]
		  },
		  options: {
		    animation,
		    interaction: {
		      intersect: false
		    },
		    plugins: {
		      legend: false
		    },
		    scales: {
		      x: {
		        type: 'linear'
		      }
		    }
		  }
		};
		// </block:config>
	
		module.exports = {
		  config
		};
	</script>
</body>
</html>
