package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import service.UserService;

/**
 * Servlet implementation class CuipingServlet
 */
public class CuipingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CuipingServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tuserid = request.getParameter("index");
		String flag = request.getParameter("flag");
		System.out.println("targetuserid==" + flag + "tuserid==" + tuserid);
		User u = new User();
		u.setUserid(Integer.parseInt(tuserid));
		u.setFlag(Integer.parseInt(flag));

		UserService service = new UserService();
		int state = service.cuipingUp(u);
		if (state > 0)
			response.sendRedirect("admincuiping.jsp");
	}

}
