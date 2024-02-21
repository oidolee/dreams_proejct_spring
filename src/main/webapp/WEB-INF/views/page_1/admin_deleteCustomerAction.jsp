<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../../WEB-INF/views/layout/setting.jsp" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- 반응형 웹-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/common/header.css">
    <link rel="stylesheet" href="${path}/resources/css/common/footer.css">
    <link rel="stylesheet" href="${path}/resources/css/customer/join.css">

    <script src="https://kit.fontawesome.com/48086a0d4e.js" crossorigin="anonymous"></script>
    <!-- (3-3-2). 자바스크립트 소스 추가 :  -->
    <!-- defer : 모든 html 파일을 로딩할때까지 html이 브라우저창에 표시가 안되는 것을 방지 -->
    <script src="${path}/resources/js/customer/main.js" defer></script>
    <title>deleteCustomer</title>

</head>
<body>
    
    <div class="wrap">
        <!-- header 시작 -->
        <%@ include file="../../../WEB-INF/views/layout/header.jsp" %>
        <!-- header 끝 -->
        
        <!-- 컨텐츠 시작 -->
        <div id="container">
            <div id="contents">
                <!-- 상단 중앙1 시작 -->
                <div id="section1">
                    <h1 align="center"> 영구삭제 </h1>
                </div>

                <!-- 상단 중앙2 시작 -->
                <div id="section2">
                    <div id="s2_inner">
                        <div class="join">
                            <form name="deleteform" method="post">   <!-- post : 노출x / get : 노출o -->
                            		<script type="text/javascript">
	                            		alert("영구삭제 성공!!");
	                            		window.location = "admin_member.cc";
	                            	</script>
                            </form>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        <!-- 컨텐츠 끝 -->
        
        <!-- footer 시작 -->
        <%@ include file="../../../WEB-INF/views/layout/footer.jsp" %>
        <!-- footer 끝 -->
    </div>

</body>
</html>