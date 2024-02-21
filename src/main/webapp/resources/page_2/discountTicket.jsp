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
									<li><a href="ticketFee.html">입장요금</a></li>
									<li><a href="reservationInfo.html">예매안내</a></li>
									<li><a href="discountTicket.html">할인안내</a></li>
								</ul>
							</li>
						</ul>
						<ul>
							<li class="hasChild">
								<a href="#">멤버쉽</a>
								<ul style="display: block;">
									<li>
										<a href="DreamsMembership.html" class="on">드림즈멤버쉽</a>
									</li>
									<li>
										<a href="childrenMembership.html" class="on">듬린이(어린이 회원)</a>
									</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li class="hasChild">
								<a href="#">단체관람</a>
								<ul style="display: block;">
									<li>
										<a href="groupViewing.html" class="on">안내</a>
									</li>
								</ul>
							</li>
						</ul>
						<ul>
							<li class="hasChild">
								<a href="#">스카이박스</a>
								<ul style="display: block;">
									<li>
										<a href="skybox.html" class="on">소개 / 예약</a>
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
                    <h1 style="margin-top: 50px;">할인안내</h1>
                </div>
                <h6 style="color: #1c5c50  !important; margin-top: 50px; font-weight: bold;" >· 입장권 할인</h6>
                <table >
                    <colgroup>
                        <col style="width: 13%;">
                        <col style="width: 20%;">
                        <col>
                        <col style="width: 9%;">
                    </colgroup>
                    <thead >
                        <tr>
                            <td>대상</td>
                            <td>제공 혜택</td>
                            <td>내용</td>
                            <td>구입 장소</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="text-align: center;">국가유공자</td>
                            <td rowspan="4">1인1매<br>주중 5,000원 할인<br>주말 7,000원 할인</td>
                            <td rowspan="4">
                                <ul>
                                    <li>· 4층 지정석, 외야 지정석</li>
                                    <li>· 본인에 한함</li>
                                    <li>· 국가유공자, 경로우대자: 현장 매표소에서 본인을 확인할 수 있는 신분증 제시</li>
                                    <li>· 장애의 정도가 심한 장애인 : 복지카드 제시 시, 본인 및 동반 1인까지 할인 적용</li>
                                    <li>· 군경: 현장 매표소에서 신분증, 복지카드, 휴가증/외박증 제시</li>
                                    <li>· 온라인 예매 시, 현장 확인 후 티켓 교환 필요</li>
                                    <li>· 중복할인 불가</li>
                                </ul>
                            </td>
                            <td rowspan="4">온라인<br>/현장</td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">경로우대자<br>
                                (만 65세 이상)</td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">군, 경</td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">장애인</td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">청소년</td>
                            <td >1인1매<br>주중 2,000원 할인<br>주말 3,000원 할인</td>
                            <td>
                                <ul>
                                    <li>· 4층 지정석, 외야 지정석</li>
                                    <li>· 본인에 한함</li>
                                    <li>· 현장 매표소에서 청소년증, 학생증 등 본인을 확인할 수 <br>있는 신분증 제시</li>
                                    <li>· 중복할인 불가</li>
                                </ul>
                            </td>
                            <td>온라인<br>/현장</td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">구로, 영등포<br>
                                주민, 회사원</td>
                            <td >1인1매 <br>2,000원 할인</td>
                            <td>
                                <ul>
                                    <li>· 3층 지정석, 4층 지정석, 외야 지정석</li>
                                    <li>· 본인에 한함</li>
                                    <li>· 구로, 영등포 주민 및 회사원 대상</li>
                                    <li>· 현장 매표소에 주소가 기재된 신분증 및 명함 등 제시</li>
                                    <li>· 중복할인 불가</li>
                                </ul>
                            </td>
                            <td>온라인<br>/현장</td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">문화누리카드</td>
                            <td >1인 4매까지 <br>40% 할인</td>
                            <td>
                                <ul>
                                    <li>· 4층 지정석, 외야지정석</li>
                                    <li>· 현장 매표소에서 신분증 제시</li>
                                    <li>· 중복할인 불가</li>
                                </ul>
                            </td>
                            <td>온라인<br>/현장</td>
                        </tr>
                    </tbody>
                </table>
                <h6 style="color: #1c5c50  !important; margin-top: 50px; font-weight: bold;">· 무료입장</h6>
                <table style="text-align: center; margin-bottom: 50px;">
                    <colgroup>
                    <col style="background: whitesmoke; text-align: center; width: 12%;">
                    <col >
                    <col style="text-align: center; width: 15%;">
                    <col style="text-align: center;">
                    </colgroup>
                    <thead>
                        <tr>
                            <td>대상</td>
                            <td>자격</td>
                            <td>제공혜택</td>
                            <td>입장방법</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td >36개월 미만<br>유아</td>
                            <td>
                                <ul>
                                    <li>· 건강보험증, 등본 등 증명서류 제시</li>
                                    <li>· 36개월 미만 유아는 보호자 동반 시 전 구역 무료 입장이 가능하나, 좌석의 권한은 제공되지 않습니다.</li>
                                    <li>· 지정 좌석 점유 필요 시 입장권 별도 구매</li>
                                </ul>
                            </td>
                            <td rowspan="3">외야 지정석<br>
                                1인 1매<br>
                                무료 입장
                            </td>
                            <td rowspan="3">온라인 예매 후<br>
                                외야 매표소 1번 창구에서<br>
                                본인 확인 및 명부 작성 후 입장
                            </td>
                        </tr>
                        <tr>
                            <td>어린이회원</td>
                            <td>각 구단 어린이 회원 카드 제시</td>
                        </tr>
                        <tr>
                            <td>리틀야구단</td>
                            <td>리틀 야구단 유니폼 착용</td>
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