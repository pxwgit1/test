package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.StringFomat;
import model.User;
import service.UserService;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("rawtypes")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String roleID="NO";
		User u=new User();
		
		String uname=request.getParameter("loginuser");
		uname=StringFomat.getUtf8(uname);
		String upwd=request.getParameter("loginpwd");
		u.setUsername(uname);
		u.setPassword(upwd);
		UserService Uservice=new UserService();
		ArrayList uList = Uservice.signIn(u);
	
		for(Iterator userIt=uList.iterator();userIt.hasNext();){
			User us=(User)userIt.next();
		    roleID=us.getRole();
		}
		System.out.println("roleID:"+roleID);
		if(roleID.equals("NO")){
			response.sendRedirect("/ZYPGPSXTTWO/login.jsp");
	    }
		if(roleID.equals("0")){
			//response.sendRedirect("ManageServlet");iso8859-1
			String tuname = new String(uname.getBytes("UTF-8"),"iso8859-1");
			System.out.println("LoginServlet==tuname="+tuname);
			response.sendRedirect("/ZYPGPSXTTWO/usermain.jsp?uname="+tuname);
		}
		 
		if(roleID.equals("2")||roleID.equals("1")){
		//response.sendRedirect("/hotel/roomlist.jsp");
			//response.sendRedirect("ManageServlet");
			response.sendRedirect("/ZYPGPSXTTWO/adminmain.jsp");
		} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
