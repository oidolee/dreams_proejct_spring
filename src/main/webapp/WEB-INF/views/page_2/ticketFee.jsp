<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/setting.jsp" %>
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
    <script> 
        function openNewWindow() {
            
            // 새 창 열기
            window.open('purchaseTicket.tc', '_blank', 'width=882, height=530');
         }
        $(function(){
        	$("#ticket-Checkbutton").click(function(){
        		window.location.href = "${path}/ResCheck.tc"
        	});
        });
      </script>
</head>
<div class="wrap">
	
    <body>
        <div class="container-fluid container-box">
            <header>
                <%@ include file="../layout/header.jsp"%>
            </header>
        </div>

        <div class="slider-con">
            <div class="slider-box">
                <img style="width: 100%;" src="${path }/resources/image/main/dreams_main_01.jpg"
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
									<li><a href="ticketFee.tc">입장요금</a></li>
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
                    <h1 style="margin-top: 50px;">입장 요금</h1>
                </div>
                <div class="ticket-reservation">
					<input style="margin-right: 10px;" id="ticket-Checkbutton" type="button" value="티켓 예약 확인 / 취소" >
					<input id="ticket_Resbutton" type="button" value="티켓예약" onclick="openNewWindow()">
				</div>
                <table style="margin-bottom: 50px; margin-top: 40px; " align="center" >
                    <tr>
                        <td rowspan="20"><img src="${path }/resource/image/page_2img/dome00.png" width="500px" height="600px"></td>
                        <td>전체좌석</td>

                    </tr>

                    <tr>

                        <td></td>
                    </tr>

                    <tr>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot14.png">스카이박스</td>
                    </tr>

                    <tr>
                        <td></td>
                    </tr>

                    <tr>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot01.png">R.d club<br>(로얄다이아몬드클럽)</td>
                    </tr>
                    <tr>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot03.png">1층 테이블석</td>
                    </tr>
                    <tr>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot04.png">2층 테이블석</td>
                    </tr>
                    <tr>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot05.png">내야커플석</td>
                    </tr>
                    <tr>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot06.png" alt="">외야커플석</td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot07.png">다크버건디석</td>
                    </tr>
                    <tr>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot08.png" alt="">버건디석</td>
                    </tr>
                    <tr>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot09.png" alt="">3층 지정석</td>
                    </tr>
                    <tr>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot10.png" alt="">4층 지정석</td>
                    </tr>
                    <tr>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot11.png">휠체어석</td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot12.png">외야 지정석</td>
                    </tr>
                    <tr>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot13.png">외야 패밀리석</td>
                    </tr>
                    <tr>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot16.png">외야 유아동반석</td>
                    </tr>

                </table>
                <table style="margin-bottom: 50px;" align="center" border="1">
					<thead style="background: whitesmoke">
						<tr>
							<td colspan="2">좌석</td>
							<td>구분</td>
							<td>주중(화/수/목)</td>
							<td>주말(금/토/일/공휴일)</td>

						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="3">VIP</td>
							<td rowspan="3"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot14.png">스카이박스</td>
							<td>9인실</td>
							<td colspan="2" align="center">1,080,000</td>
						</tr>
						<tr>
							<td>14인실</td>
							<td colspan="2" align="center">1,680,000</td>
						</tr>
						<tr>
							<td>20인실</td>
							<td colspan="2" align="center">2,400,000</td>
						</tr>
						<tr>
							<td rowspan="5">테이블석</td>
							<td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot01.png">R.d-club</td>
							<td>일반</td>
							<td>55,000</td>
							<td>85,000</td>
						</tr>
						<tr>
							<td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot03.png">1층 테이블석</td>
							<td>일반</td>
							<td>50,000</td>
							<td>75,000</td>
						</tr>
						<tr>
							<td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot04.png">2층 테이블석</td>
							<td>일반</td>
							<td>50,000</td>
							<td>75,000</td>
						</tr>
						<tr>
							<td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot05.png">내야커플석</td>
							<td>일반</td>
							<td>30,000</td>
							<td>45,000</td>
						</tr>
						<tr>
							<td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot06.png">외야커플석</td>
							<td>일반</td>
							<td>17,000</td>
							<td>25,000</td>
						</tr>
						<tr>
							<td rowspan="10">내야</td>
							<td rowspan="2"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot07.png">다크버건디석</td>
							<td>일반</td>
							<td>17,000</td>
							<td>25,000</td>
						</tr>
						<tr>
							<td>어린이</td>
							<td>8,000</td>
							<td>12,000</td>
						</tr>
						<tr>
							<td rowspan="2"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot08.png">버건디석</td>
							<td>일반</td>
							<td>15,000</td>
							<td>22,000</td>
						</tr>
						<tr>
							<td>어린이</td>
							<td>7,000</td>
							<td>11,000</td>
						</tr>
						<tr>
							<td rowspan="2"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot09.png">3층 지정석</td>
							<td>일반</td>
							<td>12,000</td>
							<td>18,000</td>
						</tr>
						<tr>
							<td>어린이</td>
							<td>6,000</td>
							<td>9,000</td>
						</tr>
						<tr>
							<td rowspan="3"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot10.png">4층 지정석</td>
							<td>일반</td>
							<td>9,000</td>
							<td>13,000</td>
						</tr>
						<tr>
							<td>청소년</td>
							<td>7,000</td>
							<td>10,000</td>
						</tr>
						<tr>
							<td>어린이/장애,유공자/군,경/경로</td>
							<td>4,000</td>
							<td>6,000</td>
						</tr>
						<tr>
							<td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot11.png">휠체어석</td>
							<td>휠체어 이용 고객 + 동반인 동반인석 무상제공</td>
							<td>10,000</td>
							<td>15,000</td>
						</tr>
                        <tr>
							<td rowspan="7">외야</td>
							<td rowspan="4"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot12.png">외야 지정석</td>
                            <td>일반</td>
							<td>9,000</td>
							<td>13,000</td>
						</tr>
                        <tr>
                            <td>청소년</td>
                            <td>7,000</td>
                            <td>10,000</td>
                        </tr>
                        <tr>
                            <td>어린이/장애,유공자/<br>
                            군,경/경로
                            </td>
                            <td>4,000</td>
                            <td>6,000</td>
                        </tr>
                        <tr>
                            <td>36개월 미만 유아<br>
                            리틀 드림즈 멤버십<br>
                            리틀 야구단
                            </td>
                            <td colspan="2">무료</td>
                            
                        </tr>
                        <tr>
                            <td rowspan="2"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot15.png">외야 패밀리석</td>
                            <td>5인</td>
                            <td>100,000</td>
                            <td>135,000</td>
                        </tr>
                        <tr>
                            <td>4인</td>
                            <td>80,000</td>
                            <td>108,000</td>
                        </tr>
                        <tr>
                            <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot16.png">외야 유아동반석</td>
                            <td>2인</td>
                            <td>40,000</td>
                            <td>54,000</td>
                        </tr>
					</tbody>
				</table>
            </div>
        </div>
        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <a href="${path }/admin.tc">
            <div class="floating-box left"></div>
        </a>
        <footer>
            <%@ include file="../layout/footer.jsp"%>
        </footer>
    </body>
</div>

</html>