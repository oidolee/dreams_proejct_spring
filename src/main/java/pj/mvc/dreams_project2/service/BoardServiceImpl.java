package pj.mvc.dreams_project2.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import pj.mvc.dreams_project2.dao.BoardDAOImpl;
import pj.mvc.dreams_project2.dto.BoardDTO;
import pj.mvc.dreams_project2.dto.Board_reviewDTO;
import pj.mvc.dreams_project2.page.Paging;

/* 작업자 : 강승재 */

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAOImpl dao;
	
	// 게시글 목록
	@Override
	public void boardListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - boardListAction");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		String pageNum = req.getParameter("pageNum");
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5-1단계. 전체 게시글 갯수 카운트
		Paging paging = new Paging(pageNum);
		int total = dao.boardCnt();
		System.out.println("total : " + total);
		
		paging.setTotalCount(total);
		
		// 5-2단계. 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<BoardDTO> list = dao.boardList(map);
		
		// 6단계. jsp로 처리결과를 전달
		req.setAttribute("paging", paging);
		req.setAttribute("list", list);
		
	}

	// 게시글 상세
	@Override
	public void boardDetailAction(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - boardDetailAction");
		
		// 3단계. get방식으로 전달받은 값을 가져온다.
		int boardNo = Integer.parseInt(req.getParameter("board_No"));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5단계. 상세페이지
		BoardDTO dto = dao.getBoardDetail(boardNo);
		int maxBoardNo = dao.getMaxBoardNo();
		
		// 6단계. jsp로 처리결과를 전달
		req.setAttribute("maxBoardNo", maxBoardNo);
		req.setAttribute("dto", dto);
		
	}

	// 게시글 추가
	@Override
	public void boardWrite(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - boardWrite");
		
		// 3단계. get방식으로 전달받은 값을 dto에 담는다.
		BoardDTO dto = new BoardDTO();
		dto.setBoard_Title(req.getParameter("writeTitle"));
		dto.setBoard_Content(req.getParameter("writeTextarea"));
		dto.setCust_Id(req.getParameter("hidden_Id"));
		
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5단계. 상세페이지
		dao.boardWrite(dto);
		
	}

	// 게시글 수정
	@Override
	public void boardEdit(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - boardEdit");
		
		// 3단계. get방식으로 전달받은 값을 dto에 담는다.
		BoardDTO dto = new BoardDTO();
		dto.setBoard_Title(req.getParameter("writeTitle"));
		dto.setBoard_Content(req.getParameter("writeTextarea"));
		dto.setBoard_No(Integer.parseInt(req.getParameter("board_No")));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5단계. 상세페이지
		dao.boardEdit(dto);
		
	}
	
	// 게시글 삭제
	@Override
	public void boardDelete(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - boardDelete");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		int board_No = Integer.parseInt(req.getParameter("board_No"));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5단계. 게시글 삭제 처리 후 컨트롤러에서 list로 이동
		dao.boardDelete(board_No);
		
	}

	// 게시글 검색
	@Override
	public void boardSearch(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - boardSearch");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		String pageNum = req.getParameter("pageNum");
		String searchKey = req.getParameter("searchKey");
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5-1단계. 전체 게시글 갯수 카운트
		Paging paging = new Paging(pageNum);
		int total = dao.boardSearchCnt(searchKey);
		System.out.println("total : " + total);
		
		paging.setTotalCount(total);
		
		// 5-2단계. 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchKey", searchKey);
		
		List<BoardDTO> list = dao.boardSearchList(map);
		
		// 6단계. jsp로 처리결과를 전달
		req.setAttribute("searchKey", searchKey);
		req.setAttribute("paging", paging);
		req.setAttribute("list", list);
	}

	// 댓글 추가
	@Override
	public void reviewAdd(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - reviewAdd");
		
		// 화면으로부터 입력받은 값을 dto에 담는다.
		Board_reviewDTO dto = new Board_reviewDTO();
		dto.setBoard_No(Integer.parseInt(req.getParameter("board_No")));
		dto.setCust_Id(req.getParameter("cust_Id"));
		dto.setReview_Content(req.getParameter("reviewWrite"));
		
		// DAO 객체 생성
		
		// 댓글 작성 처리 후 컨트롤러에서 list로 이동
		dao.reviewInsert(dto);
		
	}

	// 댓글 조회
	@Override
	public void reviewList(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - reviewList");
		
		// 화면으로부터 입력받은 값을 받는다.
		int board_No = Integer.parseInt(req.getParameter("board_No"));
		String pageNum = req.getParameter("pageNum");
		
		// DAO 객체 생성
		
		// 댓글 개수 조회, 페이지처리
		int reviewCnt = dao.reviewCount(board_No);
		Paging paging = new Paging(pageNum);
		
		paging.setTotalCount(reviewCnt);
		
		// 5-2단계. 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("board_No", board_No);
		
		// 댓글 목록 조회
		List<Board_reviewDTO> list = dao.reviewList(map);
		
		// jsp로 결과 전달
		req.setAttribute("list", list);
		req.setAttribute("paging", paging);
		req.setAttribute("reviewCnt", reviewCnt);
		
		
	}

	// 댓글 삭제 / 관리자 댓글 숨기기
	@Override
	public void reviewDelete(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - reviewDelete");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		int review_No = Integer.parseInt(req.getParameter("review_No"));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5단계. 게시글 삭제 처리 후 컨트롤러에서 list로 이동
		dao.reviewDelete(review_No);
	}

	// 관리자 게시글 목록
	@Override
	public void admin_boardList(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - admin_boardList");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		String pageNum = req.getParameter("pageNum");
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5-1단계. 전체 게시글 갯수 카운트
		Paging paging = new Paging(pageNum);
		int total = dao.boardTotalCnt();
		System.out.println("total : " + total);
		
		paging.setTotalCount(total);
		
		// 5-2단계. 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<BoardDTO> list = dao.admin_boardList(map);
		
		// 6단계. jsp로 처리결과를 전달
		req.setAttribute("paging", paging);
		req.setAttribute("list", list);
		
		
	}

	// 관리자 게시글 숨기기
	@Override
	public void boardHide(HttpServletRequest req, Model model) throws ServletException, IOException {
		System.out.println("서비스 - boardHide");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		int boardNo = Integer.parseInt(req.getParameter("board_No"));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5단계. 게시글 삭제(숨기기) 처리 
		dao.boardDelete(boardNo);
		
	}

	// 관리자 게시글 보이기
	@Override
	public void boardView(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - boardView");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		int boardNo = Integer.parseInt(req.getParameter("board_No"));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5단계. 게시글 삭제(숨기기) 처리 
		dao.boardView(boardNo);
		
	}
	
	// 관리자 게시글 삭제
	@Override
	public void boardDelete_admin(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - boardDelete_admin");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		int boardNo = Integer.parseInt(req.getParameter("board_No"));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5단계. 게시글 삭제(숨기기) 처리 
		dao.boardDelete_admin(boardNo);
		
	}


	// 관리자 댓글 목록
	@Override
	public void reviewList_admin(HttpServletRequest req, Model model) {
		System.out.println("서비스 - reviewList_admin");
		
		// 화면으로부터 입력받은 값을 받는다.
		int board_No = Integer.parseInt(req.getParameter("board_No"));
		String pageNum = req.getParameter("pageNum");
		
		// DAO 객체 생성
		
		// 댓글 개수 조회, 페이지처리
		int reviewCnt = dao.reviewTotalCnt(board_No);
		Paging paging = new Paging(pageNum);
		
		paging.setTotalCount(reviewCnt);
		
		// 5-2단계. 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("board_No", board_No);
		
		// 댓글 목록 조회
		List<Board_reviewDTO> list = dao.reviewList_admin(map);
		
		// jsp로 결과 전달
		req.setAttribute("list", list);
		req.setAttribute("paging", paging);
		req.setAttribute("reviewCnt", reviewCnt);
	}
	
	// 관리자 댓글 보이기
	@Override
	public void reviewView(HttpServletRequest req, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - reviewView");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		int review_No = Integer.parseInt(req.getParameter("review_No"));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5단계. 게시글 삭제(숨기기) 처리 
		dao.reviewView_admin(review_No);
		
	}

	// 관리자 댓글 완전삭제
	@Override
	public void reviewDelete_admin(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - reviewHide");
		
		// 3단계. 화면에서 입력받은 값을 가져온다.
		int review_No = Integer.parseInt(req.getParameter("review_No"));
		
		// 4단계. 싱글톤방식으로 DAO 객체 생성, 다형성 적용
		
		// 5단계. 게시글 삭제(숨기기) 처리 
		dao.reviewDelete_admin(review_No);
		
		
	}



}
