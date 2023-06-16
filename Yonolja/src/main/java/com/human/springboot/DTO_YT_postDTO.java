package com.human.springboot;


import lombok.Data;

@Data
public class DTO_YT_postDTO {

	int post_seq;
	int post_category;
	int user_seq;
	int user_id;
	String post_title;
	String post_content;
	String post_date;
	String post_comment;
	String post_img;

	String type;
	int num;
	String keyword;
	String searchCategory;
}
