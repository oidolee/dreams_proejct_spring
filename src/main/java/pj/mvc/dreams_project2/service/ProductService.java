package pj.mvc.dreams_project2.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ProductService {
	
	
	
	// 상품 목록
	public void productListAction(HttpServletRequest req, HttpServletResponse res)
		throws ServletException, IOException;

	
	// 상품 추가
	public void productInsertAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 상품 상세페이지
	public void productDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 상품수정
	public void productUpdateAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException; 
	
	// 상품 삭제
	public void productDeleteAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 고객 상품 목록 
	public void customerListAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
}
