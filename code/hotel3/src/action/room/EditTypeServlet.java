package action.room;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.roomType;
import service.RoomService;

public class EditTypeServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public EditTypeServlet() {
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

		doPost(request, response);
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

		roomType t=new roomType();
		String typeid=request.getParameter("typeid");
		int tid=Integer.parseInt(typeid);
		String rtype=request.getParameter("rtype");
		String rprice=request.getParameter("rprice");
		String rtotal=request.getParameter("rtotal");
		String rdescription=request.getParameter("rdescription");
	    t.setTypeid(tid);
	    t.setRtype(rtype);
	    t.setRprice(rprice);
	    t.setRtotal(rtotal);
	    t.setRavailable(rtotal);
	    t.setRdescription(rdescription);
	    RoomService service=new RoomService();
	    int ustate=service.editType(t);
	    if(ustate>0){
 			//response.sendRedirect("AllRoomsServlet");
 		response.setContentType("text/html;Charset=gb2312");
 		PrintWriter out=response.getWriter();
 		out.println("<script>alert(\"修改成功!\");</script>");
 		out.println("<script>location.href=\"RoomClassifyServlet\";</script>");
 		}
 		else{
 			response.setContentType("text/html;Charset=gb2312");
 			PrintWriter out=response.getWriter();
 			out.println("<script>alert(\"修改失败!\");</script>");
 			out.println("<script>location.href=\"RoomClassifyServlet\";</script>");
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
