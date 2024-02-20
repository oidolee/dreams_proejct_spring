<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../layout/setting.jsp"%>

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>드림즈 관리자</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${path}/resources/css/admin/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- chartJs -->
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<style>
.tableContent .displayNone {
	display: none !important;
}

.tableContent .pageBox, .tableContent .pageCon {
	display: flex;
}

.chartCon {
	display: flex;
	justify-content: center;
	overflow-x: auto;
}

.floating-box {
	width: 50px;
	height: 50px;
	background: url("../image/logoSmall.png") no-repeat 50% 50%;
	background-size: 110px;
	position: fixed;
	bottom: 10px;
	left: 150px;
	border-radius: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #fff;
	font-weight: bold;
	cursor: pointer;
	animation: floatUpDown 1s infinite alternate;
	transition: transform 0.3s;
	z-index: 10000;
}

.floating-box:hover {
	transform: translateY(-5px);
}

.floating-box::before {
	content: "드림즈 메인";
	white-space: pre-line;
	position: absolute;
	width: 58px;
	text-align: center;
	top: -50px;
	left: 50%;
	transform: translateX(-50%);
	background-color: #1c5c50;
	color: #fff;
	padding: 5px;
	border-radius: 3px;
	font-size: 12px;
	opacity: 0;
	transition: opacity 1s ease-in-out;
}

.floating-box:hover::before {
	opacity: 1;
}

@
keyframes floatUpDown {from { transform:translateY(0);
	
}

to {
	transform: translateY(10px);
}
}
</style>

<script>
	//왼쪽 페이지 이동
	function moveChange(type) {
		console.log(type)
		if (type == 1) {
			window.location.href = "./member/member.html";
		} else if (type == 2) {
			window.location.href = "./account/acocunt.html";
		} else if (type == 3) {
			window.location.href = "${path}/admin_board.bc";
		} else {
			window.location.href = "${path}/admin.tc";
		}
	}
</script>


</head>

<body class="sb-nav-fixed">
	<!-- 상단 header -->
	<%@ include file="./templet/header.jsp"%>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<!-- 왼쪽 nav -->
			<%@ include file="./templet/nav.jsp"%>
			<a href="${path}/admin.gc">
				<div class="floating-box"></div>
			</a>
		</div>
		<div id="layoutSidenav_content">
			<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">드림즈 관리자 정보</h1>

				<div class="row">
					<div class="col-xl-3 col-md-6">

						<div class="card bg-primary text-white mb-4"
							onclick="moveChange(1)">
							<div class="card-body">회원</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">회원 상세내역</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>

					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-warning text-white mb-4"
							onclick="moveChange(2)">
							<div class="card-body">결제</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">결제 상세내역</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-success text-white mb-4"
							onclick="moveChange(3)">
							<div class="card-body">게시판</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">게시판 상세내역</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-danger text-white mb-4"
							onclick="moveChange(4)">
							<div class="card-body">티켓</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">티켓 내역</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- chart 부분 -->
				<div class="row">
					<!-- // 차트를 그릴 영역으로 canvas태그를 사용한다. -->
					<div class="chartCon">
						<canvas id="myChart" width="900" height="500"></canvas>
					</div>
				</div>

				<script>
					//chartJs

					// 차트를 그럴 영역을 dom요소로 가져온다.
					var chartArea = document.getElementById('myChart')
							.getContext('2d');

					// 차트를 생성한다. 
					var myChart = new Chart(chartArea, {
						// ①차트의 종류(String)
						type : 'bar',
						// ②차트의 데이터(Object)
						data : {
							// ③x축에 들어갈 이름들(Array)
							labels : [ '2023-08', '2023-09', '2023-10',
									'2023-11', '2023-12', '2024-01' ],
							// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
							datasets : [ {
								// ⑤dataset의 이름(String)
								label : '드림즈 회원 현황',
								// ⑥dataset값(Array)
								data : [ 5, 19, 3, 5, 2, 3 ],
								// ⑦dataset의 배경색(rgba값을 String으로 표현)
								backgroundColor : 'rgba(28, 92, 80, 0.2)',
								// backgroundColor: 'rgba(255, 99, 132, 0.2)',
								// ⑧dataset의 선 색(rgba값을 String으로 표현)
								borderColor : 'rgba(28, 92, 80, 0.2)',
								// ⑨dataset의 선 두께(Number)
								borderWidth : 1
							} ]
						},
						// ⑩차트의 설정(Object)
						options : {
							//가로 세로 값 수동 주기위함
							responsive : false,
							// ⑪축에 관한 설정(Object)
							scales : {
								x : {
									beginAtZero : true,
									title : {
										display : true,
										text : '월' // x축 레이블
									}
								},
								y : {
									beginAtZero : true,
									title : {
										display : true,
										text : '회원명' // y축 레이블
									}
								}
							},

							plugins : {
								title : {
									display : true,
								},
							}
						}
					});
				</script>

				<!-- 드림즈 테이블 -->
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 드림즈 회원 가입 목록
					</div>

					<div class="tableContent">
						<input type="hidden" id="nowPage" name="nowPage" value="1">
						<input type="hidden" id="startNum" name="startNum" value="1">
						<input type="hidden" id="endNum" name="endNum" value="15">
						<table id="table" class="table">
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">아이디</th>
									<th scope="col">이름</th>
									<th scope="col">성별</th>
								</tr>
							</thead>
						</table>

						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<!-- 이전페이지 -->
								<li class="page-item prev" onclick="prevPage()"><a
									class="page-link">Previous</a></li>

								<div class="pageBox">
									<div class="pageCon"></div>
								</div>
								<!-- 다음페이지 -->
								<li class="page-item after" onclick="nextPage()"><a
									class="page-link">Next</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; 드림즈 관리자</div>
					</div>
				</div>
			</footer>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${path}/resources/js/admin/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="admin/assets/demo/chart-area-demo.js"></script>
	<script src="admin/assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="admin/js/datatables-simple-demo.js"></script>
	<!-- 드림즈 테이블, chartJs -->
	<script src="${path}/resources/js/admin/admin.js"></script>
</body>

</html>