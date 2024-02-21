package pj.mvc.dreams_project2.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface OrderService {
	

		
	// 내 주문 조회
	public void orderDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 내 주문내역 - 구매확정
	public void orderConfirm(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 교환/환불 신청 페이지 - 최근 구매한 상품
	public void MyorderDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 상품 환불/교환 신청서 제출
	public void productRefundAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
	// 교환/환불 신청서 확인 
	public void refundDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException;
	
}
