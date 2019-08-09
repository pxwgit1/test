package action.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.DBConnection;
import model.TMessage;

public class Leavemessage extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public Leavemessage() {
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
		java.sql.PreparedStatement sql=null;
		TMessage tr=new TMessage();
		/*request.setAttribute("mview",tr);*/
		request.setAttribute("mview",tr);
		String rtitle=request.getParameter("rtitle");
		String rmessage=request.getParameter("rmessage");
		
		
		System.out.println("try«∞");
		
		
		try {
			Connection con=DBConnection.getConn();
			System.out.println("insert«∞");
			String insertCondition="insert into leavemessage values(?,?)";
			sql=con.prepareStatement(insertCondition);
			sql.setString(1, rtitle);
			System.out.println("rtitle"+rtitle);
			sql.setString(2, rmessage);
			int m=sql.executeUpdate();
			if(m!=0){
				tr.setRmessage(rmessage);
				tr.setRtitle(rtitle);
			}
			else{
				System.out.println("¥ÌŒÛ");
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		/*sql= con.prepareStatement(insertCondition);*/
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("/Leavesuccess.jsp");
		dispatcher.forward(request,response);		
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

		doGet( request,  response);
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
