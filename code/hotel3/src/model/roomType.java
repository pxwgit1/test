package model;

public class roomType {
	int typeid;
	String rtype;
	String rprice;
	String rtotal;
	String ravailable;
	String rdescription;
	String rphoto;
	String discount;
	public void setTypeid(int typeid){
		this.typeid=typeid;
	}
	public void setRtype(String rtype){
		this.rtype=rtype;
	}
	public void setRprice(String rprice){
		this.rprice=rprice;
	}
	public void setRtotal(String rtotal){
		this.rtotal=rtotal;
	}
	public void setRavailable(String ravailable){
		this.ravailable=ravailable;
	}
	
	public void setRdescription(String rdescription){
		this.rdescription=rdescription;
	}
	public void setRphoto(String rphoto){
		this.rphoto=rphoto;
	}
	public void setDiscount(String discount){
		this.discount=discount;
	}
	
	//
	public int getTypeid(){
        return typeid;
	}
	public String getRtype(){
          return rtype;
	}
	public String getRprice(){
		return rprice;
	}
	public String getRtotal(){
		return rtotal;
	}
	public String getRavailable(){
		return ravailable;
	}	
	public String getRdescription(){
		return rdescription;
	}
	public String getRphoto(){
		return rphoto;
	}
	public String getDiscount(){
		return discount;
	}
	

}
