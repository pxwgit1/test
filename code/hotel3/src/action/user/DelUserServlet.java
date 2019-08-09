package action.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.StringFomat;
import model.User;
import service.UserService;

public class DelUserServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public DelUserServlet() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost( request,  response);
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User u = new User();
		String uname=request.getParameter("uname");
		uname=StringFomat.getUtf8(uname);
		u.setUname(uname);
		UserService service=new UserService();
		int state=service.delete(u);
		if(state>0){
			response.setContentType("text/html;Charset=gb2312");
			PrintWriter out=response.getWriter();
			out.println("<script>alert(\"…æ≥˝≥…π¶!\");</script>");
			out.println("<script>location.href=\"UserListServlet\";</script>");
		}else{
			response.setContentType("text/html;Charset=gb2312");
			PrintWriter out=response.getWriter();
			out.println("<script>alert(\"…æ≥˝ ß∞‹£¨«Î÷ÿ ‘!\");</script>");
			out.println("<script>location.href=\"UserListServlet\";</script>");
		}
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}
