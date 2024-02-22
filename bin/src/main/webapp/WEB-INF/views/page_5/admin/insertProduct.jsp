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
<link href="../css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- chartJs -->
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<style>
.tableContent .displayNone {
	display: none !important;
}

.tableContent .pageBox, .tableContent .pageCon {
	display: flex;
}

.chartCon {
	display: flex;
	justify-content: center;
	overflow-x: auto;
}

.floating-box {
	width: 50px;
	height: 50px;
	background: url("../../image/logoSmall.png") no-repeat 50% 50%;
	background-size: 110px;
	position: fixed;
	bottom: 10px;
	left: 250px;
	border-radius: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #fff;
	font-weight: bold;
	cursor: pointer;
	animation: floatUpDown 1s infinite alternate;
	transition: transform 0.3s;
	z-index: 10000;
}

.floating-box:hover {
	transform: translateY(-5px);
}

.floating-box::before {
	content: "드림즈 메인";
	white-space: pre-line;
	position: absolute;
	width: 58px;
	text-align: center;
	top: -50px;
	left: 50%;
	transform: translateX(-50%);
	background-color: #1c5c50;
	color: #fff;
	padding: 5px;
	border-radius: 3px;
	font-size: 12px;
	opacity: 0;
	transition: opacity 1s ease-in-out;
}

.floating-box:hover::before {
	opacity: 1;
}

@
keyframes floatUpDown {from { transform:translateY(0);
	
}

to {
	transform: translateY(10px);
}
}

.table_div  table th, td {
   height: 50px;
   border: 1px solid black;
   padding-left: 2px;
   text-align: center;
}
</style>

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
	
	$(function(){
		
		// 목록으로 돌아가기
		$("#btnList").click(function(){
			location.href="${path}/product_list.pc";
		});
		
		// 상품등록 누를시 컨트롤러의 등록처리화면으로 이동
		$('#btnAdd').click(function() {
			// alert("test");
			document.insertform.action = "${path}/insertProductAction.pc";
			document.insertform.submit();
		});
	});
	
	$(function() {
	    // 카테고리 선택 시
	    $('#product_Category').change(function() {
	        var selectedCategory = $(this).val(); // 선택된 카테고리
	        var fileNames = {
	            '마우스패드': 'mousepadSize.jpg',
	            '의류': 'uniformSize1.jpg',
	            '핸드폰케이스': ' ',
	            '기타': ' '
	        }; // 카테고리에 따른 파일 이름 매핑
	        
	        // 선택된 카테고리에 해당하는 파일 이름 가져오기
	        var selectedFileName = fileNames[selectedCategory];
	        
	        // 파일 이름이 존재하면 상품 상세 설명 이미지 칸에 입력
	        if (selectedFileName) {
	            $('#product_ImgDetail').val(selectedFileName);
	        } else {
	            $('#product_ImgDetail').val(''); // 파일 이름이 없으면 칸 비우기
	        }
	    });
	});
	
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

				<div class="table_div">
					<form name="insertform"	method="post" id="insertform" enctype="multipart/form-data">
						<table border="1">
							
							<!-- <tr>
								<th>* 상품번호</th>
								<td><input type="text" class="input" name="product_No" id="product_No"
									size="40" placeholder="상품번호" required></td>
							</tr> -->
						
							<tr>
								<th>* 상품명</th>
								<td><input type="text" class="input" name="product_Name" id="product_Name"
									size="40" placeholder="상품명을 작성하시오(40자 이내)" required></td>
							</tr>
							
							
							<tr>
								<th>* 판매가격</th>
								<td><input type="number" class="input" name="product_Price" id="product_Price"
									size="10" placeholder="상품가격을 작성하시오" required></td>
							</tr>
							
							<tr>
								<th>* 등록수량</th>
								<td><input type="number" class="input" name="product_Qty" id="product_Qty"
									size="10" placeholder="등록수량을 작성하시오" required></td>
							</tr>
							
							<tr>
								<th>* 카테고리</th>
								<td>
								<select class="input" name="product_Category" id="product_Category" required>
									<option value=""> 상품카테고리 </option>
									<option value="마우스패드"> 마우스패드 </option>
									<option value="의류"> 의류 </option>
									<option value="핸드폰케이스"> 핸드폰케이스 </option>
									<option value="기타"> 기타 </option>
								</select>
								</td>
							</tr>
							
							<tr>
								<th>* 상품이미지</th>
								<td><input type="file" class="input" name="product_ImgName" id="product_ImgName"
									size="40" accept="image/*"></td>
							</tr>

							<tr>
								<th>* 상품 상세 설명 이미지</th>
								<td><input type="text" class="input" name="product_ImgDetail" id="product_ImgDetail"
									size="40" ></td>
							</tr>
							
							<tr>
								<th>* 상품 사이즈 사진 이미지</th>
								<td><input type="text" class="input" name="product_ImgSize" id="product_ImgSize"
									size="40" value="sizeInform.jpg"></td>
							</tr>
							
							
							<tr>
								<th>반품/환불 이미지</th>
								<td><input type="text" class="input" name="product_ImgRfd" id="product_ImgRfd"
									size="40" value="refund.PNG"></td>
							</tr>

							<tr>
								<td colspan="2"><br>
									<div align="right">
										<input class="inputbutton" type="submit" value="상품등록" id="btnAdd">
										<input class="inputbutton" type="reset" value="초기화" > 
										<input class="inputbutton" type="button" value="등록취소" id="btnList">
										<!--  -->
									</div></td>
							</tr>
						</table>
					</form>
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