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
		List<TeamDTO> list = sqlSession.selectList("pj.mvc.dreams_project2.dao.gamesDAO.selectTeamList");
		return list;
	}

	//경기 일정 등록
	public int insertGames(gamesDTO dto) {
		System.out.println(" insertGames1 - start ");
		int insertCnt = 0;
		  //연월일 체크를 위해 형식 변경 
	    Timestamp timestamp = dto.getDG_Time();
	    Date date = new Date(timestamp.getTime());
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    String formattedDate = dateFormat.format(date);
	    System.out.println( " formattedDate : " + formattedDate) ;
		int checkDatInt = sqlSession.selectOne("pj.mvc.dreams_project2.dao.gamesDAO.checkSql",formattedDate);
		System.out.println("checkDatInt : " + checkDatInt);
		if(checkDatInt == 0) {
			insertCnt = sqlSession.insert("pj.mvc.dreams_project2.dao.gamesDAO.insertGames",dto);
		}

	    return insertCnt;
	}

	// 홈팀 위치 정보
	public String getLocation(String dG_Home) {
		String DG_Location = "";
		System.out.println("dG_Home : " + dG_Home);
		DG_Location = sqlSession.selectOne("pj.mvc.dreams_project2.dao.gamesDAO.getLocation",dG_Home);
		System.out.println("DG_Location : " + DG_Location);
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
		
		gamesDTO dto = sqlSession.selectOne("pj.mvc.dreams_project2.dao.gamesDAO.getDetail", DG_No);
		return dto;
	}
	
	//경기일정 수정
	public int updateGames(gamesDTO dto) {
	    int updateCnt = sqlSession.update("pj.mvc.dreams_project2.dao.gamesDAO.updateGames", dto);
	    
		/*  Connection conn = null;
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
		*/
		return updateCnt;
	}
	
}
