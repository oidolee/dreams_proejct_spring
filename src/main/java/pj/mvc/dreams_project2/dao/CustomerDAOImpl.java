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

import pj.mvc.jsp.dto.CustomerDTO;

/* 작업자 : 윤석무 */
public class CustomerDAOImpl implements CustomerDAO {

	DataSource dataSource = null;
	
	// 싱글톤 객체 생성
	private static CustomerDAOImpl instance = new CustomerDAOImpl();
	
	public static CustomerDAOImpl getInstance() {
		if(instance == null) {
			instance = new CustomerDAOImpl();
		}
		return instance;
	}
	
	
	// 디폴트 생성자
	/* 커넥션 풀(DBCP : DataBase Connection Pool 방식) - context.xml에 설정 */
	private CustomerDAOImpl() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/dreams_project_2");	// lookup : 검색
			
			//mysql
			//dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}

	// ID 중복확인 처리
	@Override
	public int useridCheck(String strUserid) {
		System.out.println("CustomerDAOImpl - useridCheck");
		
		int selectCnt = 0;	// 초기값 0 설정 - 회원이 존재하지 않는 경우
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM DR_customers WHERE cust_Id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strUserid);
			
			rs = pstmt.executeQuery();
			System.out.println("  qurey : " + rs.toString());
			if(rs.next()) {
	            // 회원의 상태 확인
	            String showStatus = rs.getString("show");
	            if (showStatus.equals("y")) {
	                selectCnt = 1; // 회원이 존재함
	            } else {
	                selectCnt = -1; // 탈퇴한 회원
	            }
	        }
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return selectCnt;
	}

	// 회원가입 처리
	@Override
	public int insertCustomer(CustomerDTO dto) {
		System.out.println("CustomerDAOImpl - insertCustomer");
		
		int insertCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "INSERT INTO DR_customers(cust_Id, cust_Name, cust_Password, cust_Email, cust_Birth, cust_Phone, cust_Address, cust_No) "
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, (SELECT NVL(MAX(cust_No)+1,1 ) FROM DR_customers)) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCust_Id());
			pstmt.setString(2, dto.getCust_Name());
			pstmt.setString(3, dto.getCust_Password());
			pstmt.setString(4, dto.getCust_Email());
			pstmt.setString(5, dto.getCust_Birth());
			pstmt.setString(6, dto.getCust_Phone());
			pstmt.setString(7, dto.getCust_Address());
			
			insertCnt = pstmt.executeUpdate();
			System.out.println("insertCnt : " + insertCnt);
			
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

	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	
	@Override
	public int idPasswordChk(String strId, String strPassword) {
		System.out.println("CustomerDAOImpl - idPasswordChk");
		
		int selectCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM DR_customers WHERE cust_Id=? and cust_password=? and show ='y'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			System.out.println(strId);
			pstmt.setString(2, strPassword);
			System.out.println(strPassword);
			rs = pstmt.executeQuery();
			System.out.println("query : "  + rs.toString() );
			if(rs.next()) {
				selectCnt = 1;
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return selectCnt;
	}

	// 회원 탈퇴 처리
	@Override
	public int deleteCustomer(String strId) {
		
		System.out.println("CustomerDAOImpl - deleteCustomer");
		
		int deleteCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			String sql ="UPDATE DR_customers "
					+ "SET show = 'n' "
					+ "WHERE cust_Id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);
			
			deleteCnt = pstmt.executeUpdate();
			System.out.println("updateCnt : " + deleteCnt);
		
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
		return deleteCnt;
	}

	// 회원 상세페이지
	@Override
	public CustomerDTO getCustomerDetail(String strId) {
		System.out.println("CustomerDAOImpl - getCustomerDetail");
		
		// 1. customerDTO 바구니 생성
		CustomerDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = dataSource.getConnection();
			// 2. strId(로그인화면에서 입력받은 세션 ID)와 일치하는 데이터가 존재하는지 확인
			String sql = "SELECT * FROM DR_customers WHERE cust_Id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, strId);

			rs = pstmt.executeQuery();
			
			// 3. ResultSet에 userid와 일치하는 한사람의 회원정보가 존재하면
			if(rs.next()) {
				// ResultSet을 읽어서 customerDTO에 setter로 담는다.
				dto = new CustomerDTO();
				dto.setCust_Id(rs.getString("cust_Id"));
				dto.setCust_Password(rs.getString("cust_Password"));
				dto.setCust_Name(rs.getString("cust_Name"));
				dto.setCust_Birth(rs.getString("cust_Birth"));
				dto.setCust_Address(rs.getString("cust_Address"));
				dto.setCust_Phone(rs.getString("cust_Phone"));
				dto.setCust_Email(rs.getString("cust_Email"));
				dto.setCust_No(rs.getInt("cust_No"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}

	// 회원정보 수정 처리
	@Override
	public int updateCustomer(CustomerDTO dto) {
		System.out.println("CustomerDAOImpl - updateCustomer");
		
		int updateCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			String sql = "UPDATE DR_customers SET cust_Name = ?, cust_Password = ?, cust_Email = ?, "
							+ "cust_Birth = ?, cust_Phone = ? "
							+ "WHERE cust_Id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCust_Name());
			pstmt.setString(2, dto.getCust_Password());
			pstmt.setString(3, dto.getCust_Email());
			pstmt.setString(4, dto.getCust_Birth());
			pstmt.setString(5, dto.getCust_Phone());
			pstmt.setString(6, dto.getCust_Id());
			
			updateCnt = pstmt.executeUpdate();
			System.out.println("updateCnt : " + updateCnt);
		
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

	// 관리자모드 - 회원 전체 조회
	@Override
	public List<CustomerDTO> SelectCustomer(int start, int end) {
		
		// 2. dto 생성
		CustomerDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 1. list 생성
		List<CustomerDTO> list = new ArrayList<>();
		
		try {
			conn = dataSource.getConnection();
			
		       String sql = "SELECT * "
		               + "      FROM ( "
		               + "         SELECT A.*, "
		               + "               rownum AS rn "   
		               + "          FROM "
		               + "            ( "
		               + "              SELECT * FROM DR_customers "
		               + "                ORDER BY cust_No DESC "
		               + "            ) A "
		               + "        ) "
		               + " WHERE rn BETWEEN ? AND ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				// 3. dto에 1건의 rs 게시글 정보를 담는다.
				dto = new CustomerDTO();
				dto.setCust_Id(rs.getString("cust_Id"));
				dto.setCust_Password(rs.getString("cust_Password"));
				dto.setCust_Name(rs.getString("cust_Name"));
				dto.setCust_Birth(rs.getString("cust_Birth"));
				dto.setCust_Address(rs.getString("cust_Address"));
				dto.setCust_Phone(rs.getString("cust_Phone"));
				dto.setCust_Email(rs.getString("cust_Email"));
				dto.setCust_No(rs.getInt("cust_No"));
				dto.setShow(rs.getString("show"));
				
				
				// 4. list에 dto를 추가한다.
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
		// 5. list 리턴
		return list;
	}


	// 관리자모드 - 회원 상세 정보
	@Override
	public CustomerDTO admin_getCustomerDetail(int num) {
		System.out.println("CustomerDAOImpl - admin_getCustomerDetail");
		
		// 1. customerDTO 바구니 생성
		CustomerDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			// 2. strId(로그인화면에서 입력받은 세션 ID)와 일치하는 데이터가 존재하는지 확인
			String sql = "SELECT * FROM DR_customers WHERE cust_No = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			
			// 3. ResultSet에 userid와 일치하는 한사람의 회원정보가 존재하면
			if(rs.next()) {
				// ResultSet을 읽어서 customerDTO에 setter로 담는다.
				dto = new CustomerDTO();
				dto.setCust_Id(rs.getString("cust_Id"));
				dto.setCust_Name(rs.getString("cust_Name"));
				dto.setCust_Birth(rs.getString("cust_Birth"));
				dto.setCust_Address(rs.getString("cust_Address"));
				dto.setCust_Phone(rs.getString("cust_Phone"));
				dto.setCust_Email(rs.getString("cust_Email"));
				dto.setCust_No(rs.getInt("cust_No"));
				dto.setShow(rs.getString("show"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				if(rs != null) rs.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	
	// 관리자모드 - 회원 상세 정보 - 계정복구
	@Override
	public int admin_recoverCustomer(int cust_No) {
		
		System.out.println("CustomerDAOImpl - admin_recoverCustomer");
		int updateCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			String sql ="UPDATE DR_customers "
					+ "SET show = 'y' "
					+ "WHERE cust_No = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cust_No);
			
			updateCnt = pstmt.executeUpdate();
			System.out.println("updateCnt : " + updateCnt);
		
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

	// 관리자모드 - 회원 상세 정보 - 계정삭제
	@Override
	public int admin_suspendCustomer(int cust_No) {
		
		System.out.println("CustomerDAOImpl - admin_suspendCustomer");
		int deleteCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			String sql ="UPDATE DR_customers "
					+ "SET show = 'n' "
					+ "WHERE cust_No = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cust_No);
			
			deleteCnt = pstmt.executeUpdate();
			System.out.println("deleteCnt : " + deleteCnt);
		
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
		return deleteCnt;
	}
	
	
	// 관리자모드 - 회원 상세 정보 - 영구삭제
		@Override
		public int admin_deleteCustomer(int cust_No) {
			
			System.out.println("CustomerDAOImpl - admin_deleteCustomer");
			int deleteCnt = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = dataSource.getConnection();
				String sql ="DELETE FROM DR_customers WHERE cust_No = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cust_No);
				
				deleteCnt = pstmt.executeUpdate();
				System.out.println("deleteCnt : " + deleteCnt);
			
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
			return deleteCnt;
		}

		
		// 관리자모드 - 회원 전체 조회 갯수 구하기
		@Override
		public int CustomerCnt(CustomerDTO dto) {
			System.out.println("CustomerDAOImpl - CustomerCnt");
		      
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int total = 0;
	      
			try {
				conn = dataSource.getConnection();
				String sql = "SELECT COUNT(*) as cnt "
						+ "  FROM DR_customers";
				pstmt = conn.prepareStatement(sql);

				rs = pstmt.executeQuery();
				if(rs.next()) {
					total = rs.getInt("cnt");
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
			// 5. list 리턴
			return total;
		}
}