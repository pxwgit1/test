package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import common.DBConnection;
import model.LvTargetusertongji;
import model.TargettoUser;
import model.Targetuserlianjie;
import model.target;

public class TargetDao {

	private Connection conn=DBConnection.getConn();  
    target tb_Img=null;  
    List<target> tb_Imgs=null;  
    /** 
     * 上传文件图片 
     * */  
    public void UpImg(target tb_Img) throws SQLException{  
        String sql="insert into target(targettitle,targeturl,targetcreatetime,targettype,fathertarget,flag,targetname,savetargetname,targetlevel,mincount,maxcount)values(?,?,?,?,?,?,?,?,?,?,?)";  
        PreparedStatement ptmt=conn.prepareStatement(sql);  
        ptmt.setString(1, tb_Img.getTargettitle()); 
        ptmt.setString(2, tb_Img.getTargeturl());  
        ptmt.setString(3, tb_Img.getTargetcreatetime());
        ptmt.setString(4, tb_Img.getTargettype());
        ptmt.setString(5, tb_Img.getFathertarget());
        ptmt.setString(6, tb_Img.getFlag());
        ptmt.setString(7, tb_Img.getTargetname());
        ptmt.setString(8, tb_Img.getSavetargetname());
        ptmt.setInt(9, tb_Img.getTargetlevel());
        ptmt.setDouble(10, tb_Img.getMincount());
        ptmt.setDouble(11, tb_Img.getMaxcount());
        ptmt.executeUpdate();  
    }
    @SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList findTargets() throws SQLException{
		ArrayList targetList=new ArrayList();
		try {
			String sql="select targetid,savetargetname,targetname,targettitle,targeturl,targetcreatetime,fathertarget,targettype,flag,targetlevel,mincount,maxcount from target";
			//String sql="select rtype,rprice,ravailable,rdescription from ROOMTYPE t";
			ResultSet rs=DBConnection.getRs(sql);
		
			while(rs.next()){
				target us=new target();
				
				us.setTargetid(Integer.parseInt(rs.getString("targetid")));
				us.setTargetname(rs.getString("targetname"));
				us.setSavetargetname(rs.getString("savetargetname"));
				us.setTargettitle(rs.getString("targettitle"));
				us.setTargeturl(rs.getString("targeturl"));
				us.setTargetcreatetime(rs.getString("targetcreatetime"));
				us.setTargettype(rs.getString("targettype"));
				us.setFlag(rs.getString("flag"));
				us.setFathertarget(rs.getString("fathertarget"));
				us.setTargetlevel(Integer.parseInt(rs.getString("targetlevel")));
				us.setMincount(Double.parseDouble(rs.getString("mincount")));
				us.setMaxcount(Double.parseDouble(rs.getString("maxcount")));
				targetList.add(us);
			
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return targetList;
		
	}
    
    @SuppressWarnings({ "unchecked", "rawtypes" })
   	public target findTargetById(String targetid) throws SQLException{
   		//ArrayList targetList=new ArrayList();
    	target us=new target();
   		PreparedStatement pstmt = null;
   		try {
   			Connection con = DBConnection.getConn();
   			String sql="select savetargetname,targetname,targettitle,targeturl,targetcreatetime,fathertarget,targettype,flag,targetlevel from target where targetid=?";
   			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(targetid));
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
   				us.setTargetname(rs.getString("targetname"));
   				us.setSavetargetname(rs.getString("savetargetname"));
   				us.setTargettitle(rs.getString("targettitle"));
   				us.setTargeturl(rs.getString("targeturl"));
   				us.setTargetcreatetime(rs.getString("targetcreatetime"));
   				us.setTargettype(rs.getString("targettype"));
   				us.setFlag(rs.getString("flag"));
   				us.setFathertarget(rs.getString("fathertarget"));
   				us.setTargetlevel(Integer.parseInt(rs.getString("targetlevel")));
   			}
   		
   		} catch (SQLException e) {
   			e.printStackTrace();
   		}
   		finally{DBConnection.close();}
   		return us;
   	}
    @SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList findTargetByIdcp(String stgid) throws SQLException{
		ArrayList targetList=new ArrayList();
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql="select savetargetname,targetname,targettitle,targeturl,targetcreatetime,fathertarget,targettype,flag,targetlevel from target where targetid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(stgid));
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				target ts=new target();
				ts.setSavetargetname(rs.getString("savetargetname"));
				ts.setTargetname(rs.getString("targetname"));
				ts.setTargettitle(rs.getString("targettitle"));
				ts.setTargeturl(rs.getString("targeturl"));
				ts.setTargetcreatetime(rs.getString("targetcreatetime"));
				ts.setFathertarget(rs.getString("fathertarget"));
				ts.setTargettype(rs.getString("targettype"));
				ts.setFlag(rs.getString("flag"));
				ts.setTargetlevel(Integer.parseInt(rs.getString("targetlevel")));
				targetList.add(ts);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return targetList;
	}
    /** 
     *得到所有数据 
     * */  
    public List<target> AllImg() throws SQLException{  
        tb_Imgs=new ArrayList<target>();  
        String sql="select * from target";  
        PreparedStatement ptmt=conn.prepareStatement(sql);  
        ResultSet rs=ptmt.executeQuery();  
        while(rs.next()){  
            tb_Img=new target();  
            tb_Img.setTargetid(rs.getInt("id"));  
            tb_Img.setTargettitle(rs.getString("flieName"));  
            tb_Img.setTargeturl(rs.getString("fliePath"));  
            tb_Img.setTargetcreatetime(rs.getString("date"));  
            tb_Imgs.add(tb_Img);  
        }  
        return tb_Imgs;  
    }  
    /** 
     *下载查看文件  
     * */  
    public List<target> FindImg(String context) throws SQLException{  
        tb_Imgs=new ArrayList<target>();  
        String sql="select * from Img where flieName like '%"+context +"%' or fliePath like '%"+context +"%' or id like '%"+context +"%'";  
        PreparedStatement ptmt=conn.prepareStatement(sql);  
        ResultSet rs=ptmt.executeQuery();  
        while(rs.next()){  
            tb_Img=new target();  
            tb_Img.setTargetid(rs.getInt("id"));  
            tb_Img.setTargettitle(rs.getString("flieName"));  
            tb_Img.setTargeturl(rs.getString("fliePath"));  
            tb_Imgs.add(tb_Img);  
        }  
        return tb_Imgs;  
    }  

