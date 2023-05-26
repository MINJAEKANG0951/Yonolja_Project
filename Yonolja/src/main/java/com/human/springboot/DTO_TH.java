package com.human.springboot;

import lombok.Data;

@Data
public class DTO_TH {
	
	int USER_SEQ; // 회원번호
	String USER_ID; // 회원 아이디
	String USER_PASSWORD; // 회원 타입
	String USER_NAME;
	String USER_MOBILE;
	String USER_EMAIL;
	String USER_GENDER;
	String USER_TYPE;
	String USER_SIGNINTYPE; // 네이버 카카오 노멀인지 확인
}
