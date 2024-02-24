package pj.mvc.dreams_project2.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


//import spring.mvc.security_pj_itc02.dto.UserVO;

public class UserLoginSuccessHandler implements AuthenticationSuccessHandler{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// security-context.xml에서 매개변수 생성자 호출시 sqlSession의 주소값을 매개변수로 전달
	public UserLoginSuccessHandler(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 로그인이 성공할 경우 자동으로 실행하는 메서드
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("<<< UserLoginSuccessHandler - onAuthenticationSuccess() 진입 >>>");
		
		UserVO vo = (UserVO)authentication.getPrincipal();
		System.out.println("UserVO : " + vo.getAuthorities());
		
		String msg = authentication.getName() + " 님 환영합니다.";
		String authority = sqlSession.selectOne("spring.mvc.security_pj_itc02.dao.CustomerDAO.authorityCheck",authentication.getName());
		
		request.setAttribute("msg", msg);
		request.getSession().setAttribute("sessionID", authentication.getName());
		request.setAttribute("authority", authority);

		int grade = 0;
		String viewPage = "";
		
		if(authority.equals("ROLE_USER")) {
			grade = 1;
			viewPage = "/main.do";
		}
		else {
			grade = 0;
			viewPage = "/board_list.bc";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
		
		
		
	}
	
}
