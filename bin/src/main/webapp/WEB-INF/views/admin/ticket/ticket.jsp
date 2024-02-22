<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>드림즈 관리자</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="resource/admin/css/styles.css" rel="stylesheet" />
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
    .ticket-kind{
        display: flex;
        justify-content: center;
    }
    
    </style>


</head>

<body class="sb-nav-fixed">
   <%@ include file="/WEB-INF/views/admin/templet/header.jsp" %>
	<div id="layoutSidenav">
        <div id="layoutSidenav_nav">
        	<%@ include file="/WEB-INF/views/admin/templet/nav.jsp" %>
            <a href="../index.jsp">
                <div class="floating-box"></div>
            </a>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <div class="row mt-4">
                        <div class="col-xl-2 col-md-6">
                            <div class="card bg-danger text-white mb-4">
                                <div class="card-body">티켓</div>
                                <div class="card-footer d-flex align-items-center justify-content-between">
                                    <a class="small text-white stretched-link" href="${path}/ticket_detail.tc">티켓 상세내역</a>
                                    <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                </div>
                            </div>
                        </div>
                   		<div class="col-xl-2 col-md-6">
                            <div class="card bg-danger text-white mb-4">
                                <div class="card-body">티켓</div>
                                <div class="card-footer d-flex align-items-center justify-content-between">
                                    <a class="small text-white stretched-link" href="${path}/ResAdminCheck.tc">티켓 예매 현황</a>
                                    <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class=ticket-kind style="display: flex;">
                        <div class="ticket-kind1">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="R.dclub-tab" data-bs-toggle="tab" data-bs-target="#R.dclub-tab-pane"
                                        type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">R.d club 판매현황</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="1fTable-tab" data-bs-toggle="tab" data-bs-target="#1fTable-tab-pane"
                                        type="button" role="tab" aria-controls="1fTable-tab-pane" aria-selected="false">1층 테이블석
                                        판매현황</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="2fTable-tab" data-bs-toggle="tab" data-bs-target="#2fTable-tab-pane"
                                        type="button" role="tab" aria-controls="2fTable-tab-pane" aria-selected="false">2층 테이블석
                                        판매현황</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="darkBg-tab" data-bs-toggle="tab" data-bs-target="#darkBg-tab-pane"
                                        type="button" role="tab" aria-controls="darkBg-tab-pane" aria-selected="false">다크버건디석 판매현황</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="bg-tab" data-bs-toggle="tab" data-bs-target="#bg-tab-pane" type="button"
                                        role="tab" aria-controls="bg-tab-pane" aria-selected="false">버건디석 판매현황</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="outfield-tab" data-bs-toggle="tab" data-bs-target="#outfield-tab-pane"
                                        type="button" role="tab" aria-controls="outfield-tab-pane" aria-selected="false">외야지정석 판매현황</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="34-tab" data-bs-toggle="tab" data-bs-target="#34-tab-pane" type="button"
                                        role="tab" aria-controls="34-tab-pane" aria-selected="false">3, 4층지정석 판매현황</button>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <!-- R.dclub -->
                                <div class="tab-pane fade show active" id="R.dclub-tab-pane" role="tabpanel" aria-labelledby="R.dclub-tab" tabindex="0">
                                    <div class="row">
                                        <!-- // 차트를 그릴 영역으로 canvas태그를 사용한다. -->
                                        <div class="chartCon">
                                            <canvas id="myChart-R.dclub" width="900" height="500"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <!-- 1fTable -->
                                <div class="tab-pane fade hide" id="1fTable-tab-pane" role="tabpanel" aria-labelledby="1fTable-tab" tabindex="0">
                                    <div class="row">
                                        <!-- // 차트를 그릴 영역으로 canvas태그를 사용한다. -->
                                        <div class="chartCon">
                                            <canvas id="myChart-1fTable" width="900" height="500"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <!-- 2fTable -->
                                <div class="tab-pane fade hide" id="2fTable-tab-pane" role="tabpanel" aria-labelledby="2fTable-tab" tabindex="0">
                                    <div class="row">
                                        <!-- // 차트를 그릴 영역으로 canvas태그를 사용한다. -->
                                        <div class="chartCon">
                                            <canvas id="myChart-2fTable" width="900" height="500"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="darkBg-tab-pane" role="tabpanel" aria-labelledby="darkBg-tab" tabindex="0">
                                    <div class="row">
                                        <!-- // 차트를 그릴 영역으로 canvas태그를 사용한다. -->
                                        <div class="chartCon">
                                            <canvas id="myChart-darkBg" width="900" height="500"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade hide" id="bg-tab-pane" role="tabpanel" aria-labelledby="bg-tab" tabindex="0">
                                    <div class="row">
                                        <!-- // 차트를 그릴 영역으로 canvas태그를 사용한다. -->
                                        <div class="chartCon">
                                            <canvas id="myChart-bg" width="900" height="500"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade hide" id="outfield-tab-pane" role="tabpanel" aria-labelledby="outfield-tab"
                                    tabindex="0">
                                    <div class="row">
                                        <!-- // 차트를 그릴 영역으로 canvas태그를 사용한다. -->
                                        <div class="chartCon">
                                            <canvas id="myChart-outfield" width="900" height="500"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade hide" id="34-tab-pane" role="tabpanel" aria-labelledby="34-tab" tabindex="0">
                                    <div class="row">
                                        <!-- // 차트를 그릴 영역으로 canvas태그를 사용한다. -->
                                        <div class="chartCon">
                                            <canvas id="myChart-34" width="900" height="500"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- chart 부분 -->
                    
                    

                    <script>
                        //chartJs

                        // 차트를 그럴 영역을 dom요소로 가져온다.
                        var chartArea = document.getElementById('myChart-R.dclub').getContext('2d');

                        // 차트를 생성한다. 
                        var myChart = new Chart(chartArea, {
                            // ①차트의 종류(String)
                            type: 'bar',
                            // ②차트의 데이터(Object)
                            data: {
                                // ③x축에 들어갈 이름들(Array)
                                labels: ['2023-08', '2023-09', '2023-10', '2023-11', '2023-12', '2024-01'],
                                // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                                datasets: [{
                                    // ⑤dataset의 이름(String)
                                    label: 'R.d club 티켓 판매현황',
                                    // ⑥dataset값(Array)
                                    data: [5, 19, 3, 5, 2, 3],
                                    // ⑦dataset의 배경색(rgba값을 String으로 표현)
                                    backgroundColor: 'rgba(28, 92, 80, 0.2)',
                                    // backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                    // ⑧dataset의 선 색(rgba값을 String으로 표현)
                                    borderColor: 'rgba(28, 92, 80, 0.2)',
                                    // ⑨dataset의 선 두께(Number)
                                    borderWidth: 1
                                }]
                            },
                            // ⑩차트의 설정(Object)
                            options: {
                                //가로 세로 값 수동 주기위함
                                responsive: false,
                                // ⑪축에 관한 설정(Object)
                                scales: {
                                    x: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '월' // x축 레이블
                                        }
                                    },
                                    y: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '티켓 수' // y축 레이블
                                        }
                                    }
                                },

                                plugins: {
                                    title: {
                                        display: true,
                                    },
                                }
                            }
                        });


                    </script>

                    <script>
                        //chartJs

                        // 차트를 그럴 영역을 dom요소로 가져온다.
                        var chartArea = document.getElementById('myChart-1fTable').getContext('2d');

                        // 차트를 생성한다. 
                        var myChart = new Chart(chartArea, {
                            // ①차트의 종류(String)
                            type: 'bar',
                            // ②차트의 데이터(Object)
                            data: {
                                // ③x축에 들어갈 이름들(Array)
                                labels: ['2023-08', '2023-09', '2023-10', '2023-11', '2023-12', '2024-01'],
                                // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                                datasets: [{
                                    // ⑤dataset의 이름(String)
                                    label: '1층 테이블석 티켓 판매현황',
                                    // ⑥dataset값(Array)
                                    data: [20, 10, 3, 5, 2, 3],
                                    // ⑦dataset의 배경색(rgba값을 String으로 표현)
                                    backgroundColor: 'rgba(28, 92, 80, 0.2)',
                                    // backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                    // ⑧dataset의 선 색(rgba값을 String으로 표현)
                                    borderColor: 'rgba(28, 92, 80, 0.2)',
                                    // ⑨dataset의 선 두께(Number)
                                    borderWidth: 1
                                }]
                            },
                            // ⑩차트의 설정(Object)
                            options: {
                                //가로 세로 값 수동 주기위함
                                responsive: false,
                                // ⑪축에 관한 설정(Object)
                                scales: {
                                    x: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '월' // x축 레이블
                                        }
                                    },
                                    y: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '티켓 수' // y축 레이블
                                        }
                                    }
                                },

                                plugins: {
                                    title: {
                                        display: true,
                                    },
                                }
                            }
                        });


                    </script>

                    <script>
                        //chartJs

                        // 차트를 그럴 영역을 dom요소로 가져온다.
                        var chartArea = document.getElementById('myChart-2fTable').getContext('2d');

                        // 차트를 생성한다. 
                        var myChart = new Chart(chartArea, {
                            // ①차트의 종류(String)
                            type: 'bar',
                            // ②차트의 데이터(Object)
                            data: {
                                // ③x축에 들어갈 이름들(Array)
                                labels: ['2023-08', '2023-09', '2023-10', '2023-11', '2023-12', '2024-01'],
                                // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                                datasets: [{
                                    // ⑤dataset의 이름(String)
                                    label: '2층 테이블석 티켓 판매현황',
                                    // ⑥dataset값(Array)
                                    data: [5, 19, 3, 5, 20, 3],
                                    // ⑦dataset의 배경색(rgba값을 String으로 표현)
                                    backgroundColor: 'rgba(28, 92, 80, 0.2)',
                                    // backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                    // ⑧dataset의 선 색(rgba값을 String으로 표현)
                                    borderColor: 'rgba(28, 92, 80, 0.2)',
                                    // ⑨dataset의 선 두께(Number)
                                    borderWidth: 1
                                }]
                            },
                            // ⑩차트의 설정(Object)
                            options: {
                                //가로 세로 값 수동 주기위함
                                responsive: false,
                                // ⑪축에 관한 설정(Object)
                                scales: {
                                    x: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '월' // x축 레이블
                                        }
                                    },
                                    y: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '티켓 수' // y축 레이블
                                        }
                                    }
                                },

                                plugins: {
                                    title: {
                                        display: true,
                                    },
                                }
                            }
                        });


                    </script>

                    <script>
                        //chartJs

                        // 차트를 그럴 영역을 dom요소로 가져온다.
                        var chartArea = document.getElementById('myChart-darkBg').getContext('2d');

                        // 차트를 생성한다. 
                        var myChart = new Chart(chartArea, {
                            // ①차트의 종류(String)
                            type: 'bar',
                            // ②차트의 데이터(Object)
                            data: {
                                // ③x축에 들어갈 이름들(Array)
                                labels: ['2023-08', '2023-09', '2023-10', '2023-11', '2023-12', '2024-01'],
                                // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                                datasets: [{
                                    // ⑤dataset의 이름(String)
                                    label: '다크 버건디석 티켓 판매현황',
                                    // ⑥dataset값(Array)
                                    data: [5, 19, 13, 5, 2, 3],
                                    // ⑦dataset의 배경색(rgba값을 String으로 표현)
                                    backgroundColor: 'rgba(28, 92, 80, 0.2)',
                                    // backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                    // ⑧dataset의 선 색(rgba값을 String으로 표현)
                                    borderColor: 'rgba(28, 92, 80, 0.2)',
                                    // ⑨dataset의 선 두께(Number)
                                    borderWidth: 1
                                }]
                            },
                            // ⑩차트의 설정(Object)
                            options: {
                                //가로 세로 값 수동 주기위함
                                responsive: false,
                                // ⑪축에 관한 설정(Object)
                                scales: {
                                    x: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '월' // x축 레이블
                                        }
                                    },
                                    y: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '티켓 수' // y축 레이블
                                        }
                                    }
                                },

                                plugins: {
                                    title: {
                                        display: true,
                                    },
                                }
                            }
                        });


                    </script>

                    <script>
                        //chartJs

                        // 차트를 그럴 영역을 dom요소로 가져온다.
                        var chartArea = document.getElementById('myChart-bg').getContext('2d');

                        // 차트를 생성한다. 
                        var myChart = new Chart(chartArea, {
                            // ①차트의 종류(String)
                            type: 'bar',
                            // ②차트의 데이터(Object)
                            data: {
                                // ③x축에 들어갈 이름들(Array)
                                labels: ['2023-08', '2023-09', '2023-10', '2023-11', '2023-12', '2024-01'],
                                // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                                datasets: [{
                                    // ⑤dataset의 이름(String)
                                    label: '버건디석 티켓 판매현황',
                                    // ⑥dataset값(Array)
                                    data: [5, 9, 3, 5, 2, 3],
                                    // ⑦dataset의 배경색(rgba값을 String으로 표현)
                                    backgroundColor: 'rgba(28, 92, 80, 0.2)',
                                    // backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                    // ⑧dataset의 선 색(rgba값을 String으로 표현)
                                    borderColor: 'rgba(28, 92, 80, 0.2)',
                                    // ⑨dataset의 선 두께(Number)
                                    borderWidth: 1
                                }]
                            },
                            // ⑩차트의 설정(Object)
                            options: {
                                //가로 세로 값 수동 주기위함
                                responsive: false,
                                // ⑪축에 관한 설정(Object)
                                scales: {
                                    x: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '월' // x축 레이블
                                        }
                                    },
                                    y: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '티켓 수' // y축 레이블
                                        }
                                    }
                                },

                                plugins: {
                                    title: {
                                        display: true,
                                    },
                                }
                            }
                        });


                    </script>

                    <script>
                        //chartJs

                        // 차트를 그럴 영역을 dom요소로 가져온다.
                        var chartArea = document.getElementById('myChart-outfield').getContext('2d');

                        // 차트를 생성한다. 
                        var myChart = new Chart(chartArea, {
                            // ①차트의 종류(String)
                            type: 'bar',
                            // ②차트의 데이터(Object)
                            data: {
                                // ③x축에 들어갈 이름들(Array)
                                labels: ['2023-08', '2023-09', '2023-10', '2023-11', '2023-12', '2024-01'],
                                // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                                datasets: [{
                                    // ⑤dataset의 이름(String)
                                    label: '외야지정석 티켓 판매현황',
                                    // ⑥dataset값(Array)
                                    data: [11, 19, 13, 5, 2, 13],
                                    // ⑦dataset의 배경색(rgba값을 String으로 표현)
                                    backgroundColor: 'rgba(28, 92, 80, 0.2)',
                                    // backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                    // ⑧dataset의 선 색(rgba값을 String으로 표현)
                                    borderColor: 'rgba(28, 92, 80, 0.2)',
                                    // ⑨dataset의 선 두께(Number)
                                    borderWidth: 1
                                }]
                            },
                            // ⑩차트의 설정(Object)
                            options: {
                                //가로 세로 값 수동 주기위함
                                responsive: false,
                                // ⑪축에 관한 설정(Object)
                                scales: {
                                    x: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '월' // x축 레이블
                                        }
                                    },
                                    y: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '티켓 수' // y축 레이블
                                        }
                                    }
                                },

                                plugins: {
                                    title: {
                                        display: true,
                                    },
                                }
                            }
                        });


                    </script>

                    <script>
                        //chartJs

                        // 차트를 그럴 영역을 dom요소로 가져온다.
                        var chartArea = document.getElementById('myChart-34').getContext('2d');

                        // 차트를 생성한다. 
                        var myChart = new Chart(chartArea, {
                            // ①차트의 종류(String)
                            type: 'bar',
                            // ②차트의 데이터(Object)
                            data: {
                                // ③x축에 들어갈 이름들(Array)
                                labels: ['2023-08', '2023-09', '2023-10', '2023-11', '2023-12', '2024-01'],
                                // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                                datasets: [{
                                    // ⑤dataset의 이름(String)
                                    label: '3, 4층 지정석 티켓 판매현황',
                                    // ⑥dataset값(Array)
                                    data: [5, 19, 3, 5, 2, 3],
                                    // ⑦dataset의 배경색(rgba값을 String으로 표현)
                                    backgroundColor: 'rgba(28, 92, 80, 0.2)',
                                    // backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                    // ⑧dataset의 선 색(rgba값을 String으로 표현)
                                    borderColor: 'rgba(28, 92, 80, 0.2)',
                                    // ⑨dataset의 선 두께(Number)
                                    borderWidth: 1
                                }]
                            },
                            // ⑩차트의 설정(Object)
                            options: {
                                //가로 세로 값 수동 주기위함
                                responsive: false,
                                // ⑪축에 관한 설정(Object)
                                scales: {
                                    x: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '월' // x축 레이블
                                        }
                                    },
                                    y: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '티켓 수' // y축 레이블
                                        }
                                    }
                                },

                                plugins: {
                                    title: {
                                        display: true,
                                    },
                                }
                            }
                        });


                    </script>
                    <!-- 드림즈 테이블 -->
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="../assets/demo/chart-area-demo.js"></script>
    <script src="../assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
    <!-- 드림즈 테이블, chartJs -->
    <script src="../js/admin.js"></script>
</body>

</html>