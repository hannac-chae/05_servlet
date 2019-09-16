package forward;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 서블릿 페이지 이동 방식 중
 * forward 방식을 사용하여 페이지 이동을 테스트하는 서블릿
 * --------------------------------------------
 * forward 방식으로 페이지를 이동시키면
 * 이 서블릿의 서비스를 요청한 최초의 request, response 객체가
 * 유지되며 이동한다.
 * --------------------------------------------
 */
@WebServlet("/forward")
public class MyForwardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 *  /forward 라는 요청 주소로 이 서블릿의 서비스가 요청되었을 때
	 *  -------------------------------------------
	 *  1. forward 방식으로 페이지가 이동되면
	 *     request, response 객체가 유지되는 것을 확인하기 위한 
	 *     로직을 처리.
	 *  
	 *  2. request 객체가 유지됨을 확인학 위해서
	 *     요청 객체에 속성(attribute)를 추가
	 *     
	 *  3. 이렇게 속성이 추가된 request 객체를 forward방식으로
	 *     다른 페이지로 전달하면 forward 방식의 페이지 이동이 발생
	 *     
	 *  4. 여기서 전달된 request 객체를 받은 다음 서블릿 / JSP 에서는
	 *     요청객체가 동일하게 전달되었으므로 2에서 추가된
	 *     속성이 유지되는 것을 확인할 수 있다.
	 *  
	 */
	protected void service(HttpServletRequest request
			             , HttpServletResponse response) 
			         throws ServletException, IOException {
		
		// 2. 서블릿 진입시 request 객체에 속성을 추가
		request.setAttribute("name", "채한나");
		
		// 속성명 : semester, 학기 숫자
		// 속성명 : major, 전공명
		
		// 3. forward 방식으로 이 요청 객체를 받을
		//    다음 페이지를 얻어냄, 이 때 다음페이지는 next 라는 요청주소를 가질
		//    서블릿이 된다.
		//    요청을 전달해야 하므로 요청 전달 기능을 가지고 있는
		//    RequestDispatcher 객체를 얻어냄
		RequestDispatcher reqd =
				request.getRequestDispatcher("next");
	
		// 4. 얻어진 reqd 객체를 사용하여 forward 방식으로
		//    요청 객체(request), 응답 객체(response)를 전달
		reqd.forward(request, response);
	}

}
