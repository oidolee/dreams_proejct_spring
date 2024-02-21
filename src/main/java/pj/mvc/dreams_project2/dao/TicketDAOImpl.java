package pj.mvc.dreams_project2.dao;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.mvc.dreams_project2.dto.CustomerDTO;
import pj.mvc.dreams_project2.dto.TicketDTO;
import pj.mvc.dreams_project2.dto.TicketResDTO;


@Repository
public class TicketDAOImpl implements TicketDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 티켓 전체 조회
	@Override
	public List<TicketDTO> ticketList(String strTicket_seat) {
		System.out.println("TicketDAOImpl - ticketList");
		List<TicketDTO> list = sqlSession.selectList("pj.mvc.dreams_project2.dao.TicketDAO.ticketList", strTicket_seat);
		
		return list;
		
	}
	// 티켓 예매 처리 - insert
	public int ticketRes(TicketResDTO trdto) {
		System.out.println("TicketDAOImpl - ticketRes");
		int insertResCnt = sqlSession.insert("pj.mvc.dreams_project2.dao.TicketDAO.ticketRes", trdto);		
		
		return insertResCnt;
	}
	// 티켓 예매 취소
	@Override
	public int ticketCancle(int ticket_no) {
		System.out.println("TicketDAOImpl - ticketDelete");
		
		int deleteCnt = sqlSession.update("pj.mvc.dreams_project2.dao.TicketDAO.ticketCancle", ticket_no);
		
		System.out.println("deleteCnt : " + deleteCnt);
		return deleteCnt;
	}
	
	
	// 티켓 예매 확인 - select
	@Override
	public List<TicketResDTO> ResCheckTicket(String strId) {
		System.out.println("TicketDAOImpl - ticketList");
		  
		List<TicketResDTO> list = sqlSession.selectList("pj.mvc.dreams_project2.dao.TicketDAO.ResCheckTicket", strId);
		  
		return list;
      
   }
	
	// 티켓 개별 조회
	@Override
	public TicketDTO ticketEach(String strTicket_seat) {
		System.out.println("TicketDAOImpl - ticketList");
		
		TicketDTO tdto = sqlSession.selectOne("pj.mvc.dreams_project2.dao.TicketDAO.ticketEach", strTicket_seat);
		return tdto;
		
	}
	// 티켓 가격 수정
	@Override
	public int ticketUpdate(TicketDTO tdto) {
		System.out.println("TicketDAOImpl - ticketUpdate");
		
		int updateCnt = sqlSession.update("pj.mvc.dreams_project2.dao.TicketDAO.ticketUpdate", tdto);
		
		return updateCnt;
	}

	// 티켓 삭제
	@Override
	public int ticketDelete(String strTicket_seat) {
		System.out.println("TicketDAOImpl - ticketDelete");
		
		int deleteCnt = sqlSession.delete("pj.mvc.dreams_project2.dao.TicketDAO.ticketDelete", strTicket_seat);			
		return deleteCnt;
	}
	
	// 티켓 추가
	public int ticketInsert(TicketDTO tdto) {
		System.out.println("TicketDAOImpl - ticketInsert");
			
		int insertCnt = sqlSession.insert("pj.mvc.dreams_project2.dao.TicketDAO.ticketInsert", tdto);			
		return insertCnt;
	}
	
	// 회원정보 찾기
	@Override
	public CustomerDTO customerDetail(String srtId) {
		System.out.println("TicketDAOImpl - customerDetail");
		CustomerDTO cdto = sqlSession.selectOne("pj.mvc.dreams_project2.dao.TicketDAO.customerDetail", srtId);			
		return cdto;
	}
	
	// 관리자 페이지 티켓 예매 전체내역 조회
	@Override
	public List<TicketResDTO> ticketResAdminList(Map<String, Object> map) {
		System.out.println("TicketDAOImpl - ticketResAdminList");
		List<TicketResDTO> list = sqlSession.selectList("pj.mvc.dreams_project2.dao.TicketDAO.ticketResAdminList", map);
		return list;
	}
	
	// 관리자 페이지 티켓 넘버로 예매 상세내역 조회 - select
	@Override
	public TicketResDTO ticketResDetail(int ticket_no) {
		System.out.println("TicketDAOImpl - ticketResAdminList");
			
		TicketResDTO trdto = sqlSession.selectOne("pj.mvc.dreams_project2.dao.TicketDAO.ticketRes.ticketResDetail", ticket_no);
		
		return trdto;
	}
	
	// 티켓 예매 갯수 구하기
	@Override
	public int ticketResCnt() {
		System.out.println("TicketDAOImpl - TicketResCnt");
			
		int total = sqlSession.selectOne("pj.mvc.dreams_project2.dao.TicketDAO.ticketRes.ticketResCnt");
		return total;
	}
}
