package com.human.springboot;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DAO_YT {

	
	void insertPost(int post_seq, String post_category, int user_seq, String post_content,
			String post_date,String post_comment);
	
	
}
