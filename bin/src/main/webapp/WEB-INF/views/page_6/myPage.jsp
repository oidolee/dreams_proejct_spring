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
    <title>마이페이지</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/css/common/reset.css">
    <!-- Bootstrap css-->

    <link href="${path}/resources/css/bootstrap/bootstrap.css" rel="stylesheet" />    

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
        .slider-con img {
             width: 100%;
        }
        
        .card {
        	width: 15rem; 
         	text-align: center;
            margin: 30px;
            padding-top: 80px;
            padding-bottom: 30px;
            display:inline-block !important;
        }
        
        .btn-primary {
        	color: white !important;
        	background-color: #1c5c50 !important;
        }
        
        .card-title {
        	color:black !important;
        }
        
    </style>
</head>

<body>
    	<!-- 상단 이동 헤더 -->
        <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
 
        <div id="slider_con" class="slider-con">
            <img src="${path}/resources/image/banner/category_DREAMS.jpg">
        </div>
        <br>

        <br><br><br>
        <h2 style="text-align: center; color: black !important; font-weight: bold;" > 마이페이지 </h2>
        <br><br><br>
        
        <div class="card-list" style="text-align:center">
            <div class="card" >
                <i class="fa-solid fa-user-pen fa-3x"></i>
                <div class="card-body">
                <h5 class="card-title">회원 정보 수정</h5>
                <p class="card-text"></p>
                <a href="${path}/modifyDetailAction.cc" class="btn btn-primary">바로가기</a>
                </div>
            </div>

            <div class="card" >
                <i class="fa-solid fa-cart-flatbed fa-3x"></i>
                <div class="card-body">
                <h5 class="card-title">내 주문 내역</h5>
                <p class="card-text"></p>
                <a href="${path}/myOrder.oc" class="btn btn-primary">바로가기</a>
                </div>
            </div>
			
			<div class="card" >
                <i class="fa-solid fa-ticket fa-3x"></i>
                <div class="card-body">
                <h5 class="card-title">내 티켓</h5>
                <p class="card-text"></p>
                <a href="${path}/myTicket.tc" class="btn btn-primary">바로가기</a>
                </div>
            </div>
            
            <div class="card" >
                <i class="fa-solid fa-trash-can fa-3x"></i>
                <div class="card-body">
                <h5 class="card-title">회원 탈퇴</h5>
                <p class="card-text"></p>
                <a href="${path}/deleteCustomer.cc" class="btn btn-primary">바로가기</a>
                </div>
            </div>
            
        </div> <br><br>

        

        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
    </body>

</html>