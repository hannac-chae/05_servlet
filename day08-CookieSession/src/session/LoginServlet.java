package session;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *  /WEB-INF/views/session/login.jsp 에서 넘어온
 *  로그인 요청 파라미터(userId, password)를 처리하여
 *  로그인 성공을 가정하고
 *  HttpSession을 사용하여 다음 페이지로 이동 처리하는 서블릿 클래스
 */
@WebServlet("/session/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 *	세션 로그인 화면인 views/session/login.jsp 페이지로 이동 
	 */
	protected void doGet(HttpServletRequest request
			          , HttpServletResponse response) 
			         throws ServletException, IOException {
		// 1. 뷰 설정(web.xml 에 등록된 주소)
		String view = "/session/views/login";
		
		// 2. 페이지 이동 (forward)
		request.getRequestDispatcher(view)
		       .forward(request, response);
	}

	/**
	 * views/session/login.jsp 페이지에서 전달된
	 * 1. 로그인 요청 파라미터를 추출하여
	 * 2. 로그인 성공 가정
	 * 3. HttpSession 을 사용하여 로그인 유지 처리
	 * 4. 로그인 성공 페이지로 이동 : forward 사용
	 *  
	 */
	protected void doPost(HttpServletRequest request
			           , HttpServletResponse response) 
			        throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 1. 로그인 요청 파라미터 추출
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		// 2. 로그인 성공 가정
		if ("java".equals(userId) &&
			"jsp".equals(password)) {
			
			// 3. HttpSession 사용하여 로그인 유지 처리
			HttpSession session;
			
			// (1) 세션 객체는 요청으로부터 추출
			// 현재의 요청(request)에 연결된 세션을 얻어낸다.
			session = request.getSession();
			
			/* ----------------------------------
			 * 세션 객체를 요청으로부터 얻어낼 때 주의할 점
			 * 1. getSession() 메소드를 사용하여 얻어낸다.
			 * 2. getSession() 메소드 파라미터로 
			 *    어떤 값을 넘기느냐에 따라 얻어지는 세션객체의
			 *    특징이 달라진다.
			 * 3. 입력 파라미터의 종류 : true, false, 생략
			 * 
			 * (1) getSession(true); getSession()
			 *   ==> 현재의 요청(request)과 연결된 세션이 이미 있으면
			 *       존재하는 그 세션을 리턴함, 없으면 새로 생성 후 리턴
			 *   ==> 신규 로그인 처리 시도에 사용함
			 *    
			 * (2) getSession(false);
			 *   ==> 현재의 요청(request)과 연결된 세션이 이미 있으면
			 *       존재하는 그 세션을 리턴함, 없으면 null 리턴함
			 *       없어도 새로 생성하지 않음
			 *   ==> 로그 아웃 처리에 사용함
			 * 
			 * ----------------------------------
			 */
			
			// 얻어진 세션에 사용자 아이디를 속성으로 추가함
			session.setAttribute("userId", userId);
			
			// 4. 로그인 성공 페이지로 이동
			String view = "/session/views/success";
			
			request.getRequestDispatcher(view)
			       .forward(request, response);
			
		} else {
			// 아이디, 비번이 java, jsp 로 들어오지 않은 로그인 실패
			// fail.jsp 페이지로 이동 : sendRedirect로 이동
			ServletContext context = getServletContext();
			String view = context.getContextPath() 
					    + "/session/views/fail";
			
			response.sendRedirect(view);
		}
	}

}
