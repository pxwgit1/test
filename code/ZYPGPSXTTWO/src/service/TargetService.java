package service;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import dao.TargetDao;
import model.target;

public class TargetService {
	public int uptarget(target t) {
		TargetDao dao = new TargetDao();
		int state = dao.uptarget(t);
		return state;
	}

	public int delete(String targetid) {
		TargetDao dao=new TargetDao();
		int i=dao.delete(targetid);
		return i;
	}

	public ArrayList findTargets2(target tg) {
		TargetDao dao = new TargetDao();
		ArrayList targetList2 = null;
		try {
			try {
				targetList2 = dao.findTargets2(tg);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return targetList2;
	}

	public ArrayList findpsjgTargets(target tg) {
		TargetDao dao = new TargetDao();
		ArrayList targetList3 = null;
		try {
			targetList3 = dao.findpsjgTargets(tg);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return targetList3;
	}

	@SuppressWarnings("rawtypes")
	public ArrayList findTargetsgj(target tgtj) {
		TargetDao dao = new TargetDao();
		ArrayList targetListtj = null;
		targetListtj = dao.findTargetsgj(tgtj);
		return targetListtj;
	}

	public ArrayList findchildpsjgTargets(target tg) {
		TargetDao dao = new TargetDao();
		ArrayList targetListtj = null;
		targetListtj = dao.findchildpsjgTargets(tg);
		return targetListtj;
	}

	public ArrayList findchildpsjgTargetsByfatherID(String string) {
		TargetDao dao = new TargetDao();
		ArrayList targetListtj = null;
		targetListtj = dao.findchildpsjgTargetsByfatherID(string);
		return targetListtj;
	}

}
