<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file = "layout/setting.jsp" %>  
<html lang="ko"> 
<!-- 페이지 작업자 : 이민진 -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>드림즈</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/resources/css/common/reset.css">
       <!-- Bootstrap css-->
    <link rel="stylesheet" href="${path}/resources/css/bootstrap/bootstrap.css"  />
    <!-- swiper css-->
    <link rel="stylesheet" href="./resources/css/common/common.css">
    <link rel="stylesheet" href="./resources/css/common/header.css">
    <link rel="stylesheet" href="./resources/css/common/footer.css">
    <link rel="stylesheet" href="./resources/css/index.css">

    <!-- jQuery -->
    <script  src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- swiper js-->
    <script  src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script  src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- scrollreveal -->
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    
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
		  $(window).on("scroll", function() {
		    $("#goTop a").attr("href", "#none");
		    $("#goTop").css({ "background-color": "rgba(255, 255, 255, 0.1)" });
		    setTimeout(function() {
		        $("#goTop a").attr("href", "#header");
		        $("#goTop").css({ "background-color": "rgba(255, 255, 255, 0.7)" });
		    }, 2000);
		});


    </script>
</head>
<div class="wrap">
    <!-- 제일 먼저 나오는 부분 -->
    <div class="first-bg">
        <div class="text-box">
            <h2 class="first-title">Let'go Dreams!</h2>
            <div class="floating-box center"></div>
        </div>
        <img src="./resources/image/main/firstBg.png" alt="firstBg" id="bgImage">
    </div>

    <!-- 상단 이동 헤더 -->
    <div id="header"></div>
    <body>
    	<jsp:include page="./layout/header.jsp"></jsp:include> 
      
        <div id="slider_con" class="slider-con">
            <div class="slider-box">
                <swiper-container class="mySwiper" pagination="true" pagination-clickable="true" navigation="true" space-between="30" centered-slides="true"  autoplay-delay="2000" autoplay-disable-on-interaction="false" >
                <!-- <swiper-container class="mySwiper" pagination="true" pagination-clickable="true" navigation="true" space-between="30" centered-slides="true" > -->
                    <swiper-slide><img style="width: 100%;" src="./resources/image/main/dreams_main_01.jpg" alt="main"></swiper-slide>
                    <swiper-slide><img style="width: 100%;" src="./resources/image/main/dreams_main_02.jpg" alt="main"></swiper-slide>
                    <swiper-slide><img style="width: 100%;" src="./resources/image/main/dreams_main_03.jpg" alt="main"></swiper-slide>
                </swiper-container>

            </div>
        </div>

        <section class="section-1-con">
            <div class="section-1 center">
                <div class="section-1-top">
                    <h2><a href="#">드림즈 바로가기</a></h2>
                </div>
                <div class="section-1-bottom">
                    <ul>
                        <li>
                            <a href="./resources/page_2/ticketFee.html" target="_blank">
                                <img src="./resources/image/main/dreams_char.png"alt="">
                            </a>
                        </li>
                        <li>
                            <a href="https://www.instagram.com/explore/tags/%EC%8A%A4%ED%86%A0%EB%B8%8C%EB%A6%AC%EA%B7%B8/top/" target="_blank">
                                <img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/index/btn_link_toolbar_item2.png" alt="">
                            </a>
                        </li>
                        <li>
                            <a href="https://www.facebook.com/watch/sbsdrama.official/2552511298297818/" target="_blank">
                                <img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/index/btn_link_toolbar_item3.png" alt="">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </section>

        <section class="section-2-con">
            <div class="news-1">
                <div class="news-title">
                    <h3>드림즈 구단 소식</h3>
                    <a href="#">더보기</a>
                </div>
                <ul class="news-bottom-1 first">
                    <li>
                        <div class="card" style="width: 18rem;">
                            <div class="imgBox imgBox_1"></div>
                            <div class="card-body">
                                <h5 class="card-title">장진우 5년계약!</h5>
                                <p class="card-text">드림즈 1선발 장진우 <br> 5년 150억 계약!</p>
                                <a href="./resources/page_4/news.html" class="btn grean">더보기</a>
                            </div>
                        </div>
    
                        <div class="card" style="width: 18rem;">
                            <div class="imgBox imgBox_2"></div>
                            <div class="card-body">
                                <h5 class="card-title">드림즈 미래!</h5>
                                <p class="card-text">신촌고 1선발 유민호 선수 <br> 드래프트 완료</p>
                                <a href="./resources/page_4/news.html" class="btn grean">더보기</a>
                            </div>
                        </div>
                    </li>
                
                    <li>
                        <div class="card" style="width: 18rem;">
                            <div class="imgBox imgBox_3"></div>
                            <div class="card-body">
                                <h5 class="card-title">백승수 단장 인터뷰!</h5>
                                <p class="card-text">새롭게 영입된 백승수 단장 <br> 올해 목표는 ? </p>
                                <a href="./resources/page_4/news.html" class="btn grean">더보기</a>
                            </div>
                        </div>
    
                        <div class="card" style="width: 18rem;">
                            <div class="imgBox imgBox_4"></div>
                            <div class="card-body">
                                <h5 class="card-title">드림 서포터즈!</h5>
                                <p class="card-text">드림즈 서포터즈 모집! <br> 지금 참여하세요!</p>
                                <a href="./resources/page_4/news.html" class="btn grean">더보기</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
     
        </section>

        <section class="section-2-con" style="padding-top: 0;">
            <div class="news-1">
                <div class="news-title">
                    <h3>드림즈 영상</h3>
                    <a href="#">더보기</a>
                </div>
                <ul class="news-bottom-1 second">
                    <div class="card">
                        <div class="imgBox_second imgBox_5"></div>
                        <div class="card-body">
                            <h5 class="card-title">돌부처 장진우</h5>
                            <p class="card-text">드림즈의 돌부처 장진우 선수를 알아보자!</p>
                            <a href="https://www.youtube.com/watch?v=LJ5K34BEjm8&t=15s" target="_blank" class="btn grean">더보기</a>
                        </div>
                    </div>

                    <div class="card">
                        <div class="imgBox_second imgBox_6"></div>
                        <div class="card-body">
                            <h5 class="card-title">드림즈 안방마님</h5>
                            <p class="card-text">드림즈 안방마님 서영주 선수를 알아보자!</p>
                            <a href="https://www.youtube.com/watch?v=hwutge1VAz8" target="_blank" class="btn grean">더보기</a>
                        </div>
                    </div>

                    <div class="card">
                        <div class="imgBox_second imgBox_7"></div>
                        <div class="card-body">
                            <h5 class="card-title">선수들의 이야기</h5>
                            <p class="card-text">프렌차이즈 스타 3인방 인터뷰!</p>
                            <a href="https://www.youtube.com/watch?v=ATwoWkRuWMU&t=39s" target="_blank" class="btn grean">더보기</a>
                        </div>
                    </div>


                </ul>
            </div>
        </section>

        <section class="section-3-con">
            <div class="section-3">
                <dl>
                    <dt>
                        <h2 style="font-size: 35px; font-weight: 600;">All about DREAMS</h2>
                        <P>드림즈의 다양한 채널과 함께하세요.</P>
                    </dt>
                    <dd class="icons">
                        <ul>
                            <li>
                                <a href="https://www.youtube.com/results?search_query=%EC%8A%A4%ED%86%A0%EB%B8%8C%EB%A6%AC%EA%B7%B8" target="_blank">
                                    <img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/index/btn_about_item1.png"
                                        alt="youtube">
                                </a>
                            </li>
                            <li>
                                <a href="https://www.instagram.com/explore/tags/%EC%8A%A4%ED%86%A0%EB%B8%8C%EB%A6%AC%EA%B7%B8/top/" target="_blank">
                                    <img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/index/btn_about_item2.png"
                                    alt="instagram">
                                </a>
                                
                            </li>
                            <li>
                                <a href="https://www.facebook.com/watch/sbsdrama.official/2552511298297818/" target="_blank">
                                    <img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/index/btn_about_item3.png"
                                    alt="facebokk">
                                </a>
                            </li>
                        </ul>
                    </dd>
                </dl>
            </div>
        </section>
        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
		<%-- <c:if test='${sessionID.equals("admin")}'> --%>
		    <a href="${path}/admin.gc">
		        <div class="floating-box left"></div>
		    </a>
		<%-- </c:if> --%>

     	<jsp:include page="./layout/footer.jsp"></jsp:include> 
        
        <script>
            //메인 스크롤 이벤트 
            window.sr = ScrollReveal({ reset: true });
            let SRArr = ['.first-title','.slider-con','.section-1-con','.section-2-con','.section-3-con','footer'];
            SRArr.forEach(selector => {
                sr.reveal(selector, { 
                    origin: 'bottom', distance: '100px', duration: 2000,
                    viewFactor: 0.1 // 10%만 보이면 나타나도록 설정
                });
            });
            ScrollReveal().reveal('.headline');
        </script>
    </body>
</div>

</html>