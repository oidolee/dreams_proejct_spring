package pj.mvc.dreams_project2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pj.mvc.dreams_project2.service.TicketServiceImpl;


@Controller
public class TicketController {
	private static final Logger logger = LoggerFactory.getLogger(TicketController.class);

	@Autowired
	private TicketServiceImpl service;
	
	String viewPage = "";

	// 첫페이지 게시글 목록
	@RequestMapping("ticket.tc")
	public String ticket(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /ticket.tc >>>");
		
		// 임시 아이디
		HttpSession session = req.getSession();
		session.setAttribute("sessionID", "hong");
		
		return "page_2/ticketFee";
	}
	
	// 티켓 조회(예매)
	@RequestMapping("purchaseTicket.tc")
	public String purchaseTicket(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /purchaseTicket.tc >>>");
		
		service.ticketListAction(req, model);
		
		return "page_2/purchaseTicket";
	}

	// 티켓 예매 처리
	@RequestMapping("ticketRes.tc")
	public String ticketRes(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /ticketRes.tc >>>");
		
		service.ticketResAction(req, model);
		
		return "page_2/ticketFee";
	}
	
	// 티켓 예매 확인
	@RequestMapping("ResCheck.tc")
	public String ResCheck(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /ResCheck.tc >>>");
		
		service.resCheckAction(req, model);
		
		return "page_2/ReserationTicket_check";
	}


		
	// 마이페이지 티켓 예매 확인
	@RequestMapping("myTicket.tc")
	public String myTicket(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /myTicket.tc >>>");
		
		service.resCheckAction(req, model);
		
		return "page_6/myTicket";
	}
		
	// 티켓 예매 취소
	@RequestMapping("ResCancle.tc")
	public String ResCancle(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /ResCancle.tc >>>");
		
		service.resCancleAction(req, model);
		
		return "page_6/myPage";
	}
	
	// 관리자 페이지
	@RequestMapping("admin.tc")
	public String admin(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /admin.tc >>>");
		
		return "admin/ticket/ticket";
	}

	// 티켓 예매 내역 조회 - 관리자페이지
	@RequestMapping("ResAdminCheck.tc")
	public String ResAdminCheck(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /ResAdminCheck.tc >>>");
		
		service.resAdminCheckAction(req, model);
		
		return "admin/ticket/ticket_res";
	}
	
	// 티켓 예매 상세내역 조회 - 관리자페이지
	@RequestMapping("ResAdminCheck_Detail.tc")
	public String ResAdminCheck_Detail(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /ResAdminCheck_Detail.tc >>>");
		
		service.resAdminDetailAction(req, model);
		
		return "admin/ticket/ticket_res_detail";
	}

	
	// 티켓 가격 조회 - 관리자 페이지
	@RequestMapping("ticket_detail.tc")
	public String ticket_detail(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /ticket_detail.tc >>>");
		
		service.ticketListAction(req, model);
		
		return "admin/ticket/ticket_detail";
	}
	
	// 티켓 가격 수정버튼 클릭시 - 수정페이지 이동
	@RequestMapping("ticket_update.tc")
	public String ticket_update(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /ticket_update.tc >>>");
		
		service.ticketEachAction(req, model);
		
		return "admin/ticket/ticket_detail_update";
	}

	// 티켓 추가버튼 클릭시 - 추가페이지 이동
	@RequestMapping("ticket_insert.tc")
	public String ticket_insert(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /ticket_insert.tc >>>");
		
		return "admin/ticket/ticket_detail_insert";
	}
	
	// 티켓 수정 처리
	@RequestMapping("updateTicket.tc")
	public String updateTicket(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /updateTicket.tc >>>");
		
		service.ticketUpdateAction(req, model);
		
		return "admin/ticket/ticket";
	}

	// 티켓 삭제 처리
	@RequestMapping("deleteTicket.tc")
	public String deleteTicket(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /deleteTicket.tc >>>");
		
		service.ticketDeleteAction(req, model);
		
		return "admin/ticket/ticket";
	}
	
	// 티켓 추가
	@RequestMapping("insertTicket.tc")
	public String insertTicket(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /insertTicket.tc >>>");
		
		service.ticketInsertAction(req, model);
		
		return "admin/ticket/ticket";
	}
}
