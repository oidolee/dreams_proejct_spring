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
    <title>고척 스카이돔</title>
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
        /* 반응형 */
        @media screen and (max-width:960px) {
            .footer-1{padding: 30px;}
            .section-1-bottom ul{
                flex-direction: column;
            }

            .footer-list-box{
                flex-direction: column;
            }

            .footer-list-box .item-box ul{justify-content: center;}
            .txt-add{text-align: center;}
        }

        @media screen and (max-width:560px) {
            .footer-1{font-size: 14px;}
            .footer-list-box{flex-direction: row;}
            .link-list{flex-direction: column;}
            .footer-list-box{flex-direction: column;}
            .link-list{align-items: center;}
        }   

        .stadium-content {
            text-align: center;
            
        }

        .stadium-skydome {
            text-align: center;
        }

        .stadium-skydome-detail li{
            margin-left: auto;
            margin-right: auto;
            
        }

        .stadium-tab {
            margin: auto;
            height: 30px; 
            width: 850px;
        }

        .stadium-tab li {
            list-style: none;
            display: inline-block;
            width: 150px;
            font-weight: bold;
            margin: 0;
            
        }

        .stadium-tab .menuLink:hover {
            color: #1c5c50 !important;
        }

        .stadium-detail-table {
            display: inline-block;
            padding: 10px;
            border-spacing: 10px;
            border-collapse: separate;
        }

        .menuLink {
            color: black !important;
            font-weight: bold !important;
        }
    </style>
</head>

<body>
    	<!-- 상단 이동 헤더 -->
        <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
 
        <div id="slider_con" class="slider-con">
            <img src="${path}/resource/image/banner/category_DREAMS.jpg">
        </div>
        <br>

        <div class="stadium-content">
            <h2 style="font-weight: bold; color: #000 !important;"><br><br>고척 스카이돔</h2><br>
            <ul class="stadium-tab">
                <li style="
                    width: 151px;
                    background: #1c5c50;
                    height: 50px;
                    line-height: 50px;
                    border-radius: 20px;"><a class="menuLink" href="${path}/resource/page_6/stadium.jsp" style="color: #FFF !important">고척 스카이돔</a></li>
                <li><a class="menuLink" href="${path}/resource/page_6/amenity.jsp">편의시설</a></li>
                <li><a class="menuLink" href="${path}/resource/page_6/location.jsp">찾아오시는 길</a></li>
                <li><a class="menuLink" href="${path}/resource/page_6/parking.jsp">주차안내</a></li>
            </ul><br>
        </div>
        <br>
        <br>

            <div class="stadium-skydome">
                <h4><img src="https://www.heroesbaseball.co.kr/html/front/web/images/heroes/bgSkydome.jpg" alt="고척 스카이돔" ></h4>
                <div class="stadium-skydome-detail">
                    <br>
                    <table class="stadium-detail-table">
                    <tr> 
                        <td style="font-size: large; color: black !important;">· 서울특별시 구로구 경인로 430</td>
                    </tr>
                    <tr>
                        <td style="font-size: large; color: black !important;">· 규모 지하2층, 지상 4층</td>
                    </tr>
                    <tr>
                        <td style="font-size: large; color: black !important;">· 연면적 83,623㎡(대지면적58,992㎡, 건축면적 29,120㎡)</td>
                    </tr>
                    <tr>
                        <td style="font-size: large; color: black !important;">· 관람석 16,744석</td>
                    </tr>
                    <tr>
                        <td style="font-size: large; color: black !important;">· 중앙펜스 122m, 좌우펜스 99m, 펜스높이4m</td>
                    </tr>
                    </table>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    
        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
    </body>

</html>