package service;

import java.util.ArrayList;

import dao.PhotoDao;
import model.Album;
import model.Photo;

public class PhotoService {
	//��ȡ������ᣨ��������������ţ�
	public ArrayList getAlbum(){
		PhotoDao dao = new PhotoDao();
		ArrayList aList = dao.getAlbum();
		return aList;
	}
	
  // �����id��ʾĳ�����Ƭ 
    public ArrayList findAllPhoto(int aid) { 
    	PhotoDao dao = new PhotoDao();
    	ArrayList pList = dao.findAllPhoto(aid);
		return pList;
    }
   //�����id�����������
    public Album findAname(int aid){
    	PhotoDao dao = new PhotoDao();
    	Album a =dao.findAname(aid);
    	return a;
    }
    
    //�������
    public int creAlbum(Album a){
    	PhotoDao dao = new PhotoDao();
    	int state=dao.creAlbum(a);
    	return state;
    }
    //��idɾ�����
    public int delAlbum(int aid){
    	PhotoDao dao = new PhotoDao();
    	int state=dao.delAlbum(aid);
    	return state;
    }
    //�޸������
    public int editAlbum(Album a){
    	PhotoDao dao = new PhotoDao();
    	int state=dao.editAlbum(a);
    	return state;
    }
    //�ϴ���Ƭ
    public int upPhoto(Photo p) {  
    	PhotoDao dao = new PhotoDao();
		int state = dao.upPhoto(p);
		return state;
    }
    //��ͼƬidɾ��ͼƬ
    public int delPhoto(int pid){
    	PhotoDao dao = new PhotoDao();
    	int state=dao.delPhoto(pid);
    	return state;
    }

}
