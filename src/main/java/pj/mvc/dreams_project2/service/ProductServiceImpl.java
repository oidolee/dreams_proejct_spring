package pj.mvc.dreams_project2.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.dao.ProductDAO;
import pj.mvc.jsp.dao.ProductDAOImpl;
import pj.mvc.jsp.dto.ProductDTO;
import pj.mvc.jsp.page.Paging;

public class ProductServiceImpl implements ProductService {

	// 상품 목록
	@Override
	public void productListAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - productListAction ");

		// 3단계. 화면에서 입력받은 값을 가져온다.
		String pageNum = req.getParameter("pageNum");

		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		ProductDAO dao = ProductDAOImpl.getInstance();

		// 5-1단계. 전체 게시글 갯수 카운트
		Paging paging = new Paging(pageNum);
		int total = dao.productCnt();
		paging.setTotalCount(total);

		// 5-2단계. 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();

		List<ProductDTO> list = dao.productList(start, end);

		// 6단계. jsp로 처리결과 전달
		req.setAttribute("paging", paging);
		req.setAttribute("list", list);

	}

	// 상품 등록 처리
	@Override
	public void productInsertAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - productInsertAction ");

		// 3단계. 화면에서 입력받은 값을 가져온다.
		ProductDTO dto = new ProductDTO();
		// dto.setProduct_No(Integer.parseInt(req.getParameter("product_No")));
		dto.setProduct_Name(req.getParameter("product_Name"));
		dto.setProduct_Price(Integer.parseInt(req.getParameter("product_Price")));
		dto.setProduct_Qty(Integer.parseInt(req.getParameter("product_Qty")));
		dto.setProduct_Category(req.getParameter("product_Category"));
		System.out.println(req.getParameter("product_Category"));
		String p_img1 = "/dreams_project_2/resource/upload/" + req.getAttribute("fileName");
		dto.setProduct_ImgName(p_img1);

		dto.setProduct_ImgDetail(req.getParameter("product_ImgDetail"));
		
		dto.setProduct_ImgSize(req.getParameter("product_ImgSize"));
		dto.setProduct_ImgRfd(req.getParameter("product_ImgRfd"));
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		ProductDAO dao = ProductDAOImpl.getInstance();

		// 5-1단계. 게시글 작성 처리 후 컨트롤러에서 list로 이동
		dao.insertProduct(dto);
		
		req.setAttribute("dto", dto);
		System.out.println(dto);

	}

	// 상품상세페이지
	@Override
	public void productDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - productDetailAction");

		// 3단계. get방식에서 입력받은 값을 가져온다.
		int product_No = Integer.parseInt(req.getParameter("product_No"));
		String pageNum = req.getParameter("pageNum");

		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		ProductDAO dao = ProductDAOImpl.getInstance();

		// 5-1 단계. 상품 상세페이지
		ProductDTO dto = dao.productDetail(product_No);

		// 6단계. jsp로 처리결과 전달
		req.setAttribute("dto", dto);
		req.setAttribute("pageNum", pageNum);
	}

	// 상품 수정 처리
	@Override
	public void productUpdateAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - productUpdateAction");
		
				// 3단계. 화면에서 입력받은 값, hidden 값 을 가져온다.
				String hiddenPageNum = req.getParameter("hiddenPageNum");
				int hiddenproduct_No = Integer.parseInt(req.getParameter("hiddenproduct_No"));
				String hiddenproduct_ImgName = req.getParameter("hiddenproduct_ImgName");
				// ImageUploadHandler 클래스에서 setAttribute("fileName", fileName)로 넘겼으므로 getAttribute("fileName")로 처리
				String uploadPdImg = (String) req.getAttribute("fileName");
				
				System.out.println("uploadPdImg : " + uploadPdImg);
				
				// dto생성
				ProductDTO dto = new ProductDTO();
				dto.setProduct_No(hiddenproduct_No);
				dto.setProduct_Name(req.getParameter("product_Name"));
				dto.setProduct_Price(Integer.parseInt(req.getParameter("product_Price")));
				dto.setProduct_Qty(Integer.parseInt(req.getParameter("product_Qty")));
				dto.setProduct_Category(req.getParameter("product_Category"));
				String strPdImg = "";
				// 이미지를 수정 안했을 떄
				if(uploadPdImg == null) {
					strPdImg = hiddenproduct_ImgName;
				}
				else {	// 이미지를 수정 했을 떄
					strPdImg = "/dreams_project_2/resource/upload/" + uploadPdImg; 
				}
				dto.setProduct_ImgName(strPdImg);
				
				dto.setProduct_ImgDetail(req.getParameter("product_ImgDetail"));
				dto.setProduct_ImgSize(req.getParameter("product_ImgSize"));
				dto.setProduct_ImgRfd(req.getParameter("product_ImgRfd"));
				
				// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
				ProductDAO dao = ProductDAOImpl.getInstance();
				
				// 5-1 단계. 상품 수정처리
				int updateCnt = dao.productUpdate(dto);
				
				// 6단계. jsp로 처리결과 전달
				req.setAttribute("updateCnt", updateCnt);
				req.setAttribute("hiddenPageNum", hiddenPageNum);
				req.setAttribute("hiddenproduct_No", hiddenproduct_No);
		

	}

	@Override 
	// 상품 삭제
	public void productDeleteAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - productDeleteAction");
		
		// 3단계. get으로  값 을 가져온다.	
		int product_No = Integer.parseInt(req.getParameter("product_No"));
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		ProductDAO dao = ProductDAOImpl.getInstance();
		// 5-1 단계. 상품 삭제 처리
		int deleteCnt = dao.productDelete(product_No);
		// 6단계. jsp로 처리결과 전달
		req.setAttribute("deleteCnt", deleteCnt);
	}

	@Override
	public void customerListAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		System.out.println("서비스 - customerListAction");

		
		ProductDTO dto = new ProductDTO();
		// 3단계. get으로  값 을 가져온다.
		String product_Name = req.getParameter("product_Name");
		System.out.println(product_Name);
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		ProductDAO dao = ProductDAOImpl.getInstance();
		// 5-1 단계. 고객상품리스트 호출
		dto = dao.customerList(product_Name);
		// 6단계. jsp로 처리결과 전달
		System.out.println(dto);
		req.setAttribute("dto", dto);
		
		
		
	}
	
	
	

}
