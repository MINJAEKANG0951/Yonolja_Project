package com.human.springboot;

import lombok.Data;

@Data
public class DTO_MJ_placeTypeDTO {

	
	int place_type_seq;
	String place_type_name;
	String place_type_img;
	
	
	public int getPlace_type_seq() {
		return place_type_seq;
	}
	public void setPlace_type_seq(int place_type_seq) {
		this.place_type_seq = place_type_seq;
	}
	public String getPlace_type_name() {
		return place_type_name;
	}
	public void setPlace_type_name(String place_type_name) {
		this.place_type_name = place_type_name;
	}
	public String getPlace_type_img() {
		return place_type_img;
	}
	public void setPlace_type_img(String place_type_img) {
		this.place_type_img = place_type_img;
	}
	
	
	
	
	
}
