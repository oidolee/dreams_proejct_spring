package pj.mvc.dreams_project2.dao;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pj.mvc.dreams_project2.dto.BoardDTO;
import pj.mvc.dreams_project2.dto.Board_reviewDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 게시글 목록
	@Override
	public List<BoardDTO> boardList(Map<String, Object> map) {
		System.out.println("BoardDAOImpl - boardList");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<BoardDTO> list = dao.boardList(map);
		
		return list;
	}

	// 게시글 갯수 구하기
	@Override
	public int boardCnt() {
		System.out.println("BoardDAOImpl - boardCnt");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int total = dao.boardCnt();
			
		return total;
	}
	
	// 게시글 max 번호 조회
	@Override
	public int getMaxBoardNo() {
		System.out.println("BoardDAOImpl - getMaxBoardNo");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int maxBoardNo = dao.getMaxBoardNo();
			
		return maxBoardNo;
	}

	// 게시글 상세페이지
	@Override
	public BoardDTO getBoardDetail(int boardNo) {
		System.out.println("BoardDAOImpl - getBoardDetail");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		BoardDTO dto = dao.getBoardDetail(boardNo);
		
		return dto;
	}

	// 게시글 추가
	@Override
	public void boardWrite(BoardDTO dto) {
		System.out.println("BoardDAOImpl - boardWrite");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.boardWrite(dto);
		
	}

	// 게시글 수정
	@Override
	public void boardEdit(BoardDTO dto) {
		System.out.println("BoardDAOImpl - boardEdit");
		
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.boardEdit(dto);
			
	}

	// 게시글 삭제
	@Override
	public void boardDelete(int boardNo) {
		System.out.println("BoardDAOImpl - boardDelete");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.boardDelete(boardNo);
			
	}

	// 댓글 추가
	@Override
	public void reviewInsert(Board_reviewDTO dto) {
		System.out.println("BoardDAOImpl - reviewInsert");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.reviewInsert(dto);
		
	}

	// 댓글조회
	@Override
	public List<Board_reviewDTO> reviewList(Map<String, Object> map) {
		System.out.println("BoardDAOImpl - reviewList");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<Board_reviewDTO> list = dao.reviewList(map);
			
		return list;
	}

	// 댓글 갯수 조회
	@Override
	public int reviewCount(int board_No) {
		System.out.println("BoardDAOImpl - reviewCount");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int reviewCnt = dao.reviewCount(board_No);
		
		return reviewCnt;
	}

	// 검색한 게시글 갯수 조회
	@Override
	public int boardSearchCnt(String searchKey) {
		System.out.println("BoardDAOImpl - boardSearchCnt");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int searchCnt = dao.boardSearchCnt(searchKey);
		
		return searchCnt;
	}

	// 게시글 검색
	@Override
	public List<BoardDTO> boardSearchList(Map<String, Object> map) {
		System.out.println("BoardDAOImpl - boardSearchList");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<BoardDTO> list = dao.boardSearchList(map);
			
		return list;
	}

	// 댓글 삭제 / 관리자 댓글 숨기기
	@Override
	public void reviewDelete(int review_No) {
		System.out.println("BoardDAOImpl - reviewDelete");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.reviewDelete(review_No);
	}

	// 관리자 게시글 총갯수 조회
	@Override
	public int boardTotalCnt() {
		System.out.println("BoardDAOImpl - boardTotalCnt");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int total = dao.boardTotalCnt();
		
		return total;
	}

	// 댓글조회
	@Override
	public List<Board_reviewDTO> reviewList_admin(Map<String, Object> map) {
		System.out.println("BoardDAOImpl - reviewList_admin");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<Board_reviewDTO> list = dao.reviewList_admin(map);
			
		return list;
	}
	
	// 관리자 게시글 목록
	@Override
	public List<BoardDTO> admin_boardList(Map<String, Object> map) {
		System.out.println("BoardDAOImpl - admin_boardList");

		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		List<BoardDTO> list = dao.admin_boardList(map);
		
		return list;
	}

	// 관리자 게시글 보이기
	@Override
	public void boardView(int boardNo) {
		System.out.println("BoardDAOImpl - boardView");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.boardView(boardNo);
		
	}

	// 관리자 게시글 삭제
	@Override
	public void boardDelete_admin(int boardNo) {
		System.out.println("BoardDAOImpl - boardDelete_admin");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.boardDelete_admin(boardNo);
			
	}

	// 관리자 댓글 총갯수 조회
	@Override
	public int reviewTotalCnt(int board_No) {
		System.out.println("BoardDAOImpl - reviewTotalCnt");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		int reviewCnt = dao.reviewTotalCnt(board_No);
			
		return reviewCnt;
	}
	
	// 관리자 댓글 보이기
	@Override
	public void reviewView_admin(int review_No) {
		System.out.println("BoardDAOImpl - reviewView_admin");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.reviewView_admin(review_No);
		
	}

	// 관리자 댓글 완전삭제
	@Override
	public void reviewDelete_admin(int review_No) {
		System.out.println("BoardDAOImpl - reviewDelete_admin");
		
		BoardDAO dao = sqlSession.getMapper(BoardDAO.class);
		dao.reviewDelete_admin(review_No);
		
	}


}
