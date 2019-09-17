package cookie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *  /WEB-INF/views/cookie/login.jsp 
 *  로그인 창이 있는 화면에서 전송된 로그인 정보를 사용하여 
 *  -------------------------------------------------
 *  1. 가상의 로그인 성공처리를 한 뒤
 *  2. 로그인 성공 정보를 Cookie 로 생성
 *  3. 응답 객체에 쿠키 정보를 추가 후
 *  4. 로그인 성공 페이지로 이동
 *     /WEB-INF/views/cookie/success.jsp
 *  -------------------------------------------------
 *  위의 1 ~ 4를 진행하며 세션 쿠키를 테스트하는 서블릿 클래스
 */
@WebServlet({"/cookie", "/cookie/login"})
public class CookieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 *  /cookie, /cookie/login 이라는 요청 주소가 브라우저에 입력되면
	 *  GET 요청이 발생하는 것이므로 이 메소드가 응답하게 된다.
	 *  
	 *  로그인 창이 제공되는 화면의 jsp 페이지로 이동시킨다.
	 *  이 때, forward 방식으로 해당 페이지로 요청 객체를 전달한다.
	 */
	protected void doGet(HttpServletRequest request
			          , HttpServletResponse response) 
			          throws ServletException, IOException {

		// 1. 이동할 뷰 결정 
		// (web.xml 에 등록된 쿠키 로그인 jsp 의 url 매핑 주소) 
		String view = "/views/cookie/login";
		
		// 2. forward 로 페이지 이동
		RequestDispatcher reqd = 
				request.getRequestDispatcher(view);
		
		reqd.forward(request, response);
		
	}

	/**
	 * 
	 */
	protected void doPost(HttpServletRequest request
			           , HttpServletResponse response) 
			         throws ServletException, IOException {
		// 로그인 처리 로직
	}

}
