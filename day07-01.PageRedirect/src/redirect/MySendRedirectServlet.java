package redirect;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 서블릿 페이지 이동 방식 중
 * sendRedirect 방식으로 이동하는 방법을 테스트하는 서블릿
 * ---------------------------------------------
 * sendRedirect 방식은
 * 이 서블릿의 서비스를 요청한 
 * 
 * 1. 최초의 request 에 대하여 response 를 일으키고
 * 2. 새로운 request 로 다음 서블릿을 요청하는 방식이다.
 * ----------------------------------------------
 * 따라서 최초의 request 에 설정했던 속성이(attribute)
 * 두번째 서블릿에는 전달될 수 없다. 유지되지 않는다.
 * 
 */
@WebServlet("/redirect")
public class MySendRedirectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 1. 이 페이지에서 추가한 속성이 유지되지 않는 지 확인을 위하여
	 *    속성을 추가하고, 두번째 서블릿으로 sendRedirect 방식으로 전달
	 * 
	 * 2. redirect 의 목적 페이지인 next 로 이동하기 전
	 *    현재 request 에 대해 response 가 일어나기 때문에
	 *    브라우저 주소창에 요청 주소가 새 주소로 변경된다.
	 * 
	 * 3. 새로운 요청으로 변경되어 다음 서블릿이 요청되므로 속성이 유지되지 
	 *    않음을 확인한다.
	 */
	protected void service(HttpServletRequest request
  			           , HttpServletResponse response) 
  			        throws ServletException, IOException {

		// 1. request 객체에 name 속성을 추가
		request.setAttribute("name", "채한나");
		
		// 2. sendRedirect 로 다음 서블릿을 요청
		response.sendRedirect("next");
	}

}
