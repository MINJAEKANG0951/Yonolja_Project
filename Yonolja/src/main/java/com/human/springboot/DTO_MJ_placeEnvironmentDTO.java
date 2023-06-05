package com.human.springboot;

import lombok.Data;

@Data
public class DTO_MJ_placeEnvironmentDTO {
	
	int place_environment_seq;
	String place_environment_name;
	String place_environment_img;
	
	public int getPlace_environment_seq() {
		return place_environment_seq;
	}
	public void setPlace_environment_seq(int place_environment_seq) {
		this.place_environment_seq = place_environment_seq;
	}
	public String getPlace_environment_name() {
		return place_environment_name;
	}
	public void setPlace_environment_name(String place_environment_name) {
		this.place_environment_name = place_environment_name;
	}
	public String getPlace_environment_img() {
		return place_environment_img;
	}
	public void setPlace_environment_img(String place_environment_img) {
		this.place_environment_img = place_environment_img;
	}
	
	
	
}
