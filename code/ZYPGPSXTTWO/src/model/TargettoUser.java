package model;

import java.io.Serializable;
import java.util.ArrayList;


@SuppressWarnings("serial")
public class TargettoUser implements Serializable{
	private int targetuserid;
	private int tutargetid;
	private String tutargettitle;
	private String tutargetname;
	private int tuserid;
	private String tusername;
	private String tutargettype;
	private String targetflag;
	private Double targetcount;
	private String tusavetargetname;
	private String tutargeturl;
	private int tutargetlevel;
	private String tufathertarget;
	private String fptime;
	ArrayList targetgradeList;
	
	public ArrayList getTargetgradeList() {
		return targetgradeList;
	}
	public void setTargetgradeList(ArrayList targetgradeList) {
		this.targetgradeList = targetgradeList;
	}
	public int getTargetuserid() {
		return targetuserid;
	}
	public void setTargetuserid(int targetuserid) {
		this.targetuserid = targetuserid;
	}
	
	public int getTuserid() {
		return tuserid;
	}
	public void setTuserid(int tuserid) {
		this.tuserid = tuserid;
	}
	public String getTusername() {
		return tusername;
	}
	public void setTusername(String tusername) {
		this.tusername = tusername;
	}
	
	public String getTargetflag() {
		return targetflag;
	}
	public void setTargetflag(String targetflag) {
		this.targetflag = targetflag;
	}
	public Double getTargetcount() {
		return targetcount;
	}
	public void setTargetcount(Double targetcount) {
		this.targetcount = targetcount;
	}
	
	public int getTutargetlevel() {
		return tutargetlevel;
	}
	public void setTutargetlevel(int tutargetlevel) {
		this.tutargetlevel = tutargetlevel;
	}
	public String getTufathertarget() {
		return tufathertarget;
	}
	public void setTufathertarget(String tufathertarget) {
		this.tufathertarget = tufathertarget;
	}
	public int getTutargetid() {
		return tutargetid;
	}
	public void setTutargetid(int tutargetid) {
		this.tutargetid = tutargetid;
	}
	public String getTutargettitle() {
		return tutargettitle;
	}
	public void setTutargettitle(String tutargettitle) {
		this.tutargettitle = tutargettitle;
	}
	public String getTutargetname() {
		return tutargetname;
	}
	public void setTutargetname(String tutargetname) {
		this.tutargetname = tutargetname;
	}
	public String getTutargettype() {
		return tutargettype;
	}
	public void setTutargettype(String tutargettype) {
		this.tutargettype = tutargettype;
	}
	public String getTusavetargetname() {
		return tusavetargetname;
	}
	public void setTusavetargetname(String tusavetargetname) {
		this.tusavetargetname = tusavetargetname;
	}
	public String getTutargeturl() {
		return tutargeturl;
	}
	public void setTutargeturl(String tutargeturl) {
		this.tutargeturl = tutargeturl;
	}
	public String getFptime() {
		return fptime;
	}
	public void setFptime(String fptime) {
		this.fptime = fptime;
	}
	
}
