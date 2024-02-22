<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/setting.jsp" %>
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
                                    <li class="back_cust" onclick="back_cust()">
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

                <script>

//드림즈 table
/* let data = [
  [1, 'abce', '이름1', '남',1990],
  [2, 'bbce', '이름2', '남'],
  [3, 'cbce', '이름3', '남'],
  [4, 'dbce', '이름4', '남'],
  [5, 'ebce', '이름5', '남'],
];

console.log(data[0][4]) */



// 최종 결과를 담을 변수
let cutList = 5;

//현재페이지
let pageCount = 1;

//행카운트
let pagiNationList = $(".pageBox li");

//하단 묵음 페이지 수 
let groupBottomNum = 3;

let fintFramneNum = Math.ceil(data.length / cutList)

function tableList(pageCount) {
  $("#table tbody").remove()
  let totalCount = 0;
  let tableRows = '';
  let startNum = (pageCount - 1) * cutList;
  let endNum = pageCount * cutList;
  let getTotalNum = cutList * groupBottomNum;
  for (let i = 0; i < fintFramneNum; i++) {
    $("#table").append('<tbody id="tbodyHome_' + i + '"></tbody>')
  }
  //이전페이지 체크
  if (pageCount == 1) {
    $(".prev").addClass("disabled")
  } else {
    $(".prev").removeClass("disabled")
  }
  let tbodyHomeCount = 0;
  let checkStandardValue = 0;
  for (let i = 0; i < data.length; i++) {
    tableRows = '';
    totalCount++;
    let row = ''
    if (totalCount > startNum && totalCount <= endNum) {
      row = '<tr>';
    }
    else {
      row = '<tr class="displayNone">';
    }

    for (let j = 0; j < data[i].length; j++) {
      if (j == 0) {
        // 여기에 각 셀에 해당하는 HTML을 추가합니다.
        row += '<th scope="row">' + data[i][j] + '</th>';
      } else {
        // 여기에 각 셀에 해당하는 HTML을 추가합니다.
        row += '<td>' + data[i][j] + '</td>';
      }
    }
    row += '</tr>';
    // 각 행을 최종 결과에 추가합니다.
    tableRows += row;
    $("#tbodyHome_" + tbodyHomeCount).append(tableRows)
    if (checkStandardValue == (cutList - 1)) {
      tbodyHomeCount++;
      checkStandardValue = 0;
    } else {
      checkStandardValue++;
    }

  }
}
// 초기 테이블 노출
tableList(pageCount);


let firstBottomCount = 0;
function makeBottoList(bottomCount) {
  $(".pageBox").empty();
  let bottomStartNum = 0;
  let bottomEndNum = 0;
  bottomStartNum = (bottomStartNum - 1) * groupBottomNum;
  bottomEndNum = bottomStartNum * groupBottomNum;

  let bottomListCount = Math.ceil(data.length / cutList);
  let listTag = '';
  //하단 한 묶음에 총 개수 ex) 5개 리스트 * 하단 3페이지 = 15
  let perListCount = groupBottomNum * cutList;
  let pagigingGroupCount = Math.ceil(data.length / (perListCount))
  //하단 리스트 넘버 생성 
  let pageConCount = 1;
  let pageCon = '';
  let displayNoneClass = '';
  for (let i = 0; i < pagigingGroupCount; i++) {

    if (pageConCount != 1) {
      displayNoneClass = 'displayNone';
    }

    pageCon = '<div class="pageCon pageCon_' + pageConCount + ' ' + displayNoneClass + '"></div>';
    $('.pageBox').append(pageCon);
    pageConCount++;
  }
}

makeBottoList(firstBottomCount);

$(document).on("click", ".pageBox li", function () {
  let changePageCount = $(this).attr("idx-value");
  tableList(changePageCount);
  makeBottoList(changePageCount);
  $("#nowPage").val(changePageCount);
});

function nextPage() {
  let nowPage = $("#nowPage");
  let nextValue = parseInt(nowPage.val()) + 1
  if(nextValue > fintFramneNum) return false;
  nowPage.val(nextValue); // 문자열을 정수로 변환 후 1을 더해 다시 값으로 설정
  tableList(nextValue)
}

function prevPage() {
  console.log($("#nowPage").val())
  if($("#nowPage").val() < 2){
    return false;
  }
  let nowPage = $("#nowPage");
  let prevValue = parseInt(nowPage.val()) - 1
  if (nowPage.val() > 1) {
    nowPage.val(prevValue); // 문자열을 정수로 변환 후 1을 더해 다시 값으로 설정
  }
  nowPage.val(prevValue)
  tableList(prevValue)
}





                </script>
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
    
 	<!-- member.js -->
    <script src="${path}/resource/admin/member/member.js"></script>
    
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
    <!-- <script src="../js/admin.js"></script> -->
</body>
</html>