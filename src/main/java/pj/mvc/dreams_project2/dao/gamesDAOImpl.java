package pj.mvc.dreams_project2.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.mvc.dreams_project2.dto.TeamDTO;
import pj.mvc.dreams_project2.dto.gamesDTO;


@Repository
public class gamesDAOImpl implements gamesDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 커넥션 풀 객체를 보관
	private DataSource dataSource;
	
	// 싱글톤 객체 생성
	private static gamesDAOImpl instance = new gamesDAOImpl();
	
	public static gamesDAOImpl getInstance() {
		if(instance == null)
			instance = new gamesDAOImpl();
		
		return instance;
	}
	
	public gamesDAOImpl() {
		/*try {
			Context context = new InitialContext();
			//oracle
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/dreams_project_2");
			//mysql
			//dataSource = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
		} catch(NamingException e) {
			e.printStackTrace();
		}*/
	}
	
	//경기 일정 출력
	public List<gamesDTO> selectGamesList() {
		
		/*List<gamesDTO> list = null;*/
		
		/*Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;*/
		
		
		
		/*	try {
				list = new ArrayList<>();
				conn = dataSource.getConnection();
				String sql = "SELECT * FROM DR_Gemes";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					gamesDTO dto = new gamesDTO();
					dto.setDG_No(rs.getInt("DG_No"));
					dto.setDG_Home(rs.getString("dG_Home"));
					dto.setDG_Away(rs.getString("dG_Away"));
					dto.setDG_Location(rs.getString("dG_Location"));
					dto.setDG_Time(rs.getTimestamp("dG_Time"));
					list.add(dto);
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs != null)rs.close();
					if(pstmt != null)pstmt.close();
					if(conn != null)conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}*/
		List<gamesDTO> list = sqlSession.selectList("pj.mvc.dreams_project2.dao.gamesDAO.selectGamesList");
		System.out.println(" list : " + list);
		
		return list;
	}

	//팀 내역 출력
	public List<TeamDTO> selectTeamList() {
		List<TeamDTO> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			list = new ArrayList<>();
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM DR_KBOTeams";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TeamDTO dto = new TeamDTO();
				dto.setDK_No(rs.getInt("dK_No"));
				dto.setDK_TeamName(rs.getString("DK_TeamName"));
				dto.setDK_Location(rs.getString("DK_Location"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	//경기 일정 등록
	public int insertGames(gamesDTO dto) {
	    int insertCnt = 0;
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        // 해당 연월일에 이미 정보가 있는지 확인하는 쿼리
	        String checkSql = "SELECT COUNT(*) FROM DR_Gemes WHERE TRUNC(DG_Time) = TO_DATE(?, 'YYYY-MM-DD')";
	        //String checkSql = "SELECT COUNT(*) FROM DR_Gemes WHERE DATE(DG_Time) = ?";
	        
	        conn = dataSource.getConnection();
	        
	        //연월일 체크를 위해 형식 변경 
	        Timestamp timestamp = dto.getDG_Time();
	        Date date = new Date(timestamp.getTime());
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        String formattedDate = dateFormat.format(date);

	        // 이미 정보가 있는지 확인
	        pstmt = conn.prepareStatement(checkSql);
	        pstmt.setString(1, formattedDate);
	        rs = pstmt.executeQuery();
	        
	        if (rs.next() && rs.getInt(1) > 0) {
	            // 이미 정보가 있으면 insertCnt를 2로 설정
	            insertCnt = 2;
	        } else {
	            // 정보가 없으면 INSERT 쿼리 실행
	            String sql = "INSERT INTO DR_Gemes(DG_No, DG_Home, DG_Away, DG_Location, DG_Time) VALUES(nvl((select max(DG_No) from DR_Gemes)+1,1),?, ?, ?, ?)";
	            //String sql = "INSERT INTO DR_Gemes(DG_Home, DG_Away, DG_Location, DG_Time) VALUES(?, ?, ?, ?)";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, dto.getDG_Home());
	            pstmt.setString(2, dto.getDG_Away());
	            pstmt.setString(3, dto.getDG_Location());
	            pstmt.setTimestamp(4, dto.getDG_Time());
	            insertCnt = pstmt.executeUpdate();
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        // 리소스 정리
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
				try {
					if(rs != null)rs.close();
					if(pstmt != null)pstmt.close();
					if(conn != null)conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
	    }

	    return insertCnt;
	}

	// 홈팀 위치 정보
	public String getLocation(String dG_Home) {
		String DG_Location = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT DK_Location FROM DR_KBOTeams WHERE DK_TeamName = ? ";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dG_Home);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				DG_Location = rs.getString("DK_Location");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return DG_Location;
	}
	
	//경기일정 삭제
	public int deleteGames(int DG_No) {
		int deleteCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from DR_Gemes where DG_No = ? ";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, DG_No);
			deleteCnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return deleteCnt;
	}

	//경기일정 상세
	public gamesDTO getDetail(int DG_No) {
		
		gamesDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM DR_Gemes WHERE DG_No = ? ";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, DG_No);
			rs = pstmt.executeQuery();
			
			dto = new gamesDTO();
			while(rs.next()) {
				dto.setDG_No(DG_No);
				dto.setDG_Home(rs.getString("DG_Home"));
				dto.setDG_Away(rs.getString("DG_Away"));
				dto.setDG_Time(rs.getTimestamp("DG_Time"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	//경기일정 수정
	public int updateGames(gamesDTO dto) {
	    int updateCnt = 0;
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    try {
	    	String sql = "UPDATE DR_Gemes"
	    				+ " SET DG_Home = ?, DG_Away = ?, DG_Location = ?, DG_Time = ? "
	    				+ " WHERE DG_No = ? ";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getDG_Home());
			pstmt.setString(2, dto.getDG_Away());
			pstmt.setString(3, dto.getDG_Location());
			pstmt.setTimestamp(4,dto.getDG_Time());
			pstmt.setInt(5, dto.getDG_No());
			updateCnt = pstmt.executeUpdate();
			System.err.println(" query : " + pstmt.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return updateCnt;
	}
	
}
