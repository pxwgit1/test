package model;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.crypto.Data;

public class Order {
	int orderid;
	String uname;
	String num;
	String tel;
	Date livetime;
	Date outtime;
	//Date ordertime;
	String ordertime;
	String roomtype;
	String status;
	String currenttime;
	int allOrder;
	int allSale;
	String year;
	String rprice;
	//set
	public void setOrderid(int id){
		orderid=id;
	}
	public void setUname(String uname){
		this.uname=uname;
	}
	public void setNum(String num){
		this.num=num;
	}
	public void setTel(String tel){
		this.tel=tel;
	}
    public void setLivetime(Date livetime){
    	this.livetime=livetime;
    }
    public void setOuttime(Date outtime){
    	this.outtime=outtime;
    }
	
    /*public void setOrdertime(Date ordertime){
    	this.ordertime=ordertime;
    }*/
    public void setOrdertime(String ordertime){
	     this.ordertime=ordertime;
    }
    public void setRoomtype(String roomtype){
    	this.roomtype=roomtype;
    }
    public void setStatus(String status){
    	this.status=status;
    }
    public void setAllOrder(int order){
    	allOrder=order;
    }
    public void setAllSale(int sale){
    	allSale=sale;
    }
    public void setYear(String y){
    	year=y;
    }
    public void setRprice(String rprice){
		this.rprice=rprice;
	}
    //get
    public int getOrderid(){
    	return orderid;
    }
    public String getUname(){
    	return uname;
    }
    public String getNum(){
    	return num;
    }
    public String getTel(){
    	return tel;
    }
    public  Date getLivetime(){
    	return livetime;
    }
    public Date getOuttime(){
    	return outtime;
    }
    /*public Date getOrdertime(){
    	return ordertime;
    }*/
    public String getOrdertime(){
    	return ordertime;
    }
    public String getRoomtype(){
    	return roomtype;
    }
    public String getStatus(){
    	return status;
    }
    public String getCurrenttime(){
    	Date now = new Date( );
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd  hh:mm:ss E a ");
		String currenttime=ft.format(now);
		return currenttime;
    }
    public int getAllOrder(){
    	return allOrder;
    }
    public int getAllSale(){
    	return allSale;
    }
    public String getYear(){
    	return year;
    }
    public String getRprice(){
		return rprice;
	}
}
