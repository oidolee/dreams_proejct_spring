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

import pj.mvc.dreams_project2.service.CustomerService;


/* 작업자 : 윤석무 */
@Controller
public class CustomerController {
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
       
	@Autowired
	private CustomerService service;
	
	// 첫페이지
	@RequestMapping("main.cc")
	public String index() {
		logger.info("<<< url ==> /main.cc >>>");
		
		return "index";
	}
	
	// -- [ 회원가입 ] -- 
	@RequestMapping("join.cc")
	public String join() {
		logger.info("<<< url ==> /join.cc >>>");
			
		return "page_1/join";

	}
	 
	// 아이디 중복확인 
	@RequestMapping("idConfirmAction.cc")
	public String idConfirmAction(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /idConfirmAction.cc >>>");
			
		service.idConfirmAction(req, model);
		return "page_1/idConfirmAction";

	}

	 
	// 회원가입 처리
	@RequestMapping("joinAction.cc")
	public String joinAction(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /joinAction.cc >>>");
			
		service.signInAction(req, model);
		return "page_1/joinAction";

	}
	
	// -- [ 로그인 ] --
	// 로그인 화면
	@RequestMapping("login.cc")
	public String login(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /login.cc >>>");
			
		return "page_1/login";

	}

	// 로그인 처리
	@RequestMapping("loginAction.cc")
	public String loginAction(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /loginAction.cc >>>");
			
		service.loginAction(req, model);
		return "page_1/loginAction";

	}
	
	// 로그아웃
	@RequestMapping("logout.cc")
	public String logout(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /logout.cc >>>");
		
		// 세션 삭제
		req.getSession().invalidate();	
		return "index";

	}
	
	// -- [ 회원탈퇴 ] --
	// 회원탈퇴 - 인증화면
	@RequestMapping("deleteCustomer.cc")
	public String deleteCustomer(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /deleteCustomer.cc >>>");
		
		return "page_1/deleteCustomer";
		
	}
	
	// 회원탈퇴 처리
	@RequestMapping("deleteCustomerAction.cc")
	public String deleteCustomerAction(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /deleteCustomerAction.cc >>>");
		
		service.deleteCustomerAction(req, model);
		return "page_1/deleteCustomerAction";
		
	}
	
	// -- [ 회원수정 ] --
	// 회원정보 상세페이지
	@RequestMapping("modifyDetailAction.cc")
	public String modifyDetailAction(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /modifyDetailAction.cc >>>");
		
		service.modifyDetailAction(req, model);
		return "page_1/modifyDetailAction";
	}
	
	// 회원수정 처리페이지
	@RequestMapping("modifyCustomerAction.cc")
	public String modifyCustomerAction(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /modifyCustomerAction.cc >>>");
		
		service.modifyCustomerAction(req, model);
		return "page_1/modifyCustomerAction";
	}
	
	// [ 관리자모드 ]
	// 관리자모드 - 회원 전체 조회
	@RequestMapping("admin_member.cc")
	public String admin_member(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /admin_member.cc >>>");
		
		service.customerListAll(req, model);
		return "resources/admin/member/member";
	}
				
	// 관리자모드 - 회원 상세 정보
	@RequestMapping("admin_memberDetail.cc")
	public String admin_memberDetail(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /admin_memberDetail.cc >>>");
		
		service.admin_modifyDetailAction(req, model);
		return "resources/admin/member/memberDetail";
	}
	
	// 관리자모드 - 회원 상세 정보 - 계정복구
	@RequestMapping("admin_enable_cust.cc")
	public String admin_enable_cust(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /admin_enable_cust.cc >>>");
		
		service.admin_recoverCustomerAction(req, model);
		return "resources/admin/member/admin_recoverCustomerAction";
	}
	
	// 관리자모드 - 회원 상세 정보 - 계정삭제
	@RequestMapping("admin_block_cust.cc")
	public String admin_block_cust(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /admin_block_cust.cc >>>");
		
		service.admin_suspendCustomerAction(req, model);
		return "resources/admin/member/admin_suspendCustomerAction";
	}

	// 관리자모드 - 회원 상세 정보 - 영구삭제
	@RequestMapping("admin_delete_cust.cc")
	public String admin_delete_cust(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /admin_delete_cust.cc >>>");
		
		service.admin_deleteCustomerAction(req, model);
		return "resources/admin/member/admin_deleteCustomerAction";
	}
}

