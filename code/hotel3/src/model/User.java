package model;

public class User {
	String uname;
	String upwd;
	String relName;
	String telNum;
	String gender;
	String email;
	String role;
	//set
	public void setUname(String uname){
		this.uname=uname;
	}
	public void setUpwd(String upwd){
		this.upwd=upwd;
	}
	public void setRelName(String relName){
		this.relName=relName;
	}
	public void setTelNum(String telNum){
		this.telNum=telNum;
	}
	public void setGender(String gender){
		this.gender=gender;
	}
	public void setEmail(String email){
		this.email=email;
	}
	public void setRole(String role){
		this.role=role;
	}
   //get
	public String getUname(){
		return uname;
	}
	public String getUpwd(){
		return upwd;
	}
	public String getRelName(){
		return relName;
	}
	public String getTelNum(){
		return telNum;
	}
	public String getGender(){
		return gender;
	}
	public String getEmail(){
		return email;
	}
	public String getRole(){
		return role;
	}
}
