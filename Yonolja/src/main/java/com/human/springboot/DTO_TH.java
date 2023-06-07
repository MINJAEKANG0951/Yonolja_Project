package com.human.springboot;

import lombok.Data;

@Data
public class DTO_TH {
	// 회원관리
	int USER_SEQ; // 회원번호
	String USER_ID; // 회원 아이디
	String USER_PASSWORD; // 회원 타입
	String USER_NAME;
	String USER_MOBILE;
	String USER_EMAIL;
	String USER_GENDER;
	String USER_TYPE;
	String USER_SIGNINTYPE; // 네이버 카카오 노멀인지 확인
	
	// 회원게시판 관리
	int post_seq;
	int post_category;
	String post_title;
	String post_content;
	String post_date;
	String post_comment;
	
	//호텔 옵션타입관리
	int place_type_seq;
	String place_type_name;
	String place_type_img;
	
	int place_option_seq;
	String place_option_name;
	String place_option_img;
}
