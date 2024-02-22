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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import pj.mvc.dreams_project2.HomeController;
import pj.mvc.dreams_project2.service.ProductServiceImpl;


@Controller
public class ProductController {
	

	@Autowired
	private ProductServiceImpl service;
	
	String viewPage = "";
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 상품 목록
	@RequestMapping("product_list.pc")
	public String product_list(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("ProductController - product_list.pc");
		
		service.productListAction(req, res, model);
		
		return "page_5/admin/product";
	}
	
	// 상품 추가화면 
	@RequestMapping("insertProduct.pc")
	public String insertProduct(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("ProductController - insertProduct.pc");
		
		return "page_5/admin/insertProduct";
	}
	
	// 상품 추가 처리
	@RequestMapping("insertProductAction.pc")
	public String insertProductAction(MultipartHttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("ProductController - insertProductAction.pc");
		
		service.productInsertAction(req, model);
		viewPage = req.getContextPath() + "/product_list.pc";
		res.sendRedirect(viewPage);
		return null;
	}
	
	// 상품 수정 페이지
	@RequestMapping("detailProduct.pc")
	public String detailProduct(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("ProductController - detailProduct.pc");
		
		service.productDetailAction(req, res, model);
		
		return "page_5/admin/detailProduct";
	}
	
	// 상품수정처리
	@RequestMapping("updateAction.pc")
	public String updateAction(MultipartHttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("ProductController - updateAction.pc");

		service.productUpdateAction(req, model);
		
		return "page_5/admin/updateAction";
	}
	
	// 상품 삭제 
	@RequestMapping("deleteProductAction.pc")
	public String deleteProductAction(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("ProductController - deleteProductAction.pc");

		service.productDeleteAction(req, res, model);
		
		viewPage = req.getContextPath() + "/product_list.pc";
		res.sendRedirect(viewPage);
		return null;
	}
	
	// 고객 상품 리스트
	@RequestMapping("customerProductList.pc")
	public String customerProductList(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		logger.info("ProductController - customerProductList.pc");

		service.productListAction(req, res, model);
		
		return "page_5/productList";
	}
	
	@RequestMapping("/detail.pc")
	public String detail(HttpServletRequest request, HttpServletResponse response, Model model)
	        throws ServletException, IOException {
	    logger.info("ProductController - detail.pc");

	    // 카테고리 정보를 받아옴
	    String product_Category = request.getParameter("product_Category");
	    String product_Name = request.getParameter("product_Name");

	    // request 속성에 설정
	    request.setAttribute("product_Category", product_Category);
	    request.setAttribute("product_Name", product_Name);

	    String targetPage = null;
	    if ("기타".equals(product_Category)) {
	        targetPage = "etc";
	    } else if ("핸드폰케이스".equals(product_Category)) {
	        targetPage = "case";
	    } else if ("의류".equals(product_Category)) {
	        targetPage = "clothes";
	    } else if ("마우스패드".equals(product_Category)) {
	        targetPage = "mousepad";
	    }

	    service.customerListAction(request, response, model);

	    logger.info("targetPage : " + targetPage);

	    // 응답 페이지로 forward
	    return "page_5/" + targetPage;
	}
	
	
	
}
