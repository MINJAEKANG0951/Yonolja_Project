package com.human.springboot;

import lombok.Data;

@Data
public class DTO_MJ_placeDTO {
	
	  int place_seq; 
	  String place_name;
	  int user_seq;
	  int place_type_seq;
	  String place_checkin_time;
	  String place_checkout_time;
	  String place_address;
	  String place_imgs;
	  String place_mobile;
	  String place_options;
	  String place_guide;
	  
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
	public int getUser_seq() {
		return user_seq;
	}
	public void setUser_seq(int user_seq) {
		this.user_seq = user_seq;
	}
	public int getPlace_type_seq() {
		return place_type_seq;
	}
	public void setPlace_type_seq(int place_type_seq) {
		this.place_type_seq = place_type_seq;
	}
	public String getPlace_checkin_time() {
		return place_checkin_time;
	}
	public void setPlace_checkin_time(String place_checkin_time) {
		this.place_checkin_time = place_checkin_time;
	}
	public String getPlace_checkout_time() {
		return place_checkout_time;
	}
	public void setPlace_checkout_time(String place_checkout_time) {
		this.place_checkout_time = place_checkout_time;
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
	public String getPlace_mobile() {
		return place_mobile;
	}
	public void setPlace_mobile(String place_mobile) {
		this.place_mobile = place_mobile;
	}
	public String getPlace_options() {
		return place_options;
	}
	public void setPlace_options(String place_options) {
		this.place_options = place_options;
	}
	public String getPlace_guide() {
		return place_guide;
	}
	public void setPlace_guide(String place_guide) {
		this.place_guide = place_guide;
	}
	  
	
	
	  
	  
}
