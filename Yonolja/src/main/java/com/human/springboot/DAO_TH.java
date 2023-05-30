package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DAO_TH {
	//회원리스트
	ArrayList<DTO_TH> member_list(int start,int end);
	int member_count();
	
	ArrayList<DTO_TH> post_list();
	int post_count();
}
