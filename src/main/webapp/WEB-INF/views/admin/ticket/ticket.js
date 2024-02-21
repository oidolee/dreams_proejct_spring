

// 각 행을 클릭했을 때 실행될 함수
function goToDetails(ticket_no, cust_Id, ticket_seat, purchase_date) {
	
	alert('goToDetails');
    // 세부 정보를 전달할 URL 생성
    var url = "/dreams_project_2/ResAdminCheck_Detail.tc?ticket_no=" + encodeURIComponent(ticket_no) +
              "&custId=" + encodeURIComponent(cust_Id) +
              "&ticket_seat=" + encodeURIComponent(ticket_seat) +
              "&purchase_date=" + encodeURIComponent(purchase_date);
    
    // 새로운 페이지로 이동
    window.location.href = url;
}

// memberDetail - 뒤로가기
function back_ticket() {
	// 이전 페이지로 이동
	history.back();
}

