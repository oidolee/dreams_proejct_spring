package pj.mvc.dreams_project2.dao;

import java.util.List;

import pj.mvc.dreams_project2.dto.TeamDTO;
import pj.mvc.dreams_project2.dto.gamesDTO;


public interface gamesDAO {
	//경기 일정 출력
	public List<gamesDTO> selectGamesList();
	
	//팀 내역 출력
	public List<TeamDTO> selectTeamList();
	
	//경기 일정 등록
	public int insertGames(gamesDTO dto);
	
	//홈팀 위치 정보
	public String getLocation(String dG_Home);
	
	//경기 일정 삭제
	public int deleteGames(int dG_No);
	
	//경기 일정 상세
	public gamesDTO getDetail(int DG_No);
	
	//게임일정 수정
	public int updateGames(gamesDTO dto); 
}
