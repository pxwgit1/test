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
	//列出所有房间
	public ArrayList findAll(){
		RoomDao dao=new RoomDao();
		ArrayList rList=dao.findAll();
		return rList;
	}
	//列出所有房间类型
	public ArrayList AllType(){
		RoomDao dao=new RoomDao();
		ArrayList rList=dao.AllType();
		return rList;
	}
	//查找已预订的房间
	public PageModel findOrdered(PageModel pm){
		RoomDao dao=new RoomDao();
		 PageModel p=dao.findOrdered(pm);
		return p;
	}
	//查找未预订的房间
	public PageModel findEmpty(PageModel pm){
		RoomDao dao=new RoomDao();
		 PageModel p=dao.findEmpty(pm);
		return p;
	}
	//findbyPage，分页显示房间
		public PageModel findbyPage(PageModel pm){
			RoomDao dao=new RoomDao();
			PageModel p=dao.findbyPage(pm);
			return p;
		}
		//通过房间类型查找房间，并分页显示
		public PageModel findbyType(PageModel pm,String type){
			RoomDao dao=new RoomDao();
			PageModel p=dao.findbyType(pm,type);
			return p;
		}
		//将房间类型放在一个哈希表中
		public HashMap findType(){
			RoomDao dao=new RoomDao();
			HashMap type=dao.findType();
			return type;
		}
		//删除房间
		public int delete(Room r){
			RoomDao dao=new RoomDao();
			int ustate=dao.delete(r);
			return ustate;
		}
		//添加房间
		public int add(Room r){
			RoomDao dao=new RoomDao();
			int ustate=dao.add(r);
			return ustate;
		}
		//修改房间
		public int edit(Room r){
			RoomDao dao=new RoomDao();
			int ustate=dao.edit(r);
			return ustate;
		}
		//添加房间类型
		public int addType(roomType t){
			RoomDao dao=new RoomDao();
			int ustate=dao.addType(t);
			return ustate;
		}
		//修改房间类型
		public int editType(roomType t){
			RoomDao dao=new RoomDao();
			int ustate=dao.editType(t);
			return ustate;
		}
		//删除房间类型
		public int delType(roomType t){
			RoomDao dao=new RoomDao();
			int ustate=dao.delType(t);
			return ustate;
		}
		//修改某房间类型的图片
		public int editTphoto(roomType t){
			RoomDao dao=new RoomDao();
			int ustate=dao.editTphoto(t);
			return ustate;
		}
		//计算房间数
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
