package action.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PageModel;
import service.UserService;

public class UserListServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public UserListServlet() {
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

		
		
		UserService service=new UserService();
		HttpSession session=request.getSession();
		@SuppressWarnings("rawtypes")
		HashMap role=service.findRole();
		session.setAttribute("role", role);
				
		PageModel pm=new PageModel();		
		String r=request.getParameter("r");
		if(r==null) r="4";
		String currentPage=request.getParameter("currentPage");
		String pageSize=request.getParameter("pageSize");
		if(currentPage==null) pm.setCurrentPage(1);
		else pm.setCurrentPage(Integer.parseInt(currentPage));
		if(pageSize==null) pm.setPageSize(15);
		else pm.setPageSize(Integer.parseInt(pageSize));	
		 if(r.equals("0")){//列出所有超级管理员
			 pm=service.findSuperManager(pm);
        }else if(r.equals("1")){//列出所有酒店管理员
			 pm=service.findManager(pm);
        }else if(r.equals("2")){//列出所有会员
        	 pm=service.findVip(pm);
        }else if(r.equals("3")){//列出所有普通用户
        	 pm=service.findCommon(pm);
        } else{//列出全部用户
     	   pm=service.findAllUser(pm);
 		}
		
		session.setAttribute("pm", pm);
		response.sendRedirect("/hotel3/user-list.jsp");

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
