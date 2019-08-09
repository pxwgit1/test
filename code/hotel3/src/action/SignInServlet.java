package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.StringFomat;
import model.Login;
import model.User;
import service.UserService;

public class SignInServlet extends HttpServlet {

	/**
		 * Constructor of the object. 
		 */
	public SignInServlet() {
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

		 String roleID="NO";
		 User u=new User();
		 UserService Uservice=new UserService();
		Login logUser=null;
		String backNews="";
		HttpSession session =request.getSession(true);
		try{
			logUser=(Login)session.getAttribute("login");
			if(logUser==null){
				logUser=new Login();
				session.setAttribute("login", logUser);
			}
		}catch(Exception e){
			logUser=new Login();
			session.setAttribute("login", logUser);
		}
		
		String logname=request.getParameter("uname");
		logname=StringFomat.getUtf8(logname);
		String password=request.getParameter("upwd");
		password=StringFomat.getUtf8(password);
		boolean status=logUser.getStatus();
		if(status==true&&logname.equals(logUser.getLogname())){
			backNews=logname+"已经登录了";
			logUser.serBackNews(backNews);
		}
		else{			
			u.setUname(logname);
			u.setUpwd(password);			
			ArrayList uList = Uservice.signIn(u);	
			if(uList.isEmpty()){
				backNews="您输入的用户名不存在，或密码错误！";
				logUser.serBackNews(backNews);
				logUser.setStatus(false);
				logUser.setLogname(logname);
				logUser.setPassword(password);
				logUser.setRole(roleID);
			}
			else{
				
				for(Iterator userIt=uList.iterator();userIt.hasNext();){
					User us=(User)userIt.next();
				    roleID=us.getRole();
				}
				backNews="登录成功！";
				logUser.serBackNews(backNews);
				logUser.setStatus(false);
				logUser.setLogname(logname);
				logUser.setPassword(password);
				logUser.setRole(roleID);				
			}
	     }
		//若未登录成功
		if(logUser.getRole().equals("NO")){
			response.setContentType("text/html;Charset=gb2312");
			PrintWriter out=response.getWriter();
			out.println("<script>alert(\""+logUser.getBackNews()+"\");</script>");
			out.println("<script>location.href=\"signIn.jsp\";</script>");
	    }//若登录的是管理员
		else if(logUser.getRole().equals("0")||logUser.getRole().equals("1")){
			response.setContentType("text/html;Charset=gb2312");
			PrintWriter out=response.getWriter();
			out.println("<script>alert(\""+logUser.getBackNews()+"\");</script>");
			out.println("<script>location.href=\"ManagerServlet\";</script>");
		}
		 //若登录的是普通用户或Vip用户
		else if(logUser.getRole().equals("2")||logUser.getRole().equals("3")){
			response.setContentType("text/html;Charset=gb2312");
			PrintWriter out=response.getWriter();
			out.println("<script>alert(\""+logUser.getBackNews()+"\");</script>");
			out.println("<script>location.href=\"logIndex.jsp\";</script>");
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
