package param.get;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 마치 로그인이 처리되는 것 같이
 * HTML 의 <form> 에서 생성된 GET request를
 * 처리하는 서블릿
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * HTML 에서 GET 으로 전송된
	 * form 파라미터를 추출하여 로그인이 된 것 처럼 처리한다.
	 */
	protected void doGet(HttpServletRequest req
					   , HttpServletResponse res) 
							   throws ServletException, IOException {
		// 1. 한글세팅
		// (1) 요청 객체에 요청 파라미터로 한글이 입력될 수 있으므로 입력값에 대한 한글처리
		req.setCharacterEncoding("utf-8");
		
		// (2) 응답시 한글처리가 되어야 하므로 응답 객체에 한글 처리
		res.setContentType("text/html; charset=utf-8");
		
		// 2. 요청객체(req)로 부터 요청 파라미터 추출
		// req로 HTML의 <form> 에서 발생한 값(파라미터)가 전달된 경우
		// 요청주소?키=값&키=값...
		// (1) 서블릿에서 요청 파라미터는 항상 Stirng 으로 전달됨
		// (2) req 객체에 getParameter() 메소드를 사용하여 추출한다.
		String userId = req.getParameter("userId");
		String password = req.getParameter("password");
		int semester = Integer.parseInt(req.getParameter("semester"));
		
		// 3. 추출된 파라미터로 가공
		// ==> 추출된 입력값을 출력
		// (1) sysout 출력
		System.out.println("== 화면에서 전달된 로그인 데이터 ==");
		System.out.println("userId=" + userId);
		System.out.println("password=" + password);
		System.out.println("semester=" + semester);
		
		// (2) 브라우저 출력
		PrintWriter out = res.getWriter();
		out.println("<html>");
			out.println("<head>");
				out.println("<title> 로그인 결과 </title>");
			out.println("</head>");
			out.println("<body>");
				out.println("== 화면에서 전달된 로그인 데이터 ==<br/>");
				out.println("userId=" + userId + "<br/>");
				out.println("password=" + password + "<br/>");
				out.println("semester=" + semester + "<br/>");
			out.println("</body>");
		out.println("</html>");
		
		// 4. 필요시 가공된 데이터를 다른 페이지로 전달 / 여기서 직접 결과 처리(브라우저 출력 처리 등)
	}

}











