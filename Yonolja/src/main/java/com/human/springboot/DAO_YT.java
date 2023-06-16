package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface DAO_YT {
	
	
	
	
	ArrayList<DTO_YT> selectPost();
	ArrayList<DTO_YT> selectPost_seq();
	ArrayList<DTO_YT> postview();
    void insertPost(String post_category, int user_seq, String post_title,
                    String post_content, String post_img);
    
    
    DTO_YT_postDTO getPost(int post_seq);
    
    String getUserName(int user_seq);
	void deletePost(int post_seq);
	
	void updatePost(String post_title, String post_content, int post_seq);
	
//	ArrayList<DTO_YT> searchPosts(String searchCategory, String keyword);
	
//	ArrayList<DTO_YT> searchPosts(String searchCategory, String keyword);

	ArrayList<DTO_YT> searchPosts(@Param("searchCategory") String searchCategory, @Param("keyword") String keyword);
} 
