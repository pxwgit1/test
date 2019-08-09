package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import service.UserService;

/**
 * Servlet implementation class XianXCuipingServlet
 */
public class XianXCuipingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XianXCuipingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tuserid = request.getParameter("index");
		String flag = request.getParameter("flag");
		System.out.println("targetuserid==" + flag + "tuserid==" + tuserid);
		User u = new User();
		u.setUserid(Integer.parseInt(tuserid));
		u.setFlag(Integer.parseInt(flag));
		HttpSession session=request.getSession();
		UserService service = new UserService();
		ArrayList xianxcuipList = service.xianxcuipingUp(u);
		if (xianxcuipList.size() > 0)
			session.setAttribute("xianxcuipingList", xianxcuipList);
			response.sendRedirect("adminxianxcuiping.jsp");
	}

}
