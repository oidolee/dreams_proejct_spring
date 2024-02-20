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

import pj.mvc.jsp.dto.BoardDTO;
import pj.mvc.jsp.dto.Board_reviewDTO;

public class BoardDAOImpl implements BoardDAO{
	
	// 커넥션 풀 객체를 보관
	private DataSource dataSource;
	
	// 싱글톤 객체 생성
	private static BoardDAOImpl instance = new BoardDAOImpl();
	public static BoardDAOImpl getInstance() {
		if(instance == null)
			instance = new BoardDAOImpl();
		
		return instance; 
	}
	
	// 디폴트생성자
	// 커넥션풀 연결
	private BoardDAOImpl() {
		try {
			Context context = new InitialContext();
			//oracle
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/dreams_project_2");
			//mysql
			//dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	// 게시글 목록
	@Override
	public List<BoardDTO> boardList(int start, int end) {
		System.out.println("BoardDAOImpl - boardList");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 1. list 생성
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn = dataSource.getConnection();
			
						String sql= "SELECT * "
								+ "    FROM( "
								+ "        SELECT A.*, "
								+ "                rownum AS rn "   // 일련번호 가져오기 
								+ "            FROM "
								+ "                ( "
								+ "                 SELECT board_No, cust_Id, board_Title, board_Content, board_Date "
								+ "					FROM DR_board "
								+ "					WHERE show = 'y' "
								+ "                    ORDER BY board_No DESC "
								+ "                ) A "
								+ "        ) "
								+ "WHERE rn BETWEEN ? AND ? ";
			
			/*		String sql = "SELECT * "
								+ "FROM ( "
								+ "    SELECT board_No, cust_Id, board_Title, board_Content, board_Date, "
								+ "           ROW_NUMBER() OVER (ORDER BY board_No DESC) AS row_num "
								+ "    FROM DR_board "
								+ "    WHERE show = 'y' "
								+ ") AS sub "
								+ "WHERE row_num BETWEEN ? AND ?; "
								+ "";*/

			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 2. dto 생성
				BoardDTO dto = new BoardDTO();
				
				// 3. dto에 1건의 rs 게시글 정보를 담는다.
				dto.setBoard_No(rs.getInt("board_No"));
				dto.setCust_Id(rs.getString("cust_Id"));
				dto.setBoard_Title(rs.getString("board_Title"));
				dto.setBoard_Content(rs.getString("board_Content"));
				dto.setBoard_Date(rs.getDate("board_date"));
				
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

	// 게시글 갯수 구하기
	@Override
	public int boardCnt() {
		System.out.println("BoardDAOImpl - boardCnt");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		
		try {
			conn = dataSource.getConnection();
			
			String sql= "SELECT COUNT(*) as cnt "
					+ "    FROM DR_board "
					+ "    WHERE show = 'y'";
			
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
		return total;
	}
	
	// 게시글 max 번호 조회
	@Override
	public int getMaxBoardNo() {
		System.out.println("BoardDAOImpl - getMaxBoardNo");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxBoardNo = 0;
		
		try {
			conn = dataSource.getConnection();
			
			String sql= "SELECT MAX(board_No) as maxNo "
					+ "    FROM DR_board ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				maxBoardNo = rs.getInt("maxNo");
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
		return maxBoardNo;
	}

	// 게시글 상세페이지
	@Override
	public BoardDTO getBoardDetail(int boardNo) {
		System.out.println("BoardDAOImpl - getBoardDetail");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO dto = new BoardDTO();
		
		try {
			conn = dataSource.getConnection();
			
			String sql= "SELECT * FROM DR_board "
					+ "  WHERE board_No = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setBoard_No(rs.getInt("board_No"));
				dto.setCust_Id(rs.getString("cust_Id"));
				dto.setBoard_Title(rs.getString("board_Title"));
				dto.setBoard_Content(rs.getString("board_Content"));
				dto.setBoard_Date(rs.getDate("board_Date"));
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
		return dto;
	}

	// 게시글 추가
	@Override
	public void boardWrite(BoardDTO dto) {
		System.out.println("BoardDAOImpl - boardWrite");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			/*oracle*/
			String sql = "INSERT INTO DR_board(board_No, cust_Id, board_Title, board_Content) "
					+ "VALUES((SELECT NVL(MAX(board_No)+1, 1) FROM DR_board), ?, ?, ?)";
			
/*			String sql = "INSERT INTO DR_board( cust_Id, board_Title, board_Content) "
        + " VALUES ( ?, ?, ?)";*/


			
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCust_Id());
			pstmt.setString(2, dto.getBoard_Title());
			pstmt.setString(3, dto.getBoard_Content());
			
			pstmt.executeUpdate();
			
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
	}

	// 게시글 수정
	@Override
	public void boardEdit(BoardDTO dto) {
		System.out.println("BoardDAOImpl - boardEdit");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dataSource.getConnection();
			
			String sql = "UPDATE DR_board SET board_title = ?, board_Content = ? WHERE board_No = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBoard_Title());
			pstmt.setString(2, dto.getBoard_Content());
			pstmt.setInt(3, dto.getBoard_No());
			
			pstmt.executeUpdate();
			
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
	}

	// 게시글 삭제
	@Override
	public void boardDelete(int boardNo) {
		System.out.println("BoardDAOImpl - boardDelete");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "UPDATE DR_board "
					+ " SET show = 'n' "
					+ " WHERE board_No = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			pstmt.executeUpdate();
			
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
	}

	// 댓글 추가
	@Override
	public void reviewInsert(Board_reviewDTO dto) {
		System.out.println("BoardDAOImpl - reviewInsert");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			/*oracle*/
				String sql="INSERT INTO DR_review(review_No, board_No, cust_Id, review_Content) "
						+ "VALUES((SELECT NVL(MAX(review_No)+1, 1) FROM DR_review), ?, ?, ?)";
			
			/*			String sql="INSERT INTO DR_review( board_No, cust_Id, review_Content) "
								+ "VALUES( ?, ?, ?)";*/
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoard_No());
			pstmt.setString(2, dto.getCust_Id());
			pstmt.setString(3, dto.getReview_Content());
			
			pstmt.executeUpdate();
			
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
		
	}

	// 댓글조회
	@Override
	public List<Board_reviewDTO> reviewList(int start, int end, int board_No) {
		System.out.println("BoardDAOImpl - reviewList");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Board_reviewDTO> list = new ArrayList<Board_reviewDTO>();
		
		try {
			conn = dataSource.getConnection();
			
						String sql= "SELECT * "
								+ "    FROM( "
								+ "        SELECT A.*, "
								+ "                rownum AS rn "   // 일련번호 가져오기 
								+ "            FROM "
								+ "                ( "
								+ "                 SELECT review_No, board_No, cust_Id, review_Content, review_Date, show "
								+ "					FROM DR_review "
								+ "					WHERE show = 'y' AND board_No = ? "
								+ "                    ORDER BY review_No DESC "
								+ "                ) A "
								+ "        ) "
								+ "WHERE rn BETWEEN ? AND ? ";
			
			
			/*			String sql= "SELECT * "
								+ "			FROM ( "
								+ "			    SELECT A.*,  "
								+ "			           ROW_NUMBER() OVER (ORDER BY review_No DESC) AS rn "
								+ "			    FROM ( "
								+ "			        SELECT review_No, board_No, cust_Id, review_Content, review_Date, show "
								+ "			        FROM DR_review "
								+ "			        WHERE show = 'y' AND board_No = ? "
								+ "			    ) A "
								+ "			) AS B "
								+ "			WHERE rn BETWEEN ? AND ?;";*/
			

			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_No);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 2. dto 생성
				Board_reviewDTO dto = new Board_reviewDTO();
				
				// 3. dto에 1건의 rs 게시글 정보를 담는다.
				dto.setReview_No(rs.getInt("review_No"));
				dto.setBoard_No(rs.getInt("board_No"));
				dto.setCust_Id(rs.getString("cust_Id"));
				dto.setReview_Content(rs.getString("review_Content"));
				dto.setReview_date(rs.getDate("review_Date"));
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
		
		return list;
	}

	// 댓글 갯수 조회
	@Override
	public int reviewCount(int board_No) {
		System.out.println("BoardDAOImpl - reviewCount");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int reviewCnt = 0;
		
		try {
			conn = dataSource.getConnection();
			
			String sql= "SELECT COUNT(*) as cnt "
					+ "    FROM DR_review "
					+ "    WHERE board_No = ? AND show ='y' ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_No);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				reviewCnt = rs.getInt("cnt");
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
		
		return reviewCnt;
	}

	// 검색한 게시글 갯수 조회
	@Override
	public int boardSearchCnt(String searchKey) {
		System.out.println("BoardDAOImpl - boardSearchCnt");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int searchCnt = 0;
		
		try {
			conn = dataSource.getConnection();
			
			String sql= "SELECT COUNT(*) as cnt "
					+ "    FROM DR_board "
					+ "    WHERE board_Title LIKE ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchKey+"%");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				searchCnt = rs.getInt("cnt");
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
		
		return searchCnt;
	}

	// 게시글 검색
	@Override
	public List<BoardDTO> boardSearchList(int start, int end, String searchKey) {
		System.out.println("BoardDAOImpl - boardSearchList");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 1. list 생성
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql= "SELECT * "
					+ "    FROM( "
					+ "        SELECT A.*, "
					+ "                rownum AS rn "   // 일련번호 가져오기 
					+ "            FROM "
					+ "                ( "
					+ "                 SELECT board_No, cust_Id, board_Title, board_Content, board_Date "
					+ "					FROM DR_board "
					+ "					WHERE show = 'y' AND board_Title LIKE ? "
					+ "                    ORDER BY board_No DESC "
					+ "                ) A "
					+ "        ) "
					+ "WHERE rn BETWEEN ? AND ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, '%'+searchKey+'%');
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 2. dto 생성
				BoardDTO dto = new BoardDTO();
				
				// 3. dto에 1건의 rs 게시글 정보를 담는다.
				dto.setBoard_No(rs.getInt("board_No"));
				dto.setCust_Id(rs.getString("cust_Id"));
				dto.setBoard_Title(rs.getString("board_Title"));
				dto.setBoard_Content(rs.getString("board_Content"));
				dto.setBoard_Date(rs.getDate("board_date"));
				
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

	// 댓글 삭제 / 관리자 댓글 숨기기
	@Override
	public void reviewDelete(int review_No) {
		System.out.println("BoardDAOImpl - reviewDelete");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "UPDATE DR_review "
					+ " SET show = 'n' "
					+ " WHERE review_No = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_No);
			
			pstmt.executeUpdate();
			
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
	}

	// 관리자 게시글 총갯수 조회
	@Override
	public int boardTotalCnt() {
		System.out.println("BoardDAOImpl - boardTotalCnt");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		
		try {
			conn = dataSource.getConnection();
			
			String sql= "SELECT COUNT(*) as cnt "
					+ "    FROM DR_board ";
			
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
		return total;
	}

	// 댓글조회
	@Override
	public List<Board_reviewDTO> reviewList_admin(int start, int end, int board_No) {
		System.out.println("BoardDAOImpl - reviewList_admin");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<Board_reviewDTO> list = new ArrayList<Board_reviewDTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql= "SELECT * "
					+ "    FROM( "
					+ "        SELECT A.*, "
					+ "                rownum AS rn "   // 일련번호 가져오기 
					+ "            FROM "
					+ "                ( "
					+ "                 SELECT review_No, board_No, cust_Id, review_Content, review_Date, show "
					+ "					FROM DR_review "
					+ "					WHERE  board_No = ? "
					+ "                    ORDER BY review_No DESC "
					+ "                ) A "
					+ "        ) "
					+ "WHERE rn BETWEEN ? AND ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_No);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 2. dto 생성
				Board_reviewDTO dto = new Board_reviewDTO();
				
				// 3. dto에 1건의 rs 게시글 정보를 담는다.
				dto.setReview_No(rs.getInt("review_No"));
				dto.setBoard_No(rs.getInt("board_No"));
				dto.setCust_Id(rs.getString("cust_Id"));
				dto.setReview_Content(rs.getString("review_Content"));
				dto.setReview_date(rs.getDate("review_Date"));
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
		
		return list;
	}
	
	// 관리자 게시글 목록
	@Override
	public List<BoardDTO> admin_boardList(int start, int end) {
		System.out.println("BoardDAOImpl - admin_boardList");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 1. list 생성
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql= "SELECT * "
					+ "    FROM( "
					+ "        SELECT A.*, "
					+ "                rownum AS rn "   // 일련번호 가져오기 
					+ "            FROM "
					+ "                ( "
					+ "                 SELECT board_No, cust_Id, board_Title, board_Content, board_Date, show "
					+ "					FROM DR_board "
					+ "                    ORDER BY board_No DESC "
					+ "                ) A "
					+ "        ) "
					+ "WHERE rn BETWEEN ? AND ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 2. dto 생성
				BoardDTO dto = new BoardDTO();
				
				// 3. dto에 1건의 rs 게시글 정보를 담는다.
				dto.setBoard_No(rs.getInt("board_No"));
				dto.setCust_Id(rs.getString("cust_Id"));
				dto.setBoard_Title(rs.getString("board_Title"));
				dto.setBoard_Content(rs.getString("board_Content"));
				dto.setBoard_Date(rs.getDate("board_date"));
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

	// 관리자 게시글 보이기
	@Override
	public void boardView(int boardNo) {
		System.out.println("BoardDAOImpl - boardView");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "UPDATE DR_board "
					+ " SET show = 'y' "
					+ " WHERE board_No = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			pstmt.executeUpdate();
			
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
	}

	// 관리자 게시글 삭제
	@Override
	public void boardDelete_admin(int boardNo) {
		System.out.println("BoardDAOImpl - boardDelete_admin");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "DELETE FROM DR_board "
					+ "WHERE board_No = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			pstmt.executeUpdate();
			
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
	}

	// 관리자 댓글 총갯수 조회
	@Override
	public int reviewTotalCnt(int board_No) {
		System.out.println("BoardDAOImpl - reviewTotalCnt");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int reviewCnt = 0;
		
		try {
			conn = dataSource.getConnection();
			
			String sql= "SELECT COUNT(*) as cnt "
					+ "    FROM DR_review "
					+ "    WHERE board_No = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_No);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				reviewCnt = rs.getInt("cnt");
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
		
		return reviewCnt;
	}
	
	// 관리자 댓글 보이기
	@Override
	public void reviewView_admin(int review_No) {
		System.out.println("BoardDAOImpl - reviewView_admin");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "UPDATE DR_review "
					+ " SET show = 'y' "
					+ " WHERE review_No = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_No);
			
			pstmt.executeUpdate();
			
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
	}

	// 관리자 댓글 완전삭제
	@Override
	public void reviewDelete_admin(int review_No) {
		System.out.println("BoardDAOImpl - reviewDelete_admin");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "DELETE FROM DR_review "
					+ "WHERE review_No = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, review_No);
			
			pstmt.executeUpdate();
			
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
		
	}

	


}
