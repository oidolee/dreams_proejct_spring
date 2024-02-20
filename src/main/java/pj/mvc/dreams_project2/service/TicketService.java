package pj.mvc.dreams_project2.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface TicketService {

	// 티켓 목록 조회
	public void ticketListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 티켓 예매 처리
	public void ticketResAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 티켓 예매 내역 조회
	public void resCheckAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 티켓 예매 취소
	public void resCancleAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 티켓 가격 수정
	public void ticketUpdateAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 티켓 삭제 처리
	public void ticketDeleteAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 티켓 추가 처리
	public void ticketInsertAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
		
	// 티켓 개별 조회
	public void ticketEachAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 관리자 페이지 티켓 예매 전체내역 조회
	public void resAdminCheckAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
	
	// 관리자 페이지 티켓 예매 상세내역 조회
	public void resAdminDetailAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException;
}
