package include;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 서블릿 페이지 이동 방식 중
 * include 방식을 사용하여 페이지 이동을 테스트하는 서블릿
 * ------------------------------------------
 * include 방식으로 페이지를 이동하면
 * 이 서블릿의 서비를 요청한 최초의 request, response 객체가 
 * 유지되며 이동한다
 * ------------------------------------------
 * 
 */
@WebServlet("/include")
public class MyIncludeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 *  /include 라는 주소로 이 서비스가 요청되었을 때
	 *  -------------------------------------
	 *  1. include 방식으로 페이지가 이동되면
	 *     request, response 가 유지되면서
	 *     페이지 이동된 서블릿의 실행 결과를
	 *     이 서블릿이 받아서 응답하는 내용을 확인하는 로직 테스트
	 *     
	 *  2. request 객체가 유지됨을 확인하기 위하여
	 *     요청 객체(request)에 속성을 추가
	 *     
	 *  3. 이렇게 속성이 추가된 요청 객체(request)를 
	 *     include 방식으로 다음 서블릿(next)로 전달
	 *     
	 *  4. next 로 요청된 서블릿의 실행 결과를 이 서블릿이 받아서
	 *     응답이 일어나는 결과를 확인
	 *  
	 */
	protected void service(HttpServletRequest request
			           , HttpServletResponse response) 
			         throws ServletException, IOException {
		
		// 0. 응답 객체에 한글 설정
		//    include 방식은 첫 서블릿이 응답을 담당
		//    따라서 응답을 담당하는 서블릿에서 
		//    응답문서의 타입이나 한글 설정이 되지 않으면
		//    HTML 문서의 해석이나 한글 같은 문자가 처리되지 못함.
		response.setContentType("text/html; charset=utf-8");
		
		// 2. request 객체에 name 이라는 이름의 속성 추가
		request.setAttribute("name", "채한나");
		
		// 3. include 방식도 request 가 전달되어야 하므로
		//    요청을 전달할 수 있는 RequestDispatcher 객체를 얻어냄
		RequestDispatcher reqd =
				request.getRequestDispatcher("next");
		
		// 얻어진 reqd 객체에 include 방식으로 request, response
		// 객체를 전달
		reqd.include(request, response);
	
	}

}
