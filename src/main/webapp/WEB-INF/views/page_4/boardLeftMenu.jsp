<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 강승재 -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>board좌측메뉴</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/resources/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="${path}/resources/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="${path}/resources/css/common/common.css">
    <link rel="stylesheet" href="${path}/resources/css/common/header.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${path}/resources/js/bootstrap/bootstrap.bundle.js"></script>
</head>
<body>
	<div id="left">
        <div class="left_inside">
            <!-- 좌측메뉴바 시작 -->
			<ul class="left_menubar">
                <li><h3 style="color: white !important;">Board</h3></li>
				<li>
                    <ul class="product_menu">
						<p></p>
						<li><a href="${path}/resources/page_4/news.jsp">구단 소식</a></li>
						<li><a href="${path}/dreamsBoard.bc">드림즈게시판</a></li>
						<li><a href="${path}/resources/page_4/qna.jsp">안내 및 Q&A</a></li>
					</ul>
				</li>	
			</ul>	
			<!-- 좌측메뉴바 종료 -->
		</div>
	</div>
</body>
</html>