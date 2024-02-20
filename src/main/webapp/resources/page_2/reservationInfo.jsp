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
                    <h1 style="margin-top: 50px;">예매 안내</h1>
                </div>
                <div class="ticket-reservation">
					<input style="margin-right: 10px;" id="ticketbutton" type="button" value="티켓 예약 확인 / 취소">
					<input id="ticketbutton" type="button" value="티켓예약" >
				</div>
				<h6>· 예매방법</h6>
                <table style="margin-bottom: 50px; margin-top: 40px; " align="center" >
                    <tr style="background: whitesmoke;">
						<td colspan="2">구분</td>
						<td>예매수수료</td>
						<td>비고</td>
					</tr>
					<tr style="text-align: center;">
						<td>인터넷 예매</td>
						<td>구단 홈페이지</td>
						<td rowspan="2" style="text-align: left;">
							<ul>
								<li>· 경기 7일전 14시 ~ 경기 시작 1시간 후 까지 예매 가능</li>
								<li>· 경기당 1인 최대 10매 구매 가능</li>
								<li>· 키움히어로즈 홈페이지 아이디로 예매시 별도의 인터파크 회원 가입 없이<br>
									바로 예매 가능 (온라인 예매 바로가기 버튼 클릭)</li>
							</ul>
						</td>
					</tr>
					<tr style="text-align: center;">
						<td>인터파크</td>
						<td>1,000</td>

					</tr>
					<tr style="text-align: center;">
						<td>전화예매</td>
						<td>인터파크 고객센터<br>(1544-1555)/td>
						<td>1,000</td>
						<td>
							<ul>
								<li>· 경기 7일전 14시 ~ 경기 시작 1시간 후 까지 예매 가능/취소 가능 </li>
								<li>· 연중무휴 오전 9시 ~ 오후 6시</li>
								<li>· 인터파크 티켓 1544-1555 (스포츠 2번)</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td>모바일 예매</td>
						<td>인터파크티켓<br>모바일앱/td>
						<td>1,000</td>
						<td>
							<ul>
								<li>· 경기 7일전 14시 ~ 경기 시작 1시간 후 까지 예매/취소 가능</li>
								<li>· 경기당 1인 최대 10매 구매 가능</li>
							</ul>
						</td>
					</tr>
					<tr>
						<td>현장예매</td>
						<td>고척스카이돔<br>현장매표소/td>
						<td>무료</td>
						<td>
							<ul>
								<li>· 경기 당일 2시간 전 부터 현장 예매 가능</li>
								<li>· 경기당 1인 최대 10매 구매 가능</li>
							</ul>
						</td>
					</tr>
                </table>
				<div>
                    <fieldset class="group-Viewing" style=" border: 3px solid black; margin-bottom: 50px; color :#000 !important;" >
						<ul>
							<li>· 매진 시 입장권 구입 및 입장불가 합니다</li>
							<li>· 중복할인은 불가합니다.</li>
							<li>· 상기의 내용은 구단의 정책에 따라 변경될 수 있습니다.</li>
							<li>· 경기장 내 안전과 쾌적한 관람을 위한 SAFE 캠페인 정책에 따라 음료 및 소지품 반입이 제한됩니다.</li>
							<li>· 환경부의 「자원의 절약과 재활용촉진에 관한 법률 시행규칙」에 의거하여 응원용 막대풍선 및 1회용 응원용품 반입을 제한합니다.</li>
							<li>· 안전한 경기 관람을 위해 가급적 마스크를 착용해주시길 권유드립니다.</li>
						</ul>
                    </fieldset>
                </div>
				<h6 style="color: #1c5c50;">· 예매취소 및 환불</h6>
				<div>
                    <fieldset class="group-Viewing" style="display: flex;   background-color: #1c5c5065; border: 3px solid #1c5c50; margin-bottom: 50px;" >
                        <div style="width: 100;">
                            이미지 i
                        </div>
                        <div style="display: block;">
                            <ul>
                                <li>· 예매 당일은 취소수수료가 없으며, 예매수수료도 환불됩니다.</li>
								<li>· 예매 익일 이후로는 티켓금액의 10% 취소수수료 부과되며, 예매수수료도 환불되지 않습니다.</li>
								<li>· 경기일자 및 좌석변경은 불가합니다.</li>
								<li>· 부분취소는 불가합니다. 기존 건을 전체 취소 후 재예매하셔야 하며, 취소좌석에 대한 좌석선점은 보장되지 않습니다.</li>
								<li>· 재예매서비스/예매대기서비스는 불가합니다.</li>
								<li>· 예매한 입장권은 경기당일 현장에서 취소 및 환불 불가능합니다.</li>
								<li>· 입장한 후에는 입장권의 교환 및 환불이 되지 않습니다.</li>
								<li>· 예매한 입장권은 경기시작 4시간 전까지 해당 구입처(인터파크, 1544-1555)에서 환불 가능하며<br>
									  그 이후에는 환불 불가능 합니다.</li>
								<li>· 현장 구매한 입장권은 경기시작 전까지 환불 가능하며 경기시작 이후 및 매진 시에는 환불되지 않습니다.</li>
                            </ul>
                        </div>
                    </fieldset>
                </div>
				<h6>· 예매티켓 수령방법</h6>
                <table style="margin-bottom: 50px;" align="center" border="1">
					<thead style="background: whitesmoke">
						<tr>
							<td colspan="2">구분</td>
							<td>수령 방법</td>
							<td>비고</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="background: whitesmoke">매표소</td>
							<td rowspan="2">	당일 경기 시작 2시간 전부터 교환/입장 가능<br>
								(당일 경기 티켓만 발권 가능)</td>
							
							<td rowspan="2">예매 시 부여된 예약번호를 통한 발권</td>
						</tr>
						<tr>
							<td style="background: whitesmoke">무인발급기</td>
						</tr>
						<tr>
							<td style="background: whitesmoke">모바일티켓</td>
							<td>당일 경기 시작 2시간 전부터 교환/입장 가능</td>
							<td>별도의 입장권 교환 없이 입장 가능</td>
						</tr>
						
					</tbody>
				</table>
				<h6>· 티켓수령 및 입장</h6>
                <div>
                    <fieldset class="group-Viewing" style="border: 3px solid black; margin-bottom: 50px;" >
						<ul>
							<li>· 경기당일 매표소가 혼잡하오니, 가급적 모바일 티켓을 활용하여 편안한 입장을 권장 드립니다.<br>
								   모바일 티켓 캡쳐 혹은 이미지는 입장 불가 (어플에서 예약번호 혹은 바코드가 실시간으로 움직이는 티켓만 입장 가능)<br>
								   모바일 티켓으로 티켓선물하기 기능 사용하여 티켓을 선물한 경우 취소 불가 (선물한 티켓이 반납된 이후 취소가능)</li>
							<li>· 본인확인이 힘들 경우, 입장권 교환이 불가할 수 있습니다.</li>
							<li>· 고척교 인근의 교통난과 돔구장 주차시설 부족으로 인해 프로야구 경기 시 고척스카이돔 내부 주차장은 이용 불가합니다.
								불편하시더라도 인근 민영주차장을 이용해주시기 바랍니다.</li>
							<li>· 자가용 이용시 혼잡하오니, 가급적 대중교통을 이용해주시기 바랍니다.</li>
						</ul>
                    </fieldset>
                </div>
				<h6>· 예매유의 사항</h6>
				<div>
                    <fieldset class="group-Viewing" style="width: 700px; border: 3px solid black; margin-bottom: 50px;" >
						<ul>
							<li>· 인터파크는 ‘자동배정’ 예매와 ‘좌석선택’ 예매를 제공합니다.<br>
								-자동배정 : 좌석을 시스템이 자동으로 지정하는 가장 빠른 예매 방법!<br>
								-좌석선택 : 지정석 중 희망하는 위치를 예매자가 직접 선택하는 꼼꼼한 예매 방법!</li>
							<li>· 결제수단 : 신용카드와 무통장입금이 가능합니다.
								<ul>
									<li>-TIP1 : 무통장입금으로 예매 시 좀 더 빠르게 예매를 완료할 수 있습니다.
										<ul>
											<li>※ 무통장입금 주의사항
												<ul>- 무통장입금은 경기일 2일 전까지만 이용 가능</ul>
												<ul>- 무통장입금은 예매 당일 밤 12시 전까지 입금 (미입금 시 자동취소)</ul>
											</li>
										</ul>
									</li>
									<li>-TIP2 : 신용카드로 결제 시 자동설치파일들을 미리 최신버전으로 받아 두세요.<br>
										(크롬 브라우저에서는 신용카드 결제가 안되니, IE등 다른 브라우저를 이용해주세요)
										<ul>
											<li></li>
										</ul>
									</li>
								</ul>
							<li>· 티켓수령방법
								<ul>
									<li>-모바일티켓 : 별도의 티켓 수령없이 모바일티켓 APP으로 바로 입장 가능 (종이티켓은 제공되지 않음)</li>
									<li>-현장수령 : 예매 시 부여되는 “예약번호”로 관람일 당일 매표소에서 티켓 수령하여 입장</li>
								</ul>
							</li>
						</ul>
                    </fieldset>
                </div>
				<h6>· 모바일 티켓 안내사항</h6>
				<div>
                    <fieldset class="group-Viewing" style="width: 700px; border: 3px solid black; margin-bottom: 50px;" >
						<ul>
							<li>· 배송선택을 모바일 티켓으로 하신 분께서만 인터파크 모바일 티켓 APP을 통해 이용 가능합니다.<br></li>
							<li>· 경기 4시간 전부터 입장 가능한 바코드가 노출됩니다.
							<li>· 티켓 취소시 모바일 티켓 선물하기 기능을 통해 티켓을 선물한 경우 티켓 취소가 불가능 하오니<br>
								선물하신 분께 선물한 티켓을 등록 해제 요청 하신 후 취소하시기 바랍니다.</li>
							<li>· 입장 후에도 바코드는 사라지지 않습니다. 외출이 가능하며 경기일 23시59분이 지나면 티켓 APP 에서 사라집니다.</li>
							<li>· 모바일 티켓으로 예매하신 분은 종이 티켓으로 발권이 절대 불가 합니다.</li>
						</ul>
                    </fieldset>
                </div>
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