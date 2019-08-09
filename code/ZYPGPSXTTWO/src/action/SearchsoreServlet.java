package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TargettoUser;
import service.TargettoUserService;

/**
 * Servlet implementation class SearchsoreServlet
 */
public class SearchsoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchsoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("rawtypes")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tid=request.getParameter("index");//loginuname
		System.out.println("tid"+tid);
		String loginusid=request.getParameter("loginusid");
		System.out.println("loginusid=="+loginusid);
		String loginuname=new String(request.getParameter("loginuname").getBytes("iso-8859-1"), "utf-8");
		System.out.println("loginuname=="+loginuname);
		HttpSession session=request.getSession();
		TargettoUser ts1 = new TargettoUser();
		ts1.setTargetuserid(Integer.parseInt(tid));
		ts1.setTuserid(Integer.parseInt(loginusid));
		
		TargettoUserService service=new TargettoUserService();
		ArrayList state=service.pingfenfindTargettouser(ts1);
		//ArrayList state=service.findTargettouser2(ts1);
		if(state.size()>0)
			session.setAttribute("aseachList", state);
			response.sendRedirect("grade.jsp");
			//response.sendRedirect("usergrade.jsp?loginusid="+loginusid);
	
	}

}
