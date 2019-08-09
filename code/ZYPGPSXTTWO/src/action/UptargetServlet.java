package action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import common.StringFomat;
import dao.TargetDao;
import model.target;
import service.TargetService;

/**
 * Servlet implementation class Uptarget
 */
@SuppressWarnings("unused")
public class UptargetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UptargetServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings({ "unchecked" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fathertarget = null;
		String templefathertarget = null;//暂时存储父编号
		String fathertarget1 = null;
		String fathertarget2 = null;
		String filetitle = null;//指标内容
		String fileflag = null;
		String fileurl = null;
		String targettype = null;//父级指标字符串
		String templetargettype = null;//暂时存储父指标名称
		int targetlevel = 0;
		double mincount = 0.0;
		double maxcount = 0.0;
		
		// 得到上传时生成的临时文件保存目录
		/**
		 * 得到上传文件的保存目录的两种方法 方法1的目录生成在tomcat目录下，一旦tomcat清除项目，此文件就会消失，不为考虑
		 * 1、String savePath =
		 * this.getServletContext().getRealPath("/WEB-INF/upload");
		 * 方法2的AttFilePath位webxml里面配置的路径名称，此目录为固定硬盘目录，不会因为项目移除而消失，稳定可靠 2、String
		 * savePath = this.getServletContext().getInitParameter("AttFilePath");
		 */
		// 得到上传文件的保存目录
		// String savePath =
		// this.getServletContext().getRealPath("/WEB-INF/upload");
		// 得到上传文件的保存目录
		String savePath = this.getServletContext().getInitParameter("file");
		System.out.println("savePath==" + savePath);
		String message = "";
		try {
			// 创建一个DiskFileItemFactory工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 设置缓冲区的大小为100KB，如果不指定，那么缓冲区的大小默认是10KB
			factory.setSizeThreshold(1024 * 100);
			// 设置上传时生成的临时文件的保存目录
			//factory.setRepository(tmpFile);
			// 创建一个文件上传解析器
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 监听文件上传进度
			upload.setProgressListener(new ProgressListener() {
				public void update(long pBytesRead, long pContentLength, int arg2) {
					System.out.println("文件大小为：" + pContentLength + ",当前已处理：" + pBytesRead);
				}
			});
			// 解决上传文件名的中文乱码
			upload.setHeaderEncoding("UTF-8");
			// 设置上传单个文件的大小的最大值，目前是设置为1024*1024字节，也就是1MB
			upload.setFileSizeMax(1024 * 1024);
			// 设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为10MB
			upload.setSizeMax(1024 * 1024 * 10);
			// 4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
			List<FileItem> list = upload.parseRequest(request);
			for (FileItem item : list) {
				// 如果fileitem中封装的是普通输入项的数据
				if (item.isFormField()) {
					String name = item.getFieldName();
					// 解决普通输入项的数据的中文乱码问题
					String value = item.getString("UTF-8");
					System.out.println("000" + name + "=" + value);
					if(name.equals("type")){
						fathertarget = value;
						fathertarget1 = fathertarget; 
						System.out.println("type==" + fathertarget);
						if(fathertarget.equals("6")){
							templefathertarget = "6";
							//targettype="增加的一级指标";
							targettype="学院";
							templetargettype = targettype;
							targetlevel=0;
							//fathertarget=templefathertarget;
							System.out.println("targettype=="+targettype);
							System.out.println("fathertarget66=="+fathertarget);
						}else if(fathertarget.equals("1")){
							templetargettype = "计算机学院";
						}
					}else if(name.equals("targettitle")){
						filetitle = value;
						System.out.println("title==" + filetitle);
					}else if(name.equals("flag")){
						fileflag = value;
						System.out.println("flag==" + fileflag);
					}else if(name.equals("mincount")){
						mincount = Double.parseDouble(value);
						System.out.println("mincount==" + mincount);
					}else if(name.equals("maxcount")){
						maxcount = Double.parseDouble(value);
						System.out.println("maxcount==" + maxcount);
					}else if(name.equals("type2") && !(fathertarget.equals("6"))){
						fathertarget = value;
						System.out.println("type2==" + fathertarget);
						if(fathertarget.equals("11")){
							targettype=templetargettype+"--专业定位与规划";
							targetlevel=2;
							templetargettype = targettype;
							fathertarget2=fathertarget;
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("16")){
							fathertarget = fathertarget1;
							//targettype="增加二级指标";
							targettype="计算机学院";
							targetlevel=1;
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("13")){
							targettype=templetargettype+"--学科方向设置";
							targetlevel=2;
							templetargettype = targettype;
							fathertarget2=fathertarget;
						}else{
							System.out.println("test");
						}
					//}else if(name.equals("type3") && !(fathertarget.equals("1")) && !(templefathertarget.equals("6"))){
					}else if(name.equals("type3") && !(fathertarget.equals("13")) && !(fathertarget.equals("6")) && !(fathertarget.equals("1"))){
						fathertarget = value;
						System.out.println("type3==" + fathertarget);
						if(fathertarget.equals("111")){
							targettype=templetargettype+"--培养目标";
							targetlevel=3;
							templetargettype = "培养目标";
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("122")){
							targettype=templetargettype+"--学科等级";
							targetlevel=3;
							templetargettype = "学科等级";
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("133")){
							targettype=templetargettype+"--支撑行业";
							targetlevel=3;
							templetargettype = "支撑行业";
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("144")){
							fathertarget = fathertarget2;
							//targettype="增加二级指标";
							targettype=templetargettype;
							targetlevel=2;
							System.out.println("targettype=="+targettype);
						}else{
							System.out.println("ttttt3");
						}//&& !(fathertarget.equals("11"))
					}else if(name.equals("type4") && !(fathertarget.equals("11")) && !(fathertarget.equals("1")) && !(fathertarget.equals("111"))&& !(fathertarget.equals("122"))&& !(fathertarget.equals("133"))&& !(fathertarget.equals("144"))&& !(fathertarget.equals("6"))){
						fathertarget = value;
						System.out.println("type4==" + fathertarget);
						if(fathertarget.equals("211")){
							targettype=templetargettype+"--计算智能方向";
							targetlevel=3;
							templetargettype = "计算智能方向";
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("222")){
							targettype=templetargettype+"--图形图像方向";
							targetlevel=3;
							templetargettype = "图形图像方向";
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("233")){
							targettype=templetargettype+"--网络与信息系统安全方向";
							targetlevel=3;
							templetargettype = "网络与信息系统安全方向";
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("244")){
							targettype=templetargettype+"--物联网技术方向";
							targetlevel=3;
							templetargettype = "物联网技术方向";
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("255")){
							fathertarget = fathertarget2;
							//targettype="增加二级指标";
							targettype=templetargettype;
							targetlevel=2;
							System.out.println("targettype=="+targettype);
						}else{
							System.out.println("ttttt");
						}
					}
					
				} else {
					// 得到上传的文件名称，
					String filename = item.getName();
					if (filename == null || filename.trim().equals("")) {
						continue;
					}
					
					// 注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：
					// c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
					// 处理获取到的上传文件的文件名的路径部分，只保留文件名部分
					filename = filename.substring(filename.lastIndexOf("\\") + 1);
					System.out.println("filename=="+filename);
					/**
					 * 将上传的文件保存到数据库
					 * 
					 * @author baicai time上传时间 filename文件名 savePath文件路径
					 */
					Date date = new Date();
					DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					String time = format.format(date);
					TargetDao imgDao = new TargetDao();
					fileurl = savePath + "\\" + filename;
					// 得到上传文件的扩展名
					String fileExtName = filename.substring(filename.lastIndexOf(".") + 1);
					// 如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
					System.out.println("上传的文件的扩展名是：" + fileExtName);
					// 获取item中的上传文件的输入流
					InputStream in = item.getInputStream();
					// 得到文件保存的名称
					String saveFilename = makeFileName(filename);
					target tb_Img = new target(saveFilename, filename, filetitle, savePath, time, targettype, fathertarget, fileflag, targetlevel, mincount, maxcount);
					imgDao.UpImg(tb_Img);
					// 得到文件的保存目录
					String realSavePath = makePath(saveFilename, savePath);
					// 创建一个文件输出流
					FileOutputStream out = new FileOutputStream(realSavePath + "\\" + saveFilename);
					// 创建一个缓冲区
					byte buffer[] = new byte[1024];
					// 判断输入流中的数据是否已经读完的标识
					int len = 0;
					// 循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
					while ((len = in.read(buffer)) > 0) {
						// 使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\"
						// + filename)当中
						out.write(buffer, 0, len);
					}
					// 关闭输入流
					in.close();
					// 关闭输出流
					out.close();
					// 删除处理文件上传时生成的临时文件
					// item.delete();
				}
			}
		} catch (FileUploadBase.FileSizeLimitExceededException e) {
			e.printStackTrace();
			request.setAttribute("message", "out of maximum value！！！");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
			return;
		} catch (FileUploadBase.SizeLimitExceededException e) {
			e.printStackTrace();
			response.getWriter().println("<script type='text/javascript'>alert('all out of maximum value！！！')</script>");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @Method: makeFileName
	 * @Description: 生成上传文件的文件名，文件名以：uuid+"_"+文件的原始名称
	 * @param filename
	 *            文件的原始名称
	 * @return uuid+"_"+文件的原始名称
	 */
	private String makeFileName(String filename) { // 2.jpg
		// 为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
		return UUID.randomUUID().toString() + "_" + filename;
	}

	/**
	 * 为防止一个目录下面出现太多文件，要使用hash算法打散存储
	 * 
	 * @Method: makePath
	 * @Description:
	 * 
	 * @param filename
	 *            文件名，要根据文件名生成存储目录
	 * @param savePath
	 *            文件存储路径
	 * @return 新的存储目录
	 */
	private String makePath(String filename, String savePath) {
		// 用日期得到文件名的
		Calendar date = Calendar.getInstance();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String name = format1.format(date.getTime());
		String dir = savePath + "\\" + name; // upload\2\3 upload\3\5
		File file = new File(dir);
		// 如果目录不存在
		if (!file.exists()) {
			// 创建目录
			file.mkdirs();
		}
		return dir;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
