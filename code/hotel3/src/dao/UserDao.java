package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import common.DBConnection;
import common.StringFomat;
import model.PageModel;
import model.Room;
import model.TMessage;
import model.User;

public class UserDao {
	//登录
	public ArrayList signIn(User u){
		ArrayList uList=new ArrayList();
		
		try{
			//System.out.println(u.getUname());
			//System.out.println(u.getUpwd());
			String sql="select roleID from users where uname='%s'and upwd='%s'";
			sql=sql.format(sql,u.getUname(),u.getUpwd());
			//System.out.println("sql:"+sql);
			ResultSet rs=DBConnection.getRs(sql);
			while(rs.next()){
				User  u1=new User();
				u1.setRole(rs.getString("roleID"));
				System.out.println("dao:"+rs.getString("roleID"));
				uList.add(u1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBConnection.close();
		}
		return uList;
	}
	//注册
	public int signUp(User u){
		int ustate=0;
		PreparedStatement pstmt=null;
		try{
			Connection con=DBConnection.getConn();
			String sql="insert into users values(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, u.getUname());
			pstmt.setString(2, u.getUpwd());
			pstmt.setString(3, u.getRelName());
			pstmt.setString(4, u.getTelNum());
			pstmt.setString(5, StringFomat.getUtf8(u.getGender()));
			pstmt.setString(6, u.getEmail());
			pstmt.setString(7, u.getRole());
			ustate=pstmt.executeUpdate();		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close();
		}
		return ustate;
	}
	
	//findAll users
	public PageModel findAllUser(PageModel pm){
		ArrayList uList=new ArrayList();
		try{
			String sql="select u.uName,u.uPwd,u.relName,u.telNum,u.gender,u.email,r.roleName as role from users u, role r where u.roleID=r.roleID(+)";
			String sql1="select count(*) from users u,role r where u.roleID=r.roleID(+)";
			String sql2="select * from "+
					"(select a.*,rownum rn from (%s) a "
					+ "where rownum<=%s*%s)"+
					" where rn>=(%s-1)*%s+1";
			
			ResultSet rs=DBConnection.getRs(sql1);
			while (rs.next()) {
				int rows=rs.getInt(1);
				int totalPages=0;
				if(rows%pm.getPageSize()==0)
					totalPages=rows/pm.getPageSize();
				else totalPages=rows/pm.getPageSize()+1;
				pm.setRows(rows);
				pm.setTotalPages(totalPages);
			}
			DBConnection.close();			
			sql2=sql2.format(sql2, sql,pm.getCurrentPage(),pm.getPageSize(),pm.getCurrentPage(),pm.getPageSize());			
	//System.out.println(sql2);
	ResultSet rs1=DBConnection.getRs(sql2);
	while(rs1.next()){
		User u=new User();
		u.setUname(rs1.getString("uname"));
		u.setUpwd(rs1.getString("upwd"));
		u.setRelName(rs1.getString("relName"));
		u.setTelNum(rs1.getString("telNum"));
		u.setGender(rs1.getString("gender"));
		u.setEmail(rs1.getString("email"));
		u.setRole(rs1.getString("role"));
		uList.add(u);
	}
	}catch(Exception e){e.printStackTrace();}
	finally{DBConnection.close();}
		pm.setRList(uList);
		return pm;
	}
	
	
	//找出所有用户角色
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public HashMap findRole(){
		HashMap role=new HashMap();
		try{
			String sql="select * from role";
			ResultSet rs=DBConnection.getRs(sql);
			while(rs.next()){
				role.put(rs.getString("roleID"), rs.getString("roleName"));
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close();
		}
		return role;
	}
	

	//findCommon users列出普通用户
		@SuppressWarnings({ "static-access", "rawtypes", "unchecked" })
		public PageModel findCommon(PageModel pm){
			ArrayList uList=new ArrayList();
			try{
				String sql="select u.uName,u.uPwd,u.relName,u.telNum,u.gender,u.email,r.roleName as role from users u, role r where u.roleID=r.roleID(+) and u.roleID=3";
				String sql1="select count(*) from users u,role r where u.roleID=r.roleID(+) and u.roleID=3";
				String sql2="select * from "+
						"(select a.*,rownum rn from (%s) a "
						+ "where rownum<=%s*%s)"+
						" where rn>=(%s-1)*%s+1";
				
				ResultSet rs=DBConnection.getRs(sql1);
				while (rs.next()) {
					int rows=rs.getInt(1);
					int totalPages=0;
					if(rows%pm.getPageSize()==0)
						totalPages=rows/pm.getPageSize();
					else totalPages=rows/pm.getPageSize()+1;
					pm.setRows(rows);
					pm.setTotalPages(totalPages);
				}
				DBConnection.close();
				
				sql2=sql2.format(sql2, sql,pm.getCurrentPage(),pm.getPageSize(),pm.getCurrentPage(),pm.getPageSize());
				
		//System.out.println(sql2);
		ResultSet rs1=DBConnection.getRs(sql2);
		while(rs1.next()){
			User u=new User();
			u.setUname(rs1.getString("uName"));
			u.setUpwd(rs1.getString("uPwd"));
			u.setRelName(rs1.getString("relName"));
			u.setTelNum(rs1.getString("telNum"));
			u.setGender(rs1.getString("gender"));
			u.setEmail(rs1.getString("email"));
			u.setRole(rs1.getString("role"));
			uList.add(u);
		}
		}catch(Exception e){e.printStackTrace();}
		finally{DBConnection.close();}
			pm.setRList(uList);
			return pm;
		}
		
		
		//findVip users列出Vip用户
		@SuppressWarnings({ "static-access", "rawtypes", "unchecked" })
		public PageModel findVip(PageModel pm){
			ArrayList uList=new ArrayList();
			try{
				String sql="select u.uName,u.uPwd,u.relName,u.telNum,u.gender,u.email,r.roleName as role from users u, role r where u.roleID=r.roleID(+) and u.roleID=2";
				String sql1="select count(*) from users u,role r where u.roleID=r.roleID(+) and u.roleID=2";
				String sql2="select * from "+
						"(select a.*,rownum rn from (%s) a "
						+ "where rownum<=%s*%s)"+
						" where rn>=(%s-1)*%s+1";
				
				ResultSet rs=DBConnection.getRs(sql1);
				while (rs.next()) {
					int rows=rs.getInt(1);
					int totalPages=0;
					if(rows%pm.getPageSize()==0)
						totalPages=rows/pm.getPageSize();
					else totalPages=rows/pm.getPageSize()+1;
					pm.setRows(rows);
					pm.setTotalPages(totalPages);
				}
				DBConnection.close();
				
				sql2=sql2.format(sql2, sql,pm.getCurrentPage(),pm.getPageSize(),pm.getCurrentPage(),pm.getPageSize());
				
		//System.out.println(sql2);
		ResultSet rs1=DBConnection.getRs(sql2);
		while(rs1.next()){
			User u=new User();
			u.setUname(rs1.getString("uName"));
			u.setUpwd(rs1.getString("uPwd"));
			u.setRelName(rs1.getString("relName"));
			u.setTelNum(rs1.getString("telNum"));
			u.setGender(rs1.getString("gender"));
			u.setEmail(rs1.getString("email"));
			u.setRole(rs1.getString("role"));
			uList.add(u);
		}
		}catch(Exception e){e.printStackTrace();}
		finally{DBConnection.close();}
			pm.setRList(uList);
			return pm;
		}
		
		//findManage users列出（普通）酒店管理员
			@SuppressWarnings({ "static-access", "rawtypes", "unchecked" })
			public PageModel findManager(PageModel pm){
				ArrayList uList=new ArrayList();
				try{
					String sql="select u.uName,u.uPwd,u.relName,u.telNum,u.gender,u.email,r.roleName as role from users u, role r where u.roleID=r.roleID(+) and u.roleID=1";
					String sql1="select count(*) from users u,role r where u.roleID=r.roleID(+) and u.roleID=1";
					String sql2="select * from "+
							"(select a.*,rownum rn from (%s) a "
							+ "where rownum<=%s*%s)"+
							" where rn>=(%s-1)*%s+1";
					
					ResultSet rs=DBConnection.getRs(sql1);
					while (rs.next()) {
						int rows=rs.getInt(1);
						int totalPages=0;
						if(rows%pm.getPageSize()==0)
							totalPages=rows/pm.getPageSize();
						else totalPages=rows/pm.getPageSize()+1;
						pm.setRows(rows);
						pm.setTotalPages(totalPages);
					}
					DBConnection.close();	
					sql2=sql2.format(sql2, sql,pm.getCurrentPage(),pm.getPageSize(),pm.getCurrentPage(),pm.getPageSize());
					
			//System.out.println(sql2);
			ResultSet rs1=DBConnection.getRs(sql2);
			while(rs1.next()){
				User u=new User();
				u.setUname(rs1.getString("uName"));
				u.setUpwd(rs1.getString("uPwd"));
				u.setRelName(rs1.getString("relName"));
				u.setTelNum(rs1.getString("telNum"));
				u.setGender(rs1.getString("gender"));
				u.setEmail(rs1.getString("email"));
				u.setRole(rs1.getString("role"));
				uList.add(u);
			}
			}catch(Exception e){e.printStackTrace();}
			finally{DBConnection.close();}
				pm.setRList(uList);
				return pm;
			}
			
			//findManage users列出超级管理员
			@SuppressWarnings({ "static-access", "rawtypes", "unchecked" })
			public PageModel findSuperManager(PageModel pm){
				ArrayList uList=new ArrayList();
				try{
					String sql="select u.uName,u.uPwd,u.relName,u.telNum,u.gender,u.email,r.roleName as role from users u, role r where u.roleID=r.roleID(+) and u.roleID=0";
					String sql1="select count(*) from users u,role r where u.roleID=r.roleID(+) and u.roleID=0";
					String sql2="select * from "+
							"(select a.*,rownum rn from (%s) a "
							+ "where rownum<=%s*%s)"+
							" where rn>=(%s-1)*%s+1";
					
					ResultSet rs=DBConnection.getRs(sql1);
					while (rs.next()) {
						int rows=rs.getInt(1);
						int totalPages=0;
						if(rows%pm.getPageSize()==0)
							totalPages=rows/pm.getPageSize();
						else totalPages=rows/pm.getPageSize()+1;
						pm.setRows(rows);
						pm.setTotalPages(totalPages);
					}
					DBConnection.close();	
					sql2=sql2.format(sql2, sql,pm.getCurrentPage(),pm.getPageSize(),pm.getCurrentPage(),pm.getPageSize());
					
			//System.out.println(sql2);
			ResultSet rs1=DBConnection.getRs(sql2);
			while(rs1.next()){
				User u=new User();
				u.setUname(rs1.getString("uName"));
				u.setUpwd(rs1.getString("uPwd"));
				u.setRelName(rs1.getString("relName"));
				u.setTelNum(rs1.getString("telNum"));
				u.setGender(rs1.getString("gender"));
				u.setEmail(rs1.getString("email"));
				u.setRole(rs1.getString("role"));
				uList.add(u);
			}
			}catch(Exception e){e.printStackTrace();}
			finally{DBConnection.close();}
				pm.setRList(uList);
				return pm;
			}
			
			//添加用户
			public int add(User u){
				int ustate=0;
				PreparedStatement pstmt=null;
				try{
					Connection con=DBConnection.getConn();
					String sql="insert into users values(?,?,?,?,?,?,?)";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, u.getUname());
					pstmt.setString(2, u.getUpwd());
					pstmt.setString(3, u.getRelName());
					pstmt.setString(4, u.getTelNum());
					pstmt.setString(5, u.getGender());
					pstmt.setString(6, u.getEmail());
					pstmt.setString(7, u.getRole());
					ustate=pstmt.executeUpdate();		
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					DBConnection.close();
				}
				return ustate;
			}
			//删除用户
			public int delete(User u){
				int ustate=0;
				PreparedStatement pstmt=null;
				try{
					Connection con=DBConnection.getConn();
					String sql="delete from users where uname=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, u.getUname());
					ustate=pstmt.executeUpdate();	
				}catch(Exception e){
					e.printStackTrace();
				}finally {
					DBConnection.close();
				}
				return ustate;
				
			}
			//修改用户基本信息
			public int edit(User u){
				int ustate=0;
				PreparedStatement pstmt=null;
				try{
					Connection con=DBConnection.getConn();
					String sql="update users set upwd=? relNum=? telNum=? gender=? email=? roleid=? where uname=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, u.getUpwd());
					pstmt.setString(2, u.getRelName());
					pstmt.setString(3, u.getTelNum());
					pstmt.setString(4, u.getGender());
					pstmt.setString(5, u.getEmail());
					pstmt.setString(6, u.getRole());
					pstmt.setString(7, u.getUname());
					ustate=pstmt.executeUpdate();		
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					DBConnection.close();
				}
				return ustate;
			}
			//计算注册人数
			public int countUser(){
				int c=0;
				try{  
					String sql="select count(*) from users where roleid>1";				
					ResultSet rs=DBConnection.getRs(sql);
					while (rs.next()) {
						c=rs.getInt(1);
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					DBConnection.close();
				}
				return c;
			}	   
			
			//计算会员人数
			public int countVip(){
				int c=0;
				try{  
					String sql="select count(*) from users where roleid=2";				
					ResultSet rs=DBConnection.getRs(sql);
					while (rs.next()) {
						c=rs.getInt(1);
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					DBConnection.close();
				}
				return c;
			}	  
			
			//查找所有留言
			public ArrayList findAllMeg(){   				
				ArrayList leavemessageList=new ArrayList();
				try {					
					String sql="select rtitle,rmessage from leavemessage ";
					//String sql="select s.rlevel,s.rmoney,s.livetime,s.outtime,s.num,s.tell from showroominfo s where s.tell='"+tel+"'";

					System.out.println(sql);
					ResultSet rs=DBConnection.getRs(sql);
					while(rs.next()){
						TMessage s=new TMessage();
						s.setRtitle(rs.getString("rtitle"));
						s.setRmessage(rs.getString("rmessage"));
						
						leavemessageList.add(s);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{DBConnection.close();}
				return leavemessageList;
			}
			
			public int updateMeg(TMessage tr) {
				int ustate=0;
				PreparedStatement pstmt=null;
				try {
					Connection con=DBConnection.getConn();
					pstmt=con.prepareStatement(
							"update leavemessage set rtitle=?,rmessage=?"
							+ "where rtitle=?");//更新表student 
					pstmt.setString(1,tr.getRtitle());
					pstmt.setString(2,tr.getRmessage());
					
					
					ustate = pstmt.executeUpdate();
					
					}
				catch (Exception e) {
					e.printStackTrace();
				}finally {
					DBConnection.close();
				}
				return ustate;
			}
	
}
