package param.post;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * HTML ���� �߻��ϴ� POST ��û�� �� ��û�� ���޵� ��û �Ķ���͸� ó���ϴ� ����
 */
@WebServlet("/beverage")
public class BeverageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * 02_beverage.html ���� �Էµ� ���� �ֹ� ��� checkbox �� �߻��� ��û �Ķ���͸� ó���Ѵ�.
	 */
	protected void doPost(HttpServletRequest req
						, HttpServletResponse res) 
								throws ServletException, IOException {
		// 1. �ѱ�ó��
		// (1) ��û�ѱ�ó��
		req.setCharacterEncoding("utf-8");

		// (2) �����ѱ�ó��
		res.setContentType("text/html; charset=utf-8");

		// 2. <form> ���� �Ѿ�� checkbox �Ķ���� ����
		// (1) form �� ����� name �� ������ ��쿡�� �Ϲ������� 1���� String ������ �޴´�.
		// (2) checkbox �� �ϳ��� name ���� �������� ���� ���޵Ǳ� ������
		// String[]�� �޾����ٴ� ���� �����ؾ� ��.
		// (3) checkbox �� �ʼ� ������ �ƴ� ��� ���Ǵ� form ��Ҹ��Ƿ�
		// �ƹ��� ������ ���� �ʰ� ���޵Ǵ� ��쵵 ���޵ȴ�.
		// checkbox �� name Ű�� ����Ǵ� String[] �� �������� �ʾƼ�
		// null ���� ������ ��.
		String[] beverages = req.getParameterValues("beverage");

		// 3. ����� ������ ���� => ���
		// (1) System.out ���
		System.out.println("== �ֹ��� ���� ==");

		if (beverages != null) {
			for (String beverage : beverages) {
				System.out.println(beverage);
			}
		} else {
			System.out.println("�ֹ��� ���ᰡ �����ϴ�.");
		}
		
		// (2) ������ ���
		PrintWriter out = res.getWriter();
		out.println("<html>");
			out.println("<head>");
				out.println("<title> ���� �ֹ� ��� </title>");
			out.println("</head>");
			out.println("<body>");
				
				out.println("<h3>���� �ֹ� ���</h3>");
				out.println("<hr />");
			
				if (beverages != null) {
					for (String beverage : beverages) {
						out.println(beverage + "<br />");
					}
				} else {
					out.println("�ֹ��� ���ᰡ �����ϴ�.");
				}
			out.println("</body>");
		out.println("</html>");
	}

}














