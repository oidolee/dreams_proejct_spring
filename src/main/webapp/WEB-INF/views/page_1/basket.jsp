<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/setting.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 윤석무 -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    
    <title> 장바구니 페이지 </title>
    
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/resources/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="${path}/resources/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="${path}/resources/css/common/common.css">
    <link rel="stylesheet" href="${path}/resources/css/common/header.css">
    <link rel="stylesheet" href="${path}/resources/css/common/footer.css">
    <link rel="stylesheet" href="${path}/resources/css/index.css">
    <link rel="stylesheet" href="${path}/resources/css/admin/basket.css">

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
    <!-- header.js -->
    <script src="${path}/resources/js/common/header.js"></script>

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


        .section-1-bottom ul {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 40px;
            padding-left: 0;
        }
        
       	#table_bd tr, #table_bd td, #table_bd th {
        border-color: inherit;
        border:1px solid #333 !important;
        }   

	</style>
    
    
</head>

    <body>
    	<%@include file="../layout/header.jsp"%>
      	
      	<div class="slider-con">
			<div class="slider-box">
				<img src="${path}/resources/image/banner/드림즈_포토샵.jpg" width="100%">
			</div>
		</div>
      	
		<div class="wrap">
			<!-- 컨텐츠 시작 -->
			<div id="container">
			    <form action="#">   <!--  상품주문링크 -->
			        <div id="contents" align="center">
			            <!-- 상단 중앙1 시작 -->
			            <div id="section1" style="padding-top: 120px; padding-bottom: 20px;">
			                <h2 style=" color: #000 !important"> 장바구니 </h2>
			            </div>
			
			            <!-- 상단 중앙2 시작 -->
			            <div id="section2">
			
			                <!-- 장바구니 시작 -->
			                <div id="right">
			                    <div class="table_div">
			                        
			                        <form name="ad_productAdd" action="ad_productAddAction.jsp" method="post">   <!-- post : 노출x / get : 노출o -->
			                            <table id="table_bd" style="width: 100%; border:1px">
			                                <tr>
			                                    <th style="width: 7%; color: #ffffff !important;">
			                                        <input type="checkbox" id="selectAll"> 
			                                    </th>
			                                    <th style="width: 20%; color: #ffffff !important;"> 상품정보 </th>
			                                    <th style="width: 28%; color: #ffffff !important;"> 상품명 </th>
			                                    <th style="width: 7%; color: #ffffff !important;"> 수량 </th>
			                                    <th style="width: 13%; color: #ffffff !important;"> 상품금액 </th>
			                                    <th style="width: 13%; color: #ffffff !important;"> 합계금액 </th>
			                                    <th style="width: 10%; color: #ffffff !important;"> 배송비 </th>
			                                </tr>
			
			                                <!-- 장바구니 목록 -->
			                                <tr>
			                                    <td>
			                                        <label><input type="checkbox" class="itemCheckbox" name="check1" value="check1"></label>
			                                    </td>
			                                    <td> <image src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDAyMTRfMjg0%2FMDAxNTgxNjQ5ODE2MjA1.nQ6nx80RlsMeIAhg7NqZtQi_RF-EQBvjejekIDAo0-Eg.VELqjExMNTIq5sf1qODKc7FoHxXh8cho39mt8x8zlNUg.JPEG.gamzatan%2F20200214_121001.jpg&type=sc960_832" width="250" height="250"></image> </td>
			                                    <td style="color: #000 !important;"> [선착순한정] [LOCKERDIUM] 스토브리그 드림즈 멤버십 패키지(HOME) </td>
			                                    <td style="text-align: center; border: none;">
			                                        <input type="number" id="stdNum" name="std_num" min="0" max="100" value="1" autofocus style="text-align: center; width: 50px; border: none; background-color:transparent;" oninput="calculateTotal()">
			                                    </td>
			                                    <td style="color: #000 !important;"> 80,000원 </td>
			                                    <td id="totalPrice" style="color: #000 !important;"> 80,000원 </td>
			                                    <td rowspan="2" style="color: #000 !important;" >배송비 무료</td>
			                                </tr>
			
			                                <tr>
			                                    <td>
			                                        <label><input type="checkbox" class="itemCheckbox" name="check1" value="check1"></label>
			                                    </td>
			                                    <td> <image src="https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAyMDAyMDVfNzUg%2FMDAxNTgwODY4MDMzOTU5._3Pnin3euDMyv0KR4dZVzT-Rsq2q4TRemMF3bbXwJQMg.RgwJ1gXIwEqKn56p0hSPIu4VuIqJWmRHy1ZLyoN_XCEg.PNG%2F%25C8%25C4%25B5%25E5%25C6%25BC.PNG&type=sc960_832" width="250" height="250"></image> </td>
			                                    <td style="color: #000 !important;"> [★3차] [LOCKERDIUM] 스토브리그 드림즈 후드티셔츠 </td>
			                                    <td>
			                                        <input type="number" id="stdNum2" name="std_num2" min="0" max="100" value="1" autofocus style="text-align: center; width: 50px; border: none; background-color:transparent;" oninput="calculateTotal()">
			                                    </td>
			                                    <td style="color: #000 !important;"> 120,000원 </td>
			                                    <td id="totalPrice2" style="color: #000 !important;"> 120,000원 </td>
			                                </tr>
			                            </table>
			                        </form>
			                    </div>
			                    <div class="sumTotalWrap">
			                        <div class="box">
			                            <div class="sumPrice">
			                                        <span class="tit" style="color: #000000 !important;">총 주문 금액</span>
			                                        <span class="txt">
			                                            <strong id="totalAll" style="color: #000000 !important;">0</strong>
			                                            <span style="color: #000000 !important;">원</span>
			                                        </span>
			                            </div>
			                                <span class="plus" style= "font-size: 25px; padding-top: 10px; color: #000000 !important;">+</span>
			                            <div class="sumPrice">
			                                <span class="tit" style="color: #000000 !important;">배송비</span>
			                                <span class="txt">
			                                    <strong id="totaldlvr" style="color: #000000 !important;">0</strong>
			                                    <span style="color: #000000 !important;">원</span>
			                                </span>
			                            </div>
			                                <span class="equal" style="font-size: 25px; padding-top: 10px; color: #000000 !important;">=</span>
			                            <div class="sumPrice">
			                                <span class="tit" style="color: #000000 !important;">결제 예정 금액</span>
			                                <span class="txt">
			                                    <strong id="totalAll2" style="color: #000000 !important;">0</strong>
			                                    <span style="color: #000000 !important;">원</span>
			                                </span>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="order2" style="align-items: center; padding-top: 30px;" >
			                        <a href="${path}/WEB-INF/views/page_2/purchaseTicket.jsp">
			                            <input id="btn1" type="button" value="선택상품주문">
			                        </a>
			                        <a href="${path}/WEB-INF/views/page_2/purchaseTicket.jsp">
			                            <input id="btn1" type="button" value="전체상품주문">
			                        </a>
			                    </div>
			                </div>
			                <!-- 장바구니 종료 -->
			            </div>
			        </div>
			    </form>
			</div>
		</div>


        <section class="section-1-con">
            <div class="section-1 center">
                <div class="section-1-top">
                    <h2><a href="#">드림즈 바로가기</a></h2>
                </div>
                <div class="section-1-bottom">
                    <ul>
                        <li><a href="${path}/WEB-INF/views/page_2/ticketFee.jsp"><img src="../image/main/dreams_char.png"
                                    alt=""></a></li>
                        <li><a href="https://www.instagram.com/explore/tags/%EC%8A%A4%ED%86%A0%EB%B8%8C%EB%A6%AC%EA%B7%B8/top/"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/index/btn_link_toolbar_item2.png"
                                    alt=""></a></li>
                        <li><a href="${path}/WEB-INF/views/page_6/stadium.jsp"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/index/btn_link_toolbar_item3.png"
                                    alt=""></a></li>
                    </ul>
                </div>
            </div>
        </section>
     
      
     	<%@include file="../layout/footer.jsp" %>
        
        
        <script type="text/javascript">
            function calculateTotal() {
                const quantity = parseInt(document.getElementById('stdNum').value);
                const priceItem = 80000;
                const totalPrice = quantity * priceItem;
    
                const quantity2 = parseInt(document.getElementById('stdNum2').value);
                const priceItem2 = 120000;
                const totalPrice2 = quantity2 * priceItem2;
                const totalAll = totalPrice + totalPrice2;
    
                document.getElementById('totalPrice').textContent = totalPrice.toLocaleString() + '원';
                document.getElementById('totalPrice2').textContent = totalPrice2.toLocaleString() + '원';
                document.getElementById('totalAll').textContent = totalAll.toLocaleString();
                document.getElementById('totalAll2').textContent = totalAll.toLocaleString();

            }

            // 전체 선택 체크박스 요소 가져오기
            const selectAllCheckbox = document.getElementById("selectAll");
    
            // 개별 아이템 체크박스들 요소 가져오기
            const itemCheckboxes = document.querySelectorAll(".itemCheckbox");
    
            // 전체 선택 체크박스가 변경되었을 때의 이벤트 처리
            selectAllCheckbox.addEventListener("change", function() {
                const isChecked = this.checked;
    
                // 개별 아이템 체크박스들의 상태 변경
                itemCheckboxes.forEach(function(checkbox) {
                    checkbox.checked = isChecked;
                });
            });
    
            // 개별 아이템 체크박스들이 변경되었을 때의 이벤트 처리 (모든 아이템이 선택되었는지 확인)
            itemCheckboxes.forEach(function(checkbox) {
                checkbox.addEventListener("change", function() {
                    const allChecked = [...itemCheckboxes].every(function(item) {
                        return item.checked;
                    });
                    // 모든 개별 아이템이 선택되었는지 확인 후, 전체 선택 체크박스 상태 변경
                    selectAllCheckbox.checked = allChecked;
                });
            });
        </script>
        
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

</html>