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
<link href="/dreams_project_2/resource/admin/css/product.css"
	rel="stylesheet">
<link href="/dreams_project_2/resource/admin/css/styles.css"
	rel="stylesheet" />
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
	
</script>
</head>

<body class="sb-nav-fixed">

	<%@ include file="/resources/admin/templet/header.jsp"%>
	
	


	<c:if test="${updateCnt == 1}">
		<script type="text/javascript">
						setTimeout(function() {
							alert("상품수정 성공");
							window.location="${path}/product_list.pc?pageNum=${hiddenPageNum}";
						}, 1000);
						</script>
	</c:if>

	<c:if test="${updateCnt != 1}">
		<script type="text/javascript">
						setTimeout(function() {
							alert("상품수정 실패");
							window.location="${path}/detailProduct.pc?product_No=${hiddenproduct_No}&pageNum=${hiddenPageNum}";
						}, 1000);
						</script>
	</c:if>





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
		<script src="${path}/resources/admin/js/admin.js"></script>
	<!-- 드림즈 테이블, chartJs -->
	<script src="../js/admin.js"></script>
</body>

</html>