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
	// 통합검색
	ArrayList<DTO_TH> post_list_search(String search,int start, int end);
	int post_list_search_count(String search);
	// 아이디 검색
	ArrayList<DTO_TH>post_list_search_id(String search,int start, int end);
	int post_list_search_id_count(String search);
	// 제목 검색
	ArrayList<DTO_TH>post_list_search_title(String search,int start, int end);
	int post_list_search_title_count(String search);
	// 내용 검색
	ArrayList<DTO_TH>post_list_search_content(String search,int start, int end);
	int post_list_search_content_count(String search);
}
