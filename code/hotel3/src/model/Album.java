package model;

public class Album {
	int a_id;
	String a_name;
	String facebook;
	public void setA_id(int id){
		this.a_id=id;
	}
	
	public void setA_name(String name){
		a_name=name;
	}
	public void setFacebook(String facebook){
		this.facebook=facebook;
	}
	public int getA_id(){
		return a_id;
	}
	public String getA_name(){
		return a_name;
	}
	public String getFacebook(){
		return facebook;
	}

}
