package model;

public class Room {
	String roomID;
	String roomType;
	String roomName;
	String roomStatus;
	String roomPrice;
	String description;
	public void setRoomID(String roomID){
		this.roomID=roomID;
	}
	public void setRoomType(String roomType){
		this.roomType=roomType;
	}
	public void setRoomName(String roomName){
		this.roomName=roomName;
	}
	public void setRoomStatus(String roomStatus){
		this.roomStatus=roomStatus;
	}
	public void setRoomPrice(String roomPrice){
		this.roomPrice=roomPrice;
	}
	public void setDescription(String description){
		this.description=description;
	}
	
	public String getRoomID(){
		return roomID;
	}
	public String getRoomType(){
		return roomType;
	}
	public String getRoomName(){
		return roomName;
	}
	public String getRoomStatus(){
		return roomStatus;
	}
	public String getRoomPrice(){
		return roomPrice;
	}
	public String getDescription(){
		return description;
	}

}
