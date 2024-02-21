package pj.mvc.dreams_project2.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import pj.mvc.dreams_project2.dao.ProductDAO;
import pj.mvc.dreams_project2.dto.ProductDTO;
import pj.mvc.dreams_project2.page.Paging;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO dao;

	// 상품 목록
	@Override
	public void productListAction(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - productListAction ");

		// 3단계. 화면에서 입력받은 값을 가져온다.
		String pageNum = req.getParameter("pageNum");


		// 5-1단계. 전체 게시글 갯수 카운트
		Paging paging = new Paging(pageNum);
		int total = dao.productCnt();
		paging.setTotalCount(total);

		// 5-2단계. 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		List<ProductDTO> list = dao.productList(map);
		
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);

	}

	// 상품 등록 처리
	@Override
	public void productInsertAction(MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - productInsertAction ");
		
		// 추가 S : JSP의 ,ImageUploadHandler.java 기능------------------
		MultipartFile file = req.getFile("product_ImgName");
		System.out.println("file : " + file);
		
		// input 경로
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
		System.out.println("saveDir : " + saveDir);
		// saveDir : C:\\apache-tomcat-8.5.97\\wtpwebapps\\dreams_project_2\\resource\\upload
		
		
		// 이미지 추가를 위한 샘플이미지 경로(upload 폴더 우클릭 > properties > Location 정보 복사해서 붙여넣기, 맨뒤 \\ 추가
		String realDir = "D:\\dev\\workspace-spring\\git\\spring_dreams_project\\dreams_proejct_spring\\src\\main\\webapp\\resources\\upload\\";
		System.out.println("realDir : " + realDir);
		// realDir : D:\dev\workspace-spring\\git\\spring_dreams_project\\dreams_proejct_spring\\src\\main\\webapp\\resources\\upload\\
		
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			file.transferTo(new File(saveDir + file.getOriginalFilename()));
			fis = new FileInputStream(saveDir + file.getOriginalFilename());
			fos = new FileOutputStream(realDir + file.getOriginalFilename());
			
			int data = 0;
			while((data = fis.read()) != -1) {
				fos.write(data);
			}
			// 추가 E : JSP의 ImageUploadHanDler.java 기능

			// 3단계. 화면에서 입력받은 값을 가져온다.
			ProductDTO dto = new ProductDTO();
			
			dto.setProduct_Name(req.getParameter("product_Name"));
			dto.setProduct_Price(Integer.parseInt(req.getParameter("product_Price")));
			dto.setProduct_Qty(Integer.parseInt(req.getParameter("product_Qty")));
			dto.setProduct_Category(req.getParameter("product_Category"));
			System.out.println(req.getParameter("product_Category"));
			
			String p_img1 = "/dreams_project2/resources/upload/" + file.getOriginalFilename();
			
			System.out.println("p_img1 ==>" + p_img1);
			dto.setProduct_ImgName(p_img1);
	
			dto.setProduct_ImgDetail(req.getParameter("product_ImgDetail"));
			
			dto.setProduct_ImgSize(req.getParameter("product_ImgSize"));
			dto.setProduct_ImgRfd(req.getParameter("product_ImgRfd"));
			
			// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
	
			// 5-1단계. 게시글 작성 처리 후 컨트롤러에서 list로 이동
			dao.insertProduct(dto);
			
			model.addAttribute("dto", dto);
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			if(fis != null) fis.close();
			if(fos != null) fos.close();
		}
		

	}

	// 상품상세페이지
	@Override
	public void productDetailAction(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - productDetailAction");

		// 3단계. get방식에서 입력받은 값을 가져온다.
		int product_No = Integer.parseInt(req.getParameter("product_No"));
		String pageNum = req.getParameter("pageNum");

		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용

		// 5-1 단계. 상품 상세페이지
		ProductDTO dto = dao.productDetail(product_No);

		// 6단계. jsp로 처리결과 전달
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);
	}

	// 상품 수정 처리 MultipartHttpServletRequest - 등록 수정
	@Override
	public void productUpdateAction(MultipartHttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - productUpdateAction");
		
			// 3단계. 화면에서 입력받은 값, hidden 값 을 가져온다.
			String hiddenPageNum = req.getParameter("hiddenPageNum");
			int hiddenproduct_No = Integer.parseInt(req.getParameter("hiddenproduct_No"));
			String hiddenproduct_ImgName = req.getParameter("hiddenproduct_ImgName");
			// ImageUploadHandler 클래스에서 setAttribute("fileName", fileName)로 넘겼으므로 getAttribute("fileName")로 처리
			// String uploadPdImg = (String) req.getAttribute("fileName");
			System.out.println("hiddenproduct_ImgName : " + hiddenproduct_ImgName);
			
			//---------------------------------------------------
			// 추가 S : JSP의 ,ImageUploadHandler.java 기능------------------
			MultipartFile file = req.getFile("product_ImgName");
			System.out.println("file : " + file);
			
			// input 경로
			String saveDir = req.getSession().getServletContext().getRealPath("/resources/upload/");
			System.out.println("saveDir : " + saveDir);
			// saveDir : C:\\apache-tomcat-8.5.97\\wtpwebapps\\dreams_project_2\\resource\\upload
			
			
			// 이미지 추가를 위한 샘플이미지 경로(upload 폴더 우클릭 > properties > Location 정보 복사해서 붙여넣기, 맨뒤 \\ 추가
			String realDir = "D:\\dev\\workspace-spring\\git\\spring_dreams_project\\dreams_proejct_spring\\src\\main\\webapp\\resources\\upload\\";
			System.out.println("realDir : " + realDir);
			// realDir : D:\dev\workspace-spring\\git\\spring_dreams_project\\dreams_proejct_spring\\src\\main\\webapp\\resources\\upload\\
			
			FileInputStream fis = null;
			FileOutputStream fos = null;
			String p_img1 ="";
			
			if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
				try {
					file.transferTo(new File(saveDir + file.getOriginalFilename()));
					fis = new FileInputStream(saveDir + file.getOriginalFilename());
					fos = new FileOutputStream(realDir + file.getOriginalFilename());
					
					int data = 0;
					while((data = fis.read()) != -1) {
						fos.write(data);
					}
				}catch(IOException e) {
					e.printStackTrace();
				}finally {
					if(fis != null) fis.close();
					if(fos != null) fos.close();
				}
				
				// 수정 S
				p_img1 = "/dreams_project2/resources/upload/" + file.getOriginalFilename();	// /세번째 패키지명/upload 경로/파일명
				// pdto.getPdImg() ==> /dreams_project2/resources/upload/트롬세탁기.jpg
				
				System.out.println("p_img1 ==>" + p_img1);
				
				// 수정 E
				
			}
			else { // 이미지를 수정하지 않을 경우 => 기존 이미지 사용
				p_img1 = hiddenproduct_ImgName;
				System.out.println("기존 이미지 : " + p_img1);
			}
			
			
			
			// dto생성
			ProductDTO dto = new ProductDTO();
			dto.setProduct_No(hiddenproduct_No);
			dto.setProduct_Name(req.getParameter("product_Name"));
			dto.setProduct_Price(Integer.parseInt(req.getParameter("product_Price")));
			dto.setProduct_Qty(Integer.parseInt(req.getParameter("product_Qty")));
			dto.setProduct_Category(req.getParameter("product_Category"));
			dto.setProduct_ImgName(p_img1);
			
			dto.setProduct_ImgDetail(req.getParameter("product_ImgDetail"));
			dto.setProduct_ImgSize(req.getParameter("product_ImgSize"));
			dto.setProduct_ImgRfd(req.getParameter("product_ImgRfd"));
			
			
			System.out.println(dto.toString());
			// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
			
			// 5-1 단계. 상품 수정처리
			int updateCnt = dao.productUpdate(dto);
			
			// 6단계. jsp로 처리결과 전달
			model.addAttribute("updateCnt", updateCnt);
			model.addAttribute("hiddenPageNum", hiddenPageNum);
			model.addAttribute("hiddenproduct_No", hiddenproduct_No);
		

	}

	@Override 
	// 상품 삭제
	public void productDeleteAction(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - productDeleteAction");
		
		// 3단계. get으로  값 을 가져온다.	
		int product_No = Integer.parseInt(req.getParameter("product_No"));
		// 5-1 단계. 상품 삭제 처리
		int deleteCnt = dao.productDelete(product_No);
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("deleteCnt", deleteCnt);
	}

	// 고객페이지 리스트
	@Override
	public void customerListAction(HttpServletRequest req, HttpServletResponse res, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - customerListAction");

		
		ProductDTO dto = new ProductDTO();
		// 3단계. get으로  값 을 가져온다.
		String product_Name = req.getParameter("product_Name");
		System.out.println(product_Name);
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		// 5-1 단계. 고객상품리스트 호출
		dto = dao.customerList(product_Name);
		// 6단계. jsp로 처리결과 전달
		System.out.println(dto);
		model.addAttribute("dto", dto);
		
		
		
	}
	
	
	

}
