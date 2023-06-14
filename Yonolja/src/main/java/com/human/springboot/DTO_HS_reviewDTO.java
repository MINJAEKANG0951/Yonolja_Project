package com.human.springboot;

import lombok.Data;

@Data
public class DTO_HS_reviewDTO {
	int review_seq;
	String review_content;
	String review_date;
	int review_star;
	int book_seq;

	int user_seq;
	String place_name;
	String checkin_date;
	int place_seq;
	String roomtype_name;
}
