package service;

import java.util.ArrayList;

import dao.PhotoDao;
import model.Album;
import model.Photo;

public class PhotoService {
	//获取所有相册（包括相册名及其编号）
	public ArrayList getAlbum(){
		PhotoDao dao = new PhotoDao();
		ArrayList aList = dao.getAlbum();
		return aList;
	}
	
  // 按相册id显示某相册照片 
    public ArrayList findAllPhoto(int aid) { 
    	PhotoDao dao = new PhotoDao();
    	ArrayList pList = dao.findAllPhoto(aid);
		return pList;
    }
   //按相册id查找相册名称
    public Album findAname(int aid){
    	PhotoDao dao = new PhotoDao();
    	Album a =dao.findAname(aid);
    	return a;
    }
    
    //创建相册
    public int creAlbum(Album a){
    	PhotoDao dao = new PhotoDao();
    	int state=dao.creAlbum(a);
    	return state;
    }
    //按id删除相册
    public int delAlbum(int aid){
    	PhotoDao dao = new PhotoDao();
    	int state=dao.delAlbum(aid);
    	return state;
    }
    //修改相册名
    public int editAlbum(Album a){
    	PhotoDao dao = new PhotoDao();
    	int state=dao.editAlbum(a);
    	return state;
    }
    //上传照片
    public int upPhoto(Photo p) {  
    	PhotoDao dao = new PhotoDao();
		int state = dao.upPhoto(p);
		return state;
    }
    //按图片id删除图片
    public int delPhoto(int pid){
    	PhotoDao dao = new PhotoDao();
    	int state=dao.delPhoto(pid);
    	return state;
    }

}
