package model;

import java.io.Serializable;

public class LvTargetusertongji implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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
    private int tjtargetuser;
	private int tutargetid;
	private Double sum;
	private Double childsum;
	private int tuserid;
	int userid;
	String username;
	int uflag;
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
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getTargetcreatetime() {
		return targetcreatetime;
	}
	public void setTargetcreatetime(String targetcreatetime) {
		this.targetcreatetime = targetcreatetime;
	}
	public int getTargetlevel() {
		return targetlevel;
	}
	public void setTargetlevel(int targetlevel) {
		this.targetlevel = targetlevel;
	}
	public String getFathertarget() {
		return fathertarget;
	}
	public void setFathertarget(String fathertarget) {
		this.fathertarget = fathertarget;
	}
	
	public int getTjtargetuser() {
		return tjtargetuser;
	}
	public void setTjtargetuser(int tjtargetuser) {
		this.tjtargetuser = tjtargetuser;
	}
	public int getTutargetid() {
		return tutargetid;
	}
	public void setTutargetid(int tutargetid) {
		this.tutargetid = tutargetid;
	}
	public int getTuserid() {
		return tuserid;
	}
	public void setTuserid(int tuserid) {
		this.tuserid = tuserid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getUflag() {
		return uflag;
	}
	public void setUflag(int uflag) {
		this.uflag = uflag;
	}
	public Double getSum() {
		return sum;
	}
	public void setSum(Double sum) {
		this.sum = sum;
	}
	public Double getChildsum() {
		return childsum;
	}
	public void setChildsum(Double childsum) {
		this.childsum = childsum;
	}
	
	
}
