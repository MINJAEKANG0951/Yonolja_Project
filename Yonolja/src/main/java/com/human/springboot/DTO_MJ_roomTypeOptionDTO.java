package com.human.springboot;

import lombok.Data;

@Data
public class DTO_MJ_roomTypeOptionDTO {

	int place_option_seq;
	String place_option_name;
	String place_option_img;
	
	
	public int getPlace_option_seq() {
		return place_option_seq;
	}
	public void setPlace_option_seq(int place_option_seq) {
		this.place_option_seq = place_option_seq;
	}
	public String getPlace_option_name() {
		return place_option_name;
	}
	public void setPlace_option_name(String place_option_name) {
		this.place_option_name = place_option_name;
	}
	public String getPlace_option_img() {
		return place_option_img;
	}
	public void setPlace_option_img(String place_option_img) {
		this.place_option_img = place_option_img;
	}
	
	
	
}
