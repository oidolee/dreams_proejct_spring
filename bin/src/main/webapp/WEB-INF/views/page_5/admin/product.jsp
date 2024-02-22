<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/setting.jsp" %>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link  href="${path}/resources/admin/css/product.css" rel="stylesheet">
<link href="${path}/resources/admin/css/styles.css" rel="stylesheet" />
<title>드림즈 관리자</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />


<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- chartJs -->
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<script>
	function addProduct() {
		window.open('addItem.jsp', "상품추가", "width=1000 , height=600");
	}
</script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>


<script>
	//왼쪽 페이지 이동
	function moveChange(type) {
		console.log(type)
		if (type == 1) {
			window.location.href = "./member/member.html";
		} else if (type == 2) {
			window.location.href = "./account/acocunt.html";
		} else if (type == 3) {
			window.location.href = "./board/board.html";
		} else {
			window.location.href = "./ticket/ticket.html";
		}
	}
</script>
</head>

<body class="sb-nav-fixed">

	<%@ include file="/resources/admin/templet/header.jsp"%>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<%@ include file="/resources/admin/templet/nav.jsp"%>
			<a href="../index.html">
				<div class="floating-box"></div>
			</a>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="wrap-table">
					<h2>상품 관리</h2>
		

					<table border="1" id="productTable">
						<tr>
							<th>상품 번호</th>
							<th>상품이름</th>
							<th>가격</th>
							<th>상품 재고</th>
							<th>상품 카테고리</th>
							<th>상품이미지</th>
							<th>상품상세이미지</th>
							<th>상품정보이미지</th>
							<th>반품관련이미지</th>
							<th>등록일</th>
						</tr>
						<c:forEach var="dto" items="${list }">
							<tr>
								<td> ${dto.product_No} </td>
								<td> ${dto.product_Name}</td>
								<td> ${dto.product_Price} </td>
								<td> ${dto.product_Qty} </td>
								<td> ${dto.product_Category}</td>
								<td> <img src="${dto.product_ImgName}" width="100px"> </td>
								<td> <img src="${path}/resources/upload/${dto.product_ImgDetail}" width="100px"></td>
								<td> <img src="${path}/resources/upload/${dto.product_ImgSize}" width="100px"></td>
								<td> <img src="${path}/resources/upload/${dto.product_ImgRfd}" width="100px"></td>
								<td> ${dto.regDate}</td>
								
								<td>
									<center>
										<input type="button" type="button" value="수정" onclick="window.location='${path}/detailProduct.pc?product_No=${dto.product_No}&pageNum=${paging.pageNum}'">
									</center>
								</td>
								
								<td>
									<center>
										<input type="button" type="button" value="삭제" onclick="window.location='${path}/deleteProductAction.pc?product_No=${dto.product_No}'">
									</center>
								</td>
								
							</tr>
						</c:forEach>
						
						<tr>
							<td colspan="9" align="center">
								<!-- 페이징 처리 -->
								<!-- 이전 버튼 활성화 -->
								<c:if test="${paging.startPage > 10}">
									<a href="${path}/product_list.pc?pageNum=${paging.prev}">[이전]</a>
								</c:if>
								<!-- 페이지 번호 처리 -->
								<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
									<a href="${path }/product_list.pc?pageNum=${num}">${num}</a>
								</c:forEach>
								
								<!-- 다음 버튼 활성화 -->
								<c:if test="${paging.startPage < paging.pageCount}">
									<a href="${path }/product_list.pc?pageNum=${paging.next}">[다음]</a>
								</c:if>
							</td>
						</tr>
					</table>

					<br> <br>
					<div class="button">
						<button id="addProduct" onclick="window.location.href='${path}/insertProduct.pc'">물품관리</button>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; 드림즈 관리자</div>
					</div>
				</div>
			</footer>
		</div>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${path}/resources/admin/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="${path}/resources/admin/assets/demo/chart-area-demo.js"></script>
	<script src="${path}/resources/admin/assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="${path}/resources/admin/js/datatables-simple-demo.js"></script>
	<!-- 드림즈 테이블, chartJs -->
	<script src="${path}/resources/admin/js/admin.js"></script>
</body>

</html>