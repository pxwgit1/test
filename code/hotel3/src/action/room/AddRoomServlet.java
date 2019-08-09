package action.room;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.StringFomat;
import model.Room;
import service.RoomService;

public class AddRoomServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public AddRoomServlet() {
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

		doPost(request,  response);
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

		Room r=new Room();
		String roomID=request.getParameter("roomID");
		String roomName=request.getParameter("roomName");
		roomName=StringFomat.getUtf8(roomName);
		String roomType=request.getParameter("roomType");
		System.out.println("add:"+roomType);
		String roomStatus="1";
		r.setRoomID(roomID);
		r.setRoomName(roomName);
		r.setRoomType(roomType);
		r.setRoomStatus(roomStatus);		
		RoomService service=new RoomService();
		int state=service.add(r);
		if(state>0){
			//response.sendRedirect("AllRoomsServlet");
		response.setContentType("text/html;Charset=gb2312");
		PrintWriter out=response.getWriter();
		out.println("<script>alert(\"��ӳɹ�!\");</script>");
		out.println("<script>location.href=\"RoomListServlet\";</script>");
		}
		else{
			response.setContentType("text/html;Charset=gb2312");
			PrintWriter out=response.getWriter();
			out.println("<script>alert(\"���ʧ�ܣ�������!\");</script>");
			out.println("<script>location.href=\"RoomListServlet\";</script>");
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
