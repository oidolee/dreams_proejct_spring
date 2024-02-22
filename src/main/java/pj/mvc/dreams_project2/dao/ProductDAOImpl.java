package pj.mvc.dreams_project2.dao;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.mvc.dreams_project2.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;


	// 상품 목록
	@Override
	public List<ProductDTO> productList(Map<String, Object> map) {
		System.out.println("ProductDAOImpl - productList");

		List<ProductDTO> list = sqlSession.selectList("pj.mvc.dreams_project2.dao.ProductDAO.productList", map);

			// 1. list 생성
			// 2. bdto 생성
			// 3. bdto에 1건의 rs게시글 정보를 담는다.
			// 4. list에 dto를 추가한다.
		return list;
	}

	// 상품 목록 갯수 구하기
	@Override
	public int productCnt() {
		System.out.println("ProductDAOImpl - productCnt");
		
		int total = sqlSession.selectOne("pj.mvc.dreams_project2.dao.ProductDAO.productCnt");

			// 1. list 생성

		return total;
	}

	// 상품 추가
	@Override
	public int insertProduct(ProductDTO dto) {
		
		int insertCnt = sqlSession.insert("pj.mvc.dreams_project2.dao.ProductDAO.insertProduct",dto);
		
		return insertCnt;
	}

	// 상품 삭제
	@Override
	public int productDelete(int product_No) {
		
			
		int deleteCnt = sqlSession.update("pj.mvc.dreams_project2.dao.ProductDAO.productDelete", product_No);
					
		return deleteCnt;
	}

	// 상품 수정
	@Override
	public int productUpdate(ProductDTO dto) {
		System.out.println("ProductDAOImpl - productUpdate");
		
		int updateCnt = sqlSession.update("pj.mvc.dreams_project2.dao.ProductDAO.productUpdate", dto);

		return updateCnt;

	}

	// 상품 상세 페이지
	@Override
	public ProductDTO productDetail(int product_No) {
		// 1. dto 생성
		// 2. dto에 rs 상품정보를 담는다.
		// 3. dto반환
		
		ProductDTO dto = sqlSession.selectOne("pj.mvc.dreams_project2.dao.ProductDAO.productDetail", product_No);
		
		return dto;
	}

	// 고객 상세페이지
	@Override
	public ProductDTO customerList(String product_Name) {
		
		ProductDTO dto = sqlSession.selectOne("pj.mvc.dreams_project2.dao.ProductDAO.customerList", product_Name);
		
		return dto;
	}

}
