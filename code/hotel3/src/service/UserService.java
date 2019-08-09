package service;

import java.util.ArrayList;
import java.util.HashMap;


import dao.UserDao;
import model.PageModel;
import model.TMessage;
import model.User;

public class UserService {
	public ArrayList signIn(User u){
		UserDao dao=new UserDao();
		ArrayList uList=dao.signIn(u);
		return uList;	
	}
	public int signUp(User u){
		UserDao dao=new UserDao();
		int ustate=dao.signUp(u);
		return ustate;
	}
	public PageModel findAllUser(PageModel pm){
		UserDao dao=new UserDao();
		PageModel p=dao.findAllUser(pm);
		return p;
	}
	public HashMap findRole(){
		UserDao dao=new UserDao();
		HashMap role=dao.findRole();
		return role;
	}
	
	public PageModel findCommon(PageModel pm){
		UserDao dao=new UserDao();
		PageModel p=dao.findCommon(pm);
		return p;
		
	}
	public PageModel findVip(PageModel pm){
		UserDao dao=new UserDao();
		PageModel p=dao.findVip(pm);
		return p;
		
	}
	public PageModel findManager(PageModel pm){
		UserDao dao=new UserDao();
		PageModel p=dao.findManager(pm);
		return p;
		
	}
	public PageModel findSuperManager(PageModel pm){
		UserDao dao=new UserDao();
		PageModel p=dao.findSuperManager(pm);
		return p;
	}
	public int add(User u){
		UserDao dao=new UserDao();
		int ustate=dao.add(u);
		return ustate;
	}
	public int delete(User u){
		UserDao dao=new UserDao();
		int ustate=dao.delete(u);
		return ustate;
	}
	public int edit(User u){
		UserDao dao=new UserDao();
		int ustate=dao.edit(u);
		return ustate;
	}
	public int countUser(){
		UserDao dao=new UserDao();
		int c=dao.countUser();
		return c;
	}
	public int countVip(){
		UserDao dao=new UserDao();
		int c=dao.countVip();
		return c;
	}
	public ArrayList findAllMeg(){
		UserDao dao=new UserDao();
		ArrayList leavemessageList=dao.findAllMeg();
		return leavemessageList;
	}
	public int updateMeg(TMessage tr)
	{
		UserDao dao=new UserDao();
		int i=dao.updateMeg(tr);
		return i;
	}
}
