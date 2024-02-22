<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/setting.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 신재욱 --> 
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>드림즈 소개</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="${path}/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="${path}/css/common/common.css">
    <link rel="stylesheet" href="${path}/css/common/header.css">
    <link rel="stylesheet" href="${path}/css/common/footer.css">
    <link rel="stylesheet" href="${path}/css/index.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${path}/js/bootstrap/bootstrap.bundle.js"></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- header.js -->
    <script src="${path}/js/common/header.js"></script>

    <script>
        // 페이지 로드 후 실행될 함수
        $(document).ready(function () {
            // top 버튼 클릭 시 스크롤
            $('#goTop a[href="#header"]').on('click', function (e) {
                window.scroll({
                    top: 0,
                });
                checkButton();
            });
        });

        //크롬 스크롤 오류로 시간 지정 후 동장
        $(window).on("scroll", function () {
            $("#goTop a").attr("href", "#none")
            $("#goTop").css({ "background-color": "rgba(255, 255, 255, 0.1)" });
            setTimeout(() => {
                $("#goTop a").attr("href", "#header")
                $("#goTop").css({ "background-color": "rgba(255, 255, 255, 0.7)" });
            }, 2000);
        })

    </script>
    <style>
        .slider-con img{
            width: 100%;
        }

        .intro-content {
            text-align: center;

        }

        .intro-logo {
            text-align: center;
        }
    </style>
</head>

<body>
    	<!-- 상단 이동 헤더 -->
        <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
 
        <div id="slider_con" class="slider-con">
            <img src="${path}/resources/image/banner/category_DREAMS.jpg">
        </div>
        <br>


        <div class="intro-logo">
            <img src="${path}/resources/image/logoSmall.png">
        </div>    
        
        
        <div class="intro-content">
           
            <div class="intro-title">
                <h2 style="font-weight: bold; color: #000 !important;"><br>구단 인사말</h2><br><br>
            </div>
            <div style="color: #000 !important;">
                팬 여러분의 변함없는 응원과 함께 성장해 가고 있는 드림즈 프로야구단입니다.<br><br>
                20XX년 서울을 연고로 창단한 드림즈 프로야구단은<br>
                언제나 팬 여러분과 함께였습니다.<br>
                변함없는 열정으로 응원해 주시는 팬 여러분이 계시기에<br>
                드림즈 프로야구단은 매 시즌 조금씩 높은 곳을 바라볼 수 있었습니다.<br><br>

                최선을 다하는 플레이로 보답하겠습니다.<br>
                그 동안 우승을 위해 흘렸던 땀과 눈물을 잊지 않겠습니다.<br>
                매 시즌, 조금 더 높은 곳에서<br>
                팬 여러분과 함께 기쁨의 눈물을 흘릴 수 있도록<br>
                저희 선수단과 임직원 모두는 최선을 다하겠습니다.<br><br>

                변함없는 응원에 항상 감사드립니다.<br><br><br><br><br>
            
            </div>
        </div>
		<!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
    </body>

</html>