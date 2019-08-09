package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBConnection;
import common.StringFomat;
import model.Order;
import model.PageModel;
import model.Room;

public class OrderDao {
	//分页显示所有的订单
	public PageModel findOrderList(PageModel pm){
		ArrayList oList=new ArrayList();
		try{			
			String sql="select o.orderid,o.uname,o.num,o.tel,o.livetime,o.outtime,o.ordertime,t.rtype as roomtype ,s.status as status from orderform o,roomtype t,orderstatus s where o.rtypeid=t.rtypeid(+) and o.status=s.statusid(+) order by orderid";
			String sql1="select count(*) from orderform o,roomType t where o.rtypeid=t.Rtypeid(+)";
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
			rs.close();
			DBConnection.close();
			
			sql2=sql2.format(sql2, sql,pm.getCurrentPage(),pm.getPageSize(),pm.getCurrentPage(),pm.getPageSize());
			//System.out.println(sql2);
			ResultSet rs1=DBConnection.getRs(sql2);
			while(rs1.next()){
				Order o=new Order();
				o.setOrderid(rs1.getInt(1));
				o.setUname(rs1.getString("uname"));
				o.setNum(rs1.getString("num"));
				o.setTel(rs1.getString("tel"));
				o.setLivetime(rs1.getDate("livetime"));
				o.setOuttime(rs1.getDate("outtime"));
				o.setOrdertime(rs1.getString("ordertime"));
				o.setRoomtype(rs1.getString("roomtype"));
				o.setStatus(rs1.getString("status"));
				oList.add(o);
			}			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close();
		}
		pm.setRList(oList);
		return pm;
	}
	
	//删除订单
	public int del(Order o){
		int state=0;
		PreparedStatement pstmt=null;
		try{
			Connection con = DBConnection.getConn();
			String sql="delete from orderform where orderid=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, o.getOrderid());
			state=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close();
		}
		return state;
	}
	
	//添加订单
	public int add(Order o){
		int state=0;
		PreparedStatement pstmt=null;
		try{
			Connection con=DBConnection.getConn();
			String sql="insert into orderform values(order_id_seq.nextval,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, o.getUname());			
			pstmt.setString(2,o.getNum());
			pstmt.setString(3, o.getTel());			
			pstmt.setDate(4, (Date) o.getLivetime());
			 System.out.println("daoLTime:"+(Date) o.getLivetime());
			pstmt.setDate(5, (Date) o.getOuttime());
			 System.out.println("daoOTime:"+(Date) o.getOuttime());
			pstmt.setString(6, o.getOrdertime());
			pstmt.setString(7, o.getRoomtype());
			pstmt.setString(8, o.getStatus());
			state=pstmt.executeUpdate();			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close();
		}
		return state;
	}
	
	//修改订单
	
		//计算全 年订单数量、全年销售额（每年）
		public ArrayList orderStatistics(){
			ArrayList oList=new ArrayList();
			try{
				String sql="select substr(o.ordertime,1,4) as year, sum(to_number(o.num)*to_number(t.rprice))as allsale,count(*) as allorder from orderform o,roomtype t  where o.rtypeid=t.rtypeid group by substr(ordertime,1,4) order by substr(ordertime,1,4)";				
				ResultSet rs=DBConnection.getRs(sql);
				while (rs.next()) {
					Order o =new Order();
					o.setYear(rs.getString(1));
				    o.setAllSale(rs.getInt(2));
					o.setAllOrder(rs.getInt(3));
					oList.add(o);
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				DBConnection.close();
			}
			return oList;
		}
		
		//用户下订单后，通过用户名列出其订单(用户)
		public ArrayList findOrderbyName(String uname){
			ArrayList oList=new ArrayList();
			try{  
				String sql="select o.orderid,o.uname,o.num,o.tel,o.livetime,o.outtime,o.ordertime,t.rtype as roomtype, t.rprice as rprice from orderform o,roomtype t where o.rtypeid=t.rtypeid(+) and o.uname='"+uname+"'";				
				ResultSet rs=DBConnection.getRs(sql);
				while (rs.next()) {
					Order o =new Order();
					o.setOrderid(rs.getInt(1));
					o.setUname(rs.getString("uname"));
					o.setNum(rs.getString("num"));
					o.setTel(rs.getString("tel"));
					o.setLivetime(rs.getDate("livetime"));
					o.setOuttime(rs.getDate("outtime"));
					o.setOrdertime(rs.getString("ordertime"));
					o.setRoomtype(rs.getString("roomtype"));
					o.setRprice(rs.getString("rprice"));
					oList.add(o);
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				DBConnection.close();
			}
			return oList;
		}
		
		//用户修改订单
		public int update(Order o){
			int state=0;
			PreparedStatement pstmt=null;
			try{
				Connection con=DBConnection.getConn();
				String sql="update orderform set num=? ,tel=? , livetime=?, outtime=? ,ordertime=? where orderid=?";
				pstmt=con.prepareStatement(sql);			
				pstmt.setString(1,o.getNum());
				pstmt.setString(2, o.getTel());			
				pstmt.setDate(3, (Date) o.getLivetime());			
				pstmt.setDate(4, (Date) o.getOuttime());	
				pstmt.setString(5, o.getOrdertime());
				pstmt.setInt(6, o.getOrderid());
				state=pstmt.executeUpdate();			
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				DBConnection.close();
			}
			return state;
		}
		
		//计算订单数
		public int countOrder(){
			int c=0;
			try{  
				String sql="select count(*) from orderform";				
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
}
