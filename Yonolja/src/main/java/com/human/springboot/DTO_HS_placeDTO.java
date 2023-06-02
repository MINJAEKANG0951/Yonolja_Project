package com.human.springboot;

import lombok.Data;

@Data
public class DTO_HS_placeDTO {
	  int place_seq; 
	  String place_name;
	  int user_seq;
	  int place_type_seq;
	  String checkin_time;
	  String checkout_time;
	  String address;
	  String place_imgs;
	  String mobile;
	  String place_options;
	  String place_guide;
}
