package pj.mvc.dreams_project2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pj.mvc.dreams_project2.service.BoardServiceImpl;
import pj.mvc.dreams_project2.controller.BoardController;

/* 작업자 : 강승재 */
@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardServiceImpl service;

	String viewPage = "";
		
		
	// 드림즈게시판
	@RequestMapping("dreamsBoard.bc")
	public String board_list(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /dreamsBoard.bc >>>");
		
		//HttpSession session = req.getSession();
		//session.setAttribute("sessionID", "아이디");
		
		service.boardListAction(req, model);
		
		return "page_4/dreamsBoard";
	}
		
	// 상세페이지
	@RequestMapping("dreamsBoardDetail.bc")
	public String board_detailAction(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /dreamsBoardDetail.bc >>>");
		
		service.boardDetailAction(req, model);
		return "page_4/dreamsBoardDetail";
	}
		
		
	// 드림즈게시판 글쓰기페이지
	@RequestMapping("dreamsBoardWrite.bc")
	public String board_write(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /dreamsBoardWrite.bc >>>");
		
		return "page_4/dreamsBoardWrite";
	}
	
	// 드림즈게시판 글쓰기 처리
	@RequestMapping("dreamsBoardAction.bc")
	public String board_writeAction(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /dreamsBoardAction.bc >>>");
		
		service.boardWrite(req, model);
		viewPage = req.getContextPath() + "/dreamsBoard.bc";
		res.sendRedirect(viewPage);
		return null;
	}
	
	
	// 드림즈게시판 게시글 수정페이지
	@RequestMapping("dreamsBoardEdit.bc")
	public String board_edit(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /dreamsBoardEdit.bc >>>");
		
		service.boardDetailAction(req, model);
		return "page_4/dreamsBoardEdit";
	}
		
	// 드림즈게시판 게시글 수정처리
	@RequestMapping("dreamsBoardEditAction.bc")
	public String board_editAction(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /dreamsBoardEditAction.bc >>>");
		
		service.boardEdit(req, model);
		
		int board_No = Integer.parseInt(req.getParameter("board_No"));
		viewPage = req.getContextPath() + "/dreamsBoardDetail.bc?board_No="+board_No;
		res.sendRedirect(viewPage);
		return null;
	}
	
	// 드림즈게시판 게시글 삭제처리
	@RequestMapping("dreamsBoardDelete.bc")
	public String board_delete(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /dreamsBoardDelete.bc >>>");
		
		service.boardDelete(req, model);
		viewPage = req.getContextPath() + "/dreamsBoard.bc";
		res.sendRedirect(viewPage);
		return null;
	}	
		
	// 드림즈게시판 검색페이지
	@RequestMapping("dreamsBoardSearch.bc")
	public String board_search(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /dreamsBoardSearch.bc >>>");
		
		service.boardSearch(req, model);
		return "page_4/dreamsBoardSearch";
	}
		
	// 드림즈게시판 댓글 작성처리
	@RequestMapping("dreamsBoardReview_add.bc")
	public String comment_insert(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /dreamsBoardReview_add.bc >>>");
		
		service.reviewAdd(req, model);
		return null;
	}
	
	
	// 드림즈게시판 댓글 목록
	@RequestMapping("dreamsBoardReview.bc")
	public String comment_list(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /dreamsBoardReview.bc >>>");
		
		service.reviewList(req, model);
		return "page_4/dreamsBoardReview";
	}
	
	// 드림즈게시판 댓글 삭제처리
	@RequestMapping("dreamsBoardReview_delete.bc")
	public String comment_delete(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /dreamsBoardReview_delete.bc >>>");
		
		int board_No = Integer.parseInt(req.getParameter("board_No"));
		service.reviewDelete(req, model);
		viewPage = req.getContextPath() + "/dreamsBoardDetail.bc?board_No="+board_No;
		res.sendRedirect(viewPage);
		return null;
	}
		
	// 관리자 페이지 진입 및 게시판 목록 조회
	@RequestMapping("admin_board.bc")
	public String admin_board(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /admin_board.bc >>>");
		
		service.admin_boardList(req, model);
		return "admin/board/board";
	}
		
	// 관리자 게시글 숨기기
	@RequestMapping("admin_board_hide.bc")
	public String admin_board_hide(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /admin_board_hide.bc >>>");
		
		service.boardHide(req, model);
		
		int pageNum;
		if(req.getParameter("pageNum") == "") {
			pageNum = 1;
		}
		else {
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		
		viewPage = req.getContextPath() + "/admin_board.bc?pageNum=" + pageNum;
		res.sendRedirect(viewPage);
		return null;
	}
	
	// 관리자 게시글 보이기
	@RequestMapping("admin_board_view.bc")
	public String admin_board_view(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /admin_board_view.bc >>>");
		
		service.boardView(req, model);
		
		int pageNum;
		if(req.getParameter("pageNum") == "") {
			pageNum = 1;
		}
		else {
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		viewPage = req.getContextPath() + "/admin_board.bc?pageNum=" + pageNum;
		res.sendRedirect(viewPage);
		return null;
	}
	
	// 관리자 게시글 완전삭제
	@RequestMapping("admin_board_delete.bc")
	public String admin_board_delete(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /admin_board_delete.bc >>>");
		
		service.boardDelete_admin(req, model);
		
		int pageNum;
		if(req.getParameter("pageNum") == "") {
			pageNum = 1;
		}
		else {
			pageNum = Integer.parseInt(req.getParameter("pageNum"));
		}
		viewPage = req.getContextPath() + "/admin_board.bc?pageNum=" + pageNum;
		res.sendRedirect(viewPage);
		return null;
	}
	
	// 관리자 상세페이지
	@RequestMapping("boardDetail.bc")
	public String admin_boardDetail(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /boardDetail.bc >>>");
		
		service.boardDetailAction(req, model);
		return "admin/board/boardDetail";
	}
	
	
	// 관리자 댓글 목록
	@RequestMapping("boardReview.bc")
	public String admin_boardReview(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /boardReview.bc >>>");
		
		service.reviewList_admin(req, model);
		return "admin/board/boardReview";
	}
	
	// 관리자 댓글 보이기
	@RequestMapping("admin_review_view.bc")
	public String admin_review_view(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /admin_review_view.bc >>>");
		
		int board_No = Integer.parseInt(req.getParameter("board_No"));
		service.reviewView(req, model);
		viewPage = req.getContextPath() + "/boardDetail.bc?board_No="+board_No;
		res.sendRedirect(viewPage);
		return null;
	}
	
	
	// 관리자 댓글 숨기기
	@RequestMapping("admin_review_hide.bc")
	public String admin_review_hide(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /admin_review_hide.bc >>>");
		
		int board_No = Integer.parseInt(req.getParameter("board_No"));
		service.reviewDelete(req, model);
		viewPage = req.getContextPath() + "/boardDetail.bc?board_No="+board_No;
		res.sendRedirect(viewPage);
		return null;
	}
	
	// 관리자 댓글 완전삭제
	@RequestMapping("admin_review_delete.bc")
	public String admin_review_delete(HttpServletRequest req, HttpServletResponse res, Model model) throws ServletException, IOException{
		logger.info("<<< url ==> /admin_review_delete.bc >>>");
		
		int board_No = Integer.parseInt(req.getParameter("board_No"));
		service.reviewDelete_admin(req, model);
		viewPage = req.getContextPath() + "/boardDetail.bc?board_No="+board_No;
		res.sendRedirect(viewPage);
		return null;
	}
	
		
		
}
