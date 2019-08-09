package model;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class target implements Serializable{

	private static final long serialVersionUID = -4673052506337375379L;
	private int targetid;
	private String targetname;
	private String savetargetname;
    private String targettitle;  
    private String targeturl;
    private String targettype;
    private String flag;
    private String targetcreatetime;
    private int targetlevel;
    private String fathertarget;
    private double mincount;
    private double maxcount;
    private String fptime;
	public int getTargetid() {
		return targetid;
	}
	public void setTargetid(int targetid) {
		this.targetid = targetid;
	}
	
	public String getTargetname() {
		return targetname;
	}
	public void setTargetname(String targetname) {
		this.targetname = targetname;
	}
	
	public String getSavetargetname() {
		return savetargetname;
	}
	public void setSavetargetname(String savetargetname) {
		this.savetargetname = savetargetname;
	}
	public String getTargettitle() {
		return targettitle;
	}
	public void setTargettitle(String targettitle) {
		this.targettitle = targettitle;
	}
	public String getTargeturl() {
		return targeturl;
	}
	public void setTargeturl(String targeturl) {
		this.targeturl = targeturl;
	}
	public String getTargettype() {
		return targettype;
	}
	public void setTargettype(String targettype) {
		this.targettype = targettype;
	}
	public String getTargetcreatetime() {
		return targetcreatetime;
	}
	public void setTargetcreatetime(String targetcreatetime) {
		this.targetcreatetime = targetcreatetime;
	}
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	public int getTargetlevel() {
		return targetlevel;
	}
	public void setTargetlevel(int targetlevel) {
		this.targetlevel = targetlevel;
	}
	public String getTime() {
		Date date = new Date();  
        DateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");  
        return df.format(date);
	}
	
    public String getFathertarget() {
		return fathertarget;
	}
	public void setFathertarget(String fathertarget) {
		this.fathertarget = fathertarget;
	}
	
	public double getMincount() {
		return mincount;
	}
	public void setMincount(double mincount) {
		this.mincount = mincount;
	}
	public double getMaxcount() {
		return maxcount;
	}
	public void setMaxcount(double maxcount) {
		this.maxcount = maxcount;
	}
	public target() {  
        super();  
    }
	public target(String saveFilename,String filename,String filetitle, String savePath, String time,String targettype,String fathertarget,String fileflag,int targetlevel,double mincount,double maxcount) {
		// TODO Auto-generated constructor stub
		this.savetargetname = saveFilename;
		this.targetname = filename;
		this.targettitle = filetitle;
		this.targeturl = savePath;
		this.targetcreatetime = time;
		this.targettype = targettype;
		this.fathertarget = fathertarget;
		this.flag =fileflag;
		this.targetlevel = targetlevel;
		this.mincount = mincount;
		this.maxcount = maxcount;
	}
	public String getFptime() {
		return fptime;
	}
	public void setFptime(String fptime) {
		this.fptime = fptime;
	} 
	
    
}
