package action.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.StringFomat;
import model.Login;
import model.Order;
import service.OrderService;

public class AddOrderServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public AddOrderServlet() {
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

	    HttpSession session=request.getSession();
		Login logUser=null;
		String backNews="";
		String uname;
		try{
			logUser=(Login)session.getAttribute("login");
		
			if(logUser==null){
				backNews="Äú»¹Î´µÇÂ¼£¬ÇëµÇÂ¼£¡";
				response.setContentType("text/html;Charset=gb2312");
				PrintWriter out=response.getWriter();
				out.println("<script>alert(\""+backNews+"\");</script>");
				out.println("<script>location.href=\"signIn.jsp\";</script>");
			}
			else{
				//System.out.println("userID:"+logUser.getRole());
				Order o=new Order();
				if(logUser.getRole().equals("0")||logUser.getRole().equals("1")){
					uname=request.getParameter("uname");
				}		
				else{
					uname=logUser.getLogname();
				}				
				uname=StringFomat.getUtf8(uname);
				String roomtype=request.getParameter("roomtype");
				String num=request.getParameter("num");
				String tel=request.getParameter("tel");
				String liveTime=request.getParameter("liveTime");
				Date ltime = StringFomat.getDatefromString(liveTime);
			    System.out.println("servletLTime:"+ltime);
				String outTime=request.getParameter("outTime");
				Date otime=StringFomat.getDatefromString(outTime);
				System.out.println("servletOtime:"+otime);
				
				o.setUname(uname);
				o.setRoomtype(roomtype);
				o.setNum(num);
				o.setTel(tel);
				o.setLivetime(ltime);
				o.setOuttime(otime);
				o.setOrdertime(o.getCurrenttime());
				o.setStatus("1");
				OrderService service=new OrderService();
				int state=service.add(o);	
				if(state>0){
					//response.sendRedirect("AllRoomsServlet");
				response.setContentType("text/html;Charset=gb2312");
				PrintWriter out=response.getWriter();
				out.println("<script>alert(\"Ô¤¶©³É¹¦!\");</script>");
					if(logUser.getRole().equals("0")||logUser.getRole().equals("1")){
						  out.println("<script>location.href=\"ManagerAddOrder\";</script>");
					}
					else{
						 out.println("<script>location.href=\"orderSuccess.jsp\";</script>");
					}				  
				}
				else{
					response.setContentType("text/html;Charset=gb2312");
					PrintWriter out=response.getWriter();
					out.println("<script>alert(\"Ô¤¶©Ê§°Ü£¬ÇëÖØÊÔ!\");</script>");
					if(logUser.getRole().equals("0")||logUser.getRole().equals("1")){
						  out.println("<script>location.href=\"ManagerAddOrder\";</script>");
					}
					else{
						 out.println("<script>location.href=\"index.jsp\";</script>");
					}	
				}				
			}
		}catch(Exception e){
			e.printStackTrace();
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
