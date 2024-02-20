package pj.mvc.dreams_project2.dao;

import java.util.List;

import pj.mvc.dreams_project2.dto.ProductDTO;

public interface ProductDAO {
	
	//  상품 목록
	public List<ProductDTO> productList(int start, int end);
	
	// 상품 목록 갯수 구하기
	public int productCnt();
	
	// 2. 상품 추가
	public int insertProduct(ProductDTO dto);
	// 3. 상품 삭제
	public int productDelete(int product_No);
	// 4. 상품 수정
	public int productUpdate(ProductDTO dto);
	// 5. 상품 상제 페이지
	public ProductDTO productDetail(int product_No);
	
	// 6. 고객 상세페이지 
	public ProductDTO customerList(String product_Name);
}
