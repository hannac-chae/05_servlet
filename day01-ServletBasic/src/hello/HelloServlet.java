package hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 간단한 환영인사인
 * Hello, Servlet 문장을 출력하는 서블릿 클래스
 */
@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 서블릿 클래스가 호출되었을 때,
	 * 실제로 응답하는 메소드  
	 */
	@Override
	protected void service(HttpServletRequest request
			             , HttpServletResponse response) 
			            		 throws ServletException, IOException {
		
		// 서블릿의 구조는
		// 자바코드 안에 HTML 이 들어가는 형태
		response.setContentType("text/html;charset=utf-8");
		
		// 화면(브라우저)에 HTML 코드를 출력하기 위해서
		// 출력객체(out)를 응답객체(response)로 부터 얻어냄.
		PrintWriter out = response.getWriter();
		
		// System.out.println() 과 유사하게 출력하기 위해서 
		// out 을 PrintWriter 타입으로 얻어냄
		out.println("<html>");
			out.println("<head><title>Hello 서블릿</title></head>");
			out.println("<body>");
				out.println("<h2>안녕하세요, Servlet!</h2>");
			out.println("</body>");
		out.println("</html>");
		
		out.close();
	}

}



