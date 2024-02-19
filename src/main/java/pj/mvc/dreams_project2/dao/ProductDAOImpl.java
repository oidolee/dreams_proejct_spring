package pj.mvc.dreams_project2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pj.mvc.jsp.dto.ProductDTO;

public class ProductDAOImpl implements ProductDAO {

	DataSource dataSource = null;

	// 싱글톤 객체 생성
	private static ProductDAOImpl instance = new ProductDAOImpl(); // 객체 내 유일한 인스턴스 생성

	public static ProductDAOImpl getInstance() {
		if (instance == null) {
			instance = new ProductDAOImpl();
		}
		return instance;
	}

	// 디폴트 생성자
	/* 커넥션 풀(DBCP : DataBase Connection Pool 방식) - context.xml 에 설정 */
	private ProductDAOImpl() {

		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/dreams_project_2"); // 다운캐스팅 적용

		} catch (NamingException e) {

		} finally {

		}

	} // 외부에서 new를 못하게 디폴트 생성자를 private로 막는다

	// 상품 목록
	@Override
	public List<ProductDTO> productList(int start, int end) {
		System.out.println("ProductDAOImpl - productList");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<>();
		;
		try {
			conn = dataSource.getConnection();

			String sql = "SELECT * " 
					+ "  FROM (" 
					+ "        SELECT A.*, " 
					+ "                rownum AS rn"
					+ "        FROM " 
					+ "            (" 
					+ "            SELECT * FROM DR_product"
					+ "              WHERE show = 'y' "
					+ "            ORDER BY product_No DESC" 
					+ "            ) A" 
					+ "        )"
					+ " WHERE rn BETWEEN ? AND ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			// 1. list 생성
			while (rs.next()) {

				// 2. bdto 생성
				ProductDTO dto = new ProductDTO();

				// 3. bdto에 1건의 rs게시글 정보를 담는다.
				dto.setProduct_No(rs.getInt("product_No"));
				dto.setProduct_Name(rs.getString("product_Name"));
				dto.setProduct_Price(rs.getInt("product_Price"));
				dto.setProduct_Qty(rs.getInt("product_Qty"));
				dto.setProduct_Category(rs.getString("product_Category"));
				dto.setProduct_ImgName(rs.getString("product_ImgName"));
				dto.setProduct_ImgDetail(rs.getString("product_ImgDetail"));
				dto.setProduct_ImgSize(rs.getString("product_ImgSize"));
				dto.setProduct_ImgRfd(rs.getString("product_ImgRfd"));
				dto.setRegDate(rs.getDate("regDate"));

				// 4. list에 dto를 추가한다.
				list.add(dto);
			}
			;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	// 상품 목록 갯수 구하기
	@Override
	public int productCnt() {
		System.out.println("ProductDAOImpl - productCnt");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;

		try {
			conn = dataSource.getConnection();

			String sql = "SELECT COUNT(*) as cnt " + "  FROM DR_product";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			// 1. list 생성

			if (rs.next()) {
				total = rs.getInt("cnt");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return total;
	}

	// 상품 추가
	@Override
	public int insertProduct(ProductDTO dto) {
		int insertCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dataSource.getConnection();
			String sql = " INSERT INTO DR_product(product_No, product_Name, product_Price, product_Qty, product_Category, product_ImgName, product_ImgDetail, product_ImgSize, product_ImgRfd, regDate) "
					+ "         VALUES((SELECT NVL(MAX(product_No)+1, 1) FROM DR_product), ?, ?, ?, ?, ?, ?, ?, ?, sysdate) ";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getProduct_Name());
			pstmt.setInt(2, dto.getProduct_Price());
			pstmt.setInt(3, dto.getProduct_Qty());
			pstmt.setString(4, dto.getProduct_Category());
			pstmt.setString(5, dto.getProduct_ImgName());
			pstmt.setString(6, dto.getProduct_ImgDetail());
			pstmt.setString(7, dto.getProduct_ImgSize());
			pstmt.setString(8, dto.getProduct_ImgRfd());

			insertCnt = pstmt.executeUpdate();
			System.out.println("insertCnt : " + insertCnt);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return insertCnt;
	}

	// 상품 삭제
	@Override
	public int productDelete(int product_No) {
		
		int deleteCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "UPDATE DR_product "
					+ "   SET show = 'n' "
					+ " WHERE product_No = ? ";
					
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, product_No);
			
			deleteCnt = pstmt.executeUpdate();
			System.out.println("deleteCnt : " + deleteCnt);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return deleteCnt;
	}

	// 상품 수정
	@Override
	public int productUpdate(ProductDTO dto) {
		System.out.println("ProductDAOImpl - productUpdate");
		int updateCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = dataSource.getConnection();

			String sql = "UPDATE DR_product SET "
		            + "product_Name = ?, "
		            + "product_Price = ?, "
		            + "product_Qty = ?, "
		            + "product_Category = ?, "
		            + "product_ImgName = ?, "
		            + "product_ImgDetail = ?, "
		            + "product_ImgSize = ?, "
		            + "product_ImgRfd = ? "
		            + "WHERE product_No = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getProduct_Name());
			pstmt.setInt(2, dto.getProduct_Price());
			pstmt.setInt(3, dto.getProduct_Qty());
			pstmt.setString(4, dto.getProduct_Category());
			pstmt.setString(5, dto.getProduct_ImgName());
			pstmt.setString(6, dto.getProduct_ImgDetail());
			pstmt.setString(7, dto.getProduct_ImgSize());
			pstmt.setString(8, dto.getProduct_ImgRfd());
			pstmt.setInt(9, dto.getProduct_No());
			

			updateCnt = pstmt.executeUpdate();
			System.out.println("updateCnt : " + updateCnt);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return updateCnt;

	}

	// 상품 상세 페이지
	@Override
	public ProductDTO productDetail(int product_No) {
		// 1. dto 생성
		ProductDTO dto = new ProductDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();

			String sql = "SELECT * FROM DR_product WHERE product_No= ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_No);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				// 2. dto에 rs 상품정보를 담는다.
				dto.setProduct_No(rs.getInt("product_No"));
				dto.setProduct_Name(rs.getString("product_Name"));
				dto.setProduct_Price(rs.getInt("product_Price"));
				dto.setProduct_Qty(rs.getInt("product_Qty"));
				dto.setProduct_Category(rs.getString("product_Category"));
				dto.setProduct_ImgName(rs.getString("product_ImgName"));
				dto.setProduct_ImgDetail(rs.getString("product_ImgDetail"));
				dto.setProduct_ImgSize(rs.getString("product_ImgSize"));
				dto.setProduct_ImgRfd(rs.getString("product_ImgRfd"));
				dto.setRegDate(rs.getDate("regDate"));
				
				System.out.println();
			};

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 3. dto반환
		return dto;
	}

	@Override
	public ProductDTO customerList(String product_Name) {
		
		ProductDTO dto = new ProductDTO();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dataSource.getConnection();

			String sql = "SELECT * FROM DR_product WHERE product_Name= ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product_Name);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				// 2. dto에 rs 상품정보를 담는다.
				dto.setProduct_Name(rs.getString("product_Name"));
				dto.setProduct_Price(rs.getInt("product_Price"));
				dto.setProduct_ImgName(rs.getString("product_ImgName"));
				dto.setProduct_ImgDetail(rs.getString("product_ImgDetail"));
				dto.setProduct_ImgSize(rs.getString("product_ImgSize"));
				dto.setProduct_ImgRfd(rs.getString("product_ImgRfd"));
			};
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// 3. dto반환
		return dto;
	}

}
