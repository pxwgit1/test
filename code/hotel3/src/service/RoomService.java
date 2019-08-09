package service;

import java.util.ArrayList;
import java.util.HashMap;

import dao.OrderDao;
import dao.RoomDao;
import model.Album;
import model.PageModel;
import model.Room;
import model.roomType;

public class RoomService {
	//�г����з���
	public ArrayList findAll(){
		RoomDao dao=new RoomDao();
		ArrayList rList=dao.findAll();
		return rList;
	}
	//�г����з�������
	public ArrayList AllType(){
		RoomDao dao=new RoomDao();
		ArrayList rList=dao.AllType();
		return rList;
	}
	//������Ԥ���ķ���
	public PageModel findOrdered(PageModel pm){
		RoomDao dao=new RoomDao();
		 PageModel p=dao.findOrdered(pm);
		return p;
	}
	//����δԤ���ķ���
	public PageModel findEmpty(PageModel pm){
		RoomDao dao=new RoomDao();
		 PageModel p=dao.findEmpty(pm);
		return p;
	}
	//findbyPage����ҳ��ʾ����
		public PageModel findbyPage(PageModel pm){
			RoomDao dao=new RoomDao();
			PageModel p=dao.findbyPage(pm);
			return p;
		}
		//ͨ���������Ͳ��ҷ��䣬����ҳ��ʾ
		public PageModel findbyType(PageModel pm,String type){
			RoomDao dao=new RoomDao();
			PageModel p=dao.findbyType(pm,type);
			return p;
		}
		//���������ͷ���һ����ϣ����
		public HashMap findType(){
			RoomDao dao=new RoomDao();
			HashMap type=dao.findType();
			return type;
		}
		//ɾ������
		public int delete(Room r){
			RoomDao dao=new RoomDao();
			int ustate=dao.delete(r);
			return ustate;
		}
		//��ӷ���
		public int add(Room r){
			RoomDao dao=new RoomDao();
			int ustate=dao.add(r);
			return ustate;
		}
		//�޸ķ���
		public int edit(Room r){
			RoomDao dao=new RoomDao();
			int ustate=dao.edit(r);
			return ustate;
		}
		//��ӷ�������
		public int addType(roomType t){
			RoomDao dao=new RoomDao();
			int ustate=dao.addType(t);
			return ustate;
		}
		//�޸ķ�������
		public int editType(roomType t){
			RoomDao dao=new RoomDao();
			int ustate=dao.editType(t);
			return ustate;
		}
		//ɾ����������
		public int delType(roomType t){
			RoomDao dao=new RoomDao();
			int ustate=dao.delType(t);
			return ustate;
		}
		//�޸�ĳ�������͵�ͼƬ
		public int editTphoto(roomType t){
			RoomDao dao=new RoomDao();
			int ustate=dao.editTphoto(t);
			return ustate;
		}
		//���㷿����
		public int countRoom(){
		   RoomDao dao=new RoomDao();
		   int c =dao.countRoom();
		   return c;
		}
		
		public ArrayList searchAll(String bookingin,String bookingout){
			RoomDao dao=new RoomDao();
			ArrayList searchList=dao.searchAll(bookingin,bookingout);
			return searchList;
		}
}
