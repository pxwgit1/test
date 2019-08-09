package service;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.TargetDao;
import dao.TargetusertongjiDao;
import dao.UserDao;
import model.Targetusertongji;
import model.target;

public class TargetusertjService {

	public int savetj(Targetusertongji targetusertongji) {

		TargetusertongjiDao dao=new TargetusertongjiDao();
		int ustate=dao.savetj(targetusertongji);
		return ustate;
	}

	public ArrayList findTargets3(target tg) {
		TargetusertongjiDao dao=new TargetusertongjiDao();
		ArrayList targetList3 = null;
		targetList3 = dao.findTargets3(tg);
		return targetList3;
	}
	

}
