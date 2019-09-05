package request;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ������ ���� �������� ȣ���ϰ�
 * ���� �������� �Էµ� ������ ó���ϴ� ���� Ŭ����
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 1. ������ ���ҽ��� ��û�� ó���ϴ� �޼ҵ�
	 * 2. �������� GET ��û���� register �ּҰ� �ԷµǾ��� ��
	 * 	  ���� ���� �ִ� HTML �������� �������� ������
	 */
	protected void doGet(HttpServletRequest req
					   , HttpServletResponse res) 
							   throws ServletException, IOException {
		// ��û��ü�� ���� �ѱ�ó��
		req.setCharacterEncoding("UTF-8");

		// (2) �����ѱ�ó��
		res.setContentType("text/html;charset=UTF-8");
		res.setCharacterEncoding("utf-8");
		
		// 03_registerForm.html �� ��û�� ���� ���� �ܿ��
		RequestDispatcher reqd = 
				req.getRequestDispatcher("03_registerForm.html");
		
		reqd.forward(req, res);
		
	}

	/**
	 * 1. ������ ���۵� ���� ó���ϴ� �޼ҵ�
	 * ���� ���� POST ��û�� �߻��� ���
	 * ���� ��û �Ķ���Ϳ� �Էµ� ������ �����Ͽ� ó��
	 */
	protected void doPost(HttpServletRequest req
						, HttpServletResponse res) 
								throws ServletException, IOException {
		// ��û��ü�� ���� �ѱ�ó��
		req.setCharacterEncoding("UTF-8");

		// (2) �����ѱ�ó��
		res.setContentType("text/html;charset=UTF-8");
		res.setCharacterEncoding("utf-8");
		
		// 1. ��û �Ķ���� ����
		String userId = req.getParameter("userId");
		String userName = req.getParameter("userName");
		String userPass = req.getParameter("userPass");
		String passConfirm = req.getParameter("passConfirm");
		String gender = req.getParameter("gender");
		int age = Integer.parseInt(req.getParameter("age"));
		String[] hobbies = req.getParameterValues("hobby");
		String emailId = req.getParameter("emailId");
		String emailDomain = req.getParameter("emailDomain");
		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		String phone3 = req.getParameter("phone3");
		String address = req.getParameter("address");
		String intro = req.getParameter("intro");
		
		// (2) ����� ��û �Ķ���� ȭ�鿡 ���
		PrintWriter out = res.getWriter();
		
		out.println("<html>");
			out.println("<head>");
				out.println("<title> ���� �� ��û ó�� </title>");
			out.println("</head>");
			out.println("<body>");
			
				out.println("<h3>���� ��û ����</h3>");
				out.println("<hr />");
				
				out.println("userId=" + userId + "<br />");
				out.println("userPass=" + userPass + "<br />");
				out.println("passConfirm=" + passConfirm+ "<br />");
				out.println("gender=" + gender + "<br />");
				out.println("age=" + age + "<br />");
			
				out.println("hobby=");
				if (hobbies != null) {
					for (String hobby: hobbies) {
						out.println(hobby + ", ");
					}
					out.println("<br />");
				} else {		
					out.println("���õ� ��̰� �����ϴ�. <br />");
				}
				
				out.println("email=" + emailId + "@" + emailDomain + "<br />");
				out.printf("phone=%s-%s-%s<br />", phone1, phone2, phone3);
				out.println("address=" + address + "<br />");
				out.println("intro=" + intro + "<br />");
			out.println("</body>");
		out.println("</html>");
	}

}
