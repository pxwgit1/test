package action.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.tools.DocumentationTool.Location;

import model.Order;
import model.PageModel;
import service.OrderService;
import service.RoomService;

public class OrderListServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public OrderListServlet() {
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

		OrderService service = new OrderService();
		HttpSession session = request.getSession();
		RoomService rservice=new RoomService();
		//获取房间类型
		HashMap type=rservice.findType();
		session.setAttribute("type", type);	
		PageModel pm=new PageModel();
		PageModel tab1=new PageModel();
		String currentPage=request.getParameter("currentPage");
		String pageSize=request.getParameter("pageSize");
		if(currentPage==null) pm.setCurrentPage(1);
		else pm.setCurrentPage(Integer.parseInt(currentPage));
		if(pageSize==null) pm.setPageSize(10);
		else pm.setPageSize(Integer.parseInt(pageSize));
		tab1=service.findOrderList(pm);
		session.setAttribute("tab1", tab1);
		response.sendRedirect("order-list.jsp");
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
