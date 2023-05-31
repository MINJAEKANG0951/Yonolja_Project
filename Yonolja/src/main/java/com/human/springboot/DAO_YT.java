package com.human.springboot;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DAO_YT {
    void insertPost(String post_category, int user_seq, String post_title,
                    String post_content, String post_img);
} 
