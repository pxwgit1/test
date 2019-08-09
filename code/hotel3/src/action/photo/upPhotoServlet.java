package action.photo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import model.Album;
import model.Photo;
import service.PhotoService;

public class upPhotoServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public upPhotoServlet() {
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

		doPost( request,  response);
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
	@SuppressWarnings("deprecation")
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Photo p=new Photo();
		SmartUpload su = new SmartUpload();//ʵ�����ϴ������Ķ���  
		 String name=p.getTime();//ͼƬ������ǰʱ��
		//PageContext��jsp�����ö��󣬲�����servlet��֮��ʹ�ã���Ҫ��һЩ����
		 try{
			 JspFactory jf=null;
			 PageContext pc=null;
			 jf=JspFactory.getDefaultFactory();
			 pc=jf.getPageContext(this, request, response, "", true, 8192, true);
			 su.initialize(pc);//��ʼ���ϴ�����
			 su.setAllowedFilesList("jpg,bmp,gif");
			 su.upload();
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		 int aid=Integer.parseInt((su.getRequest()).getParameter("aid1"));
	     System.out.println("aid:"+aid);
	     
		String ext=su.getFiles().getFile(0).getFileExt();  //��ȡ�ļ���չ��
	    System.out.println("ext:"+ext);
		String p_name=name+"."+ext;//��ȡ�ļ���
		String p_url="H:/J2EE/J2EEwokespace/hotel3/WebRoot/photos/" +p_name;//�ļ������·��	        
		 //�����ļ� 
		 try { 
			su.getFiles().getFile(0).saveAs(p_url);
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 		 	 
        p.setP_name(p_name);
        p.setP_url(p_url);
        p.setP_albumId(aid);        
       PhotoService service=new PhotoService();
       int state=service.upPhoto(p);
       if(state>0){
		//response.sendRedirect("AllRoomsServlet");
		response.setContentType("text/html;Charset=gb2312");
		PrintWriter out=response.getWriter();
		out.println("<script>alert(\"���ͼƬ�ɹ�!\");</script>");
		out.println("<script>location.href=\"RoomAlbumServlet\";</script>");
		}
		else{
			response.setContentType("text/html;Charset=gb2312");
			PrintWriter out=response.getWriter();
			out.println("<script>alert(\"���ͼƬʧ�ܣ�������!\");</script>");
			out.println("<script>location.href=\"RoomAlbumServlet\";</script>");
		
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
