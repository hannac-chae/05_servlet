package param.get;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ��ġ �α����� ó���Ǵ� �� ����
 * HTML �� <form> ���� ������ GET request��
 * ó���ϴ� ����
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * HTML ���� GET ���� ���۵�
	 * form �Ķ���͸� �����Ͽ� �α����� �� �� ó�� ó���Ѵ�.
	 */
	protected void doGet(HttpServletRequest req
					   , HttpServletResponse res) 
							   throws ServletException, IOException {
		// 1. �ѱۼ���
		// (1) ��û ��ü�� ��û �Ķ���ͷ� �ѱ��� �Էµ� �� �����Ƿ� �Է°��� ���� �ѱ�ó��
		req.setCharacterEncoding("utf-8");
		
		// (2) ����� �ѱ�ó���� �Ǿ�� �ϹǷ� ���� ��ü�� �ѱ� ó��
		res.setContentType("text/html; charset=utf-8");
		
		// 2. ��û��ü(req)�� ���� ��û �Ķ���� ����
		// req�� HTML�� <form> ���� �߻��� ��(�Ķ����)�� ���޵� ���
		// ��û�ּ�?Ű=��&Ű=��...
		// (1) �������� ��û �Ķ���ʹ� �׻� Stirng ���� ���޵�
		// (2) req ��ü�� getParameter() �޼ҵ带 ����Ͽ� �����Ѵ�.
		String userId = req.getParameter("userId");
		String password = req.getParameter("password");
		int semester = Integer.parseInt(req.getParameter("semester"));
		
		// 3. ����� �Ķ���ͷ� ����
		// ==> ����� �Է°��� ���
		// (1) sysout ���
		System.out.println("== ȭ�鿡�� ���޵� �α��� ������ ==");
		System.out.println("userId=" + userId);
		System.out.println("password=" + password);
		System.out.println("semester=" + semester);
		
		// (2) ������ ���
		PrintWriter out = res.getWriter();
		out.println("<html>");
			out.println("<head>");
				out.println("<title> �α��� ��� </title>");
			out.println("</head>");
			out.println("<body>");
				out.println("== ȭ�鿡�� ���޵� �α��� ������ ==<br/>");
				out.println("userId=" + userId + "<br/>");
				out.println("password=" + password + "<br/>");
				out.println("semester=" + semester + "<br/>");
			out.println("</body>");
		out.println("</html>");
		
		// 4. �ʿ�� ������ �����͸� �ٸ� �������� ���� / ���⼭ ���� ��� ó��(������ ��� ó�� ��)
	}

}











