package pj.mvc.dreams_project2.dao;

import java.util.List;

import pj.mvc.dreams_project2.dto.CustomerDTO;
import pj.mvc.dreams_project2.dto.TicketDTO;
import pj.mvc.dreams_project2.dto.TicketResDTO;

public interface TicketDAO {

	
	// 티켓 조회
	public List<TicketDTO> ticketList(String strTicket_seat);
	
	// 티켓 조회
	public TicketDTO ticketEach(String strTicket_seat);
	
	// 티켓 예매
	public int ticketRes(TicketResDTO trdto);
	
	// 티켓 예매 확인
	public List<TicketResDTO> ResCheckTicket(String strId);
	
	// 티켓 예매 취소
	public int ticketDelete(int ticket_no);
	
	// 티켓 가격 수정
	public int ticketUpdate(TicketDTO tdto);
	
	// 티켓 삭제
	public int ticketDelete(String strTicket_seat);
	
	// 티켓 추가
	public int ticketInsert(TicketDTO tdto);
	
	// 회원 조회
	public CustomerDTO customerDetail(String srtId);

	// 관리자 페이지 티켓 예매 전체내역 조회
	public List<TicketResDTO> ticketResAdminList(int start, int end);
	
	// 관리자 페이지 티켓 넘버로 예매내역 조회 - select
	public TicketResDTO ticketResDetail(int ticket_no);
	
	// 티켓 예매 갯수 구하기
	public int ticketResCnt();
}
