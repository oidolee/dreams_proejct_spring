<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/setting.jsp" %>
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
<link rel="stylesheet" href="./resource/css/common/reset.css">
<!-- Bootstrap css-->
<link href="./resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
<!-- swiper css-->
<link rel="stylesheet" href="${path}/resource/css/common/common.css">
<link rel="stylesheet" href="${path}/resource/css/common/header.css">
<link rel="stylesheet" href="${path}/resource/css/common/footer.css">
<link rel="stylesheet" href="${path}/resource/css/index.css">


<!-- productList.css 연결  -->
<link rel="stylesheet" href="${path}/resource/css/product/productList.css">

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


<body>
	<jsp:include page="../../layout/header.jsp"></jsp:include>

	 <div id="slider_con" class="slider-con" >
            <img src="${path}/resource/image/banner/category_GOODS.jpg"   style="width: 100%;">
     </div>
     <br>

	<div class="wrap-page">
		<!-- main -->


		<div class="section-1 center">
			<div>
				<h3>Goods</h3>
				<hr>
				
				<div class="goods_list">
					<div class="goods_card_container">
						
						
						
						
						
						 <c:forEach var="dto" items="${list}" >						
						<div class="goods_card"
							onclick="window.location.href='${path}/detail.pc?product_Category=${dto.product_Category}&product_Name=${dto.product_Name}'">
							<img class="goods_image" src="${dto.product_ImgName}"
								alt="상품 1 이미지">
							<form>
								<table>
									<tr>
										<td>${dto.product_Name}</td>
									</tr>
									<hr>
									<tr>
										<td id="product_Price">${dto.product_Price}원</td>
									</tr>
							</form>
								</table>
						</div>
						
						</c:forEach> 
											
						<!-- <div class="goods_card"
							onclick="window.location.href='detail-1.jsp';">
							<img class="goods_image" src="../image/goods/mousepad1.png"
								alt="상품 1 이미지">

								<table>
									<tr>
										<td>Dreams 마우스패드</td>
									</tr>
									<hr>
									<tr>
										<td>10000원</td>
									</tr>

								</table>
						</div>

						<div class="goods_card"
							onclick="window.location.href='detail-2.jsp';">
							<img class="goods_image" src="../image/goods/mousepad2.png"
								alt="상품 2 이미지">

							<form>
								<table>
									<tr>
										<td>Dreams 마우스패드</td>
									</tr>
									<hr>
									<tr>
										<td>10000원</td>
									</tr>

								</table>
							</form>
						</div>

						<div class="goods_card"
							onclick="window.location.href='detail-3.jsp';">
							<img class="goods_image" src="../image/goods/hat.PNG"
								alt="상품 2 이미지">

							<form>
								<table>
									<tr>
										<td>Dreams 모자</td>
									</tr>
									<hr>
									<tr>
										<td>25000원</td>
									</tr>

								</table>
							</form>
						</div>

						<div class="goods_card"
							onclick="window.location.href='detail-4.jsp';">
							<img class="goods_image" src="../image/goods/smartholder.PNG"
								alt="상품 2 이미지">

							<form>
								<table>
									<tr>
										<td>Dreams 스마트거치대</td>
									</tr>
									<hr>
									<tr>
										<td>15000원</td>
									</tr>

								</table>
							</form>
						</div>

						<div class="goods_card"
							onclick="window.location.href='detail-5.jsp';">
							<img class="goods_image" src="../image/goods/smartholder2.PNG"
								alt="상품 2 이미지">

							<form>
								<table>
									<tr>
										<td>Dreams 스마트거치대</td>
									</tr>
									<hr>
									<tr>
										<td>15000원</td>
									</tr>

								</table>
							</form>
						</div>

						<div class="goods_card"
							onclick="window.location.href='detail-6.jsp';">
							<img class="goods_image" src="../image/goods/key.PNG"
								alt="상품 2 이미지">

							<form>
								<table>
									<tr>
										<td>Dreams 키링</td>
									</tr>
									<hr>
									<tr>
										<td>15000원</td>
									</tr>

								</table>
							</form>
						</div>

						<div class="goods_card"
							onclick="window.location.href='detail-7.jsp';">
							<img class="goods_image" src="../image/goods/ball.png"
								alt="상품 2 이미지">

							<form>
								<table>
									<tr>
										<td>Dreams 야구공</td>
									</tr>
									<hr>
									<tr>
										<td>25000원</td>
									</tr>

								</table>
							</form>
						</div>

						<div class="goods_card"
							onclick="window.location.href='detail-8.jsp';">
							<img class="goods_image" src="../image/goods/uniform1.png"
								alt="상품 2 이미지">

							<form>
								<table>
									<tr>
										<td>Dreams 유니폼</td>
									</tr>
									<hr>
									<tr>
										<td>55000원</td>
									</tr>

								</table>
							</form>
						</div>

						<div class="goods_card"
							onclick="window.location.href='detail-9.jsp';">
							<img class="goods_image" src="../image/goods/uniform2.png"
								alt="상품 2 이미지">

							<form>
								<table>
									<tr>
										<td>Dreams 유니폼</td>
									</tr>
									<hr>
									<tr>
										<td>55000원</td>
									</tr>

								</table>
							</form>
						</div>

						<div class="goods_card"
							onclick="window.location.href='detail-10.jsp';">
							<img class="goods_image" src="../image/goods/muffler.PNG"
								alt="상품 2 이미지">

							<form>
								<table>
									<tr>
										<td>Dreams 머플러</td>
									</tr>
									<hr>
									<tr>
										<td>20000원</td>
									</tr>

								</table>
							</form>
						</div>

						<div class="goods_card"
							onclick="window.location.href='detail-11.jsp';">
							<img class="goods_image" src="../image/goods/hood.png"
								alt="상품 2 이미지">

							<form>
								<table>
									<tr>
										<td>Dreams 후드</td>
									</tr>
									<hr>
									<tr>
										<td>65000원</td>
									</tr>

								</table>
							</form>
						</div>

						<div class="goods_card"
							onclick="window.location.href='detail-12.jsp';">
							<img class="goods_image" src="../image/goods/case1.png"
								alt="상품 2 이미지">

							<form>
								<table>
									<tr>
										<td>Dreams 휴대폰 케이스</td>
									</tr>
									<hr>
									<tr>
										<td>20000원</td>
									</tr>

								</table>
							</form>
						</div>

						<div class="goods_card"
							onclick="window.location.href='detail-13.jsp';">
							<img class="goods_image" src="../image/goods/case2.png"
								alt="상품 2 이미지">

							<form>
								<table>
									<tr>
										<td>Dreams 휴대폰 케이스</td>
									</tr>
									<hr>
									<tr>
										<td>20000원</td>
									</tr>

								</table>
							</form>
						</div>

						<div class="goods_card"
							onclick="window.location.href='detail-14.jsp';">
							<img class="goods_image" src="../image/goods/patch1.PNG"
								alt="상품 2 이미지">

							<form>
								<table>
									<tr>
										<td>Dreams 패치</td>
									</tr>
									<hr>
									<tr>
										<td>8000원</td>
									</tr>

								</table>
							</form>
						</div>

						<div class="goods_card"
							onclick="window.location.href='detail-15.jsp';">
							<img class="goods_image" src="../image/goods/patch2.PNG"
								alt="상품 2 이미지">

							<form>
								<table>
									<tr>
										<td>Dreams 패치</td>
									</tr>
									<hr>
									<tr>
										<td>8000원</td>
									</tr>

								</table>
							</form> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="../../layout/footer.jsp"></jsp:include>

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