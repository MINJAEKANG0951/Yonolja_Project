package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DAO_TH {
	//회원리스트
	ArrayList<DTO_TH> member_list(int start,int end);
	int member_count();
	
	// 통합검색
	ArrayList<DTO_TH> admin_user_search(String search,int start,int end);
	int admin_user_search_count(String search);
	// 이름 검색
	ArrayList<DTO_TH>admin_user_search_name(String search,int start,int end);
	int admin_user_search_name_count(String search);
	
	// 아이디 검색
	ArrayList<DTO_TH>admin_user_search_id(String search,int start,int end);
	int admin_user_search_id_count(String search);
	
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
	// 개별 내용 보기
	DTO_TH post_list_diolog(int seq);
	//post_delete
	void post_delete_list(String seq);
	
	// 호텔 타입 관리
	ArrayList<DTO_TH> yonolja_place_type_list();
	// 호텔 타입 옵션 추가
	void yonolja_place_type_add(String name, String url);
	// 호텔 타입 이름,이미지 변경
	void yonolja_place_type_update_all(int seq, String name, String img);
	// 호텔 타입 이름만 변경
	void yonolja_place_type_update_name(int seq, String name);
	// 호텔 타입 삭제
	void yonolja_place_type_delete(int seq);
	
	// 호텔 타입 관리
	ArrayList<DTO_TH> yonolja_place_option_list();
	// 호텔 타입 옵션 추가
	void yonolja_place_option_add(String name, String url);
	// 호텔 타입 이름,이미지 변경
	void yonolja_place_option_update_all(int seq, String name, String img);
	// 호텔 타입 이름만 변경
	void yonolja_place_option_update_name(int seq, String name);
	// 호텔 타입 삭제
	void yonolja_place_option_delete(int seq);
	
	// 관리자 리뷰 관리
	ArrayList<DTO_TH> yonolja_review_list(int start,int end);
	int yonolja_review_page();
	
	//review delete
	void review_delete_list(String seq);
	// 관리자 리뷰 관리 검색
	ArrayList<DTO_TH> yonolja_review_search(String search, int start, int end);
	int yonolja_review_search_page(String search);
}
