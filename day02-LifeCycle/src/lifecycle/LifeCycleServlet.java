package lifecycle;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 서블릿의 생애주기(LifeCycle)를 관장하는 세 개의 메소드
 * init(), service(), destroy() 를 사용해보는 
 * 서블릿 클래스
 */
@WebServlet("/lifecycle")
public class LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// init(), service() 메소드의 작동 확인을 위해 
	// 작동 횟수를 저장할 멤버 변수
	private int count;
	
	/**
	 * 이 서블릿이 최초로 호출되었을 때
	 * 웹 컨테이너(톰캣)에 의해 단 한번 호출되며
	 * 서블릿의 초기화를 담당하는 메소드
	 */
	public void init(ServletConfig config) 
			         throws ServletException {
		 count = 0;
		 System.out.println("init() 메소드가 실행되었습니다.");
	}

	/**
	 * 이 서블릿이 서비스로부터 해제될 때(unload)될 때
	 * (서버가 종료될 때)
	 * 웹 컨테이너(톰캣)에 의해 단 한번 호출되며
	 * 서블릿 서비스를 종료하는 메소드
	 */
	public void destroy() {
		System.out.println("destroy() 메소드가 실행되었습니다.");
	}

	/**
	 * 클라이언트의 요청(request)를 직접 처리하는 라이프 사이클 메소드
	 * 각 요청에 대해서 응답(response)를 처리한다.
	 * 이 메소드의 입력 파라미터인 request, response 객체는
	 * 웹 컨테이너(톰캣)이 직접 생성하여 넘겨주는 방식으로 작동
	 */
	protected void service(HttpServletRequest request
			             , HttpServletResponse response) 
			           throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		// 화면(브라우저)에 HTML 코드를 출력하기 위해서
		// 출력객체(out)를 응답객체(response)로 부터 얻어냄.
		PrintWriter out = response.getWriter();
		
		// System.out.println() 과 유사하게 출력하기 위해서 
		// out 을 PrintWriter 타입으로 얻어냄
		out.println("<html>");
			out.println("<head><title>Hello 서블릿</title></head>");
			out.println("<body>");
				out.println("<h2>안녕하세요, Servlet!" + ++count + "</h2>");
			out.println("</body>");
		out.println("</html>");
		
		out.close();
		// 여기까지 브라우저에 출력
		
		// 여기는 서버 콘솔창 출력
		System.out.println("service() 메소드가 실행되었습니다.");
		System.out.println("service 메소드 실행 횟수 " + count);
		
	}

}
