package book;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * web.xml 과 @WebServlet 의 초기화 파라미터를 사용해보는 서블릿
 */
@WebServlet(urlPatterns = "/book"
          , initParams = {@WebInitParam(name = "company", value = "동서북스")
                         ,@WebInitParam(name = "ceo", value = "길동이")})
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String company;
	private String ceo;
	
	/**
	 * web.xml 과 
	 * @WebServlet 의 @WebInitParam 애노테이션으로 설정한
	 * 서블릿 초기화 파라미터가 담겨 전달되는 config 객체를 받아
	 * 이 서블릿의 초기화에 사용하는 서블릿 생애주기 메소드
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		this.company = config.getInitParameter("company");
		this.ceo = config.getInitParameter("ceo");		
	}

	/**
	 * 초기화 파라미터 읽은 내용을 사용하여 북 객체를 생성하고 출력 
	 */
	protected void doGet(HttpServletRequest req
			           , HttpServletResponse res) throws ServletException, IOException {
		// 1. 한글처리
		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		// 2. 초기화 파라미터 사용하여 Book 객체 생성
		Book book = new Book();
		book.setCompany(company);
		book.setAuthor(ceo);
		
		// 3. 생성된 북 객체 브라우저 출력
		PrintWriter out = res.getWriter();
		
		out.println("<html>");
			out.println("<head>");
				out.println("<title>책 정보</title>");
			out.println("</head>");
			out.println("<body>");
				out.println("<h2>책 정보</h2>");
				out.println("<hr>");
				out.println("<h3>" + book + "</h3>");
				
				out.println("<h2>출판사 정보</h2>");
				out.println("<hr>");
				out.println("<h3>" 
				           + getServletContext().getInitParameter("email") 
				           + "</h3>");
				
			out.println("</body>");
		out.println("</html>");
		
		out.close();
	}

	/**
	 * POST 요청이 들어올 시
	 * doGet() 메소드로 이동시킴
	 */
	protected void doPost(HttpServletRequest request
			            , HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

