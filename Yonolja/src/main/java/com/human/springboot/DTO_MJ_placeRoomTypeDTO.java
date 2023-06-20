package com.human.springboot;

import lombok.Data;

@Data
public class DTO_MJ_placeRoomTypeDTO {

	int roomtype_seq;
	String roomtype_name;
	int roomtype_capacity;
	int roomtype_price;
	String roomtype_imgs;
	
	public int getRoomtype_seq() {
		return roomtype_seq;
	}
	public void setRoomtype_seq(int roomtype_seq) {
		this.roomtype_seq = roomtype_seq;
	}
	public String getRoomtype_name() {
		return roomtype_name;
	}
	public void setRoomtype_name(String roomtype_name) {
		this.roomtype_name = roomtype_name;
	}
	public int getRoomtype_capacity() {
		return roomtype_capacity;
	}
	public void setRoomtype_capacity(int roomtype_capacity) {
		this.roomtype_capacity = roomtype_capacity;
	}
	public int getRoomtype_price() {
		return roomtype_price;
	}
	public void setRoomtype_price(int roomtype_price) {
		this.roomtype_price = roomtype_price;
	}
	public String getRoomtype_imgs() {
		return roomtype_imgs;
	}
	public void setRoomtype_imgs(String roomtype_imgs) {
		this.roomtype_imgs = roomtype_imgs;
	}
	
	
}
