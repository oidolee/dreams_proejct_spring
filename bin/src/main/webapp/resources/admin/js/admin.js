
//드림즈 table
let data = [
  [1, 'abce', '이름1', '남'],
  [2, 'bbce', '이름2', '남'],
  [3, 'cbce', '이름3', '남'],
  [4, 'dbce', '이름4', '남'],
  [5, 'ebce', '이름5', '남'],

  [6, 'f123d', 'f-6', 'handle6'],
  [7, 'f123d', 'f-6', 'handle6'],
  [8, 'f123d', 'f-6', 'handle6'],
  [9, 'f123d', 'f-6', 'handle6'],
  [10, 'fvcxz', 'f-6', 'handle6'],

  [11, 'fsvfds_12', 'f-6', 'handle6'],
  [12, 'fsvfds_12', 'f-6', 'handle6'],
  [13, 'fsvfds_12', 'f-6', 'handle6'],
  [14, 'fsvfds_12', 'f-6', 'handle6'],
  [15, 'fsvfds_12', 'f-6', 'handle6'],

  [16, 'f', 'f-6', 'handle6'],
  [17, 'f', 'f-6', 'handle6'],
  [18, 'f', 'f-6', 'handle6'],
  [19, 'f', 'f-6', 'handle6'],
  [20, 'f', 'f-6', 'handle6'],

  [21, 'f', 'f-6', 'handle6'],
  [22, 'f', 'f-6', 'handle6'],
  [23, 'f', 'f-6', 'handle6'],
  [24, 'f', 'f-6', 'handle6'],
  [25, 'f', 'f-6', 'handle6'],

  [26, 'f', 'f-6', 'handle6'],
  [27, 'f', 'f-6', 'handle6'],
  [28, 'f', 'f-6', 'handle6'],
  [29, 'f', 'f-6', 'handle6'],
  [30, 'f', 'f-6', 'handle6'],

  [31, 'f', 'f-6', 'handle6'],
  [32, 'f', 'f-6', 'handle6'],
  [33, 'f', 'f-6', 'handle6'],
  [34, 'f', 'f-6', 'handle6'],
  [35, 'f', 'f-6', 'handle6'],
  
];

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




