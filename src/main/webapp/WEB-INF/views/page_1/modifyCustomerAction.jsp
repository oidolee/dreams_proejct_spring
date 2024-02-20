
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/setting.jsp" %>
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
    <title>modifyCustomerAction</title>

</head>
<body>
    
    <div class="wrap">
        <!-- header 시작 -->
        <%@ include file="../layout/header.jsp" %>
        <!-- header 끝 -->
        
        <!-- 컨텐츠 시작 -->
        <div id="container">
            <div id="contents">
                <!-- 상단 중앙1 시작 -->
                <div id="section1">
                    <h1 align="center"> 회원수정 </h1>
                </div>

                <!-- 상단 중앙2 시작 -->
                <div id="section2">
                    <div id="s2_inner">
                        <div class="join">
                            <form name="modifyform" method="post">   <!-- post : 노출x / get : 노출o -->
                           		<c:if test="${updateCnt == 1}">
                           			<script type="text/javascript">
										alert("회원정보 수정 성공!!");
										window.location = "index.cc";
									</script>
                           		</c:if>
                           		
								<c:if test="${updateCnt != 1}">
									<script type="text/javascript">
										alert("회원정보 수정 실패!!");
										window.location = "modifyDetailCustomer.cc";
									</script>
								</c:if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 컨텐츠 끝 -->
        
        <!-- footer 시작 -->
        <%@ include file="../layout/footer.jsp" %>
        <!-- footer 끝 -->
    </div>
</body>
</html>