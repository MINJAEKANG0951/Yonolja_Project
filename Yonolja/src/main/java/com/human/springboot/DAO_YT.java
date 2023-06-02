package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DAO_YT {
	
	
	ArrayList<DTO_YT> selectPost();
	ArrayList<DTO_YT> postview();
    void insertPost(String post_category, int user_seq, String post_title,
                    String post_content, String post_img);
    
    
    DTO_YT_postDTO getPost(int post_seq);
    String getUserName(int user_seq);
    
} 
