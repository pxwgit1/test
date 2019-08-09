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
		String templefathertarget = null;//��ʱ�洢�����
		String fathertarget1 = null;
		String fathertarget2 = null;
		String filetitle = null;//ָ������
		String fileflag = null;
		String fileurl = null;
		String targettype = null;//����ָ���ַ���
		String templetargettype = null;//��ʱ�洢��ָ������
		int targetlevel = 0;
		double mincount = 0.0;
		double maxcount = 0.0;
		
		// �õ��ϴ�ʱ���ɵ���ʱ�ļ�����Ŀ¼
		/**
		 * �õ��ϴ��ļ��ı���Ŀ¼�����ַ��� ����1��Ŀ¼������tomcatĿ¼�£�һ��tomcat�����Ŀ�����ļ��ͻ���ʧ����Ϊ����
		 * 1��String savePath =
		 * this.getServletContext().getRealPath("/WEB-INF/upload");
		 * ����2��AttFilePathλwebxml�������õ�·�����ƣ���Ŀ¼Ϊ�̶�Ӳ��Ŀ¼��������Ϊ��Ŀ�Ƴ�����ʧ���ȶ��ɿ� 2��String
		 * savePath = this.getServletContext().getInitParameter("AttFilePath");
		 */
		// �õ��ϴ��ļ��ı���Ŀ¼
		// String savePath =
		// this.getServletContext().getRealPath("/WEB-INF/upload");
		// �õ��ϴ��ļ��ı���Ŀ¼
		String savePath = this.getServletContext().getInitParameter("file");
		System.out.println("savePath==" + savePath);
		String message = "";
		try {
			// ����һ��DiskFileItemFactory����
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// ���û������Ĵ�СΪ100KB�������ָ������ô�������Ĵ�СĬ����10KB
			factory.setSizeThreshold(1024 * 100);
			// �����ϴ�ʱ���ɵ���ʱ�ļ��ı���Ŀ¼
			//factory.setRepository(tmpFile);
			// ����һ���ļ��ϴ�������
			ServletFileUpload upload = new ServletFileUpload(factory);
			// �����ļ��ϴ�����
			upload.setProgressListener(new ProgressListener() {
				public void update(long pBytesRead, long pContentLength, int arg2) {
					System.out.println("�ļ���СΪ��" + pContentLength + ",��ǰ�Ѵ���" + pBytesRead);
				}
			});
			// ����ϴ��ļ�������������
			upload.setHeaderEncoding("UTF-8");
			// �����ϴ������ļ��Ĵ�С�����ֵ��Ŀǰ������Ϊ1024*1024�ֽڣ�Ҳ����1MB
			upload.setFileSizeMax(1024 * 1024);
			// �����ϴ��ļ����������ֵ�����ֵ=ͬʱ�ϴ��Ķ���ļ��Ĵ�С�����ֵ�ĺͣ�Ŀǰ����Ϊ10MB
			upload.setSizeMax(1024 * 1024 * 10);
			// 4��ʹ��ServletFileUpload�����������ϴ����ݣ�����������ص���һ��List<FileItem>���ϣ�ÿһ��FileItem��Ӧһ��Form����������
			List<FileItem> list = upload.parseRequest(request);
			for (FileItem item : list) {
				// ���fileitem�з�װ������ͨ�����������
				if (item.isFormField()) {
					String name = item.getFieldName();
					// �����ͨ����������ݵ�������������
					String value = item.getString("UTF-8");
					System.out.println("000" + name + "=" + value);
					if(name.equals("type")){
						fathertarget = value;
						fathertarget1 = fathertarget; 
						System.out.println("type==" + fathertarget);
						if(fathertarget.equals("6")){
							templefathertarget = "6";
							//targettype="���ӵ�һ��ָ��";
							targettype="ѧԺ";
							templetargettype = targettype;
							targetlevel=0;
							//fathertarget=templefathertarget;
							System.out.println("targettype=="+targettype);
							System.out.println("fathertarget66=="+fathertarget);
						}else if(fathertarget.equals("1")){
							templetargettype = "�����ѧԺ";
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
							targettype=templetargettype+"--רҵ��λ��滮";
							targetlevel=2;
							templetargettype = targettype;
							fathertarget2=fathertarget;
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("16")){
							fathertarget = fathertarget1;
							//targettype="���Ӷ���ָ��";
							targettype="�����ѧԺ";
							targetlevel=1;
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("13")){
							targettype=templetargettype+"--ѧ�Ʒ�������";
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
							targettype=templetargettype+"--����Ŀ��";
							targetlevel=3;
							templetargettype = "����Ŀ��";
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("122")){
							targettype=templetargettype+"--ѧ�Ƶȼ�";
							targetlevel=3;
							templetargettype = "ѧ�Ƶȼ�";
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("133")){
							targettype=templetargettype+"--֧����ҵ";
							targetlevel=3;
							templetargettype = "֧����ҵ";
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("144")){
							fathertarget = fathertarget2;
							//targettype="���Ӷ���ָ��";
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
							targettype=templetargettype+"--�������ܷ���";
							targetlevel=3;
							templetargettype = "�������ܷ���";
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("222")){
							targettype=templetargettype+"--ͼ��ͼ����";
							targetlevel=3;
							templetargettype = "ͼ��ͼ����";
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("233")){
							targettype=templetargettype+"--��������Ϣϵͳ��ȫ����";
							targetlevel=3;
							templetargettype = "��������Ϣϵͳ��ȫ����";
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("244")){
							targettype=templetargettype+"--��������������";
							targetlevel=3;
							templetargettype = "��������������";
							System.out.println("targettype=="+targettype);
						}else if(fathertarget.equals("255")){
							fathertarget = fathertarget2;
							//targettype="���Ӷ���ָ��";
							targettype=templetargettype;
							targetlevel=2;
							System.out.println("targettype=="+targettype);
						}else{
							System.out.println("ttttt");
						}
					}
					
				} else {
					// �õ��ϴ����ļ����ƣ�
					String filename = item.getName();
					if (filename == null || filename.trim().equals("")) {
						continue;
					}
					
					// ע�⣺��ͬ��������ύ���ļ����ǲ�һ���ģ���Щ������ύ�������ļ����Ǵ���·���ģ��磺
					// c:\a\b\1.txt������Щֻ�ǵ������ļ������磺1.txt
					// �����ȡ�����ϴ��ļ����ļ�����·�����֣�ֻ�����ļ�������
					filename = filename.substring(filename.lastIndexOf("\\") + 1);
					System.out.println("filename=="+filename);
					/**
					 * ���ϴ����ļ����浽���ݿ�
					 * 
					 * @author baicai time�ϴ�ʱ�� filename�ļ��� savePath�ļ�·��
					 */
					Date date = new Date();
					DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					String time = format.format(date);
					TargetDao imgDao = new TargetDao();
					fileurl = savePath + "\\" + filename;
					// �õ��ϴ��ļ�����չ��
					String fileExtName = filename.substring(filename.lastIndexOf(".") + 1);
					// �����Ҫ�����ϴ����ļ����ͣ���ô����ͨ���ļ�����չ�����ж��ϴ����ļ������Ƿ�Ϸ�
					System.out.println("�ϴ����ļ�����չ���ǣ�" + fileExtName);
					// ��ȡitem�е��ϴ��ļ���������
					InputStream in = item.getInputStream();
					// �õ��ļ����������
					String saveFilename = makeFileName(filename);
					target tb_Img = new target(saveFilename, filename, filetitle, savePath, time, targettype, fathertarget, fileflag, targetlevel, mincount, maxcount);
					imgDao.UpImg(tb_Img);
					// �õ��ļ��ı���Ŀ¼
					String realSavePath = makePath(saveFilename, savePath);
					// ����һ���ļ������
					FileOutputStream out = new FileOutputStream(realSavePath + "\\" + saveFilename);
					// ����һ��������
					byte buffer[] = new byte[1024];
					// �ж��������е������Ƿ��Ѿ�����ı�ʶ
					int len = 0;
					// ѭ�������������뵽���������У�(len=in.read(buffer))>0�ͱ�ʾin���滹������
					while ((len = in.read(buffer)) > 0) {
						// ʹ��FileOutputStream�������������������д�뵽ָ����Ŀ¼(savePath + "\\"
						// + filename)����
						out.write(buffer, 0, len);
					}
					// �ر�������
					in.close();
					// �ر������
					out.close();
					// ɾ�������ļ��ϴ�ʱ���ɵ���ʱ�ļ�
					// item.delete();
				}
			}
		} catch (FileUploadBase.FileSizeLimitExceededException e) {
			e.printStackTrace();
			request.setAttribute("message", "out of maximum value������");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
			return;
		} catch (FileUploadBase.SizeLimitExceededException e) {
			e.printStackTrace();
			response.getWriter().println("<script type='text/javascript'>alert('all out of maximum value������')</script>");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @Method: makeFileName
	 * @Description: �����ϴ��ļ����ļ������ļ����ԣ�uuid+"_"+�ļ���ԭʼ����
	 * @param filename
	 *            �ļ���ԭʼ����
	 * @return uuid+"_"+�ļ���ԭʼ����
	 */
	private String makeFileName(String filename) { // 2.jpg
		// Ϊ��ֹ�ļ����ǵ���������ҪΪ�ϴ��ļ�����һ��Ψһ���ļ���
		return UUID.randomUUID().toString() + "_" + filename;
	}

	/**
	 * Ϊ��ֹһ��Ŀ¼�������̫���ļ���Ҫʹ��hash�㷨��ɢ�洢
	 * 
	 * @Method: makePath
	 * @Description:
	 * 
	 * @param filename
	 *            �ļ�����Ҫ�����ļ������ɴ洢Ŀ¼
	 * @param savePath
	 *            �ļ��洢·��
	 * @return �µĴ洢Ŀ¼
	 */
	private String makePath(String filename, String savePath) {
		// �����ڵõ��ļ�����
		Calendar date = Calendar.getInstance();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String name = format1.format(date.getTime());
		String dir = savePath + "\\" + name; // upload\2\3 upload\3\5
		File file = new File(dir);
		// ���Ŀ¼������
		if (!file.exists()) {
			// ����Ŀ¼
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
