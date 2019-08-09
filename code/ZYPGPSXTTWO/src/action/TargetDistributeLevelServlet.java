package action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.target;
import service.TargetService;

/**
 * Servlet implementation class TargetDistributeLevelServlet
 */
public class TargetDistributeLevelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TargetDistributeLevelServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String level=request.getParameter("level");
		System.out.println("level=="+level);
		
		HttpSession session=request.getSession();
		target tg = new target();
		tg.setTargetlevel(Integer.parseInt(level));
		TargetService service=new TargetService();
		ArrayList targetList=service.findTargets2(tg);
		System.out.println("targetList2.size()=="+targetList.size());
		if(targetList.size()>0) 
		session.setAttribute("targetList", targetList);
		response.sendRedirect("targetdistribbute.jsp");
	}

}
