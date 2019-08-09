package model;

public class Login {
 
	String logname;
	String password;
	String backNews;
	String role;
	boolean status=false;
	public void setLogname(String n){
		logname=n;
	}
	public void setPassword(String p){
		password=p;
	}
	public void serBackNews(String b){
		backNews=b;
	}
	public void setStatus(boolean s){
		status=s;
	}
	public void setRole(String r){
		role=r;
	}
	public String getLogname(){
		return logname;
	}
	public String getPassword(){
		return password;
	}
	public String getBackNews(){
		return backNews;
	}
	public boolean getStatus(){
		return status;
	}
	public String getRole(){
		return role;
	}
		
}
