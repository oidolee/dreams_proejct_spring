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
    <title>상품 교환/환불</title>
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
        
        function selectBankChk(){
            
            if(document.refundForm.REF_Account1.value == 0) {  // 직접입력인 경우
               document.refundForm.REF_Account2.value = "";
               document.refundForm.REF_Account2.focus();
               return false;
            }
            else {
               document.refundForm.REF_Account2.value = document.refundForm.REF_Account1.value;
               return false;
            }
        }
        
     	
        $(document).ready(function () {
            // 라디오 버튼이 변경될 때 실행되는 함수
            $('input[name="goods"]').on('change', function () {
                // 선택된 라디오 버튼의 부모 행을 찾음
                var selectedRow = $(this).closest('tr');

                // 부모 행에서 각 필드의 값을 가져와서 폼에 할당
                var prodNo = selectedRow.find('td:eq(2)').text();
                var prodName = selectedRow.find('td:eq(3)').text();

                // 폼의 각 입력란에 값을 할당
                $('#REF_Prod_No').val(prodNo);
                $('#REF_Prod_Name').val(prodName);

                // 성명(input 요소)에 포커스 설정
                $('#REF_Name').focus();
            });
        });
    </script>
    <style>
        .slider-con img{
            width: 100%;
        }

        .goods {
            text-align: center;
            width: 768px;
            margin: 0 auto;
        }

        table {
            margin-left: auto;
            margin-right: auto;
            border-spacing: 2px;
            border-collapse: separate;
            color: black !important;
        }
        
        thead tr th {
            font-weight: bold;
            vertical-align: middle !important;
            color:black !important;
        }

        tbody tr td {
            vertical-align: middle;
            color: black !important;
        }

        .form tr label {
            color: #000 !important;
        }
        
        .form {
            border-spacing: 10px;
            border-collapse: separate;
            color: black !important;
        }
        
        .btn-primary {
        	color: white !important;
        	background-color: #1c5c50 !important;
        }
        
        </style>
</head>

