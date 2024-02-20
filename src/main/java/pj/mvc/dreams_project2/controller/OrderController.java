package pj.mvc.dreams_project2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.dreams_project_2.service.OrderServiceImpl;

@Controller
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderServiceImpl service;
	
	String viewPage ="";
	
	// 마이페이지
	@RequestMapping("myPage.oc")
	public String myPage(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /myPage.oc >>>");
		
		return "page_6/myPage";
	}
	
	// 내 주문 조회
	@RequestMapping("myOrder.oc")
	public String myOrder(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /myOrder.oc >>>");
		
		service.orderDetailAction(req, res);
		return "page_6/myOrder";
	}
	// 내 주문 조회 -> 구매 확정
	
	// 내 주문 조회 -> 교환/환불 페이지 - 최근 구매한 상품
	
	// 상품 교환/환불 페이지 신청서 제출
	
	// 교환/환불 신청 목록
}
