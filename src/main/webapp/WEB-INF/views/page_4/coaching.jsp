<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 강승재 -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>코칭스태프</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="./resource/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="./resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="./resource/css/common/common.css">
    <link rel="stylesheet" href="./resource/css/common/header.css">
    <link rel="stylesheet" href="./resource/css/common/footer.css">
    <link rel="stylesheet" href="./resource/css/index.css">
    <link rel="stylesheet" href="../css/common/page4_players.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="./resource/js/bootstrap/bootstrap.bundle.js"></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- scrollreveal -->
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <!-- header.js -->
    <script src="./resource/js/common/header.js"></script>

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
                <img src="../image/banner/category_PLAYERS.jpg" alt="">
            </div>
        </div>
        <!-- 상단 중앙1 시작 -->
				<div style="display: flex; justify-content: center;"class="board">
					
                    <!-- 좌측메뉴 시작 -->
					<%@ include file="/WEB-INF/views/page_4/playerLeftMenu.jsp" %>
					<!-- 좌측메뉴 종료 -->	

                    <!-- 우측메뉴 시작 -->
                        <div class="playerCard" style="width: 800px;">
                            <h2 class="title"> 코칭스태프 </h2>
                            
                            <div style="display: flex;  margin-top: 20px;">
                                <div class="card">
                                <img src="../image/page_4_images/no70.webp" alt="yoonsb" style="width:100%">
                                <h1>윤성복</h1>

                                <p>No.70<br>
                                    감독
                                </p>
                                </div>

                                <div class="card">
                                <img src="../image/page_4_images/no61.webp" alt="leecm" style="width:100%">
                                <h1>이철민</h1>

                                <p>No.61<br>
                                    수석코치
                                </p>
                                </div>

                            </div>

                            <div style="display: flex; margin-top: 20px; margin-bottom: 50px;">

                                <div class="card">
                                <img src="../image/page_4_images/no39.webp" alt="choiyk" style="width:100%">
                                <h1>최용구</h1>

                                <p>No.39<br>
                                    투수코치
                                </p>

                                </div>

                                <div class="card">
                                <img src="../image/page_4_images/no86.webp" alt="mints" style="width:100%">
                                <h1>민태성</h1>

                                <p>No.86<br>
                                    타격코치
                                </p>

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