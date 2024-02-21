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

import pj.mvc.dreams_project2.service.OrderServiceImpl;


@Controller
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderServiceImpl service;
	
	String viewPage ="";
	
	// 마이페이지
	@RequestMapping(value= {"myPage.oc", "*.oc"})
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
		
		service.orderDetailAction(req, model);
		return "page_6/myOrder";
	}
	// 내 주문 조회 -> 구매 확정
	@RequestMapping("orderConfirm.oc")
	public String orderConfirm(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /orderConfirm.oc >>>");
		
		service.orderConfirm(req, model);
		return "page_6/orderConfirm";
	}
	
	// 내 주문 조회 -> 교환/환불 페이지 - 최근 구매한 상품
	@RequestMapping("goodsRefund.oc")
	public String goodsRefund(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /goodsRefund.oc >>>");
		
		service.MyorderDetailAction(req, model);
		return "page_6/goodsRefund";
	}
	
	// 상품 교환/환불 페이지 신청서 제출
	@RequestMapping("goodsRefundSubmit.oc")
	public String goodsRefundSubmit(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /goodsRefundSubmit.oc >>>");
		
		service.productRefundAction(req, model);
		return "page_6/goodsRefundAction";
	}
	
	
	// 교환/환불 신청 목록
	@RequestMapping("refundDetail.oc")
	public String refundDetail(HttpServletRequest req, HttpServletResponse res, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /refundDetail.oc >>>");
		
		service.refundDetailAction(req, model);
		return "page_6/refundDetail";
	}
	
}
