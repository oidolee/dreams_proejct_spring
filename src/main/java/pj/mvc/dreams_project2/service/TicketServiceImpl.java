package pj.mvc.dreams_project2.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.dto.CustomerDTO;
import pj.mvc.jsp.dao.TicketDAO;
import pj.mvc.jsp.dao.TicketDAOImpl;
import pj.mvc.jsp.dto.TicketDTO;
import pj.mvc.jsp.dto.TicketResDTO;
import pj.mvc.jsp.page.PagingTicket;

public class TicketServiceImpl implements TicketService {

	// 티켓 목록 조회
	@Override
	public void ticketListAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		System.out.println("서비스 - ticketListAction");
		TicketDTO tdto = new TicketDTO();
		
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		String strTicket_seat = req.getParameter("parkseat");
		String srtId = (String)req.getSession().getAttribute("sessionID");
		
		tdto.setTicket_seat(req.getParameter("parkseat"));
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		TicketDAO tdao = TicketDAOImpl.getInstance();
		
		List<TicketDTO> list = tdao.ticketList(strTicket_seat);
		CustomerDTO cdto = tdao.customerDetail(srtId);
		// 5단계. jsp로 처리결과 전달
		req.setAttribute("list", list);
		req.setAttribute("cdto", cdto);
	}
	
	// 티켓 예매 처리
	@Override
	public void ticketResAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		System.out.println("서비스 - ticketResAction");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		int ticket_price = Integer.parseInt(req.getParameter("totalPrice"));
		String ticket_seat = req.getParameter("parkseat");
		Timestamp game_date = Timestamp.valueOf(req.getParameter("game_date"));
		String srtId = (String)req.getSession().getAttribute("sessionID");
		
		TicketResDTO trdto = new TicketResDTO();
		
		trdto.setTicket_price(ticket_price);
		trdto.setGame_date(game_date);
		trdto.setTicket_seat(ticket_seat);
		trdto.setCust_Id(srtId);
		trdto.setGame_date(game_date);
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		TicketDAO tdao = TicketDAOImpl.getInstance();
		
		int insertResCnt = tdao.ticketRes(trdto);
		
		
		// 5단계. jsp로 처리결과 전달
		req.setAttribute("insertResCnt", insertResCnt);
	}
	
	// 티켓 예매 내역 조회
	@Override
	public void resCheckAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		System.out.println("서비스 - resCheckAction");
		
		// session에서 아이디를 받아온다.
		String srtId = (String)req.getSession().getAttribute("sessionID");
		
		// 3단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		TicketDAO tdao = TicketDAOImpl.getInstance();
		List<TicketResDTO> list = tdao.ResCheckTicket(srtId);
		
		// 5단계. jsp로 처리결과 전달
		req.setAttribute("list", list);
	}
	
	
	// 티켓 예매 취소
	public void resCancleAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException{
		System.out.println("서비스 - resCancleAction");
		
		// 티켓 번호 값을 받아온다.
		int ticket_no = Integer.parseInt(req.getParameter("ticket_no"));
		
		// 3단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		TicketDAO tdao = TicketDAOImpl.getInstance();
		int deleteCnt = tdao.ticketDelete(ticket_no);
		
		
	}
	
	// 티켓 개별 조회
	public void ticketEachAction(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		System.out.println("서비스 - ticketEachAction");
		TicketDTO tdto = new TicketDTO();
		
		// 3단계. 화면에서 입력받은 값, hidden을 가져온다.
		String strTicket_seat = req.getParameter("parkseat");
		
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		TicketDAO tdao = TicketDAOImpl.getInstance();
		
		tdto = tdao.ticketEach(strTicket_seat);
		
		// 5단계. jsp로 처리결과 전달
		req.setAttribute("tdto", tdto);
	}
	
	
	// 티켓 가격 수정
	@Override
	public void ticketUpdateAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - ticketUpdateAction");
		
		TicketDTO tdto = new TicketDTO();
		
		// 3단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		TicketDAO tdao = TicketDAOImpl.getInstance();
		
		// 4단계. 화면에서 입력받은 값을 가져온다.
		String strTicket_seat = req.getParameter("hidden_ticket");
		int strTicket_grade_normal = Integer.parseInt(req.getParameter("changePrice-normal"));
		int strTicket_grade_membership = Integer.parseInt(req.getParameter("changePrice-membership"));
		int strTicket_grade_child = Integer.parseInt(req.getParameter("changePrice-child"));
		
		tdto.setTicket_seat(strTicket_seat);
		tdto.setTicket_grade_normal(strTicket_grade_normal);
		tdto.setTicket_grade_membership(strTicket_grade_membership);
		tdto.setTicket_grade_child(strTicket_grade_child);
		
		
		tdao.ticketUpdate(tdto);
		
		
	}

	// 티켓 삭제 처리
	@Override
	public void ticketDeleteAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - ticketDeleteAction");
		
		// 3단계. 화면에서 입력받은 hidden값을 가져온다.
		String strTicket_seat = req.getParameter("hidden_ticket");
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		TicketDAO tdao = TicketDAOImpl.getInstance();
		
		// 5단계. 게시글 삭제 처리 후 컨트롤러에서 list로 이동
		tdao.ticketDelete(strTicket_seat);
	}
	
	// 티켓 추가 처리
	@Override
	public void ticketInsertAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - ticketInsertAction");
		
		TicketDTO tdto = new TicketDTO();
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		String strTicket_seat = req.getParameter("insertSeat");
		int strTicket_grade_normal = Integer.parseInt(req.getParameter("insertPrice-normal"));
		int strTicket_grade_membership = Integer.parseInt(req.getParameter("insertPrice-membership"));
		int strTicket_grade_child = Integer.parseInt(req.getParameter("insertPrice-child"));
		
		tdto.setTicket_seat(strTicket_seat);
		tdto.setTicket_grade_normal(strTicket_grade_normal);
		tdto.setTicket_grade_membership(strTicket_grade_membership);
		tdto.setTicket_grade_child(strTicket_grade_child);
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		TicketDAO tdao = TicketDAOImpl.getInstance();
		
		tdao.ticketInsert(tdto);
		
		// 5단계. jsp로 처리결과 전달
		req.setAttribute("tdto", tdto);
	}
	
	// 관리자 페이지 티켓 예매 전체내역 조회
		@Override
		public void resAdminCheckAction(HttpServletRequest req, HttpServletResponse res) 
				throws ServletException, IOException{
			System.out.println("서비스 - resAdminCheckAction");
			
			// 3단계. 화면에서 입력받은 값을 가져온다.
			
			String pageNum = req.getParameter("pageNum");
			// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
			TicketDAO tdao = TicketDAOImpl.getInstance();
			
			
			// 5-1단계. 전체 게시글 갯수 카운트
			PagingTicket paging = new PagingTicket(pageNum);
			int total = tdao.ticketResCnt();
			//System.out.println("total : " + total);
			paging.setTotalCount(total);
			
			// 5-2단계. 게시글 목록 조회
			int start = paging.getStartRow();
			int end = paging.getEndRow();
			
			List<TicketResDTO> list = tdao.ticketResAdminList(start, end);
			// 5단계. jsp로 처리결과 전달
			req.setAttribute("list", list);
			req.setAttribute("paging", paging);
		}
	
		// 관리자 페이지 티켓 예매 상세내역 조회
		@Override
		public void resAdminDetailAction(HttpServletRequest req, HttpServletResponse res) 
				throws ServletException, IOException{
			System.out.println("서비스 - resCheckAction");
			
			// 3단계. 화면에서 입력받은 값을 가져온다.
			int ticket_no = Integer.parseInt(req.getParameter("ticket_no"));
			
			// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
			TicketDAO tdao = TicketDAOImpl.getInstance();
			TicketResDTO trdto = tdao.ticketResDetail(ticket_no);
			
			// 5단계. jsp로 처리결과 전달
			req.setAttribute("trdto", trdto);
		}
}
