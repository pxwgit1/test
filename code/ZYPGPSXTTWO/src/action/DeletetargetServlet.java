package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.TargetService;

/**
 * Servlet implementation class DeletetargetServlet
 */

public class DeletetargetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletetargetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String targetid=request.getParameter("targetid");
		//System.out.println(sno);
		TargetService service=new TargetService();
		int i=service.delete(targetid);
		if(i>0)
			response.sendRedirect("/ZYPGPSXT/target.jsp");
		else response.sendRedirect("/ZYPGPSXT/index.jsp");
	}

}
