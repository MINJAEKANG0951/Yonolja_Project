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
	
	  

	

	  
	
	
	
}
