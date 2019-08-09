package model;

import java.io.Serializable;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int userid;
	String username;
	String Password;
	String email;
	String role;
	int flag;//专家被催评的指标id
	int fogetpass;
	private String cpqingk;
	private String cuipingcreatetime;
	
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
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public int getFogetpass() {
		return fogetpass;
	}
	public void setFogetpass(int fogetpass) {
		this.fogetpass = fogetpass;
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
	
	
}
