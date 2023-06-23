package com.human.springboot;

import lombok.Data;

@Data
public class DTO_YT_boardPostDTO {
	
	int post_seq;
	String user_id;
	int post_category;
	String post_title;
	String post_date;
	String post_content;
	String post_comment;
	String post_img;


}
