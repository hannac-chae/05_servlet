package http.method;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * HTTP GET / POST 요청을 나누어서 처리할 수 있는 서블릿 클래스
 */
@WebServlet("/getPost")
public class GetPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * HTTP GET 요청만 처리하는 클래스 
	 */
	protected void doGet(HttpServletRequest request
			           , HttpServletResponse response) 
			        		  throws ServletException, IOException {

		// 1. 응답에 대한 한글처리
		response.setContentType("text/html;charset=utf-8");
		
		// 2. 응답 내용처리 
		PrintWriter out = response.getWriter();
  		out.println("<h2>doGet 메소드가 응답하였습니다.</h2>");
  		
  		out.close();
		
	}

	/**
	 * HTTP POST 요청만 처리하는 클래스
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 응답에 대한 한글처리
		response.setContentType("text/html;charset=utf-8");
		
		// 2. 응답 내용처리 
		PrintWriter out = response.getWriter();
  		out.println("<h2>doPost 메소드가 응답하였습니다.</h2>");
  		
  		out.close();
	}

}
