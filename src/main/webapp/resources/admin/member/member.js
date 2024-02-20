

// 각 행을 클릭했을 때 실행될 함수
function goToDetails(cust_No, cust_Id, cust_Name, cust_Birth, show) {
	
    // 세부 정보를 전달할 URL 생성
    var url = "/dreams_project_2/admin_memberDetail.cc?cust_No=" + encodeURIComponent(cust_No) +
              "&cust_Id=" + encodeURIComponent(cust_Id) +
              "&cust_Name=" + encodeURIComponent(cust_Name) +
              "&cust_Birth=" + encodeURIComponent(cust_Birth) +
              "&show=" + encodeURIComponent(show);
    
    // 새로운 페이지로 이동
    window.location.href = url;
}

// memberDetail - 뒤로가기
function back_cust() {
	// 이전 페이지로 이동
	history.back();
}


// 계정복구
function enable_cust(custNo) {
	if(confirm("계정을 복구하시겠습니까?")) {
		window.location.href = "/dreams_project_2/admin_enable_cust.cc?cust_No=" + custNo;
	}
	else {
	}
}

// 계정삭제
function block_cust(custNo) {
	if(confirm("계정을 삭제하시겠습니까?")) {
		window.location.href = "/dreams_project_2/admin_block_cust.cc?cust_No=" + custNo;
	}
	else {
	}
}

// 영구삭제
function delete_cust(custNo) {
	if(confirm("정말로 이 회원을 영구적으로 삭제하시겠습니까?")) {
		window.location.href = "/dreams_project_2/admin_delete_cust.cc?cust_No=" + custNo;
	}
	else {
	}
}