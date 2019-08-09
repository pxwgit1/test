package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import common.DBConnection;
import model.User;

public class UserDao {
	@SuppressWarnings({ "rawtypes", "static-access", "unchecked" })
	//登录
	public ArrayList signIn(User u) {
		ArrayList uList = new ArrayList();
		try {
			String sql = "select role from users where UserName='%s'and Password='%s'";
			sql = sql.format(sql, u.getUsername(), u.getPassword());
			System.out.println("sql:" + sql);
			ResultSet rs = DBConnection.getRs(sql);
			while (rs.next()) {
				User u1 = new User();
				u1.setRole(rs.getString("role"));
				uList.add(u1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return uList;
	}
//增加专家信息
	public int signUp(User u) throws ParseException {
		int ustate = 0;
		@SuppressWarnings("unused")
		String cp = "nocp";
		Date date = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String sdate = format1.format(date.getTime());
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql = "insert into users values(?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, u.getUserid());
			pstmt.setString(2, u.getUsername());
			pstmt.setString(3, u.getPassword());
			pstmt.setString(4, u.getEmail());
			pstmt.setString(5, u.getRole());
			pstmt.setInt(6, 0);
			pstmt.setInt(7, 0);
			pstmt.setString(8, "未催评");
			pstmt.setString(9, sdate);

			ustate = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return ustate;
	}
//分配指标的时候查询选择专家
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList findUsers() {
		ArrayList userList = new ArrayList();
		try {
			String sql = "select userid,username,email,flag,fogetpass from users where role=0";
			ResultSet rs = DBConnection.getRs(sql);

			while (rs.next()) {
				User us = new User();

				us.setUserid(Integer.parseInt(rs.getString("userid")));
				us.setUsername(rs.getString("username"));
				us.setEmail(rs.getString("email"));
				us.setFlag(Integer.parseInt(rs.getString("flag")));
				us.setFlag(Integer.parseInt(rs.getString("fogetpass")));
				userList.add(us);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return userList;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public ArrayList findUsersByName(String uname) {
		ArrayList userList1 = new ArrayList();
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql = "select userid,email,flag,fogetpass from users where role=0 and username=?";
			pstmt = con.prepareStatement(sql);
			System.out.println("USERDAO==findUsersByName--uname=="+uname);
			pstmt.setString(1, uname);
			ResultSet rs=pstmt.executeQuery();
			while (rs.next()) {
				User us = new User();
				us.setUserid(Integer.parseInt(rs.getString("userid")));
				us.setEmail(rs.getString("email"));
				us.setFlag(Integer.parseInt(rs.getString("flag")));
				us.setFlag(Integer.parseInt(rs.getString("fogetpass")));
				userList1.add(us);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return userList1;
	}
	
	// add
	public int add(User u) {
		int ustate = 0;
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql = "insert into users values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, u.getUsername());
			pstmt.setString(2, u.getPassword());
			pstmt.setString(3, u.getEmail());
			pstmt.setInt(4, u.getFlag());
			pstmt.setInt(5, u.getFogetpass());
			ustate = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return ustate;
	}

	public int delete(String userid) {
		int ustate = 0;
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql = "delete from users where userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			ustate = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return ustate;
	}

	public int cuipingUp(User u) {
		int ustate = 0;
		Calendar date = Calendar.getInstance();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String cpdt = format1.format(date.getTime());
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql = "update users set flag=?,cuipingcreatetime=?,cpqingk=? where userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, u.getFlag());
			pstmt.setString(2, cpdt);
			pstmt.setString(3, "已催评");
			pstmt.setInt(4, u.getUserid());
			ustate = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return ustate;
	}

	public int Checkuser(String us) {
		int ustate = 0;
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql = "select userid,email from users where username=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, us);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				ustate = 1;
			}else{
				ustate = 0;
			}
			System.out.println(rs);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return ustate;
	}

	public int setForgetpsw(User u) {
		int ustate = 0;
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql = "update users set fogetpass=? where username=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, 1);
			pstmt.setString(2, u.getUsername());
			ustate = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return ustate;
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList FindForgetpassword() {
		ArrayList forgetpasswordList1 = new ArrayList();
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql = "select userid,username,email,flag,fogetpass,username from users where fogetpass=1";
			pstmt = con.prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			while (rs.next()) {
				User us = new User();

				us.setUserid(Integer.parseInt(rs.getString("userid")));
				us.setUsername(rs.getString("username"));
				us.setEmail(rs.getString("email"));
				us.setFlag(Integer.parseInt(rs.getString("flag")));
				us.setFlag(Integer.parseInt(rs.getString("fogetpass")));
				us.setUsername(rs.getString("username"));
				forgetpasswordList1.add(us);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return forgetpasswordList1;
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList xianxcuipingUp(User u) {
		ArrayList xianxcuipuserList1 = new ArrayList();
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql = "select userid,email,flag,fogetpass,username from users where userid=?";
			pstmt = con.prepareStatement(sql);
			//System.out.println("USERDAO==findUsersByName--uname=="+uname);
			pstmt.setInt(1,u.getUserid());;
			ResultSet rs=pstmt.executeQuery();
			while (rs.next()) {
				User us = new User();

				us.setUserid(Integer.parseInt(rs.getString("userid")));
				us.setEmail(rs.getString("email"));
				us.setFlag(Integer.parseInt(rs.getString("flag")));
				us.setFlag(Integer.parseInt(rs.getString("fogetpass")));
				us.setUsername(rs.getString("username"));
				xianxcuipuserList1.add(us);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return xianxcuipuserList1;
	}

	public int Chongzhimm(User us) {
		int ustate = 0;
		PreparedStatement pstmt = null;
		try {
			Connection con = DBConnection.getConn();
			String sql = "update users set password=?,fogetpass=? where userid=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, us.getPassword());
			pstmt.setInt(2, 0);
			pstmt.setInt(3, us.getUserid());
			ustate = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close();
		}
		return ustate;
	}

}
