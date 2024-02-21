<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/setting.jsp" %>      
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 신재욱 --> 
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <title> 교환/환불 신청서 조회 </title>
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <%-- <link href="${path}/css/bootstrap/bootstrap.css" rel="stylesheet" /> --%>
    <!-- swiper css-->
    <link rel="stylesheet" href="${path}/css/common/common.css">
    <link rel="stylesheet" href="${path}/css/common/header.css">
    <link rel="stylesheet" href="${path}/css/common/footer.css">
    <link rel="stylesheet" href="${path}/css/index.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${path}/js/bootstrap/bootstrap.bundle.js"></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- header.js -->
    <script src="${path}/js/common/header.js"></script>

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
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/b0cbfa47b4.js" crossorigin="anonymous"></script>
    <style>
        .container-box {
            padding: 0;
        }

        .slider-con img {
             width: 100%;
        }
        
        .refund-goods {
            width: 540px;
            text-align: center;
            margin: auto;
        }

        .refund-goods label, input {
            color: black !important;
            font-weight: bold;
        }
        
        table tr, th {
        	margin: 0 auto;
        	padding-right: 50px;
        	vertical-align:middle;
        }
        
        .btn-primary {
        	color: white !important;
        	background-color: #1c5c50 !important;
        }
        
        .col-sm-5 {
        	padding: 7px, 12px !important;
        }
        
        
        .refund-detail th {
        	color:white !important;
        	text-align: center;
        	padding:5px;
        	background : #1c5c50;
        	font-weight: bold;
        }
        
        .refund-detail td {
        	color:black !important;
        	text-align: left;
        	padding-left: 30px;
        }
    </style>
</head>

<body>
    	<!-- 상단 이동 헤더 -->
        <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
 
        <div id="slider_con" class="slider-con">
            <img src="${path}/image/banner/category_DREAMS.jpg">
        </div>
        <br>

        <br><br><br><br><br><br>
        <h2 style="text-align: center; color: black !important; font-weight: bold;" > 교환/환불 신청서 조회 </h2>
        <br><br><br>
        
		
		<c:forEach var="refund" items="${list}">
			<h4 style="text-align:center; color:black !important;"> 환불신청번호 : ${refund.REF_No}  </h4><br>
	        <div class=refund-goods>
	            <div style="text-align:center; color:black !important; margin:5px">
	            	<table class="refund-detail" style="margin:10px auto; border:1px black !important; color:black !important" >
	            		<tr>
	            			<th> 주문번호 </th>
	            			<td>${refund.order_No}</td>
	            		</tr>
	            		
	            		<tr>
	            			<th> 이름 </th>
	            			<td>${refund.REF_Name }</td>
	            		</tr>
	            		
	            		<tr>
	            			<th> 연락처 </th>
	            			<td> ${refund.REF_Phone }</td>
	            		</tr>
	            		
	            		<tr>
	            			<th> 주소 </th>
	            			<td> ${refund.REF_Address }</td>
	            		</tr>
	            		
	            		<tr>
	            			<th> 상품번호 </th>
	            			<td> ${refund.REF_Prod_No }</td>
	            		</tr>
	            		
	            		<tr>
	            			<th> 상품명 </th>
	            			<td> ${refund.REF_Prod_Name}</td>
	            		</tr>
	            		
	            		<tr>
	            			<th> 환불/교환 개수 </th>
	            			<td> ${refund.REF_Prod_qty } </td>
	            		</tr>
	            		
	            		<tr>
	            			<th> 환불/교환 사유 </th>
	            			<td> ${refund.REF_Reason } </td>
	            		</tr>
	            		
	            		<tr>
	            			<th> 환불 받을 계좌번호 </th>
	            			<td> ${refund.REF_Account } </td>
	            		</tr>
	            		
	            		<tr>
	            			<th> 환불/교환 신청일 </th>
	            			<td> ${refund.REF_Date } </td>
	            		</tr>
	            		
	            		<tr>
	            			<th> 환불/교환 </th>
	            			<td> ${refund.REF_Status } </td>
	            		</tr>
	            	</table>
	        	</div>     
	        </div>
        <br><br><br>
        </c:forEach>
        <div class=refund-goods>
        	<a href="${path}/myPage.oc"><button type="button" class="btn btn-primary" style="color: white !important;"> 마이페이지 </button></a>
        </div>
    	<br><br><br>
    	
        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
    </body>

</html>