package next;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 이 서블릿은 세 개의 서블릿에서 요청 객체가 전달되며 
 * 이동되는 페이지를 서비스하는 서블릿이다.
 * ------------------------------------------------------
 * MyForwardServlet : forward 방식으로 이 서블릿으로 이동
 * MyIncludeServlet : include 방식으로 이 서블릿으로 이동
 * MySendRedirectServlet : sendRedirect 방식으로 이 서블릿으로 이동
 * ------------------------------------------------------
 * 각각의 이동 방식에 따라 이 결과 페이지에서 결과가 달라지는 모습을 확인하여
 * 세 가지 페이지 이동방식의 차이를 알아보자
 * 
 */
@WebServlet("/next")
public class MyNextServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 세 개의 출발 서블릿 클래스들에서
	 * request 에 추가한 name 이라는 이름의 속성이 전달되는지 여부를
	 * 확인하는 로직을 사용하여
	 * 
	 * 이 서비스 메소드에 전달된 request, response 객체가
	 * 최초의 것이 그대로 전달되고 있는지 확인한다.
	 */
	protected void service(HttpServletRequest request
			            , HttpServletResponse response) throws ServletException, IOException {

		// 1. 요청 객체 한글 처리
		request.setCharacterEncoding("utf-8");
		
		// 2. 응답 객체 한글 처리
		response.setContentType("text/html; charset=utf-8"); 
		
		// 3. name 속성 추출
		String name = (String) request.getAttribute("name");
		
		// 속성명 : semester, 학기 숫자
        // 속성명 : major, 전공명
		
		// 4. 화면 출력
		PrintWriter out = response.getWriter();
		
		out.println("<h3>이전 페이지에서 등록한 name 값</h3>");
		out.println(name  + "<br />");
		// 추출된 속성 두 가지 추가 출력
		
		out.close();
	
	}

}
