package com.human.springboot;

import java.util.ArrayList;

import lombok.Data;

@Data
public class DTO_HY_roomtypeDTO {
	
	int roomtype_seq;
	String roomtype_name;
	int place_seq;
	String roomtype_imgs;
	int roomtype_capacity;
	int roomtype_price; 
	String roomtype_options;
	String roomtype_guide; 
	
	
	//room table 관련 
	int room_seq;
	int room_number;
	
	// roomtype option select 관련
	
	int place_option_seq;
	String place_option_name;
	ArrayList<DTO_HY_roomtypeDTO> options;

}
