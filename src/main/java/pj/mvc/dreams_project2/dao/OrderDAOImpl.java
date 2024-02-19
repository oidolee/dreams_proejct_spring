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

import pj.mvc.jsp.dto.OrderDTO;
import pj.mvc.jsp.dto.OrderDetailDTO;
import pj.mvc.jsp.dto.RefundDTO;


public class OrderDAOImpl implements OrderDAO {
	
	// 싱글톤 패턴
	private static OrderDAOImpl instance = new OrderDAOImpl();
	
	public static OrderDAOImpl getInstance() {
		if(instance == null) {
			instance = new OrderDAOImpl();
		}
		return instance;
	}
	
	// 커넥션 풀 객체를 보관
	private DataSource dataSource;
	
	// 커넥션 풀
	private OrderDAOImpl() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/dreams_project_2");
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}

	// 내 주문 조회
	@Override
	public List<OrderDTO> OrderDetail(String cust_Id) {
		
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT * FROM DR_orders where cust_Id = ? ";
			
			pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, cust_Id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				OrderDTO dto = new OrderDTO();
				
				dto.setOrder_No(rs.getInt("order_No"));
				dto.setOrder_Content(rs.getString("order_Content"));
				dto.setOrder_Amount(rs.getInt("order_Amount"));
				dto.setOrder_Name(rs.getString("order_Name"));
				dto.setOrder_Phone(rs.getString("order_Phone"));
				dto.setOrder_Address(rs.getString("order_Address"));
				dto.setOrder_Date(rs.getString("order_Date"));
				dto.setOrder_Status(rs.getString("order_Status"));
				
				list.add(dto);
			}
			
		} catch(SQLException e) {
			
	         e.printStackTrace();
	       } finally {
	          try {
	             if(rs != null) rs.close();
	             if(pstmt != null) pstmt.close();
	             if(conn != null) conn.close();
	          } catch(SQLException e) {
	            e.printStackTrace();
	          }
	    }
		return list;
	}
	
	// 내 주문내역 - 구매확정 버튼
	public int confirmOrder(int order_No) {
		System.out.println(" DAO - confirmOrder ");
		int updateCnt = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "UPDATE DR_orders "
					+ "   SET order_Status = '구매확정' "
					+ " WHERE order_No = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order_No);
			
			updateCnt = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return updateCnt;
	}
	
	
	// 교환/환불 신청 페이지 - 최근 구매한 상품
	public List<OrderDetailDTO> MyorderDetail(int order_No) {
		System.out.println(" DAO - MyorderDetail ");
		
		List<OrderDetailDTO> list = new ArrayList<OrderDetailDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT * FROM DR_orderDetail WHERE order_No = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order_No);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				OrderDetailDTO dto  = new OrderDetailDTO();
				
				dto.setOrderDetail_No(rs.getInt("orderDetail_No"));
				dto.setOrder_No(rs.getInt("order_No"));
				dto.setProduct_No(rs.getInt("product_No"));
				dto.setProduct_Name(rs.getString("product_Name"));
				dto.setOrderDetail_qty(rs.getInt("orderDetail_qty"));
				dto.setOrderDetail_price(rs.getInt("orderDetail_price"));
				
				list.add(dto);
			}
		} catch(SQLException e) {
			
	         e.printStackTrace();
	       } finally {
	          try {
	             if(rs != null) rs.close();
	             if(pstmt != null) pstmt.close();
	             if(conn != null) conn.close();
	          } catch(SQLException e) {
	            e.printStackTrace();
	          }
	    }
		return list;
	}
	
	// 환불 신청서 제출
	@Override
	public int submissionRefund(RefundDTO dto) {
		
		int insertCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		
		try {
			conn = dataSource.getConnection();
			String sql = "INSERT INTO DR_refund (REF_No, order_No, REF_cust_Id, REF_Name, REF_Phone, REF_Address, REF_Prod_No, REF_Prod_Name, REF_Prod_qty, REF_Reason, REF_Account, REF_Status) "
					+ "VALUES ((SELECT NVL(MAX(REF_No) + 1, TO_NUMBER(TO_CHAR(SYSDATE, 'YYMMDD') || '001')) FROM DR_refund), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getOrder_No());
			pstmt.setString(2, dto.getREF_cust_Id());
			pstmt.setString(3, dto.getREF_Name());
			pstmt.setString(4, dto.getREF_Phone());
			pstmt.setString(5, dto.getREF_Address());
			pstmt.setInt(6, dto.getREF_Prod_No());
			pstmt.setString(7, dto.getREF_Prod_Name());
			pstmt.setInt(8, dto.getREF_Prod_qty());
			pstmt.setString(9, dto.getREF_Reason());
			pstmt.setString(10, dto.getREF_Account());
			pstmt.setString(11, dto.getREF_Status());
			
			insertCnt = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return insertCnt;
	}
	
	// 교환/환불 신청서 확인 
	public List<RefundDTO> refundDetail(String REF_cust_Id) {
		
		List<RefundDTO> list = new ArrayList<RefundDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "SELECT * FROM DR_refund WHERE REF_cust_Id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, REF_cust_Id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				RefundDTO dto = new RefundDTO();
				
				dto.setREF_No(rs.getInt("REF_No"));
				dto.setOrder_No(rs.getInt("order_No"));
				dto.setREF_cust_Id(REF_cust_Id);
				dto.setREF_Name(rs.getString("REF_Name"));
				dto.setREF_Phone(rs.getString("REF_Phone"));
				dto.setREF_Address(rs.getString("REF_Address"));
				dto.setREF_Prod_No(rs.getInt("REF_Prod_No"));
				dto.setREF_Prod_Name(rs.getString("REF_Prod_Name"));
				dto.setREF_Prod_qty(rs.getInt("REF_Prod_qty"));
				dto.setREF_Reason(rs.getString("REF_Reason"));
				dto.setREF_Account(rs.getString("REF_Account"));
				dto.setREF_Date(rs.getDate("REF_Date"));
				dto.setREF_Status(rs.getString("REF_Status"));
				
				list.add(dto);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	
	
}
