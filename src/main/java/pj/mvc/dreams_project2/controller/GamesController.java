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
	
	@RequestMapping("games.gc")
	public String gamesListAction(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println(" gamesListAction start");
		service.gamesListAction(req, model);
		return "page_3/games";
	}
	
	@RequestMapping("admin.gc")
	public String admin(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println(" admin start");
		return "admin/index";
	}
	
	@RequestMapping("gamesInsert.gc")
	public String gamesInsert(HttpServletRequest req, Model model) 
			throws ServletException, IOException {
		System.out.println(" gamesInsert start");
		return "admin/games/games";
	}
	
}
