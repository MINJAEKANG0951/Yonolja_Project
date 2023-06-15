package com.human.springboot;

import lombok.Data;

@Data
public class DTO_MJ_placeDTO_forMain {

	// 사실상 거의 room dto 
	int place_seq;
	String place_name;
	String place_address;
	String place_imgs;
	int roomtype_price;
	
	
	public int getPlace_seq() {
		return place_seq;
	}
	public void setPlace_seq(int place_seq) {
		this.place_seq = place_seq;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getPlace_address() {
		return place_address;
	}
	public void setPlace_address(String place_address) {
		this.place_address = place_address;
	}
	public String getPlace_imgs() {
		return place_imgs;
	}
	public void setPlace_imgs(String place_imgs) {
		this.place_imgs = place_imgs;
	}
	public int getRoomtype_price() {
		return roomtype_price;
	}
	public void setRoomtype_price(int roomtype_price) {
		this.roomtype_price = roomtype_price;
	}
	
	
	
	
	
	
	
}
