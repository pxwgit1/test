package action.room;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PageModel;
import service.RoomService;

public class RoomListServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public RoomListServlet() {
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

		RoomService rservice=new RoomService();
		HttpSession session=request.getSession();
		@SuppressWarnings("rawtypes")
		HashMap type=rservice.findType();
		session.setAttribute("type", type);
		String n=request.getParameter("n");
		if(n==null) n="1";
		//若n=0表示添加房间，n=1表示列出所有房间
		if(n.equals("0")){
			response.sendRedirect("/hotel3/addRoom.jsp");
		}
		else
		{		
			PageModel pm=new PageModel();
			String currentPage=request.getParameter("currentPage");
			String pageSize=request.getParameter("pageSize");
			if(currentPage==null) pm.setCurrentPage(1);
			else pm.setCurrentPage(Integer.parseInt(currentPage));
			if(pageSize==null) pm.setPageSize(8);
			else pm.setPageSize(Integer.parseInt(pageSize));
			pm=rservice.findbyPage(pm);
			session.setAttribute("pm", pm);
			response.sendRedirect("/hotel3/room-list.jsp");
	  }
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

		doGet( request, response);
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
