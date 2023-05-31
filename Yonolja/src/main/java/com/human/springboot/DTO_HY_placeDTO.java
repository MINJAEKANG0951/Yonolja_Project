package com.human.springboot;

import lombok.Data;

@Data
public class DTO_HY_placeDTO {

	  int place_seq; 
	  String place_name;
	  int user_seq;
	  int place_type_seq;
	  String checkin_time;
	  String checkout_time;
	  String address;
	  String imgs;
	  String mobile;
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
	public String getCheckin_time() {
		return checkin_time;
	}
	public void setCheckin_time(String checkin_time) {
		this.checkin_time = checkin_time;
	}
	public String getCheckout_time() {
		return checkout_time;
	}
	public void setCheckout_time(String checkout_time) {
		this.checkout_time = checkout_time;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getImgs() {
		return imgs;
	}
	public void setImgs(String imgs) {
		this.imgs = imgs;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
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