    public int uptarget(target t) {
		int state=0; 
        PreparedStatement pstmt = null;  
        try {  
            Connection con=DBConnection.getConn();  
            String sql="insert into target values(p_id_seq.nextval,?,?,?)";  
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, t.getTargettitle());
            pstmt.setString(2, t.getTargeturl());
            pstmt.setInt(3, t.getTargetlevel());
            state=pstmt.executeUpdate(); 
        } catch (Exception e){  
           e.printStackTrace();
        }finally{  
           DBConnection.close();
        }  
        return state;
	}
	public int delete(String targetid) {
		int ustate=0;
		PreparedStatement pstmt=null;
		try {
			Connection con = DBConnection.getConn();
			String sql = "delete from target where targetid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,targetid);
			ustate = pstmt.executeUpdate();
			
			}
		catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close();
		}
		return ustate;
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList findTargets2(target tg) throws SQLException, ParseException{
		ArrayList targetList2=new ArrayList();
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql="select t.targetid,t.savetargetname,t.targetname,t.targettitle,t.targeturl,t.targetcreatetime,t.fathertarget,t.targettype,t.mincount,t.maxcount,t.targetlevel,t.flag,tu.fptime from target t,targettouser tu where t.targetlevel=? and t.targetid = tu.tutargetid";
			//String sql="select rtype,rprice,ravailable,rdescription from ROOMTYPE t";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tg.getTargetlevel());
			ResultSet rs=pstmt.executeQuery();
		
			while(rs.next()){
				target us=new target();
				us.setTargetid(Integer.parseInt(rs.getString("targetid")));
				us.setTargetname(rs.getString("targetname"));
				us.setSavetargetname(rs.getString("savetargetname"));
				us.setTargettitle(rs.getString("targettitle"));
				us.setTargeturl(rs.getString("targeturl"));
				us.setTargetcreatetime(rs.getString("targetcreatetime"));
				us.setFptime(rs.getString("fptime"));
				us.setTargettype(rs.getString("targettype"));
				us.setMincount(Double.parseDouble(rs.getString("mincount")));
				us.setMaxcount(Double.parseDouble(rs.getString("maxcount")));
				us.setTargetlevel(Integer.parseInt(rs.getString("targetlevel")));
				us.setFlag(rs.getString("flag"));
				us.setFathertarget(rs.getString("fathertarget"));
				targetList2.add(us);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return targetList2;
		
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList findpsjgTargets(target tg) throws SQLException{
		ArrayList targetList3=new ArrayList();
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql="select tu.targetuserid,tu.tutargetid,t.targettitle,t.targetlevel,tu.tuserid,tu.targetcount,t.targeturl,t.targettype,t.flag,t.targetname,t.savetargetname,t.fathertarget,u.UserName,u.flag from targettouser tu,target t,users u where tu.tutargetid=t.targetid and tu.tuserid=u.UserId and t.targetlevel=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tg.getTargetlevel());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Targetuserlianjie tg2 =new Targetuserlianjie();
				tg2.setTargetuserid(Integer.parseInt(rs.getString("targetuserid")));
				tg2.setTutargetid(Integer.parseInt(rs.getString("tutargetid")));
				tg2.setTuserid(Integer.parseInt(rs.getString("tuserid")));
				tg2.setTargetcount(Double.parseDouble(rs.getString("targetcount")));
				tg2.setTargettitle(rs.getString("targettitle"));
				tg2.setTargeturl(rs.getString("targeturl"));
				tg2.setTargettype(rs.getString("targettype"));
				tg2.setFlag(rs.getString("flag"));
				tg2.setTargetname(rs.getString("targetname"));
				tg2.setSavetargetname(rs.getString("savetargetname"));
				tg2.setTargetlevel(Integer.parseInt(rs.getString("targetlevel")));
				tg2.setFathertarget(rs.getString("fathertarget"));
				tg2.setUsername(rs.getString("username"));
				targetList3.add(tg2);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return targetList3;
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList findTargetsgj(target tgtj) {
		ArrayList targetListtj=new ArrayList();
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql="select tj.tjtargetuserid,tj.tjtargetid,t.targettitle,t.targetlevel,tj.sum,tj.tjtargetlevel,t.targeturl,t.targettype,t.flag,t.targetname,t.savetargetname,t.fathertarget,t.targeturl from targetusertongji tj,target t where tj.tjtargetid=t.targetid and t.targetlevel=? and tj.tjtargetuserid in(select max(tjtargetuserid) from targetusertongji group by tjtargetid)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tgtj.getTargetlevel());
			
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				LvTargetusertongji tg2 =new LvTargetusertongji();
				tg2.setTjtargetuser(Integer.parseInt(rs.getString("tjtargetuserid")));
				tg2.setTargetid(Integer.parseInt(rs.getString("tjtargetid")));
				tg2.setTargettitle(rs.getString("targettitle"));
				tg2.setTargetlevel(Integer.parseInt(rs.getString("tjtargetlevel")));
				tg2.setSum(Double.parseDouble(rs.getString("sum")));
				tg2.setTargettype(rs.getString("targettype"));
				tg2.setFlag(rs.getString("flag"));
				tg2.setTargetname(rs.getString("targetname"));
				tg2.setSavetargetname(rs.getString("savetargetname"));
				tg2.setFathertarget(rs.getString("fathertarget"));
				tg2.setTargeturl(rs.getString("targeturl"));
				targetListtj.add(tg2);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return targetListtj;
	}
	@SuppressWarnings("unchecked")
	public ArrayList findchildpsjgTargets(target tg) {
		ArrayList childtargetListtj=new ArrayList();
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql="select tj.tjtargetuserid,tj.tjtargetid,t.targettitle,t.targetlevel,tj.sum,tj.tjtargetlevel,t.targeturl,t.targettype,t.flag,t.targetname,t.savetargetname,t.fathertarget,t.targeturl from targetusertongji tj,target t where tj.tjtargetid=t.targetid and t.fathertarget=? and tj.tjtargetuserid in(select max(tjtargetuserid) from targetusertongji group by tjtargetid)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tg.getFathertarget());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				LvTargetusertongji tg2 =new LvTargetusertongji();
				tg2.setTjtargetuser(Integer.parseInt(rs.getString("tjtargetuserid")));
				tg2.setTargetid(Integer.parseInt(rs.getString("tjtargetid")));
				tg2.setTargettitle(rs.getString("targettitle"));
				tg2.setTargetlevel(Integer.parseInt(rs.getString("tjtargetlevel")));
				tg2.setSum(Double.parseDouble(rs.getString("sum")));
				tg2.setTargettype(rs.getString("targettype"));
				tg2.setFlag(rs.getString("flag"));
				tg2.setTargetname(rs.getString("targetname"));
				tg2.setSavetargetname(rs.getString("savetargetname"));
				tg2.setFathertarget(rs.getString("fathertarget"));
				System.out.println("fatherlength==="+rs.getString("fathertarget").length());
				tg2.setTargeturl(rs.getString("targeturl"));
				childtargetListtj.add(tg2);
			
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return childtargetListtj;
	}
	@SuppressWarnings("unchecked")
	public ArrayList findchildpsjgTargetsByfatherID(String string) {
		ArrayList childtargetListtj=new ArrayList();
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql="select tj.tjtargetuserid,tj.tjtargetid,t.targettitle,t.targetlevel,tj.sum,tj.tjtargetlevel,t.targeturl,t.targettype,t.flag,t.targetname,t.savetargetname,t.fathertarget,t.targeturl from targetusertongji tj,target t where tj.tjtargetid=t.targetid and t.fathertarget=? and tj.tjtargetuserid in(select max(tjtargetuserid) from targetusertongji group by tjtargetid)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, string);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				LvTargetusertongji tg2 =new LvTargetusertongji();
				tg2.setTjtargetuser(Integer.parseInt(rs.getString("tjtargetuserid")));
				tg2.setTargetid(Integer.parseInt(rs.getString("tjtargetid")));
				tg2.setTargettitle(rs.getString("targettitle"));
				tg2.setTargetlevel(Integer.parseInt(rs.getString("tjtargetlevel")));
				tg2.setSum(Double.parseDouble(rs.getString("sum")));
				tg2.setTargettype(rs.getString("targettype"));
				tg2.setFlag(rs.getString("flag"));
				tg2.setTargetname(rs.getString("targetname"));
				tg2.setSavetargetname(rs.getString("savetargetname"));
				tg2.setFathertarget(rs.getString("fathertarget"));
				tg2.setTargeturl(rs.getString("targeturl"));
				childtargetListtj.add(tg2);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{DBConnection.close();}
		return childtargetListtj;
	}
}
