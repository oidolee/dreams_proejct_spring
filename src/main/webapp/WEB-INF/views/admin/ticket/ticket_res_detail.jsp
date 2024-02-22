<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/setting.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title> 관리자모드 - 티켓 예매 상세내역페이지 </title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="${path }/resources/admin/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- chartJs -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <style>
        .tableContent .displayNone {
            display: none !important;
        }

        .tableContent .pageBox,
        .tableContent .pageCon {
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

    @keyframes floatUpDown {
        from {
            transform: translateY(0);
        }

        to {
            transform: translateY(10px);
        }
    }
    </style>


</head>

<body class="sb-nav-fixed">
    <%@ include file="../templet/header.jsp" %>
	<div id="layoutSidenav">
        <div id="layoutSidenav_nav">
        	<%@ include file="../templet/nav.jsp" %>
            <a href="../index.jsp">
                <div class="floating-box"></div>
            </a>
        </div>       
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <script>
                        

                    </script>

                    <!-- 드림즈 테이블 상세 -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            티켓 예매 상세내역
                        </div>

                        <div class="tableContent">
                            <input type="hidden" id="nowPage" name="nowPage" value="1">
                            <input type="hidden" id="startNum" name="startNum" value="1">
                            <input type="hidden" id="endNum" name="endNum" value="15">
                            <table id="table" class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">티켓 번호</th>
                                        <th scope="col">티켓좌석</th>
                                        <th scope="col">고객ID</th>
                                        <th scope="col">경기 날짜</th>
                                        <th scope="col">구매 날짜</th>
                                        <th scope="col">티켓 가격</th>
                                    </tr>
                                    <tr>
                                        <td>${trdto.ticket_no}</td>
                                        <td>${trdto.ticket_seat}</td>
                                        <td>${trdto.cust_Id}</td>
                                        <td>${trdto.game_date}</td>
                                        <td>${trdto.purchase_date}</td>
                                        <td>${trdto.ticket_price}</td>
                                    </tr>
                                </thead>
                            </table>

                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <!-- 뒤로가기 -->
                                    <li class="back_ticket" onclick="back_ticket()">
                                        <a class="page-link">뒤로가기</a>
                                    </li>

                                    <div class="pageBox">
                                        <div class="pageCon">
                                        </div>
                                    </div>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>

            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; 드림즈 관리자 </div>
                    </div>
                </div>
            </footer>
        </div>
     
    </div>
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
    <script src="${path}/resources/admin/js/ticket.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="../assets/demo/chart-area-demo.js"></script>
    <script src="../assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
    <script src="../js/datatables-simple-demo.js"></script>
    <!-- 드림즈 테이블, chartJs -->
    <!-- <script src="../js/admin.js"></script> -->
</body>
</html>