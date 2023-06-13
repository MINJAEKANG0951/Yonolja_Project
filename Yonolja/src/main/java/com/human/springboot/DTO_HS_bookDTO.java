package com.human.springboot;

import lombok.Data;

@Data
public class DTO_HS_bookDTO {
	int book_seq;
	int user_seq;
	int room_seq;
	String checkin_date;
	String checkout_date;
	int book_price;
	
	String roomtype_name;
	String place_name;
	int roomtype_seq;
	int place_seq;
}
