package service;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import dao.TargettoUserDao;
import model.TargettoUser;

public class TargettoUserService {

	public int saveCount(TargettoUser ts) {
		TargettoUserDao dao=new TargettoUserDao();
		int ustate=dao.saveCount(ts);
		return ustate;
	}

	public boolean findTargetuserById(TargettoUser ts) {
		// TODO Auto-generated method stub
		TargettoUserDao dao=new TargettoUserDao();
		boolean ustate=dao.findTargetuserById(ts);
		return ustate;
	}

	public ArrayList pingfenfindTargettouser(TargettoUser ts1) {
		TargettoUserDao dao=new TargettoUserDao();
		ArrayList ustates=dao.pingfenfindTargettouser(ts1);
		return ustates;
	}

	public int saveDistribute(TargettoUser ts) throws SQLException {
		TargettoUserDao dao=new TargettoUserDao();
		int ustate = 0;
		try {
			ustate = dao.saveDistribute(ts);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ustate;
	}

	public ArrayList searchtargetname(String searchname) {
		TargettoUserDao dao=new TargettoUserDao();
		ArrayList ustates=dao.searchtargetname(searchname);
		return ustates;
	}

}
