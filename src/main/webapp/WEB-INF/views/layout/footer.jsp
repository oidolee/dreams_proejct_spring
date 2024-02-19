<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 이민진 -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>드림즈</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="/dreams_project_2/resources/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="../resources/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="/dreams_project_2/resources/css/common/common.css">
    <link rel="stylesheet" href="/dreams_project_2/resources/css/common/footer.css">
    <link rel="stylesheet" href="/dreams_project_2/resources/css/index.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="./resources/js/bootstrap/bootstrap.bundle.js"></script>
    

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

            $(".floating-box.center").on("click",function(){
                $(".first-bg").hide();
            })
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
</head>
<div class="wrap">

    <body>
        <footer>
            <div class="footer-1 center">
                <div class="footer-list-box">

                    <div class="item-box">
                        <ul class="link-list">
                            <li><a href="#">개인정보처리방침</a></li>
                            <li><a href="#">이용약관</a></li>
                            <li><a href="#">이메일무단수집거부</a></li>
                            <li><a href="#">안내 및 Q&amp;A</a></li>
                            <li><a href="#">사이트맵</a></li>
                        </ul>
                        <div class="txt-add">
                            서울특별시 구로구 경인로 430(고척동, 고척스카이돔구장내) T.02-3660-1000 F.02-3660-1099<br>
                            Copyright (C) Heroes, All Rights Reserved.
                        </div>
                    </div>
                    <div class="item-box">
                        <a href="${path}/index.jsp">
                            <img src="/dreams_project_2/resources/image/logoSmall.png" alt="드림즈 프로야구단" style="width: 200px;">
                        </a>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</div>

</html>