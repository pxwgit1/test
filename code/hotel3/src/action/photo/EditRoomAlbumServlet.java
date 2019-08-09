package action.photo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.StringFomat;
import model.Album;
import service.PhotoService;

public class EditRoomAlbumServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public EditRoomAlbumServlet() {
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

		Album a=new Album();
		int aid=Integer.parseInt(request.getParameter("aid"));
		String aname=request.getParameter("aname");
		aname=StringFomat.getUtf8(aname);
		a.setA_id(aid);
		a.setA_name(aname);
		PhotoService service=new PhotoService();
		int state = service.editAlbum(a);
		if(state>0){
			//response.sendRedirect("AllRoomsServlet");
		response.setContentType("text/html;Charset=gb2312");
		PrintWriter out=response.getWriter();
		out.println("<script>alert(\"修改成功!\");</script>");
		out.println("<script>location.href=\"RoomAlbumServlet\";</script>");
		}
		else{
			response.setContentType("text/html;Charset=gb2312");
			PrintWriter out=response.getWriter();
			out.println("<script>alert(\"修改失败，请重试!\");</script>");
			out.println("<script>location.href=\"RoomAlbumServlet\";</script>");
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
