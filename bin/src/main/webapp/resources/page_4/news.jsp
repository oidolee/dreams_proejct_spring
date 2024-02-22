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
    <title>구단소식</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/resources/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="./resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="${path}/resources/css/common/common.css">
    <link rel="stylesheet" href="${path}/resources/css/common/header.css">
    <link rel="stylesheet" href="${path}/resources/css/common/footer.css">
    <link rel="stylesheet" href="${path}/resources/css/index.css">
    <link rel="stylesheet" href="${path}/resources/css/common/page4_board.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${path}/resources/js/bootstrap/bootstrap.bundle.js"></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
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
    	<%@ include file="/WEB-INF/views/layout/header.jsp" %>
      
        <div class="slider-con">
            <div class="slider-box">
                <img src="${path}/resources/image/banner/category_BOARDS.jpg" alt="">
            </div>
        </div>
        <!-- 상단 중앙1 시작 -->
				<div style="display: flex; justify-content: center;"class="board">
					
                    <!-- 좌측메뉴 시작 -->
					<%@ include file="/WEB-INF/views/page_4/boardLeftMenu.jsp" %>
					<!-- 좌측메뉴 종료 -->	

                    <!-- 우측메뉴 시작 -->
                    <div style="width: 800px;">
                            <h2 align="center" class="title"> 구단 소식 </h2><br>
                        <div class="card-con" style="display: flex; padding: 20px; ">
                            <div class="card" style="width: 18rem; z-index: -1;">
                                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F076%2F2022%2F10%2F16%2F2022101701001026200065211_20221016204802660.jpg&type=a340">
                                <div class="card-body">
                                <p class="card-text" style="color: #000 !important;">백승수 단장이 2022년 10월 7일 결혼식을 올렸습니다.</p>
                                </div>
                            
                            </div>
                            <div class="card" style="width: 18rem; z-index: -1;">
                                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F311%2F2020%2F02%2F17%2F0001112839_001_20200217083010091.jpg&type=a340">
                                <div class="card-body">
                                <p class="card-text" style="color: #000 !important;"> 신인 투수 유민호 입스를 극복하고 성공적인 복귀!</p>
                                </div>
                                
                            </div>
                            <div class="card" style="width: 18rem; z-index: -1;">
                                <img src="https://search.pstatic.net/sunny/?src=http%3A%2F%2Fsccdn.chosun.com%2Fnews%2Fhtml%2F2020%2F01%2F21%2F2020012201001456900091971.jpg&type=sc960_832">
                                <div class="card-body">
                                <p class="card-text" style="color: #000 !important;">드림즈 구장이 새롭게 태어났다</p>
                                </div>
                            
                            </div>
                        </div>
                        	<hr id="blackline">
                            <h2 align="center" class="title"> 드림즈 사진 </h2><br>
                            <div>
                                <swiper-container class="mySwiper" pagination="true" pagination-type="progressbar" navigation="true">
                                    <swiper-slide><img src="https://photocloud.sbs.co.kr/S01_V2000011536/thumb/5e39229627c86f372e381c83-c600.jpg" style="width:100%"></swiper-slide>
                                    <swiper-slide><img src="https://photocloud.sbs.co.kr/S01_V2000011536/thumb/5e3922909c3fed7195f8db99-c600.jpg" style="width:100%"></swiper-slide>
                                    <swiper-slide><img src="https://photocloud.sbs.co.kr/S01_V2000011536/thumb/5e3bcddb4ae978719a37b8cf-c600.jpg" style="width:100%"></swiper-slide>
                                    <swiper-slide><img src="https://photocloud.sbs.co.kr/S01_V2000011536/thumb/5e391882e10d7937293ed03d-c600.jpg" style="width:100%"></swiper-slide>
                                    <swiper-slide><img src="https://photocloud.sbs.co.kr/S01_V2000011536/thumb/5e28fca79c3fed7195f8d15d-c600.jpg" style="width:100%"></swiper-slide>
                                </swiper-container>
                                
                                <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
                                    <hr id="blackline" style="margin-bottom: 50px;">
                            </div> 
                            </div>
                    </div>

                </div>   
     
     
     	<div id="goTop" class="goTop">
            <a href="#header"></a>
        </div> 
     	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
        
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