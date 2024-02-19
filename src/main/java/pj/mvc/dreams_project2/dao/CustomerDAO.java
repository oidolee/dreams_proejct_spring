package pj.mvc.dreams_project2.dao;

import java.util.List;



import pj.mvc.jsp.dto.CustomerDTO;

public interface CustomerDAO {
	
	// ID 중복확인 처리
	public int useridCheck(String strUserId);
	
	// 회원가입 처리
	public int insertCustomer(CustomerDTO dto);
	
	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	public int idPasswordChk(String strId, String strPassword);
	
	// 회원 탈퇴 처리
	public int deleteCustomer(String strId);
	
	// 회원 상세페이지
	public CustomerDTO getCustomerDetail(String strId);
	
	// 회원정보 수정 처리
	public int updateCustomer(CustomerDTO dto);
	
//////////////////////////////////////////////////////////////////	
	
	// 관리자모드 - 회원 전체 조회
	public List<CustomerDTO> SelectCustomer(int start, int end);
	
	// 관리자모드 - 회원 전체 조회 갯수 구하기
	public int CustomerCnt(CustomerDTO dto);
	
	// 관리자모드 - 회원 상세 정보
	public CustomerDTO admin_getCustomerDetail(int num);
	
	// 관리자모드 - 회원 상세 정보 - 계정복구
	public int admin_recoverCustomer(int cust_No);
	
	// 관리자모드 - 회원 상세 정보 - 계정삭제
	public int admin_suspendCustomer(int cust_No);
	
	// 관리자모드 - 회원 상세 정보 - 영구삭제 
	public int admin_deleteCustomer(int cust_No);
	
}
