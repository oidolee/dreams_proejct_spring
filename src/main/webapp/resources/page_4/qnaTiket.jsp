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
    <title>안내 및 Q&A 티켓</title>
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
				<div style="display: flex; justify-content: center;">
					
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
                            
                            
                            <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" checked>
                            <label class="btn btn-outline-primary" for="btnradio2"><a href="qnaTiket.jsp" style="color: white !important;">티켓</a></label>
                            
                            <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
                            <label class="btn btn-outline-primary" for="btnradio3"><a href="qnaSky.jsp" style="color: #000 !important;">스카이박스</a></label>
                            
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
                                    온라인 매진 시 현장에서 구매 가능한 티켓이 있나요?
                                </button>
                              </h2>
                              <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    온라인/현장 티켓을 따로 구분하여 판매하지는 않습니다.<br>
                                    그러나 온라인 매진 시, 인터넷 예매 종료 후(경기 시작 4시간 전)<br>
                                    잔여 티켓, 취소 티켓 그리고 일부 시야방해석에 한하여<br>
                                    경기 시작 2시간 전부터 현장에서 티켓 구매가 가능합니다.<br>
                                </div>
                              </div>
                            </div>
                            <div class="accordion-item">
                              <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    티켓 예매시간은 언제부터 가능한가요?
                                </button>
                              </h2>
                              <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    예매는 경기당일을 기준으로 일주일전 오후 2시부터 경기시작 4시간 전까지 온라인으로 가능합니다.<br><br>

                                    현장구매는 당일만 가능하며, 경기 시작 2시간 전부터 예매가 시작됩니다.<br>
                                    (단, 경기 상황에 따라 판매 시각이 변동될 수 있습니다.)<br>
                                </div>
                              </div>
                            </div>
                            <div class="accordion-item">
                              <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    연간 회원권은 예매 따로 안해도 되나요? 지류 티켓 뽑을 수 있나요?
                                </button>
                              </h2>
                              <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    연간회원은 회원 카드로만 입장 가능하시며, 별도 예매 진행하지 않습니다.<br><br>
                                    지류 티켓 발권은 불가합니다.<br>
                                </div>
                              </div>
                            </div>
                            <div class="accordion-item">
                              <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
                                    예매 후 현장에서 티켓수령 방법은어떻게 되나요?
                                </button>
                              </h2>
                              <div id="collapse4" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    매표소나 무인발권기에서 발권하시면 됩니다.<br><br>

                                    무인발권기는 주민등록번호를 입력하셔야 사용하실 수 있습니다.<br>
                                    (일부 지정석은 무인발권기를 통한 발권이 제한되니 양해해 주시기 바랍니다.)<br>
                                </div>
                              </div>
                            </div>
                            <div class="accordion-item">
                              <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse5" aria-expanded="false" aria-controls="collapse5">
                                    단체 관람은 어떻게 예매할 수 있나요?
                                </button>
                              </h2>
                              <div id="collapse5" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    구단의 단체관람 기준 인원은 25명입니다.<br><br>

                                    25명 이상의 단체 관람은 보시고자 하는 경기 날짜 1주일 전 오후 2시부터 인터파크 고객센터(1544-1555)를 통해 예매 가능합니다.<br>
                                </div>
                              </div>
                            </div>
                            <div class="accordion-item">
                              <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse6" aria-expanded="false" aria-controls="collapse6">
                                    선예매는 멤버십을 구매한 본인의 계정에서만 할 수 있는 걸까요?
                                </button>
                              </h2>
                              <div id="collapse6" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    선예매는 본인 계정에서만 인증 후 사용 가능합니다.
                                </div>
                              </div>
                            </div>
                            </div>
                          </div>
                          <!-- 우측메뉴 종료 -->
                        </div>
                    <br><br><br>
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