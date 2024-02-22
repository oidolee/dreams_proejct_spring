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
    <title>안내 및 Q&A Sky</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="./resource/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="./resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="./resource/css/common/common.css">
    <link rel="stylesheet" href="./resource/css/common/header.css">
    <link rel="stylesheet" href="./resource/css/common/footer.css">
    <link rel="stylesheet" href="./resource/css/index.css">
    <link rel="stylesheet" href="../css/common/page4_board.css">

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
                <img src="../image/banner/category_BOARDS.jpg" alt="">
            </div>
        </div>
        
        <!-- 상단 중앙1 시작 -->
            <div style="display: flex; justify-content: center;" class="board">
                
                <!-- 좌측메뉴 시작 -->
                <%@ include file="/WEB-INF/views/page_4/boardLeftMenu.jsp" %>
                <!-- 좌측메뉴 종료 -->	
            <!-- 우측메뉴 시작 -->
            <div style="width: 1000px;">
                <h2 align="center" style="color: #000 !important; margin-top: 20px;"> 안내 및 Q&A </h2><br>
						<div style="display: flex; justify-content: center;">
                        <!-- Q&A게시판 시작 -->
                    
                        <div class="btn-group" role="group" aria-label="Basic radio toggle button group" style="justify-content: center;">
                        <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off">
                        <label class="btn btn-outline-primary" for="btnradio1"><a href="qna.jsp" style="color: #000 !important;">전체</a></label>
                        
                        
                        <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                        <label class="btn btn-outline-primary" for="btnradio2"><a href="qnaTiket.jsp" style="color: #000 !important;">티켓</a></label>
                        
                        <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" checked>
                        <label class="btn btn-outline-primary" for="btnradio3"><a href="qnaSky.jsp" style="color: white !important;">스카이박스</a></label>
                        
                        <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
                        <label class="btn btn-outline-primary" for="btnradio4"><a href="qnaMd.jsp" style="color: #000 !important;">MD</a></label>
                        
                        <input type="radio" class="btn-check" name="btnradio" id="btnradio5" autocomplete="off">
                        <label class="btn btn-outline-primary" for="btnradio5"><a href="qnaParking.jsp" style="color: #000 !important;">주차관련</a></label>
                        
                        <input type="radio" class="btn-check" name="btnradio" id="btnradio6" autocomplete="off">
                        <label class="btn btn-outline-primary" for="btnradio6"><a href="qnaEtc.jsp" style="color: #000 !important;">기타</a></label>
                        </div>
                        
            
                        <!-- Q&A게시판 끝 -->
                    </div><br>		
                    <div class="accordion" id="accordionExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                스카이박스에 36개월 미만 유아는 무료 입장 가능한가요?
                            </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                네 가능합니다. 무료 추가입장을 허용하며 입장시 증빙 서류를 지참 하셔야 합니다.<br><br>

                                36개월 미만 유아 (건강보험증, 등본 등 증명서류 제시)<br>
                                · 36개월 미만 유아는 보호자 동반 시 전 구역 무료 입장이 가능하나, 좌석의 권한은 제공되지 않습니다.<br>
                                · 지정 좌석 점유 필요 시 입장권 별도 구매<br>
                            </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                스카이박스 주차 가능 대수는 몇대인가요?
                            </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                9인실은 (3대) 14인실은 (4대) 20인실은 (6대) 입니다.
                            </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                스카이박스 최대 추가 인원은 몇명까지에요?
                            </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                9인실 (2인), 14인실(3인) 20인실(6인)입니다.<br>
                                추가 인원 발생 시 추가 요금이 발생합니다.<br>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br><br><br>
                <!-- 우측메뉴 종료 -->

     
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