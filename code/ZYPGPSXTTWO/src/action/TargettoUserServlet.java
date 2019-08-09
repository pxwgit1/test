package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TargettoUser;
import service.TargettoUserService;

/**
 * Servlet implementation class TargettoUserServlet
 */

public class TargettoUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TargettoUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String targetcount = request.getParameter("targetcount");
		String ids = request.getParameter("id");
		String uids = request.getParameter("uid");
		System.out.println("ids"+ids);
		System.out.println("uids"+uids);
		System.out.println("targetcount"+targetcount);
		TargettoUser ts = new TargettoUser();
		ts.setTargetcount(Double.parseDouble(targetcount));
		ts.setTutargetid(Integer.parseInt(ids));
		ts.setTuserid(Integer.parseInt(uids));
		TargettoUserService service=new TargettoUserService();
		int state=service.saveCount(ts);
		if(state>0) 
			response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String sno=request.getParameter("score");
		//System.out.println(sno);
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
