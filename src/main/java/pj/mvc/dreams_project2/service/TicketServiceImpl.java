package pj.mvc.dreams_project2.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import pj.mvc.dreams_project2.dao.TicketDAO;
import pj.mvc.dreams_project2.dto.CustomerDTO;
import pj.mvc.dreams_project2.dto.TicketDTO;
import pj.mvc.dreams_project2.dto.TicketResDTO;
import pj.mvc.dreams_project2.page.PagingTicket;

@Service
public class TicketServiceImpl implements TicketService {

	@Autowired
	private TicketDAO tdao;
	
	// 티켓 목록 조회
	@Override
	public void ticketListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - ticketListAction");
		TicketDTO tdto = new TicketDTO();
		
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		String strTicket_seat = req.getParameter("parkseat");
		String srtId = (String)req.getSession().getAttribute("sessionID");
		
		tdto.setTicket_seat(req.getParameter("parkseat"));
		
		
		List<TicketDTO> list = tdao.ticketList(strTicket_seat);
		CustomerDTO cdto = tdao.customerDetail(srtId);
		// 5단계. jsp로 처리결과 전달
		model.addAttribute("list", list);
		model.addAttribute("cdto", cdto);
	}
	
	// 티켓 예매 처리
	@Override
	public void ticketResAction(HttpServletRequest req, Model model) 
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
		
		
		int insertResCnt = tdao.ticketRes(trdto);
		
		
		// 5단계. jsp로 처리결과 전달
		model.addAttribute("insertResCnt", insertResCnt);
	}
	
	// 티켓 예매 내역 조회
	@Override
	public void resCheckAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		System.out.println("서비스 - resCheckAction");
		
		// session에서 아이디를 받아온다.
		String srtId = (String)req.getSession().getAttribute("sessionID");
		
		List<TicketResDTO> list = tdao.ResCheckTicket(srtId);
		
		// 5단계. jsp로 처리결과 전달
		model.addAttribute("list", list);
	}
	
	
	// 티켓 예매 취소
	public void resCancleAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException{
		System.out.println("서비스 - resCancleAction");
		
		// 티켓 번호 값을 받아온다.
		int ticket_no = Integer.parseInt(req.getParameter("ticket_no"));
		
		int deleteCnt = tdao.ticketCancle(ticket_no);
		
		
	}
	
	// 티켓 개별 조회
	public void ticketEachAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - ticketEachAction");
		TicketDTO tdto = new TicketDTO();
		
		// 3단계. 화면에서 입력받은 값, hidden을 가져온다.
		String strTicket_seat = req.getParameter("parkseat");
		
		
		tdto = tdao.ticketEach(strTicket_seat);
		
		// 5단계. jsp로 처리결과 전달
		model.addAttribute("tdto", tdto);
	}
	
	
	// 티켓 가격 수정
	@Override
	public void ticketUpdateAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - ticketUpdateAction");
		
		TicketDTO tdto = new TicketDTO();
		
		
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
	public void ticketDeleteAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - ticketDeleteAction");
		
		// 3단계. 화면에서 입력받은 hidden값을 가져온다.
		String strTicket_seat = req.getParameter("hidden_ticket");
		
		
		// 5단계. 게시글 삭제 처리 후 컨트롤러에서 list로 이동
		tdao.ticketDelete(strTicket_seat);
	}
	
	// 티켓 추가 처리
	@Override
	public void ticketInsertAction(HttpServletRequest req, Model model)
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
		
		tdao.ticketInsert(tdto);
		
		// 5단계. jsp로 처리결과 전달
		model.addAttribute("tdto", tdto);
	}
	
	// 관리자 페이지 티켓 예매 전체내역 조회
		@Override
		public void resAdminCheckAction(HttpServletRequest req, Model model) 
				throws ServletException, IOException{
			System.out.println("서비스 - resAdminCheckAction");
			
			// 3단계. 화면에서 입력받은 값을 가져온다.
			
			String pageNum = req.getParameter("pageNum");
			
			
			// 5-1단계. 전체 게시글 갯수 카운트
			PagingTicket paging = new PagingTicket(pageNum);
			Map<String, Object> map = new HashMap<String, Object>();
			int total = tdao.ticketResCnt();
			//System.out.println("total : " + total);
			paging.setTotalCount(total);
			
			// 5-2단계. 게시글 목록 조회
			int start = paging.getStartRow();
			int end = paging.getEndRow();
			map.put("start", start);
			map.put("end", end);
			List<TicketResDTO> list = tdao.ticketResAdminList(map);
			// 5단계. jsp로 처리결과 전달
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
		}
	
		// 관리자 페이지 티켓 예매 상세내역 조회
		@Override
		public void resAdminDetailAction(HttpServletRequest req, Model model) 
				throws ServletException, IOException{
			System.out.println("서비스 - resCheckAction");
			
			// 3단계. 화면에서 입력받은 값을 가져온다.
			int ticket_no = Integer.parseInt(req.getParameter("ticket_no"));
			
			TicketResDTO trdto = tdao.ticketResDetail(ticket_no);
			
			// 5단계. jsp로 처리결과 전달
			model.addAttribute("trdto", trdto);
		}
}
