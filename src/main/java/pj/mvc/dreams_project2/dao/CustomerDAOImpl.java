package pj.mvc.dreams_project2.dao;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.mvc.dreams_project2.dto.CustomerDTO;


/* 작업자 : 윤석무 */
@Repository
public class CustomerDAOImpl implements CustomerDAO {
	
	@Autowired	// 초대장
	private SqlSession sqlSession;

	// ID 중복확인 처리
	@Override
	public int useridCheck(String strUserid) {
		System.out.println("CustomerDAOImpl - useridCheck");
		
		int selectCnt = sqlSession.selectOne("pj.mvc.dreams_project2.dao.CustomerDAO.useridCheck", strUserid);
		return selectCnt;
	}

	// 회원가입 처리
	@Override
	public int insertCustomer(CustomerDTO dto) {
		System.out.println("CustomerDAOImpl - insertCustomer");
		
		int insertCnt = sqlSession.insert("pj.mvc.dreams_project2.dao.CustomerDAO.insertCustomer", dto);
		return insertCnt;
	}

	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	@Override
	public int idPasswordChk(Map<String, Object> map) {
		System.out.println("CustomerDAOImpl - idPasswordChk");
		
		int selectCnt = sqlSession.selectOne("pj.mvc.dreams_project2.dao.CustomerDAO.idPasswordChk", map);
		return selectCnt;
	}

	// 회원 탈퇴 처리
	@Override
	public int deleteCustomer(String strId) {
		System.out.println("CustomerDAOImpl - deleteCustomer");
		
		int deleteCnt = sqlSession.update("pj.mvc.dreams_project2.dao.CustomerDAO.deleteCustomer", strId);
		return deleteCnt;
	}

	// 회원 상세페이지
	@Override
	public CustomerDTO getCustomerDetail(String strId) {
		System.out.println("CustomerDAOImpl - getCustomerDetail");
		
		CustomerDTO dto = sqlSession.selectOne("pj.mvc.dreams_project2.dao.CustomerDAO.getCustomerDetail", strId);
		return dto;
	}

	// 회원정보 수정 처리
	@Override
	public int updateCustomer(CustomerDTO dto) {
		System.out.println("CustomerDAOImpl - updateCustomer");
		
		int updateCnt = sqlSession.update("pj.mvc.dreams_project2.dao.CustomerDAO.updateCustomer", dto);
		return updateCnt;
	}

	// 관리자모드 - 회원 전체 조회
	@Override
	public List<CustomerDTO> SelectCustomer(Map<String, Object> map) {
		System.out.println("CustomerDAOImpl - SelectCustomer");
		
		List<CustomerDTO> list = sqlSession.selectList("pj.mvc.dreams_project2.dao.CustomerDAO.SelectCustomer", map);
		return list;
	}


	// 관리자모드 - 회원 상세 정보
	@Override
	public CustomerDTO admin_getCustomerDetail(int num) {
		System.out.println("CustomerDAOImpl - admin_getCustomerDetail");
		
		CustomerDTO dto = sqlSession.selectOne("pj.mvc.dreams_project2.dao.CustomerDAO.admin_getCustomerDetail", num);
		return dto;
	}
	
	
	// 관리자모드 - 회원 상세 정보 - 계정복구
	@Override
	public int admin_recoverCustomer(int cust_No) {
		System.out.println("CustomerDAOImpl - admin_recoverCustomer");
		
		int updateCnt = sqlSession.update("pj.mvc.dreams_project2.dao.CustomerDAO.admin_recoverCustomer", cust_No);
		return updateCnt;
	}

	// 관리자모드 - 회원 상세 정보 - 계정삭제
	@Override
	public int admin_suspendCustomer(int cust_No) {
		System.out.println("CustomerDAOImpl - admin_suspendCustomer");
		
		int deleteCnt = sqlSession.update("pj.mvc.dreams_project2.dao.CustomerDAO.admin_suspendCustomer", cust_No);
		return deleteCnt;
	}
	
	
	// 관리자모드 - 회원 상세 정보 - 영구삭제
	@Override
	public int admin_deleteCustomer(int cust_No) {
		System.out.println("CustomerDAOImpl - admin_deleteCustomer");
		
		int deleteCnt = sqlSession.delete("pj.mvc.dreams_project2.dao.CustomerDAO.admin_deleteCustomer", cust_No);
		return deleteCnt;
	}

		
	// 관리자모드 - 회원 전체 조회 갯수 구하기
	@Override
	public int CustomerCnt() {
		System.out.println("CustomerDAOImpl - CustomerCnt");
	      
		int total = sqlSession.selectOne("pj.mvc.dreams_project2.dao.CustomerDAO.CustomerCnt");
		return total;
	}
}