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
 * 로그아웃 링크가 클릭되면 현재 세션을
 * 명시적으로 해제하여 로그아웃 처리하는 서블릿 클래스
 */
@WebServlet("/session/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * GET, POST 어떤 방식으로 요청되어도 동일하게 로그아웃 처리하기 위하여
	 * service() 메소드만 남겨서 처리하도록 한다.
	 * 
	 * 로그아웃 처리 프로세스
	 * 1. 이미 존재하는 세션을 얻어냄
	 *    존재하지 않는 경우 null 로 얻어내야 로그인 처리된 세션을 
	 *    정상적으로 얻을 수 있음에 주의
	 *    
	 * 2. 얻어진 세션에 명시적으로 해제하는 코드를 사용
	 * 
	 * 3. 로그 아웃 후 보여줄 페이지 이동
	 */
	protected void service(HttpServletRequest request
			             , HttpServletResponse response) throws ServletException, IOException {

		// 1. 존재하는 세션 얻어냄 : false 옵션으로 얻어내야 한다
		HttpSession session;
		session = request.getSession(false);
		/* ------------------------------------------
		 * 정상적인 로그아웃 처리를 위해서 얻어진 세션은
		 * 이전에 로그인에 사용된 세션이라는 보증이 필요함.
		 * 따라서 false 파라미터를 전달하며 얻어진 세션이어야 한다.
		 * ------------------------------------------
		 */
		
		// 2. 로그인 되었던 세션이 존재하면 명시적으로 해제
		if (session != null) {
			// 이 세션에 설정되어 있던 모든 속성을 삭제하면서
			// 세션 자체를 해제함
			session.invalidate();
		}
		
		// 3. 로그 아웃 후 보여줄 페이지 이동 : sendRedirect() 사용
		ServletContext context = getServletContext();
		String view = context.getContextPath()
				    + "/session/login";
		
		response.sendRedirect(view);
	
	}

}
