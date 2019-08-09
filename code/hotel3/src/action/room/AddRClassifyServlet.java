package action.room;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import common.StringFomat;
import model.Photo;
import model.roomType;
import service.RoomService;

public class AddRClassifyServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public AddRClassifyServlet() {
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

		doPost(request,  response);
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

		roomType t=new roomType();
		Photo p=new Photo();
		SmartUpload su = new SmartUpload();//实例化上传操作的对象  
		//PageContext是jsp的内置对象，不能再servlet中之间使用，需要做一些处理
		 try{
			 JspFactory jf=null;
			 PageContext pc=null;
			 jf=JspFactory.getDefaultFactory();
			 pc=jf.getPageContext(this, request, response, "", true, 8192, true);
			 su.initialize(pc);//初始化上传操作
			 su.setAllowedFilesList("jpg,bmp,gif");
			 su.upload();
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		 String ext=su.getFiles().getFile(0).getFileExt();  //获取文件扩展名
		 String name=p.getTime();//图片名：当前时间
		 String rphoto=name+"."+ext;//获取文件名   			
		 String p_url="H:/J2EE/J2EEwokespace/hotel3/WebRoot/photos/" +rphoto;//文件保存的路径	        
		 //保存文件 
		 try { 
			su.getFiles().getFile(0).saveAs(p_url);
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 		 	 
		 		 
         String rtype=(su.getRequest()).getParameter("rtype");
         rtype=StringFomat.getUtf8(rtype);
         String rprice=(su.getRequest()).getParameter("rprice");
         String rtotal=(su.getRequest()).getParameter("rtotal");
         String rdescription=(su.getRequest()).getParameter("rdescription");
         rdescription=StringFomat.getUtf8(rdescription);
           
         t.setRtype(rtype);
         t.setRprice(rprice);
         t.setRtotal(rtotal);
         t.setRdescription(rdescription);
         t.setRphoto(rphoto);
         
         RoomService service=new RoomService();
         int ustate=service.addType(t);
         if(ustate>0){
 			//response.sendRedirect("AllRoomsServlet");
 		response.setContentType("text/html;Charset=gb2312");
 		PrintWriter out=response.getWriter();
 		out.println("<script>alert(\"添加成功!\");</script>");
 		out.println("<script>location.href=\"RoomClassifyServlet\";</script>");
 		}
 		else{
 			response.setContentType("text/html;Charset=gb2312");
 			PrintWriter out=response.getWriter();
 			out.println("<script>alert(\"添加失败!\");</script>");
 			out.println("<script>location.href=\"RoomClassifyServlet\";</script>");
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
