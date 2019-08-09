package action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TargettoUser;
import service.TargettoUserService;
import service.UserService;

/**
 * Servlet implementation class TargetdistributeServlet
 */
public class TargetdistributeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TargetdistributeServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String usids = request.getParameter("usids");
		String tempusids="";
		int state = 0;
		String uids[]=usids.split(",");
		String targetid = request.getParameter("targetid");
		for(int i =0;i<uids.length;i++){
			if(!uids[i].equals("")){
				tempusids=uids[i];
	            TargettoUser ts = new TargettoUser();
	            ts.setTuserid(Integer.parseInt(tempusids));
	        	ts.setTutargetid(Integer.parseInt(targetid));
	        	TargettoUserService service=new TargettoUserService();
	        	try {
	        		state = service.saveDistribute(ts);
	        	} catch (SQLException e) {
	        			e.printStackTrace();
	        	}
            }
		}
		if (state > 0)
			response.sendRedirect("targetdistribbute.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
