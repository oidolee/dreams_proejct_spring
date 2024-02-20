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
    <title>찾아오시는 길</title>
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
        
        /*  */
        

        .stadium-content {
            text-align: center;
            
        }

        .stadium-tab li {
           
           list-style: none;
           display: inline-block;
           width: 150px;
           font-weight: bold;
           margin: 0;
        }
        .stadium-tab {
            margin: auto;
            height: 30px; 
            width: 850px;
            
           
        }

        .stadium-tab .menuLink:hover {
            color: #1c5c50 !important;
            
        }

        .table {
            text-align: center;
            vertical-align: auto;
            border: 1px solid #000 !important;
            border-top: 2px solid #000 !important;
            border-bottom: 2px solid #000 !important;
            width: 1280px !important;
            margin: 0 auto ;
            
        }

        .menuLink {
            color: black !important;
            font-weight: bold !important;
        }

        thead {
            vertical-align: middle !important;
            border: #000 1px solid;
            border-bottom: #000 2px solid;
        }

        thead th {
            color: #000 !important;
            border: #000 1px solid;
            border-bottom: #000 2px solid !important;
        }


        tbody {
            vertical-align: middle !important;
            border: #000 1px solid !important;
        }

        tbody  tr td {
            color: #000 !important;
            border: #000 1px solid !important;
        }

        tbody tr th {
            color: #000 !important;
            border: #000 1px solid !important;
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
            <h2 style="font-weight: bold; color: #000 !important;"><br><br> 찾아오시는 길</h2><br>
            <ul class="stadium-tab">
                <li><a class="menuLink" href="${path}/resource/page_6/stadium.jsp">고척 스카이돔</a></li>
                <li><a class="menuLink" href="${path}/resource/page_6/amenity.jsp">편의시설</a></li>
                <li style="
                width: 151px;
                background: #1c5c50;
                height: 50px;
                line-height: 50px;
                border-radius: 20px;"><a class="menuLink" href="${path}/resource/page_6/location.jsp" style="color: #FFF !important">찾아오시는 길</a></li>
                <li><a class="menuLink" href="${path}/resource/page_6/parking.jsp">주차안내</a></li>
            </ul><br><br><br>

            <div>
                <img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/heroes/imgTrafficSubway_2023.png" alt="찾아오시는 길" >
            </div>
        </div>
        <br>
        <br>

            <div>
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col" style="font-weight: bold;">방법</th>
                        <th scope="col" style="font-weight: bold;">지하철역</th>
                        <th scope="col" style="font-weight: bold;">호선</th>
                        <th scope="col" style="font-weight: bold;">오시는 길</th>
                      </tr>
                    </thead>
                    <tbody class="table-group-divider">
                      <tr>
                        <th scope="row">1</th>
                        <td>신도림역</td>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web/images/heroes/icoLine01.png"> <img src="https://www.heroesbaseball.co.kr/html/front/web/images/heroes/icoLine02.png"></td>
                        <td colspan="8">1번, 5번 출구에서 버스 이용 시 3정거장 소요<br>버스 : 160번 외 9개 노선운행</td>
                      </tr>
                      <tr>
                        <th scope="row">2</th>
                        <td>구로역</td>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web/images/heroes/icoLine01.png"></td>
                        <td>2번 출구에서 좌회전하여 1km 직진 후, 고척교 건너 좌측 위치(도보 약 20분)<br>버스: 5712번, 5626번</td>
                      </tr>
                      <tr>
                        <th scope="row">3</th>
                        <td>개봉역</td>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web/images/heroes/icoLine01.png"></td>
                        <td>2번 출구에서 200m 직진 후, 우회전하여 650m 직진 후 우측 위치(도보 약 15분)<br>버스: 마을버스06번 (고척교 방향)</td>
                      </tr>
                      <tr>
                        <th scope="row">4</th>
                        <td>구일역</td>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web/images/heroes/icoLine01.png"></td>
                        <td>2번 출구에서 약 100m 직진 후 고척스카이돔 정면 출입문 게이트 통해 입장 (도보 약 3분)<br>버스 이용 필요 없음</td>
                      </tr>
                    </tbody>
                </table>
            </div>

        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
    </body>

</html>