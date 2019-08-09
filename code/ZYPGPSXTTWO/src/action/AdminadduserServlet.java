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
 * Servlet implementation class AdminadduserServlet
 */

public class AdminadduserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminadduserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u=new User();
		String uname=request.getParameter("reguser");
		System.out.println("uname=="+ uname);
		uname=StringFomat.getUtf8(uname);
		String upwd=request.getParameter("regpwd");
		String email=request.getParameter("email");
		String roleID="0";
		
		System.out.println("RegistServlet email=="+email);
		u.setUsername(uname);
		u.setPassword(upwd);
		u.setEmail(email);
		u.setRole(roleID);
		
		UserService service=new UserService();
		int state=service.signUp(u);
		if(state>0) 
			response.sendRedirect("user.jsp");
	}

}
