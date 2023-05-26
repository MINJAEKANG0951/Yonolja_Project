package com.human.springboot;

import lombok.Data;

@Data
public class DTO_HY_P {
	// host_addPlace page관련 
	String PLACE_TYPE_NAME;
	int place_option_seq;
	String place_option_name;
	
	// gpt추가 
	  public String getLabel() {
	        return place_option_seq + "," + place_option_name;
	    }
	
	

	
	
	
}
