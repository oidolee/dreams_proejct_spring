package pj.mvc.dreams_project2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pj.mvc.dreams_project2.service.GamesServiceImpl;

@Controller
public class GamesController {

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private GamesServiceImpl service;
	//경기일정 화면
	@RequestMapping("games.gc")
	public String gamesListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println(" gamesListAction start");
		service.gamesListAction(req, model);
		return "page_3/games";
	}
	//관리자 초기화면
	@RequestMapping("admin.gc")
	public String admin(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println(" admin start");
		return "admin/index";
	}
	//게임일정 등록 화면
	@RequestMapping("gamesInsert.gc")
	public String gamesInsert(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println(" gamesInsert start");
		service.teamListAction(req, model);
		return "admin/games/games";
	}
	//게임일정 등록 실행		
	@RequestMapping("gamesInsertAction.gc")
	public String gamesInsertAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println(" gamesInsertAction start");
		service.gamesInsertAction(req, model);
		return "admin/games/gamesInsertAction";
	}
	
	//게임일정 업데이트 화면
	@RequestMapping("update.gc")
	public String update(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println(" update start");
		service.getDetail(req, model);
		service.teamListAction(req, model);
		return "admin/games/update";
	}
	
	//게임일정 업데이트 화면
	@RequestMapping("updateAction.gc")
	public String updateAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println(" updateAction start");
		service.gamesUpdateAction(req, model);
		return "admin/games/gamesUpdateAction";
	}
	
	
	
}
