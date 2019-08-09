package model;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


/** 
 *’’∆¨ µÃÂ¿‡ 
 * 
 */ 
public class Photo implements Serializable{
	private static final long serialVersionUID = 1342554333250712580L;
	private int p_id;
    private String p_name;  
    private String p_url;  
    private int p_albumId;
    String time;
    
    public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_url() {
		return p_url;
	}
	public void setP_url(String p_url) {
		this.p_url = p_url;
	}
	public int getP_albumId() {
		return p_albumId;
	}
	public void setP_albumId(int p_albumId) {
		this.p_albumId = p_albumId;
	}
	 public String getTime(){  
	        Date date = new Date();  
	        DateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");  
	        return df.format(date);  
	    } 
	 
	public Photo(int p_id, String p_name, String p_url, int p_albumId) {  
        super();  
        this.p_id = p_id;  
        this.p_name = p_name;  
        this.p_url = p_url;  
        this.p_albumId = p_albumId;  
    }  
    public Photo(String p_name, String p_url, int p_albumId) {  
        this.p_name = p_name;  
        this.p_url = p_url;  
        this.p_albumId = p_albumId;  
    }  
    public Photo() {  
        super();  
        // TODO Auto-generated constructor stub  
    } 
	
}
