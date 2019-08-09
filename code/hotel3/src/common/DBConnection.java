package common;
import java.sql.*;
public class DBConnection {
	static Connection conn=null;
	static Statement stmt=null;
	static PreparedStatement pstmt=null;
	static ResultSet rs=null;
	static int i=0;
	@SuppressWarnings("finally")
	public static Connection getConn(){
	   	try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "system";
			String pwd = "123456";
			conn = DriverManager.getConnection(url, user, pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	   	finally{
	   		return conn;
	   	}
	}
	@SuppressWarnings("finally")
	public static Statement getStmt(){
		try {
			conn = getConn();
			stmt = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{return stmt;}
	}

	@SuppressWarnings("finally")
	public static ResultSet getRs(String sql){
		try {
			conn = getConn();
			stmt = conn.createStatement();
			rs=stmt.executeQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{return rs;}
	}
	@SuppressWarnings("finally")
	public static int update(String sql){
		try {
			conn = getConn();
			stmt = conn.createStatement();
			i=stmt.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{return i;}
	}
	
	public static void close(){
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

