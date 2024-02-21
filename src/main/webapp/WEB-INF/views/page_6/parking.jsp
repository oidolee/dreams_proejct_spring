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
    <title>주차안내</title>
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
            
        }


        #parking-container {
            margin: auto;
            text-align: center;
            vertical-align: auto;
            padding: 5px;
            
        }

        #parking-container th, td {
            border: 1px solid black !important;
        }
        
        .table {
            text-align: center;
            vertical-align: auto;
            border: 1px solid;
        }

        .table-title {
            font-weight: bold !important;
            border: 1px solid black !important;
        }

        .menuLink {
            color: black !important;
            font-weight: bold !important;
        }

        thead {
            vertical-align: middle !important;
            border-bottom: #000 2px solid !important;
            border-top: #000 2px solid !important; 
        }
        tbody {
            border-collapse: separate;
            text-align: center;
            vertical-align: middle !important;
        }

        tbody td {
            color: #000 !important;
        }

        thead tr th {
            color: #000 !important;
        }

        .table {
            width: 1280px !important;
            margin: 0 auto;
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
            <h2 style="font-weight: bold; color: #000 !important;"><br><br>주차안내</h2><br>
            <ul class="stadium-tab">
                <li><a class="menuLink" href="${path}/resource/page_6/stadium.jsp">고척 스카이돔</a></li>
                <li><a class="menuLink" href="${path}/resource/page_6/amenity.jsp">편의시설</a></li>
                <li><a class="menuLink" href="${path}/resource/page_6/location.jsp">찾아오시는 길</a></li>
                <li style="
                width: 151px;
                background: #1c5c50;
                height: 50px;
                line-height: 50px;
                border-radius: 20px;"><a class="menuLink" href="${path}/resource/page_6/parking.jsp" style="color: #FFF !important">주차안내</a></li>
            </ul><br><br><br>

            <div>
                <h4><img src="https://heroesbaseball.co.kr/html/front/web_2018/images/heroes/imgTrafficParking_230320.png" alt="주차안내" ></h4>
            </div>
        </div>
        <br>
        <br>


        
        <table class="table table-striped">
                <thead>
                    <tr>
                        <th class="table-title">구분<br></th>
                        <th class="table-title">위치<br>(주소)</th>
                        <th class="table-title">거리<br>돔<->주차장</th>
                        <th class="table-title">운영시간</th>
                        <th class="table-title">이용요금</th>
                        <th class="table-title">주차면수</th>
                        <th class="table-title">주차장 진입방면 위치</th>
                    </tr>		
                </thead>
                
            
                <tbody>
                    <tr>
                        <td>고척산업용품<br>종합상가</td>
                        <td>서울시 구로구<br>중앙로3길 50</td>
                        <td>800m<br>(도보10분)</td>
                        <td>24시간</td>
                        <td>30분<hr>1,000원</td>
                        <td>약1,000면</td>
                        <td>인천 방면에서<br>오시는분</td>

                    </tr>
                    <tr>
                        <td>중앙<br>유통단지</td>
                        <td>서울시 구로구<br>경인로 53길 15</td>
                        <td>700m<br>(도보10분)</td>
                        <td>24시간</td>
                        <td>30분<hr>1,000원</td>
                        <td>약4,000면</td>
                        <td>서울 방면에서<br>오시는분</td>
                    </tr>
                    <tr>
                        <td>구로기계<br>공구상가</td>
                        <td>서울시 구로구<br>구로중앙로 198</td>
                        <td>1,300m<br>(도보15분)</td>
                        <td>24시간</td>
                        <td>30분<hr>1,000원</td>
                        <td>약4,000면</td>
                        <td>서울 방면에서<br>오시는분</td>
                    </tr>
                    <tr>
                        <td>동양미래<br>대학교</td>
                        <td>서울시 구로구<br>경인로 445</td>
                        <td>50m<br>(도보3분)</td>
                        <td>08:00 ~<br>23:00</td>
                        <td>1시간<hr>3,000원</td>
                        <td>약320면</td>
                        <td>서울 방면에서<br>오시는분</td>	
                    </tr>
                    <tr>
                        <td>아이파크몰<br>고척점</td>
                        <td>서울시 구로구<br>경인로 43길 49</td>
                        <td>1,000m<br>(도보13분)</td>
                        <td>24시간</td>
                        <td>10분<hr>1,000원</td>
                        <td>약380면</td>
                        <td>서울 방면에서<br>오시는분</td>	
                    </tr>
                </tbody>
                
            
            </table><br><br><br>

        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
    </body>

</html>