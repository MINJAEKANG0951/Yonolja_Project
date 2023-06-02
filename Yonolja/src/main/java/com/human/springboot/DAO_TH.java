package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DAO_TH {
	//회원리스트
	ArrayList<DTO_TH> member_list(int start,int end);
	int member_count();
	
	// 문의관리 게시판
	ArrayList<DTO_TH> post_list(int start,int end);
	int post_count();
	
	DTO_TH post_seq_data(int seq);
	
	void post_admin_comment(String comment, int post_seq);
	
	ArrayList<DTO_TH> post_list_search(String search,int start, int end);
	int post_list_search_count(String search);
}