<body>
    	<!-- 상단 이동 헤더 -->
        <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
 
        <div id="slider_con" class="slider-con">
            <img src="${path}/resource/image/banner/category_DREAMS.jpg">
        </div>
        <br>
 

        <div class="goods">
            <h2 style="color: #000 !important; font-weight: bold;"><br>상품 교환/환불<br><br></h2>
            <fieldset> 
                <legend style="color: #000 !important; font-weight: bold;"> 최근 구매한 상품<hr> </legend>
                <table class="table" align="center">
                    <thead>
                      <tr style="color:black !important; ">
                        <th scope="col" style="color:white !important; background-color:#1c5c50;">선택</th>
                        <th scope="col" style="color:white !important; background-color:#1c5c50;">주문상세번호</th>
                        <th scope="col" style="color:white !important; background-color:#1c5c50;">상품번호</th>
                        <th scope="col" style="color:white !important; background-color:#1c5c50;">상품명</th>
                        <th scope="col" style="color:white !important; background-color:#1c5c50;">수량</th>
                        <th scope="col" style="color:white !important; background-color:#1c5c50;">가격</th>
                      </tr>
                    </thead>
                    <tbody class="table-group-divider">
	                    <c:forEach var="list" items="${ list }">
	                      <tr>
	                        <td><input type="radio" name="goods"></td>
	                        <td>${list. orderDetail_No}</td>
	                        <td>${list. product_No}</td>
	                        <td>${list.product_Name}</td>
	                        <td>${list.orderDetail_qty}개</td>
	                        <td>${list.orderDetail_price}원</td>
	                      </tr>
	                    </c:forEach>  
                    </tbody>
                </table>
            </fieldset>
            
            <div>
                
                <br>
                <h2 style="color:#000 !important; font-weight: bold;">교환/환불 신청서</h2>
                <br><br>
                <form name="refundForm" method="post" action="goodsRefundSubmit.oc">
                	<input type="hidden" id="order_No" name="order_No" size="65" required value="${param.order_No}">
                	<input type="hidden" id="REF_cust_Id" name="REF_cust_Id" value="hong"> <!-- ${sessionScope.sessionId} -->
	                <table class="form">
	                    <tr>
	                        <th align="center" style="background-color:#1c5c50;">
	                        	<label for="order_No" style="color:white !important; padding:5px">주문번호</label>
	                        </th>
	                        <td align="left">
	                        	<input type="text" id="order_No" name="order_No" size="65" required value="${param.order_No}" disabled>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center" style="background-color:#1c5c50;">
	                        	<label for="REF_Name" style="color:white !important; padding:5px">성명</label>
	                        </th>
	                        <td align="left">
	                        	<input type="text" id="REF_Name" name="REF_Name" size="65" required>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center" style="background-color:#1c5c50;">
	                        	<label for="REF_Phone" style="color:white !important; padding:5px">연락처</label>
	                        </th>
	                        <td align="left">
	                        	<input type="text" id="REF_Phone" name="REF_Phone" size="65" required>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center" style="background-color:#1c5c50;">
	                        	<label for="REF_Address" style="color:white !important; padding:5px">주소</label>
	                        </th>
	                        <td align="left">
	                        	<input type="text" id="REF_Address" name="REF_Address" size="65" required>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center" style="background-color:#1c5c50;">
	                        	<label for="REF_Prod_No" style="color:white !important; padding:5px"> 상품번호 </label>
	                        </th>
	                        <td align="left">
	                        	<input type="text" id="REF_Prod_No" name="REF_Prod_No" size="65" required>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center" style="background-color:#1c5c50;">
	                        	<label for="REF_Prod_Name" style="color:white !important; padding:5px">상품명</label>
	                        </th>
	                        <td align="left">
	                        	<input type="text" id="REF_Prod_Name" name="REF_Prod_Name" size="65" required>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center" style="background-color:#1c5c50;">
	                        	<label for="REF_Prod_qty" style="color:white !important; padding:5px">개수</label>
	                        </th>
	                        <td align="left">
	                        	<input type="text" id="REF_Prod_qty" name="REF_Prod_qty" size="3" required>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center" style="background-color:#1c5c50;">
	                        	<label for="REF_Status" style="color:white !important; padding:5px"> 교환/환불 </label>
	                        </th>
	                        <td align="left" style="color:black !important">
	                        	<input type="radio" id="REF_Status" name="REF_Status" value="교환"> 교환
	                        	<input type="radio" id="REF_Status" name="REF_Status" value="환불"> 환불
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center" style="background-color:#1c5c50;">
	                        	<label for="REF_Reason" style="color:white !important; padding:5px"> 교환/환불 사유 </label>
	                        </th>
	                        <td align="left">
	                        	<textarea name="REF_Reason" id="REF_Reason" cols="66" rows="5"></textarea>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center" style="background-color:#1c5c50;">
	                        	<label for="REF_Account" style="color:white !important; padding:5px"> 환불시 계좌 번호</label>
	                        </th>
	                        <td align="left">
	                            <select name="REF_Account1" style="width:100px" onchange="selectBankChk()" >
	                                <option value="">은행선택</option>
	                                <option value="국민은행">국민은행</option>
	                                <option value="하나은행">하나은행</option>
	                                <option value="우리은행">우리은행</option>
	                                <option value="카카오뱅크">카카오뱅크</option>
	                                <option value="0">직접입력</option>
	                            </select>
	                            <input type="text" id="REF_Account2" name="REF_Account2" size="15" required>
	                            <input type="text" id="REF_Account3" name="REF_Account3" size="30" required placeholder="-없이 숫자만 입력"> 
	                        </td>		
	                    </tr>
	                    
	                    <tr>
	                        <td colspan="2"><br>
	                            <div align = "center">
	                                <button id=refund_btn class="btn btn-primary" type="submit" style="color: #fff !important;">교환/환불</button>
	                                <a href="${path}/myPage.oc"><button class="btn btn-primary" type="button" style="color: #fff !important;">취소</button></a>
	                            </div>
	                        </td>	
	                    </tr>
	                    
	                </table>
				</form>	
            </div>
        </div>
        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
    </body>

</html>