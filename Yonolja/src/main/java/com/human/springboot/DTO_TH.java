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
	int POST_SEQ;
	int POST_CATEGORY;
	String POST_TITLE;
	String POST_CONTENT;
	String POST_DATE;
	String POST_COMMENT;
}
