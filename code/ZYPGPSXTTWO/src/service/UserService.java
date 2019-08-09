package service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.TargettoUserDao;
import dao.UserDao;
import model.PageModel;
import model.User;

public class UserService {
	@SuppressWarnings("rawtypes")
	public ArrayList signIn(User u){
		UserDao dao=new UserDao();
		ArrayList uList=dao.signIn(u);
		return uList;	
	}
	public int signUp(User u){
		UserDao dao=new UserDao();
		int ustate = 0;
		try {
			ustate = dao.signUp(u);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ustate;
	}
	
	
	public int add(User u){
		UserDao dao=new UserDao();
		int ustate=dao.add(u);
		return ustate;
	}
	
	public int delete(String userid) {
		UserDao dao=new UserDao();
		int i=dao.delete(userid);
		return i;
	}
	public int cuipingUp(User u) {
		UserDao dao=new UserDao();
		int i=dao.cuipingUp(u);
		return i;
	}
	public int Checkuser(String us) {
		UserDao dao=new UserDao();
		int i=dao.Checkuser(us);
		return i;
	}
	public int setForgetpsw(User u) {
		// TODO Auto-generated method stub
		UserDao dao=new UserDao();
		int i=dao.setForgetpsw(u);
		return i;
	}
	public ArrayList xianxcuipingUp(User u) {
		UserDao dao=new UserDao();
		ArrayList xianxcuipList=dao.xianxcuipingUp(u);
		return xianxcuipList;
	}
	public int Chongzhimm(User us) {
		UserDao dao=new UserDao();
		int ustate=dao.Chongzhimm(us);
		return ustate;
	}
	
}
