<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 이민진 -->
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>드림즈</title>
<!-- reset.css -->
<link rel="stylesheet" href="${path}/resources/css/common/reset.css">
<!-- Bootstrap css-->
<link href="${path}/resources/css/bootstrap/bootstrap.css" rel="stylesheet" />
<!-- swiper css-->
<link rel="stylesheet" href="${path}/resources/css/common/common.css">
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/index.css">

<!-- product.css 연결  -->
<link rel="stylesheet" href="${path}/resources/css/product/product.css">

<!-- jQuery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<!-- Bootstrap js -->
<script src="./resource/js/bootstrap/bootstrap.bundle.js"></script>
<!-- swiper js-->
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
	integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
	crossorigin="anonymous"></script>
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
        
        
         // 수량에 따라 최종 금액을 업데이트하는 함수
        function updateTotalPrice() {
            // 입력 요소에서 선택한 수량을 가져옵니다
            var quantity = parseInt($('#quantity').val());

            // 단위 가격을 정의합니다 (실제 단위 가격으로 대체할 수 있습니다)
            var unitPrice = ${dto.product_Price};

            // 수량에 기반하여 최종 금액을 계산합니다
            var totalPrice = quantity * unitPrice;

            // 최종 금액 표시를 업데이트합니다
            $('#totalPrice h3').text('최종 금액: ' + totalPrice + '원');
        }

        // 페이지 로드 시 함수를 호출합니다
        $(document).ready(function () {
            updateTotalPrice();

            // 수량 입력 필드의 변경 이벤트에 대한 이벤트 리스너를 추가하여 수량이 변경될 때 최종 금액을 업데이트합니다
            $('#quantity').on('input', function () {
                updateTotalPrice();
            });
        });
        
        


    </script>
</head>


<body>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

	<div class="slider-con">
			<div class="slider-box">
				<img src="${path}/resources/image/banner/category_GOODS.jpg"   style="width: 100%;">
			</div>
	</div>
	
	<div class="wrap-page">
		<div class="product-detail-1">
			<hr>
			<table class="wrap-table">
				<tr class="product-inform">
					<td colspan="3" id="image"><img
						src="${dto.product_ImgName}" width="300px" height="400px"></td>
					<td colspan="2">
						<h1>${dto.product_Name}</h1> <br>
						<div class="price">
							<h3>${dto.product_Price}</h3>
						</div>

						<div class="price-info">
							<h5>택배 무료</h5>
							<h5>굿즈종류 ${dto.product_Category} </h5>
						</div>

						<!-- <h5>옵션 선택</h5> <select class="custom-select">
							<option value="0">사이즈를 선택해 주세요.</option>
							<option value="S">S</option>
							<option value="M">M</option>
							<option value="L">L</option>
							<option value="XL">XL</option>
							<option value="2XL">2XL</option>
							<option value="3XL">3XL</option>

					</select> <br>
					<br> -->
					<form id="purchaseForm" action="#" method="post">
						<div class="quantity">
							<label>수량</label> <input type="number" id="quantity" min="1"
								value="1">
						</div> <br> <br> <br>

						<div id="totalPrice" class="price">
							<h3 style="text-align: right;">최종 금액: ${dto.product_Price}원</h3>
						</div>

						<div class="action-buttons">
						
							<input type="hidden" name="product_No" value="${dto.product_No}"> 
							<input type="hidden" name="product_Name" value="${dto.product_Name}"> 
							<input type="hidden" name="product_Price" value="${dto.product_Price}">
						
							<a href="#" class="buy-button">구매하기</a> <a
								href="../page_1/basket.html" class="cart-button">장바구니 담기</a>
						</div>
					</form>
					</td>
				</tr>
			</table>

			<hr>

			<div class="product-image">
				<%-- <img src="${path}/resource/upload/${dto.product_ImgSize}"> 
				<img src="${path}/resource/upload/${dto.product_ImgDetail}" width="600px">  --%>
				<img src="${path}/resources/upload/${dto.product_ImgRfd}">
			</div>
		</div>
	</div>







	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

</body>
</div>

</html>