<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">

<head>    
    <!-- reset.css -->
    <link rel="stylesheet" href="${path }/resource/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="${path }/resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="${path }/resource/css/common/common.css">
    
    <%-- <link rel="stylesheet" href="${path }/resource/css/common/header.css">
    <link rel="stylesheet" href="${path }/resource/css/common/footer.css"> --%>
    
    <link rel="stylesheet" href="${path }/resource/css/index.css">
    <!-- 왼쪽 티켓박스 css -->
    <link rel="stylesheet" href="${path }/resource/css/common/page2_ticket.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${path }/resource/js/bootstrap/bootstrap.bundle.js"></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- scrollreveal -->
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <!-- header.js -->
    <script src="${path }/resource/js/common/header.js"></script>

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
                <jsp:include page="../layout/header.jsp"></jsp:include>
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
                    <h1 style="margin: 50px 0 50px 0 ;">단체관람 안내</h1>
                </div>
                <div>
                    <fieldset class="group-Viewing" style="display: flex; width: 700px;  background-color: #1c5c5065; border: 3px solid #1c5c50; margin-bottom: 50px;" >
                        <div style="width: 100;">
                            이미지 i
                        </div>
                        <div style="display: block;">
                            <ul>
                                <li>· 단체관람 신청은 25명 이상부터 가능하며,<br>
                                    인터파크 콜센터(1544-1555)를 통해 가능합니다.</li>
                                
                                <li>· 단체구매에 따른 할인은 4층 지정석, 외야석에 한해서만 2,000원 할인 적용됩니다.</li>
                            </ul>
                        </div>
                    </fieldset>
                </div>
                <table >
                    <thead style="text-align: center;">
                        <tr>
                            <td rowspan="2">구분</td>
                            <td rowspan="2">내용</td>
                            <td colspan="2">주중</td>
                            <td colspan="2">주말 및 공휴일</td>
                            <td >예매 방법/td>
                        </tr>
                        <tr>
                            <td>정상가</td>
                            <td>할인가</td>
                            <td>정상가</td>
                            <td>할인가</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td rowspan="5">25명 이상</td>
                            <td>다크버건디석</td>
                            <td>17,000</td>
                            <td rowspan="3">할인없음</td>
                            <td>25,000</td>
                            <td rowspan="3">할인없음</td>
                            <td rowspan="5">인터파크 콜센터 : 1544-1555<br>
                                (스포츠 2번)<br>
                                · 월~일 (연중무휴) 오전 9시~오후 6시<br>
                                · 경기 시작일 30일 전 ~ 경기 1일 전까지<br>
                                (매진 시 예매 불가)</td>
                        </tr>

                        <tr>
                            <td>버건디석</td>
                            <td>25,000</td>
                            <td>22,000</td>
                        </tr>
                        <tr>
                            <td>3층 지정석</td>
                            <td>12,000</td>
                            <td>18,000</td>
                        </tr>
                        <tr>
                            <td>4층 지정석</td>
                            <td>9,000</td>
                            <td>7,000</td>
                            <td>13,000</td>
                            <td>10,000</td>
                        </tr>
                        <tr>
                            <td>외야 일반석</td>
                            <td>9,000</td>
                            <td>7,000</td>
                            <td>13,000</td>
                            <td>10,000</td>
                        </tr>
                    </tbody>
                </table>
                <h6 style="margin-top: 50px;">단체관람 신청방법</h6>
                <fieldset style="margin-bottom: 50px;">
                    <ul>
                        <li>1. 인터파크 콜센터(1544-1555) 신청</li>
                        <li>2. 결제 완료 후 예매번호 등 수령안내사항 회신</li>
                        <li>3. 경기당일 지정매표소에서 예매번호로 티켓 수령 (3루 내야 매표소 20번 ~ 21번 창구)</li>
                    </ul>
                </fieldset>
                <h6 style="margin-top: 50px;">단체관람 신청 안내</h6>
                <fieldset style="margin-bottom: 50px;">
                    <ul>
                        <li>· 개막 2연전은 단체 관람이 불가 합니다.</li>
                        <li>· 신청 후 담당자가 단체 관람 가능 여부 회신 드리며, 신청만으로 좌석이 확보 된 것은 아닙니다.</li>
                        <li>· 단체 관람 신청은 순서대로 접수되며, 한도 좌석 초과 시 구입이 불가능할 수 있습니다.</li>
                        <li>· 구단 사정으로 인하여 신청이 불가할 수 있습니다.</li>
                        <li>· 좌석 등급은 선택 가능하나, 블록/좌석 번호 등은 선택이 불가능합니다.</li>
                        <li>· 중복 할인은 불가능합니다.</li>
                        <li>· 사업자 등록증 또는 단체를 증빙할 수 있는 증빙서류가 필요합니다.</li>
                        <li>· 단체관람 결제 진행 후, 자리 변경, 교환, 환불이 불가 합니다.</li>
                        <li>· 단체 관람은 신용카드로만 결제 가능합니다.</li>
                    </ul>
                </fieldset>
            </div>
        </div>
        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <footer>
            <jsp:include page="../layout/footer.jsp"></jsp:include>
        </footer>
    </body>
</div>

</html>