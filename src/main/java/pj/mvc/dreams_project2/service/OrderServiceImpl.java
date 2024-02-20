package pj.mvc.dreams_project2.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import pj.mvc.dreams_project2.dao.OrderDAO;
import pj.mvc.dreams_project2.dao.OrderDAOImpl;
import pj.mvc.dreams_project2.dto.OrderDTO;
import pj.mvc.dreams_project2.dto.OrderDetailDTO;
import pj.mvc.dreams_project2.dto.RefundDTO;


@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO dao;
	
	// 내 주문 조회
	@Override
	public void orderDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		// 세션에서 값을 가져옴
//		String cust_Id = (String) req.getSession().getAttribute("sessionID");
		String cust_Id = "hong";
		
		// list에 값 담기 
		List<OrderDTO> list = dao.orderDetail(cust_Id);
		
		// jsp로 처리결과 전달
		model.addAttribute("list", list);
	}
	
	// 내 주문내역 - 구매 확정
	public void orderConfirm(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		// 화면에서 값을 가져옴
		int order_No = Integer.parseInt(req.getParameter("order_No"));
		
		// 구매확정 버튼
		int updateCnt = dao.confirmOrder(order_No);
		
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("updateCnt", updateCnt);
	}
	
	// 교환/환불 신청 페이지 - 최근 구매한 상품
	public void MyorderDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println(" 서비스 - MyorderDetailAction");
		
		// 3단계. 화면에서 값 가져오기
		OrderDetailDTO dto = new OrderDetailDTO();
		int order_No = Integer.parseInt(req.getParameter("order_No")); 
		
		// 5단계.
		List<OrderDetailDTO> list = dao.MyorderDetail(order_No);
		
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("list", list);
		
	}
	
	// 상품 환불/교환 신청서 제출
	@Override
	public void productRefundAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("productRefundAction");
		
		// 3단계. 화면에서 입력받은 값을 가져와서 DTO의 setter로 값 전달	
		// DTO 생성
		RefundDTO dto = new RefundDTO();
		
		// 주문번호(구매당시)
		dto.setOrder_No(Integer.parseInt(req.getParameter("order_No")));
		
		// 아이디
		// dto.setREF_cust_Id((String)req.getSession().getAttribute("sessionID"));
		dto.setREF_cust_Id("hong");
		
		// 이름
		dto.setREF_Name(req.getParameter("REF_Name"));
		
		// 연락처
		dto.setREF_Phone(req.getParameter("REF_Phone"));
		
		// 주소
		dto.setREF_Address(req.getParameter("REF_Address"));
		
		// 상품번호
		dto.setREF_Prod_No(Integer.parseInt(req.getParameter("REF_Prod_No")));
		
		// 상품명
		dto.setREF_Prod_Name(req.getParameter("REF_Prod_Name"));
		
		// 환불/교환 개수
		dto.setREF_Prod_qty(Integer.parseInt(req.getParameter("REF_Prod_qty")));
		
		// 환불/교환 사유
		dto.setREF_Reason(req.getParameter("REF_Reason"));
		
		// 환불 받을계좌
		String Account ="";
		String REF_Account2 = req.getParameter("REF_Account2");
		String REF_Account3 = req.getParameter("REF_Account3");
		Account = REF_Account2 + " " + REF_Account3;
		dto.setREF_Account(Account);
		
		// 환불/교환 신청일
		dto.setREF_Date(new Timestamp(System.currentTimeMillis()));
		
		// 상태 환불, 교환
		dto.setREF_Status(req.getParameter("REF_Status"));
		
		
		// 5단계. 환불신청서 제출
		int insertCnt = dao.submissionRefund(dto);
		
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("insertCnt", insertCnt);
		model.addAttribute("dto", dto);
	}
	
	// 교환/환불 신청서 확인 
	public void refundDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		
		// 3단계.
//		String REF_cust_Id = (String)req.getSession().getAttribute("sessionID");
		String REF_cust_Id = "hong";
		
		// 5단계.
		List<RefundDTO> list = dao.refundDetail(REF_cust_Id);
		
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("list", list);
	}
		
}
