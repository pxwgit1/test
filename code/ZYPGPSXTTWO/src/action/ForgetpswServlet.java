package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.StringFomat;
import model.User;
import service.UserService;

/**
 * Servlet implementation class ForgetpswServlet
 */
public class ForgetpswServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetpswServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u=new User();
		String uname=request.getParameter("usname");
		uname=StringFomat.getUtf8(uname);
		u.setUsername(uname);
		UserService service=new UserService();
		int state=service.setForgetpsw(u);
		if(state>0) 
			response.sendRedirect("forgetpasswordtishi.jsp");
	}

}
