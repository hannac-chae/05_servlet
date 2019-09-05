package param.post;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * HTML 에서 발생하는 POST 요청과 그 요청에 전달된 요청 파라미터를 처리하는 서블릿
 */
@WebServlet("/beverage")
public class BeverageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 02_beverage.html 에서 입력된 음료 주문 결과 checkbox 로 발생한 요청 파라미터를 처리한다.
	 */
	protected void doPost(HttpServletRequest req
						, HttpServletResponse res) 
								throws ServletException, IOException {
		// 1. 한글처리
		// (1) 요청한글처리
		req.setCharacterEncoding("utf-8");

		// (2) 응답한글처리
		res.setContentType("text/html; charset=utf-8");

		// 2. <form> 에서 넘어온 checkbox 파라미터 추출
		// (1) form 의 요소중 name 이 유일한 경우에는 일반적으로 1개의 String 변수로 받는다.
		// (2) checkbox 는 하나의 name 으로 여러개의 값이 전달되기 때문에
		// String[]로 받아진다는 점에 주의해야 함.
		// (3) checkbox 는 필수 선택이 아닌 경우 사용되는 form 요소리므로
		// 아무런 선택이 되지 않고 전달되는 경우도 전달된다.
		// checkbox 의 name 키로 추출되는 String[] 이 존재하지 않아서
		// null 값을 가지게 됨.
		String[] beverages = req.getParameterValues("beverage");

		// 3. 추출된 데이터 가공 => 출력
		// (1) System.out 출력
		System.out.println("== 주문된 음료 ==");

		if (beverages != null) {
			for (String beverage : beverages) {
				System.out.println(beverage);
			}
		} else {
			System.out.println("주문된 음료가 없습니다.");
		}
		
		// (2) 브라우저 출력
		PrintWriter out = res.getWriter();
		out.println("<html>");
			out.println("<head>");
				out.println("<title> 음료 주문 결과 </title>");
			out.println("</head>");
			out.println("<body>");
				
				out.println("<h3>음료 주문 결과</h3>");
				out.println("<hr />");
			
				if (beverages != null) {
					for (String beverage : beverages) {
						out.println(beverage + "<br />");
					}
				} else {
					out.println("주문된 음료가 없습니다.");
				}
			out.println("</body>");
		out.println("</html>");
	}

}














