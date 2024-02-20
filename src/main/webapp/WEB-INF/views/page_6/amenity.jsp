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
    <title>편의시설</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="${path}/resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
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

        #amenity-container {
            margin: auto;
        }

        .stadium-contents {
            text-align: center;
        }

        .stadium-tab li {
           
           list-style: none;
           display: inline-block;
           width: 150px;
           font-weight: bold;
        }

        .stadium-tab .menuLink:hover {
            color: #1c5c50 !important;
            
        }

        .menuLink {
            color: black !important;
            font-weight: bold !important;
        }

        .card-title {
            font-weight: bold;
        }
        
        .amenity-fluid {
            width: 1280px;
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


        <div class="stadium-contents">
            <h2 style="font-weight: bold; color: #000 !important;"><br>편의시설</h2><br>
            <ul class="stadium-tab">
                <li><a class="menuLink" href="${path}/resource/page_6/stadium.jsp">고척 스카이돔</a></li>
                <li style="
                width: 151px;
                background: #1c5c50;
                height: 50px;
                line-height: 50px;
                border-radius: 20px;"><a class="menuLink" href="${path}/resource/page_6/amenity.jsp" style="color: #FFF !important">편의시설</a></li>
                <li><a class="menuLink" href="${path}/resource/page_6/location.jsp">찾아오시는 길</a></li>
                <li><a class="menuLink" href="${path}/resource/page_6/parking.jsp">주차안내</a></li>
            </ul><br><br>

            <div>
                <img src="https://www.heroesbaseball.co.kr/files/facilities.1/2023/03/08/08feb124-8971-4621-ac75-f4415d552250.jpg" alt="편의시설" >
                
            </div>
        </div>
        <br>
        <br>

        <div class="amenity-fluid">
            <!-- 1행 -->
            <div class="row">
                <!-- 1열 -->
                  <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">1. 피자</h5>
                        <p class="card-text"><br>불고기, 페페로니 피자<br><hr></p>
                        <p class="card-text">2번 통로 맞은편</p>
                      </div>
                    </div>
                  </div>
              
                <!-- 2열 -->
                  <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">2. 편의점</h5>
                        <p class="card-text">캔맥주, 음료, <br>각종 스낵, 마른 안주<hr></p>
                        <p class="card-text">2번 통로 맞은편</p>
                      </div>
                    </div>
                  </div>
              
                <!-- 3열 -->
                  <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">3. 닭꼬치, 새우튀김</h5>
                        <p class="card-text">닭꼬치, 크림 <br>새우, 생맥주<hr></p>
                        <p class="card-text">4번 통로 맞은편</p>
                      </div>
                    </div>
                  </div>
             
                <!-- 4열 -->
                  <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">4. 편밀밀</h5>
                        <p class="card-text">만두라자냐, 만두고로케, <br>체다치즈멘보샤<hr></p>
                        <p class="card-text">4번 통로 맞은편</p>
                      </div>
                    </div>
                  </div>
            </div> <!-- row --> 
            <!-- ************************************************************************* -->
            <!-- 2행 -->
                <br>
            <div class="row">
                <!-- 1열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">7. 드림즈 용품점</h5>
                        <p class="card-text">선수 레플리카, 모자, 응원도구<hr></p>
                        <p class="card-text">7번 통로 맞은편</p>
                      </div>
                    </div>
                </div>
              
                <!-- 2열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">8. 원정용품점</h5>
                        <p class="card-text">선수 레플리카, 모자, 응원도구<hr></p>
                        <p class="card-text">7번 통로 맞은편</p>
                      </div>
                    </div>
                </div>
              
                <!-- 3열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">9. 피자</h5>
                        <p class="card-text">불고기, 페페로니 피자<hr></p>
                        <p class="card-text">8번 통로 맞은편</p>
                      </div>
                    </div>
                </div>
              
                <!-- 4열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">10. 올떡볶이</h5>
                        <p class="card-text">떡볶이, 어묵, 순대<hr></p>
                        <p class="card-text">9번 통로 맞은편</p>
                      </div>
                    </div>
                </div> <!-- row  -->
            </div>    
            <!-- ************************************************************************* -->
            <!-- 3행 -->
            <br>
            <div class="row">
                <!-- 1열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">11. 편의점</h5>
                        <p class="card-text">캔맥주, 음료, <br>각종 스낵, 마른 안주<hr></p>
                        <p class="card-text">11번 통로 맞은편</p>
                      </div>
                    </div>
                </div>
              
                <!-- 2열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">12. 스테프핫도그</h5>
                        <p class="card-text"><br>스테프핫도그, 메디스터 소시지<hr></p>
                        <p class="card-text">11번 통로 맞은편</p>
                      </div>
                    </div>
                </div>
              
                <!-- 3열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">13. 맘스터치</h5>
                        <p class="card-text">싸이버거, 불싸이버거, <br>불고기버거<hr></p>
                        <p class="card-text">3-4번 통로 사이</p>
                      </div>
                    </div>
                </div>
              
                <!-- 4열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">13. BBQ</h5>
                        <p class="card-text"><br>핫윙, 파더스 치킨, 황금 치즈볼<hr></p>
                        <p class="card-text">3~4번 통로 사이</p>
                      </div>
                    </div>
                </div> 
            </div>    <!-- row  -->
            <!-- ************************************************************************* -->
            <!-- 4행 -->
            <br>
            <div class="row">
                <!-- 1열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">14. 올떡볶이</h5>
                        <p class="card-text"><br>떡볶이, 어묵, 순대<hr></p>
                        <p class="card-text">3~4번 통로 사이</p>
                      </div>
                    </div>
                </div>
              
                <!-- 2열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">15. 탐앤탐스</h5>
                        <p class="card-text"><br>아메리카노, 스무디<hr></p>
                        <p class="card-text">3-4번 통로 사이</p>
                      </div>
                    </div>
                </div>
              
                <!-- 3열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">16. 스테프 핫도그</h5>
                        <p class="card-text"><br>스테프 핫도그, 메디스터 소시지<hr></p>
                        <p class="card-text">3-4번 통로 사이</p>
                      </div>
                    </div>
                </div>
              
                <!-- 4열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">17. BHC(가판)</h5>
                        <p class="card-text">순살 뿌링클, 바삭클 치즈볼, <br>뿌링 핫도그<hr></p>
                        <p class="card-text">5번, 9번 통로 맞은편</p>
                      </div>
                    </div>
                </div> <!-- row  -->
            </div>
        
            <!-- ************************************************************************* -->
            <!-- 5행 -->
            <br>
            <div class="row">
                <!-- 1열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">18. 마왕족발</h5>
                        <p class="card-text"><br>족발 도시락, 족발 만두<hr></p>
                        <p class="card-text">9~10번 통로 사이</p>
                      </div>
                    </div>
                </div>
              
                <!-- 2열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">19. 맘스터치</h5>
                        <p class="card-text">싸이버거, 불싸이버거, <br>불고기버거<hr></p>
                        <p class="card-text">9~10번 통로 사이</p>
                      </div>
                    </div>
                </div>
              
                <!-- 3열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">19. BBQ</h5>
                        <p class="card-text"><br>핫윙, 파더스 치킨, 황금 치즈볼<hr></p>
                        <p class="card-text">9~10번 통로 사이</p>
                      </div>
                    </div>
                </div>
              
                <!-- 4열 -->
                <div class="col-sm-3">
                    <div class="card">
                      <div class="card-body">
                        <h5 class="card-title">20. 투다리</h5>
                        <p class="card-text"><br>닭꼬치, 야끼 교자 만두, 회오리 감자<hr></p>
                        <p class="card-text">9-10번 통로 사이</p>
                      </div>
                    </div>
                </div> <!-- row  -->
            

            </div>
        </div>
        <br><br><br><br><br><br>
        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
    </body>

</html>