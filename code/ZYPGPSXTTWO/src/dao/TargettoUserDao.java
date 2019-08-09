package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import common.DBConnection;
import model.TargettoUser;
import model.Targetuserlianjie;


public class TargettoUserDao {
	//查看专家分配到的指标
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList FindTargettouserByloginId(String loginusid){
		ArrayList targettouserList=new ArrayList();
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql="select tu.targetuserid,tu.tutargetid,t.targettitle,t.targetlevel,tu.tuserid,tu.targetcount,t.targeturl,t.targettype,t.flag,t.targetname,t.savetargetname,t.fathertarget,u.UserName,u.flag from targettouser tu,target t,users u where tu.tutargetid=t.targetid and tu.tuserid=u.UserId and u.UserId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(loginusid));
			ResultSet rs=pstmt.executeQuery();
			System.out.println("rs"+rs);
			while(rs.next()){
				Targetuserlianjie ts =new Targetuserlianjie();
				ts.setTargetuserid(Integer.parseInt(rs.getString("targetuserid")));
				ts.setTutargetid(Integer.parseInt(rs.getString("tutargetid")));
				ts.setTargettitle(rs.getString("targettitle"));
				ts.setTargetname(rs.getString("targetname"));
				ts.setUsername(rs.getString("UserName"));
				ts.setTargettype(rs.getString("targettype"));
				ts.setFlag(rs.getString("flag"));
				ts.setSavetargetname(rs.getString("savetargetname"));
				ts.setTargeturl(rs.getString("targeturl"));
				ts.setTargetlevel(Integer.parseInt(rs.getString("targetlevel")));
				ts.setTuserid(Integer.parseInt(rs.getString("tuserid")));
				ts.setTargetcount(Double.parseDouble(rs.getString("targetcount")));
				ts.setFathertarget(rs.getString("fathertarget"));
				targettouserList.add(ts);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return targettouserList;
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList findAllTargettouser(){
		ArrayList targettouserList1=new ArrayList();
		try {
			String sql="select tu.targetuserid,tu.tutargetid,t.targettitle,tu.tuserid,tu.targetcount,t.targeturl,t.targettype,t.flag,t.targetname,t.savetargetname,t.targetlevel,t.fathertarget,u.UserName,u.flag from targettouser tu,target t,users u where tu.tutargetid=t.targetid and tu.tuserid=u.UserId";
			ResultSet rs=DBConnection.getRs(sql);
			while(rs.next()){
				Targetuserlianjie tg=new Targetuserlianjie();
				tg.setTargetuserid(Integer.parseInt(rs.getString("targetuserid")));
				tg.setTutargetid(Integer.parseInt(rs.getString("tutargetid")));
				tg.setTuserid(Integer.parseInt(rs.getString("tuserid")));
				tg.setTargetcount(Double.parseDouble(rs.getString("targetcount")));
				tg.setTargettitle(rs.getString("targettitle"));
				tg.setTargeturl(rs.getString("targeturl"));
				tg.setTargettype(rs.getString("targettype"));
				tg.setFlag(rs.getString("flag"));
				tg.setTargetname(rs.getString("targetname"));
				tg.setSavetargetname(rs.getString("savetargetname"));
				tg.setTargetlevel(Integer.parseInt(rs.getString("targetlevel")));
				tg.setFathertarget(rs.getString("fathertarget"));
				tg.setUsername(rs.getString("username"));
				targettouserList1.add(tg);
				System.out.println("dao-list=="+targettouserList1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return targettouserList1;
	}
	//管理员查找未评审的专家和指标
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList cuipingfindTargettouser() throws ParseException {
		ArrayList targettouserList=new ArrayList();
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String nowtimes = format1.format(date.getTime());
		java.util.Date nowtime = format1.parse(nowtimes);
		System.out.println("nowtime="+nowtime);
		try {
			String sql="select tu.targetuserid,t.targettitle,tu.tuserid,t.targeturl,t.targettype,t.flag,t.targetname,t.savetargetname,t.targetlevel,t.fathertarget,u.UserName,u.flag,u.cpqingk,u.cuipingcreatetime from targettouser tu,target t,users u where tu.targetcount=0 and tu.tutargetid=t.targetid and tu.tuserid=u.UserId";
			//String sql="select tu.targetuserid,t.targettitle,tu.tuserid,t.targeturl,t.targettype,t.flag,t.targetname,t.savetargetname,t.targetlevel,t.fathertarget,u.UserName,u.flag,u.cpqingk,u.cuipingcreatetime from targettouser tu,target t,users u where tu.targetcount=0 and tu.tutargetid=t.targetid and tu.tuserid=u.UserId";
			ResultSet rs=DBConnection.getRs(sql);
			while(rs.next()){
				String cpingtime = rs.getString("cuipingcreatetime");
				System.out.println("cpingtime="+cpingtime);
				Date cptime = null;
				cptime = format1.parse(cpingtime);
				System.out.println("cptime="+cptime);
				long shijiancha = (nowtime.getTime()-cptime.getTime())/1000;
				long day1=shijiancha/(24*3600);
				String day=Long.toString(day1);
				long hour1=shijiancha%(24*3600)/3600;
				String hour=Long.toString(hour1);
				long minute1=shijiancha%3600/60;
				String minute=Long.toString(minute1);
				long second1=shijiancha%(24*3600)%3600/60;
				String second=Long.toString(second1);
				System.out.println(""+day1+"天"+hour1+"小时"+minute1+"分"+second1+"秒");
				String cpsjcha = day+"天"+hour+"小时"+minute+"分"+second+"秒";
				System.out.println("cpsjcha="+cpsjcha);
				Targetuserlianjie tg=new Targetuserlianjie();
				tg.setTargetuserid(Integer.parseInt(rs.getString("targetuserid")));
				tg.setTuserid(Integer.parseInt(rs.getString("tuserid")));
				tg.setTargettitle(rs.getString("targettitle"));
				tg.setTargeturl(rs.getString("targeturl"));
				tg.setTargettype(rs.getString("targettype"));
				tg.setFlag(rs.getString("flag"));
				tg.setTargetname(rs.getString("targetname"));
				tg.setSavetargetname(rs.getString("savetargetname"));
				tg.setTargetlevel(Integer.parseInt(rs.getString("targetlevel")));
				tg.setFathertarget(rs.getString("fathertarget"));
				tg.setUsername(rs.getString("username"));
				tg.setCpqingk(rs.getString("cpqingk"));
				tg.setCuipingcreatetime(rs.getString("cuipingcreatetime"));
				tg.setCuipingshijiancha(cpsjcha);
				targettouserList.add(tg);
				System.out.println("dao-list=="+targettouserList);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return targettouserList;
	}

	//保存评分
	public int saveCount(TargettoUser ts) {
		int ustate = 0;
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql = "update targettouser set targetcount=? where tutargetid=? and tuserid=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setDouble(1, ts.getTargetcount());
			pstmt.setInt(2, ts.getTutargetid());
			pstmt.setInt(3, ts.getTuserid());
			ustate = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return ustate;
	}

	public boolean findTargetuserById(TargettoUser ts) {
		// TODO Auto-generated method stub
		boolean ustates = false;
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql="select count(*) from targettouser where targetuserid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ts.getTargetuserid());
			ustates = pstmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return ustates;
	}
	//去给指标评分
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList pingfenfindTargettouser(TargettoUser ts1){
		ArrayList targettouserList=new ArrayList();
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql="select tu.targetuserid,tu.tutargetid,t.targettitle,t.targetlevel,tu.tuserid,tu.targetcount,t.targeturl,t.targettype,t.flag,t.targetname,t.savetargetname,t.fathertarget,u.UserName,u.flag,t.mincount,t.maxcount from targettouser tu,target t,users u where tu.tutargetid=t.targetid and tu.tuserid=u.UserId and tu.targetuserid=? and tu.tuserid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ts1.getTargetuserid());
			pstmt.setInt(2, ts1.getTuserid());
			ResultSet rs=pstmt.executeQuery();
			System.out.println("rs"+rs);
			while(rs.next()){
				Targetuserlianjie ts =new Targetuserlianjie();
				ts.setTargetuserid(Integer.parseInt(rs.getString("targetuserid")));
				ts.setTutargetid(Integer.parseInt(rs.getString("tutargetid")));
				ts.setTargettitle(rs.getString("targettitle"));
				ts.setTargetname(rs.getString("targetname"));
				ts.setUsername(rs.getString("username"));
				ts.setTargettype(rs.getString("targettype"));
				ts.setFlag(rs.getString("flag"));
				ts.setSavetargetname(rs.getString("savetargetname"));
				ts.setTargeturl(rs.getString("targeturl"));
				ts.setTargetlevel(Integer.parseInt(rs.getString("targetlevel")));
				ts.setTuserid(Integer.parseInt(rs.getString("tuserid")));
				ts.setTargetcount(Double.parseDouble(rs.getString("targetcount")));
				ts.setFathertarget(rs.getString("fathertarget"));
				ts.setMincount(Double.parseDouble(rs.getString("mincount")));
				ts.setMaxcount(Double.parseDouble(rs.getString("maxcount")));
				targettouserList.add(ts);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return targettouserList;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList findAllTargettouser(TargettoUser ts1){
		ArrayList targettouserList=new ArrayList();
		try {
			String sql="select targetuserid,tutargetid,tutargettitle,tutargetname,tuserid,tusername,tutargettype,targetflag,tusavetargetname,tutargeturl,tutargetlevel,targetcount from targettouser";
			ResultSet rs=DBConnection.getRs(sql);
			System.out.println("rs"+rs);
			while(rs.next()){
				TargettoUser ts=new TargettoUser();
				ts.setTargetuserid(Integer.parseInt(rs.getString("targetuserid")));
				ts.setTutargetid(Integer.parseInt(rs.getString("tutargetid")));
				ts.setTutargettitle(rs.getString("tutargettitle"));
				ts.setTutargetname(rs.getString("tutargetname"));
				ts.setTuserid(Integer.parseInt(rs.getString("tuserid")));
				ts.setTusername(rs.getString("tusername"));
				ts.setTutargettype(rs.getString("tutargettype"));
				ts.setTargetflag(rs.getString("targetflag"));
				ts.setTusavetargetname(rs.getString("tusavetargetname"));
				ts.setTutargeturl(rs.getString("tutargeturl"));
				ts.setTutargetlevel(Integer.parseInt(rs.getString("tutargetlevel")));
				ts.setTargetcount(Double.parseDouble(rs.getString("targetcount")));
				targettouserList.add(ts);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return targettouserList;
	}
	//保存分配
	public int saveDistribute(TargettoUser ts) throws ParseException{
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String nowtimes = format1.format(date.getTime());
		java.util.Date nowtime = format1.parse(nowtimes);
		System.out.println("findTargets2=nowtime==="+ nowtime);
		int ustate = 0;
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			long pftime = nowtime.getTime();
			String pftimes = nowtimes;
			String sql = "insert into targettouser values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ts.getTargetuserid());
			pstmt.setInt(2, ts.getTutargetid());
			pstmt.setInt(3, ts.getTuserid());
			pstmt.setDouble(4,0);
			pstmt.setString(5, pftimes);
			ustate = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return ustate;
	}
//搜索指标
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList searchtargetname(String searchname) {
		ArrayList findtargetList=new ArrayList();
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql="select tu.targetuserid,tu.tutargetid,t.targettitle,t.targetlevel,tu.tuserid,tu.targetcount,t.targeturl,t.targettype,t.flag,t.targetname,t.savetargetname,t.fathertarget,u.UserName,u.flag from targettouser tu,target t,users u where tu.tutargetid=t.targetid and tu.tuserid=u.UserId and t.targettype like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+searchname+"%");//  "‘%"+name+"%’"
			ResultSet rs=pstmt.executeQuery();
			System.out.println("rs"+rs);
			while(rs.next()){
				Targetuserlianjie ts =new Targetuserlianjie();
				ts.setTargetuserid(Integer.parseInt(rs.getString("targetuserid")));
				ts.setTutargetid(Integer.parseInt(rs.getString("tutargetid")));
				ts.setTargettitle(rs.getString("targettitle"));
				ts.setTargetname(rs.getString("targetname"));
				ts.setUsername(rs.getString("username"));
				ts.setTargettype(rs.getString("targettype"));
				ts.setFlag(rs.getString("flag"));
				ts.setSavetargetname(rs.getString("savetargetname"));
				ts.setTargeturl(rs.getString("targeturl"));
				ts.setTargetlevel(Integer.parseInt(rs.getString("targetlevel")));
				ts.setTuserid(Integer.parseInt(rs.getString("tuserid")));
				ts.setTargetcount(Double.parseDouble(rs.getString("targetcount")));
				ts.setFathertarget(rs.getString("fathertarget"));
				findtargetList.add(ts);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return findtargetList;
	}
	//专家查看催评信息
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList FindcuipxinxiByloginId(String loginusid){
		ArrayList cuipxinxList=new ArrayList();
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql="select tu.targetuserid,tu.tutargetid,t.targettitle,t.targetlevel,tu.tuserid,tu.targetcount,t.targeturl,t.targettype,t.flag,t.targetname,t.savetargetname,t.fathertarget,u.UserName,u.flag,u.cpqingk,u.cuipingcreatetime from targettouser tu,target t,users u where tu.tutargetid=t.targetid and u.flag=tu.targetuserid and tu.tuserid=u.UserId and u.UserId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(loginusid));
			ResultSet rs=pstmt.executeQuery();
			System.out.println("rs"+rs);
			while(rs.next()){
				Targetuserlianjie ts =new Targetuserlianjie();
				ts.setTargetuserid(Integer.parseInt(rs.getString("targetuserid")));
				ts.setTutargetid(Integer.parseInt(rs.getString("tutargetid")));
				ts.setTargettitle(rs.getString("targettitle"));
				ts.setTargetname(rs.getString("targetname"));
				System.out.println("rs.getString=="+rs.getString("targetname"));
				ts.setUsername(rs.getString("UserName"));
				ts.setTargettype(rs.getString("targettype"));
				ts.setFlag(rs.getString("flag"));
				ts.setSavetargetname(rs.getString("savetargetname"));
				ts.setTargeturl(rs.getString("targeturl"));
				ts.setTargetlevel(Integer.parseInt(rs.getString("targetlevel")));
				ts.setTuserid(Integer.parseInt(rs.getString("tuserid")));
				ts.setTargetcount(Double.parseDouble(rs.getString("targetcount")));
				ts.setFathertarget(rs.getString("fathertarget"));
				ts.setCpqingk(rs.getString("cpqingk"));
				ts.setCuipingcreatetime(rs.getString("cuipingcreatetime"));
				cuipxinxList.add(ts);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return cuipxinxList;
	}

}
