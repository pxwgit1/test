package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import common.DBConnection;
import model.LvTargetusertongji;
import model.Targetusertongji;
import model.target;
public class TargetusertongjiDao {
	public int savetj(Targetusertongji targetusertongji){
		int ustate = 0;
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql = "insert into targetusertongji values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,targetusertongji.getTjtargetuserid());
			pstmt.setInt(2, targetusertongji.getTjtargetid());
			pstmt.setInt(3, targetusertongji.getTjtargetlevel());
			pstmt.setDouble(4, targetusertongji.getSum());
			ustate = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return ustate;
	}
	@SuppressWarnings({ "rawtypes", "unchecked"})
	public ArrayList findTargets3(target tg) {
		ArrayList targetList3=new ArrayList();
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql="select tu.tjtargetuserid,tu.tjtargetid,t.targettitle,t.targetlevel,tu.tjtargetlevel,t.targeturl,t.targettype,t.flag,t.targetname,t.savetargetname,t.fathertarget,t.targeturl from targetusertongji tu,target t where tu.tjtargetid=t.targetid and t.targetlevel=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tg.getTargetlevel());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				LvTargetusertongji tg2 =new LvTargetusertongji();
				tg2.setTjtargetuser(Integer.parseInt(rs.getString("tjtargetuserid")));
				tg2.setTargetid(Integer.parseInt(rs.getString("tjtargetid")));
				tg2.setTargettitle(rs.getString("targettitle"));
				tg2.setTargetlevel(Integer.parseInt(rs.getString("tjtargetlevel")));
				tg2.setTargettype(rs.getString("targettype"));
				tg2.setFlag(rs.getString("flag"));
				tg2.setTargetname(rs.getString("targetname"));
				tg2.setSavetargetname(rs.getString("savetargetname"));
				tg2.setFathertarget(rs.getString("fathertarget"));
				tg2.setTargeturl(rs.getString("targeturl"));
				targetList3.add(tg2);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return targetList3;
	}
}
