<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">

<head>    
    <!-- reset.css -->
    <link rel="stylesheet" href="${path }/resources/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="${path }/resources/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="${path }/resources/css/common/common.css">
    
    <%-- <link rel="stylesheet" href="${path }/resource/css/common/header.css">
    <link rel="stylesheet" href="${path }/resource/css/common/footer.css"> --%>
    
    <link rel="stylesheet" href="${path }/resources/css/index.css">
    <!-- 왼쪽 티켓박스 css -->
    <link rel="stylesheet" href="${path }/resources/css/common/page2_ticket.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${path }/resources/js/bootstrap/bootstrap.bundle.js"></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- scrollreveal -->
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <!-- header.js -->
    <script src="${path }/resources/js/common/header.js"></script>

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

/*         //크롬 스크롤 오류로 시간 지정 후 동장
        $(window).on("scroll", function () {
            $("#goTop a").attr("href", "#none")
            $("#goTop").css({ "background-color": "rgba(255, 255, 255, 0.1)" });
            setTimeout(() => {
                $("#goTop a").attr("href", "#header")
                $("#goTop").css({ "background-color": "rgba(255, 255, 255, 0.7)" });
            }, 2000);
        }) */

    </script>
    <style>
        .container-box {
            padding: 0;
        }

        input:focus {
            outline: none;
        }


        .center {
            max-width: 1240px;
            margin: 0 auto;
        }

        .section-1-con {
            min-height: 440px;
        }

        .section-1 {
            height: 100%;
            padding: 80px 0;
        }

        .section-1-top h2 {
            text-align: center;
        }

        .section-1-top h2 a {
            color: #000 !important;
        }

        .section-1-bottom ul {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 40px;
            padding-left: 0;
        }

        /* 반응형 */
        @media screen and (max-width:960px) {
            .footer-1 {
                padding: 30px;
            }

            .section-1-bottom ul {
                flex-direction: column;
            }

            .footer-list-box {
                flex-direction: column;
            }

            .footer-list-box .item-box ul {
                justify-content: center;
            }

            .txt-add {
                text-align: center;
            }
        }

        @media screen and (max-width:560px) {
            .footer-1 {
                font-size: 14px;
            }

            .footer-list-box {
                flex-direction: row;
            }

            .link-list {
                flex-direction: column;
            }

            .footer-list-box {
                flex-direction: column;
            }

            .link-list {
                align-items: center;
            }
        }
        #ticket-box{
            position: relative;
            width: 300px;
            /* margin: 0 auto; */
            padding-bottom: 160px;
            z-index: 2;
        }
        
        div.local {
            float: left;
            margin-top: -38px;
            width: 240px;
        }
        .body1{
            display: flex;
            justify-content: center;
            
        }
        .haschild{
            border-bottom: 1px solid whitesmoke;
        }
        .membership-info > h1{
            display: block;
            flex-direction: column;
            align-items: center;
            color: #000 !important;
        }

        .center1, h1{
            display: flex;
            color: #000 !important;
            justify-content: center;
            width: 700px;
        }
        .center1 table{
            display: flex;
            justify-content: center;
        }
        table{
            border: 1px solid black;
            border-top: 3px solid black;
            border-bottom: 2px solid black;
            width: 700px;
        }
        table td{
            border: 1px solid black;
            
            
        }
        table thead{
            background: whitesmoke;
            text-align: center;
        }
        h{
            color: #1c5c50 !important;
        }

    </style>
</head>
<div class="wrap">
	
    <body>
        <div class="container-fluid container-box">
            <header>
                <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
            </header>
        </div>

        <div class="slider-con">
            <div class="slider-box">
                <img style="width: 100%;" src="../image/main/dreams_main_01.jpg"
                            alt="main">
            </div>
        </div>
        <!-- 중간 시작 -->
        
        <div class="body1">
            <div id="left">
				<div class="left_inside" style="width: 200px; height: 800px;">
					<!-- 좌측메뉴바 시작 -->
					<ul class="left_menubar">
						<div>
							<h2 style="color: white !important; ">TICKET</h2>
						</div>
						<ul>
							<li class="hasChild">
								<a href="#">일일티켓</a>
								<ul>
									<li><a href="ticketFee.jsp">입장요금</a></li>
									<li><a href="reservationInfo.jsp">예매안내</a></li>
									<li><a href="discountTicket.jsp">할인안내</a></li>
								</ul>
							</li>
						</ul>
						<ul>
							<li class="hasChild">
								<a href="#">멤버쉽</a>
								<ul style="display: block;">
									<li>
										<a href="DreamsMembership.jsp" class="on">드림즈멤버쉽</a>
									</li>
									<li>
										<a href="childrenMembership.jsp" class="on">듬린이(어린이 회원)</a>
									</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li class="hasChild">
								<a href="#">단체관람</a>
								<ul style="display: block;">
									<li>
										<a href="groupViewing.jsp" class="on">안내</a>
									</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li class="hasChild">
								<a href="#">스카이박스</a>
								<ul style="display: block;">
									<li>
										<a href="skybox.jsp" class="on">소개 / 예약</a>
									</li>
								</ul>
							</li>
						</ul>	
					</ul>	
					<!-- 좌측메뉴바 종료 -->
				</div>
			</div>
            <!-- 좌측 메뉴바 종료 -->
            
            <div class="membership-info">
                <div class="center1">
                    <h1 style="margin-top: 50px;">스카이박스 안내</h1>
                </div>
                <h6 style="color: whitesmoke; text-align: center;" >스카이박스에서 특별한 이벤트와 함께 야구를 관람해보세요</h6>
                <h6 style="color: #1c5c50  !important; margin-top: 50px; font-weight: bold;" >1. 스카이박스 시설</h6>
                <ul>
                    <li>· TV, 에어컨, 소파, 테이블, 옷장, 냉장고, 휴대폰 충전기, 테라스 관람석</li>
                </ul>
                <h6 style="color: #1c5c50  !important; margin-top: 50px; font-weight: bold;" >2. 스카이박스 제공 서비스/이벤트</h6>
                <ul>
                    <li>1) 전용 출입구 이용(고척 스카이돔 중앙 C게이트)</li>
                    <li>2) 전용 주차장 이용</li>
                    <li>3) 마스코트 포토서비스</li>
                </ul>
                <h6 style="color: #1c5c50  !important; margin-top: 50px; font-weight: bold;" >3. 스카이박스 1일 사용 금액 안내</h6>
                <table style="margin-bottom: 50px;">
                    <thead >
                        <tr>
                            <td colspan="2">구분</td>
                            <td>스카이박스</td>
                            <td>최대 이용인원</td>
                            <td>테라스 관람석</td>
                            <td>1일 사용료(원)</td>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1루</td>
                            <td>S08</td>
                            <td>돔돔이 라운지</td>
                            <td>9</td>
                            <td>9</td>
                            <td>1,080,000</td>
                        </tr>
                        <tr>
                            <td rowspan="3">3루</td>
                            <td>S12</td>
                            <td>그린 라운지</td>
                            <td>9</td>
                            <td>9</td>
                            <td>1,080,000</td>
                        </tr>
                        <tr>
                            <td>S14</td>
                            <td>레드 라운지</td>
                            <td>9</td>
                            <td>9</td>
                            <td>1,080,000</td>
                        </tr>
                        <tr>
                            <td>S14</td>
                            <td>버건디 라운지</td>
                            <td>20</td>
                            <td>20</td>
                            <td>2,400,000</td>
                        </tr>
                    </tbody>
                </table> 
            </div>
        </div>
        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <footer>
            <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
        </footer>
    </body>
</div>

</html>