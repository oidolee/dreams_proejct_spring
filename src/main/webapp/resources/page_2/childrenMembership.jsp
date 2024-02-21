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
                    <h1 style="margin-top: 50px;">듬린이(어린이 회원)</h1>
                </div>
                <h6 style="color: #1c5c50  !important; margin-top: 50px; font-weight: bold;" >1. 드림즈 멤버쉽 안내</h6>
                <table>
                    <thead>
                        <tr>
                            <td>구분</td>
                            <td>내용</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>가입 금액</td>
                            <td>65,000원</td>
                        </tr>
                        <tr>
                            <td>사용 기간</td>
                            <td>2023 KBO정규리그 마지막 홈경기까지</td>
                        </tr>
                    </tbody>
                </table>
                <h6 style="color: #1c5c50  !important; margin-top: 50px; font-weight: bold;"">2. 듬린이(어린이 회원) 멤버십 가입 상품</h6>
                <table style="text-align: center;">
                    <thead >
                        <tr>
                            <td colspan="3">듬린이 패키지 상품</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr style="background: whitesmoke; text-align: center;">
                            <td width="150px">상품명</td>
                            <td width="279px">소비자가</td>
                            <td>회원가</td>
                        </tr>
                       
                        <tr>
                            <td>스프링 노트 + 펜</td>
                            <td rowspan="5">약 100,000원</td>
                            <td rowspan="5">80,000원</td>
                        </tr>
                        <tr>
                            <td>텀블러</td>
                        </tr>
                        
                        <tr>
                            <td>유니폼뱃지 4종</td>
                        </tr>
                        <tr>
                            <td>드림즈 스케줄러</td>
                        </tr>
                    </tbody>
                </table>
                <h6 style="color: #1c5c50  !important; margin-top: 50px; font-weight: bold;">3. 듬린이(어린이 회원) 멤버십 가입 혜택</h6>
                <ul style="margin-bottom: 50px;">
                    <li>
                        1) 약 100,000원 상당의 패키지 상품 제공
                    </li>
                    <li>2) 회원 본인 고척스카이돔 외야 일반석 무료입장
                        <ul>
                            <li style="font-size: 12px;">- 입장 시 어린이회원 카드를 반드시 제시하여야 합니다.</li>
                        </ul>
                    </li>
                    <li>3)회원 본인 KBO리그 전 구장 외야 비지정석 무료 입장
                        <ul>
                            <li style="font-size: 12px;">- 방문 구장 상황에 따라 혜택이 제한 또는 취소될 수 있습니다.</li>
                            <li style="font-size: 12px;">- 입장 시 어린이회원 카드를 반드시 제시하여야 합니다.</li>
                        </ul>
                    </li>
                    <li>4)주중 버건디석 할인권 (10매)
                        <ul>
                            <li style="font-size: 12px;">- 구매가: 성인 6,000원, 어린이 4,000원</li>
                            <li style="font-size: 12px;">- 2023시즌 고척스키이돔 주중 홈 경기에 한하여 사용 가능합니다.</li>
                            <li style="font-size: 12px;">- 회원 카드와 함께 할인권을 제시해주시기 바랍니다. (할인권 미지참 시 차액 지불)</li>
                        </ul>
                    </li>
                    <li>5)오프라인 상품샵 5% 할인</li>
                </ul>
                <h6 style="color: #1c5c50  !important; margin-top: 50px; font-weight: bold;"> 4. 유의사항</h6>
                <ul style="margin-bottom: 50px;">
                    <li>- 모든 멤버십 혜택은 2023 KBO리그 정규시즌 키움히어로즈 고척스카이돔 홈 경기에 한하여 사용 가능합니다. <br>
                        (시범경기,포스트시즌 사용 불가)</li>
                    <li>- 어린이회원권 양도 및 대여는 불가합니다.</li>
                    <li>- 멤버십 양도 및 대여는 불가합니다</li>
                    <li>- 회원카드 분실 시 재발급 비용이 발생하며, 분실에 따른 불이익이 발생할 수 있으니 주의 바랍니다. <br>
                        (재발급 1회만 가능)</li>
                    <li>- 배송 받으실 주소 정보를 정확하게 입력해주시기 바랍니다.</li>
                    <li>- 멤버십 혜택 및 이벤트는 구단 사정에 의해 내용이 변경될 수 있습니다.</li>
                    <li>- 가입 취소는 멤버십 모집 기간 내에만 가능하며, 모집 기간 이후로는 취소가 불가합니다.</li>
                </ul>
            <h6 style="color: #1c5c50  !important; margin-top: 50px; font-weight: bold;"> 5. 가입 및 배송 문의</h6>
                <ul style="margin-bottom: 100px;">
                    <li>- 인터파크<a href="http://ticket.interpark.com"> http://ticket.interpark.com</a></li>
                    <li>- 인터파크 티켓 고객센터 1544-1555 (스포츠 2번)<br>
                          (상담가능시간: 연중무휴 9시~18시)</li>
                    <li>- 이벤트 및 할인권 관련 문의는 구단으로 연락바랍니다.(02-3660-1000)</li>
                </ul>
            </div>
        </div>
        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <a href="./resource/admin/index.jsp">
            <div class="floating-box left"></div>
        </a>
        <footer>
            <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
        </footer>
    </body>
</div>

</html>