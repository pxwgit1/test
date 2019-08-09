package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.TargettoUserService;

/**
 * Servlet implementation class SearchTargetServlet
 */
public class SearchTargetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTargetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("rawtypes")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchname = new String(request.getParameter("searchname").getBytes("iso-8859-1"), "utf-8");
		System.out.println("searchname=="+searchname);
		HttpSession session=request.getSession();
		TargettoUserService service=new TargettoUserService();
		ArrayList state=service.searchtargetname(searchname);
		//System.out.println("findtarget state.size()=="+state.size());
		if(state.size()>0)
			session.setAttribute("searchtg", state);
			response.sendRedirect("searchresult.jsp");
	}

}
