package model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Targetuserlianjie implements Serializable{
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
    private int targetuserid;
	private int tutargetid;
	private Double targetcount;//
	private int tuserid;
	private int userid;
	private String username;
	private int uflag;
	private String cpqingk;
	private String cuipingcreatetime;
	private Double mincount;
	private Double maxcount;
	private String cuipingshijiancha;
	private Double avg;
	private Double sum;
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
	public int getTargetuserid() {
		return targetuserid;
	}
	public void setTargetuserid(int targetuserid) {
		this.targetuserid = targetuserid;
	}
	public int getTutargetid() {
		return tutargetid;
	}
	public void setTutargetid(int tutargetid) {
		this.tutargetid = tutargetid;
	}
	public Double getTargetcount() {
		return targetcount;
	}
	public void setTargetcount(Double targetcount) {
		this.targetcount = targetcount;
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
	public String getCpqingk() {
		return cpqingk;
	}
	public void setCpqingk(String cpqingk) {
		this.cpqingk = cpqingk;
	}
	public String getCuipingcreatetime() {
		return cuipingcreatetime;
	}
	public void setCuipingcreatetime(String cuipingcreatetime) {
		this.cuipingcreatetime = cuipingcreatetime;
	}
	public Double getMincount() {
		return mincount;
	}
	public void setMincount(Double mincount) {
		this.mincount = mincount;
	}
	public Double getMaxcount() {
		return maxcount;
	}
	public void setMaxcount(Double maxcount) {
		this.maxcount = maxcount;
	}
	public String getCuipingshijiancha() {
		return cuipingshijiancha;
	}
	public void setCuipingshijiancha(String cuipingshijiancha) {
		this.cuipingshijiancha = cuipingshijiancha;
	}
	public Double getAvg() {
		return avg;
	}
	public void setAvg(Double avg) {
		this.avg = avg;
	}
	public Double getSum() {
		return sum;
	}
	public void setSum(Double sum) {
		this.sum = sum;
	}
}
