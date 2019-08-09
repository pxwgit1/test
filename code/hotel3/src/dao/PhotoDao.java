package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DBConnection;
import model.Album;
import model.Photo;

public class PhotoDao {
	//获取所有与相册（包括相册名,其编号,封面）
	public ArrayList getAlbum(){
		ArrayList aList=new ArrayList();
		try{
			 String sql="select a_id,a_name from album"; 
			 ResultSet rs=DBConnection.getRs(sql);
			 while(rs.next()){
				 Album a=new Album();
				 a.setA_id(rs.getInt(1));
				 a.setA_name(rs.getString("a_name"));
				 ArrayList plist=findAllPhoto(rs.getInt(1));
				 if(plist.isEmpty()){
					 a.setFacebook("kong.jpg");
				 }
				 else{
					 Photo p=(Photo)plist.get(0);
					 a.setFacebook(p.getP_name());
				 }
				 
				 aList.add(a);
			 }
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close();
		}
		return aList;
	}

    // 按相册id显示某相册照片 
    @SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList findAllPhoto(int aid) {  
    	ArrayList plist= new ArrayList();  
        Connection conn = null;  
        PreparedStatement pstate = null;  
        ResultSet res = null;  
        try {  
            conn=DBConnection.getConn();  
            String sql="select p_id,p_name,p_url from photo where P_ALBUMID=?";  
            pstate = conn.prepareStatement(sql);  
            pstate.setInt(1, aid);  
            res = pstate.executeQuery();  
            while(res.next()){  
                Photo pojo=new Photo(res.getInt(1),res.getString(2),res.getString(3), aid);  
                plist.add(pojo);  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }finally{  
            try {  
                res.close();  
                pstate.close();  
                conn.close();  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }
        }  
        return plist;  
    }
    
    
    
    //按相册id查找相册名称
    public Album findAname(int aid){
    	Album a = new Album();
    	  try {  
              String sql="select a_name from album where a_id="+aid+"";  
             ResultSet rs=DBConnection.getRs(sql);
             while(rs.next()){
            	 a.setA_name(rs.getString(1));
             }
             a.setA_id(aid);
          } catch (Exception e){  
             e.printStackTrace();
          }finally{  
             DBConnection.close();
          }  
    	return a;   	
    }
    
  
    
    //创建相册
    public int creAlbum(Album a){
    	int state=0;
    	PreparedStatement pstmt=null;
    	try {  
           Connection con= DBConnection.getConn();
           String sql="insert into album values(album_id.nextval,?)";
           pstmt=con.prepareStatement(sql);
           pstmt.setString(1, a.getA_name());
           state=pstmt.executeUpdate();
         } catch (Exception e){  
            e.printStackTrace();
         }finally{  
            DBConnection.close();
         }  
    	return state;
    }
    
  //按id删除相册
    public int delAlbum(int aid){
    	int state1=0,state=0;
  	  try {  
           String sql="delete from album where a_id="+aid+"";  
           String sql1="delete from photo where p_albumId="+aid+"";
            state=DBConnection.update(sql);
            state1=DBConnection.update(sql1);
        } catch (Exception e){  
           e.printStackTrace();
        }finally{  
           DBConnection.close();
        }  
  	return state1+state; 
    }
  //修改相册名
    public int editAlbum(Album a){
    	int state=0;
    	PreparedStatement pstmt=null;
    	try {  
           Connection con= DBConnection.getConn();
           String sql="update album set a_name=? where a_id=?";
           pstmt=con.prepareStatement(sql);
           pstmt.setString(1, a.getA_name());
           pstmt.setInt(2, a.getA_id());
           state=pstmt.executeUpdate();
         } catch (Exception e){  
            e.printStackTrace();
         }finally{  
            DBConnection.close();
         }  
    	return state;
    }
    //上传照片
    public int upPhoto(Photo p) {  
        int state=0; 
        PreparedStatement pstmt = null;  
        try {  
            Connection con=DBConnection.getConn();  
            String sql="insert into photo values(p_id_seq.nextval,?,?,?)";  
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, p.getP_name());
            pstmt.setString(2, p.getP_url());
            pstmt.setInt(3, p.getP_albumId());
            state=pstmt.executeUpdate(); 
        } catch (Exception e){  
           e.printStackTrace();
        }finally{  
           DBConnection.close();
        }  
        return state;  
    }
    
    
    //按图片id删除图片
    public int delPhoto(int pid){
    	int state=0;
    	PreparedStatement pstmt=null;
  	  try {  
  		   Connection con = DBConnection.getConn();
           String sql="delete from photo where p_id=?";  
           pstmt=con.prepareStatement(sql);
           pstmt.setInt(1, pid);
           state=pstmt.executeUpdate();        
        } catch (Exception e){  
           e.printStackTrace();
        }finally{  
           DBConnection.close();
        }  
  	return state; 
    }

}
