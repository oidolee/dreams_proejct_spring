package pj.mvc.dreams_project2.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface OrderService {
	

		
	// 내 주문 조회
	public void orderDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 내 주문내역 - 구매확정
	public void orderConfirm(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 교환/환불 신청 페이지 - 최근 구매한 상품
	public void MyorderDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 상품 환불/교환 신청서 제출
	public void productRefundAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 교환/환불 신청서 확인 
	public void refundDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	public void insertOrder(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException;
	
	// ---------------------------------------------------
//	// 주문 등록(고객)
//	public void orderInsertAction(HttpServletRequest req, HttpServletResponse res)
//			throws ServletException, IOException;
//	
//	// 주문 수정(고객)
//	public void modifyOrderAction(HttpServletRequest req, HttpServletResponse res)
//			throws ServletException, IOException;
//	
//	// 주문 취소(고객)
//	public void cancelOrderAction(HttpServletRequest req, HttpServletResponse res)
//			throws ServletException, IOException;
	
	
}
