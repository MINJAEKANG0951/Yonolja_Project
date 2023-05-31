package com.human.springboot;

import lombok.Data;

@Data
public class DTO_HY_P {
	// host_addPlace page 셀렉트박스 옵션값 불러오기  
	String place_type_name;
	int place_type_seq;
	
	
	int place_option_seq;
	String place_option_name;
	
	// gpt추가 
	public String getLabel() {
	      return place_option_seq + "," + place_option_name;
	 }

	
	
	public String getPlace_type_name() {
		return place_type_name;
	}

	public void setPlace_type_name(String place_type_name) {
		this.place_type_name = place_type_name;
	}

	public int getPlace_type_seq() {
		return place_type_seq;
	}

	public void setPlace_type_seq(int place_type_seq) {
		this.place_type_seq = place_type_seq;
	}

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
	
	  

	

	  
	
	
	
}
