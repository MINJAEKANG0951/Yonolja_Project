package com.human.springboot;

import lombok.Data;

@Data
public class DTO_HS_postDTO {

	int post_seq;
	int post_category;
	int user_seq;
	String post_title;
	String post_content;
	String post_date;
	String post_comment;
	String post_img;
	
}
