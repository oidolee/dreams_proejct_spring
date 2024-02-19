package pj.mvc.dreams_project2.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* 작업자 : 강승재 */

public interface BoardService {
	
	// 게시글 목록
	public void boardListAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 게시글 상세
	public void boardDetailAction(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;

	// 게시글 추가
	public void boardWrite(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;

	// 게시글 수정
	public void boardEdit(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;

	// 게시글 삭제
	public void boardDelete(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 게시글 조회
	public void boardSearch(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;

	// 댓글 추가
	public void reviewAdd(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;

	// 댓글 목록
	public void reviewList(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;

	// 댓글 삭제	/ 관리자 댓글 숨기기
	public void reviewDelete(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;

	// 관리자 게시판 목록
	public void admin_boardList(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;

	// 관리자 게시글 숨기기
	public void boardHide(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;

	// 관리자 게시글 보이기
	public void boardView(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;

	// 관리자 게시글 완전삭제
	public void boardDelete_admin(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 관리자 댓글 목록
	public void reviewList_admin(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;
	
	// 관리자 댓글 보이기
	public void reviewView(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;

	// 관리자 댓글 완전삭제
	public void reviewDelete_admin(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException;

	
	
}
