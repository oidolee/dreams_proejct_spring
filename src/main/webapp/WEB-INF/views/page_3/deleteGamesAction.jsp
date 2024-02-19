<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../layout/setting.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 경기일정 및 운영 작업자 : 이민진 -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>경기일정 및 결과</title>

<link rel="stylesheet" href="${path}/resource/css/common/reset.css">
<!-- Bootstrap css-->
<link href="${path}/resource/css/bootstrap/bootstrap.css"
	rel="stylesheet" />

<!-- jQuery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<!-- swiper js-->
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
	crossorigin="anonymous"></script>
<script src="${path}/resource/js/common/header.js"></script>

<link rel="stylesheet" href="${path}/resource/css/common/common.css">
<link rel="stylesheet" href="${path}/resource/css/common/header.css">
<link rel="stylesheet" href="${path}/resource/css/common/footer.css">
<link rel="stylesheet" href="${path}/resource/page_3/css/games.css">

<!-- 경기일정 css -->
<link rel="stylesheet"
	href="${path}/resource/page_3/calenderJs/calender.css">
<style>
.container-box {
	padding: 0;
}

input:focus {
	outline: none;
}

.slider-con img {
	width: 100%;
}

.center {
	max-width: 1240px;
	margin: 0 auto;
}

.section-1-con {
	height: 440px;
}

.section-1 {
	height: 100%;
	padding: 80px 0;
}

.section-1-top h2 {
	text-align: center;
}

.section-1-top h2 a {
	color: #000 !important;
}

.section-1-bottom ul {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding-top: 40px;
	padding-left: 0;
}
</style>
<script type="text/javascript">
	$(function(){
		if(${deleteCnt != 0}){
			alert("삭제 되었습니다.");
		}else {
			alert("다시 확인해 주세요.");
		}
		location.href = "./games.gc";
	})	   
</script>


</head>
<div class="wrap">
	<body>
		<!-- header -->
		<%@include file="../layout/header.jsp"%>

		<div class="slider-con">
			<div class="slider-box">
				<img src="${path}/resource/image/banner/category_STATS.jpg" alt="">
			</div>
		</div>
		<!-- 상단 중앙1 시작 -->
		<div style="display: flex; justify-content: center;" class="board">

			<!-- 좌측메뉴 시작 -->
			<div id="left">
				<div class="left_inside">
					<!-- 좌측메뉴바 시작 -->
					<ul class="left_menubar">
						<li><h3 style="color: white !important;">GAMES</h3></li>
						<li>
							<ul class="product_menu">
								<p></p>
								<li><a href="${path}/games.gc">경기일정 및 결과</a></li>
								<li><a href="${path}/gamesInsert.gc">경기일정 등록<br>(관리자)
								</a></li>
							</ul>
						</li>
					</ul>
					<!-- 좌측메뉴바 종료 -->
				</div>
			</div>
			<!-- 좌측메뉴 종료 -->
			delete
		
		</div>

		<!-- footer -->
		<%@include file="../layout/footer.jsp"%>
	</body>
</div>

</html>