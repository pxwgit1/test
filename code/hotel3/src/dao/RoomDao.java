package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import common.DBConnection;
import common.StringFomat;
import model.Album;
import model.PageModel;
import model.Room;
import model.roomType;

public class RoomDao {
	//findAll,列出所有房间
			public ArrayList findAll(){
				ArrayList rList=new ArrayList();
				try {
					//ResultSet rs=DBConnection.getRs("select * from rooms");
					String sql="select r.roomID,t.Rtype as roomType,r.roomName,r.roomStatus,t.Rprice as roomPrice from rooms r, roomType t where r.roomType=t.Rtypeid(+)";
					ResultSet rs=DBConnection.getRs(sql);
					while(rs.next()){
						Room r=new Room();
						r.setRoomID(rs.getString("roomID"));
						r.setRoomType(rs.getString("roomType"));
						r.setRoomName(rs.getString("roomName"));
						r.setRoomStatus(rs.getString("roomStatus"));
						r.setRoomPrice(rs.getString("roomPrice"));
						rList.add(r);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally{DBConnection.close();}
				return rList;
			}
			
			//列出所有房间类型
			public ArrayList AllType(){
				ArrayList tList=new ArrayList();
				try {
					//ResultSet rs=DBConnection.getRs("select * from rooms");
					String sql="select * from roomtype";
					ResultSet rs=DBConnection.getRs(sql);
					while(rs.next()){
						roomType t=new roomType();
						t.setTypeid(rs.getInt(1));						
						t.setRtype(rs.getString("rtype"));						
						t.setRprice(rs.getString("rprice"));						
						t.setRtotal(rs.getString("rtotal"));						
						t.setRavailable(rs.getString("ravailable"));						
						t.setRdescription(rs.getString("rdescription"));
						t.setRphoto(rs.getString("rphoto"));
						t.setDiscount(rs.getString("discount"));
						tList.add(t);
					}
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally{DBConnection.close();}
				return tList;
			}
			//查找已预订的房间
			@SuppressWarnings({ "unchecked", "rawtypes", "static-access" })
			public PageModel findOrdered(PageModel pm){
				ArrayList rList=new ArrayList();
				try{
					String sql="select r.roomID,t.Rtype as roomType,r.roomName,r.roomStatus,t.Rprice as roomPrice from rooms r, roomType t where r.roomType=t.Rtypeid(+) and r.roomStatus=0";
					String sql1="select count(*) from rooms r,roomType t where r.roomtype=t.Rtypeid(+) and r.roomstatus=0";
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
					ResultSet rs1=DBConnection.getRs(sql2);
					while(rs1.next()){
						Room r=new Room();
						r.setRoomID(rs1.getString("roomID"));
						r.setRoomType(rs1.getString("roomType"));
						r.setRoomName(rs1.getString("roomName"));
						r.setRoomStatus(rs1.getString("roomStatus"));
						r.setRoomPrice(rs1.getString("roomPrice"));
						rList.add(r);
					}
				}catch(Exception e){e.printStackTrace();}
				finally{DBConnection.close();}
						
				pm.setRList(rList);
				return pm;
				}
			//查找未预订的房间
			@SuppressWarnings({ "unchecked", "rawtypes", "static-access" })
			public PageModel findEmpty(PageModel pm){
				ArrayList rList=new ArrayList();
				try{
					String sql="select r.roomID,t.Typename as roomType,r.roomName,r.roomStatus,r.roomPrice from rooms r, r_type t where r.roomType=t.type(+) and r.roomStatus=1";
					String sql1="select count(*) from rooms r,r_type t where r.roomtype=t.type(+) and r.roomstatus=1";
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
					ResultSet rs1=DBConnection.getRs(sql2);
					while(rs1.next()){
						Room r=new Room();
						r.setRoomID(rs1.getString("roomID"));
						r.setRoomType(rs1.getString("roomType"));
						r.setRoomName(rs1.getString("roomName"));
						r.setRoomStatus(rs1.getString("roomStatus"));
						r.setRoomPrice(rs1.getString("roomPrice"));
						rList.add(r);
					}
				}catch(Exception e){e.printStackTrace();}
				finally{DBConnection.close();}
						
				pm.setRList(rList);
				return pm;
				}
			
			//findbyPage，分页显示房间
			@SuppressWarnings({ "static-access", "rawtypes", "unchecked" })
			public PageModel findbyPage(PageModel pm){
				ArrayList rList=new ArrayList();
				try{
					String sql="select r.roomID,t.Rtype as roomType,r.roomName,r.roomStatus,t.Rprice as roomPrice,t.Rdescription as description from rooms r, roomType t where r.roomType=t.Rtypeid(+) order by r.roomID";
					String sql1="select count(*) from rooms r,roomType t where r.roomtype=t.Rtypeid(+)";
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
				Room r=new Room();
				r.setRoomID(rs1.getString("roomID"));
				r.setRoomType(rs1.getString("roomType"));
				r.setRoomName(rs1.getString("roomName"));
				r.setRoomStatus(rs1.getString("roomStatus"));
				r.setRoomPrice(rs1.getString("roomPrice"));
				r.setDescription(rs1.getString("description"));
				rList.add(r);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{DBConnection.close();}
				
		pm.setRList(rList);
		return pm;
		}
			//通过房间类型查找房间，并分页显示
			@SuppressWarnings({ "static-access", "rawtypes", "unchecked" })
			public PageModel findbyType(PageModel pm,String type){
				ArrayList rList=new ArrayList();
				try{
					String sql=null,sql1=null;
					if(type.endsWith("Y")||type.equals("N")){
						String status="	0";
						if(type.equals("Y")){
							status="1";
						}
					   sql="select r.roomID,t.Rtype as roomType,r.roomName,r.roomStatus,t.Rprice as roomPrice,t.Rdescription as description from rooms r, roomType t where r.roomType=t.Rtypeid(+) and r.roomStatus="+status+"order by r.roomID";
					   sql1="select count(*) from rooms r,roomType t where r.roomtype=t.Rtypeid(+) and r.roomStatus="+status+"";
						
					}else{
					
					   sql="select r.roomID,t.Rtype as roomType,r.roomName,r.roomStatus,t.Rprice as roomPrice,t.Rdescription as description from rooms r, roomType t where r.roomType=t.Rtypeid(+) and t.Rtypeid="+type+" order by r.roomID";
					   sql1="select count(*) from rooms r,roomType t where r.roomtype=t.Rtypeid(+) and t.Rtypeid="+type+"";
					}
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
				Room r=new Room();
				r.setRoomID(rs1.getString("roomID"));
				r.setRoomType(rs1.getString("roomType"));
				r.setRoomName(rs1.getString("roomName"));
				r.setRoomStatus(rs1.getString("roomStatus"));
				r.setRoomPrice(rs1.getString("roomPrice"));
				r.setDescription(rs1.getString("description"));
				rList.add(r);
			}
		}catch(Exception e){e.printStackTrace();}
		finally{DBConnection.close();}
				
		pm.setRList(rList);
		return pm;
		}
			
			//获取房间类型，将其存在一个HashMap中
			@SuppressWarnings({ "rawtypes", "unchecked" })
			public HashMap findType(){
				HashMap type=new HashMap();
				try {
					ResultSet rs=DBConnection.getRs("select * from roomType");					
					while(rs.next()){
						type.put(rs.getString("Rtypeid"), rs.getString("Rtype"));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{DBConnection.close();}
				return type;
			}
			
			//delete room
			public int delete(Room r){
				int ustate=0;
				PreparedStatement pstmt=null;
				try{
					Connection con=DBConnection.getConn();
					String sql="delete from rooms where roomID=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, r.getRoomID());
					ustate=pstmt.executeUpdate();	
				}catch(Exception e){
					e.printStackTrace();
				}finally {
					DBConnection.close();
				}
				return ustate;
				
			}
			//add room
			public int add(Room r){
				int ustate=0;
				PreparedStatement pstmt=null;
				try{
					Connection con=DBConnection.getConn();
				 	String sql="insert into rooms values(?,?,?,?)" ;
				 	pstmt=con.prepareStatement(sql);
				 	pstmt.setString(1, r.getRoomID());
				 	pstmt.setString(2, r.getRoomName());
				 	pstmt.setString(3,  r.getRoomStatus());
				 	pstmt.setString(4, r.getRoomType());				 	
				 	ustate=pstmt.executeUpdate();
				 }catch(Exception e){
					e.printStackTrace();
				}finally {
					DBConnection.close();
				}
				return ustate;
			}
			//edit room
			public int edit(Room r){
				int ustate=0;
				PreparedStatement pstmt=null;
				try{
					Connection con=DBConnection.getConn();
					String sql="update rooms set roomName=?,roomType=?,roomStatus=? where roomID=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, r.getRoomName());
					pstmt.setString(2, r.getRoomType());
					pstmt.setString(3, r.getRoomStatus());
					pstmt.setString(4, r.getRoomID());
					ustate=pstmt.executeUpdate();			
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					DBConnection.close();
				}
				return ustate;
			}
			
			//add room type
			public int addType(roomType t){
				int ustate=0;
				PreparedStatement pstmt=null;
				try{
					Connection con=DBConnection.getConn();
				 	String sql="insert into roomtype values(roomtype_rtypeid_SEQ.NEXTVAL,?,?,?,?,?,?)" ;
				 	pstmt=con.prepareStatement(sql);
				 	pstmt.setString(1, t.getRtype());
				 	pstmt.setString(2, t.getRprice());
				 	pstmt.setString(3,  t.getRtotal());
				 	pstmt.setString(4, t.getRtotal());
				 	pstmt.setString(5, t.getRdescription());
				 	pstmt.setString(6, t.getRphoto());
				 	ustate=pstmt.executeUpdate();
				 }catch(Exception e){
					e.printStackTrace();
				}finally {
					DBConnection.close();
				}
				return ustate;
			}
			//修改房间类型
			public int editType(roomType t){
				int ustate=0;
				PreparedStatement pstmt=null;
				try{
					Connection con=DBConnection.getConn();
					String sql="update roomType set rtype=?,rprice=?,rtotal=?,ravailable=?,rdescription=? where rtypeid=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, t.getRtype());
					pstmt.setString(2, t.getRprice());
					pstmt.setString(3, t.getRtotal());
					pstmt.setString(4, t.getRavailable());
					pstmt.setString(5, t.getRdescription());
					pstmt.setInt(6, t.getTypeid());
					ustate=pstmt.executeUpdate();			
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					DBConnection.close();
				}
				return ustate;
			}
			//删除房间类型
			public int delType(roomType t){
				int ustate=0;
				PreparedStatement pstmt=null;
				try{
					Connection con=DBConnection.getConn();
					String sql="delete from roomType where rtypeid=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, t.getTypeid());
					ustate=pstmt.executeUpdate();			
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					DBConnection.close();
				}
				return ustate;
			}
			//修改某房间类型的图片
			public int editTphoto(roomType t){
				int ustate=0;
				PreparedStatement pstmt=null;
				try{
					Connection con=DBConnection.getConn();
					String sql="update roomType set rphoto=? where rtypeid=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, t.getRphoto());
					pstmt.setInt(2, t.getTypeid());
					ustate=pstmt.executeUpdate();			
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					DBConnection.close();
				}
				return ustate;
			}
			//计算房间数
			public int countRoom(){
				int c=0;
				try{  
					String sql="select count(*) from rooms";				
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
			
			//列出所有打折类型房间
			public ArrayList findActivity(){
				ArrayList tList=new ArrayList();
				try {
					//ResultSet rs=DBConnection.getRs("select * from rooms");
					String sql="select * from roomtype where discount!='10'";
					ResultSet rs=DBConnection.getRs(sql);
					while(rs.next()){
						roomType t=new roomType();
						t.setTypeid(rs.getInt(1));						
						t.setRtype(rs.getString("rtype"));						
						t.setRprice(rs.getString("rprice"));						
						t.setRtotal(rs.getString("rtotal"));						
						t.setRavailable(rs.getString("ravailable"));						
						t.setRdescription(rs.getString("rdescription"));
						t.setRphoto(rs.getString("rphoto"));
						t.setDiscount(rs.getString("discount"));
						tList.add(t);
					}
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally{DBConnection.close();}
				return tList;
			}
			

			public ArrayList searchAll(String bookingin,String bookingout)
			{
				ArrayList rtypeList=new ArrayList();
				
				//将入住时间转换成“年-月-日”（传过来的bookingin时间是“日/月/年”格式）
				String in=bookingin.substring(6)+"-"+bookingin.substring(3,5)+"-"+bookingin.substring(0,2);
				String out=bookingout.substring(6)+"-"+bookingout.substring(3,5)+"-"+bookingout.substring(0,2);
				System.out.println(in);
				System.out.println(out);
				
				try {
					//找到该段时间内还有空余房间的房间类型
					String sql1="select r.*,form1.* from roomtype r,(select rtypeid,sum(to_number(num)) n from orderform where livetime=to_date('"+in+"','yyyy-mm-dd') and outtime=to_date('"+out+"','yyyy-mm-dd') group by rtypeid) form1 where form1.rtypeid=r.rtypeid(+) and form1.n< to_number(r.rtotal)";
					//没有被预定过的房间类型
					String sql2="select r.* from roomtype r where not exists(select * from orderform o where o.rtypeid=r.rtypeid)";
					//订单表中不在改时间段内的房间类型
					String sql3="select r.*,form1.* from roomtype r,(select rtypeid,sum(to_number(num)) n from orderform where livetime!=to_date('"+in+"','yyyy-mm-dd') and outtime!=to_date('"+out+"','yyyy-mm-dd') group by rtypeid) form1 where form1.rtypeid=r.rtypeid(+)";
					
					ResultSet rs1=DBConnection.getRs(sql1);
					System.out.println(sql1);
					while(rs1.next()){
						roomType rt=new roomType();
						
						rt.setRphoto(rs1.getString("rphoto"));
						rt.setTypeid(Integer.parseInt(rs1.getString("rtypeid")));
						rt.setRtype(rs1.getString("rtype"));
						rt.setRprice(rs1.getString("rprice"));
						rt.setRtotal(rs1.getString("rtotal"));
						rt.setRavailable(rs1.getString("ravailable"));
						rt.setRdescription(rs1.getString("rdescription"));
						rt.setDiscount(rs1.getString("discount"));
						rtypeList.add(rt);
						
					}
					ResultSet rs2=DBConnection.getRs(sql2);
					
					while(rs2.next()){
						roomType rt=new roomType();
						
						rt.setRphoto(rs2.getString("rphoto"));
						rt.setTypeid(Integer.parseInt(rs2.getString("rtypeid")));
						rt.setRtype(rs2.getString("rtype"));
						rt.setRprice(rs2.getString("rprice"));
						rt.setRtotal(rs2.getString("rtotal"));
						rt.setRavailable(rs2.getString("ravailable"));
						rt.setRdescription(rs2.getString("rdescription"));
						rt.setDiscount(rs2.getString("discount"));
						rtypeList.add(rt);
						
					}
					ResultSet rs3=DBConnection.getRs(sql3);
					
					while(rs3.next()){
						roomType rt=new roomType();
						
						rt.setRphoto(rs3.getString("rphoto"));
						rt.setTypeid(Integer.parseInt(rs3.getString("rtypeid")));
						rt.setRtype(rs3.getString("rtype"));
						rt.setRprice(rs3.getString("rprice"));
						rt.setRtotal(rs3.getString("rtotal"));
						rt.setRavailable(rs3.getString("ravailable"));
						rt.setRdescription(rs3.getString("rdescription"));
						rt.setDiscount(rs3.getString("discount"));
						rtypeList.add(rt);
						
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{DBConnection.close();}
				return rtypeList;
			}
			
}
