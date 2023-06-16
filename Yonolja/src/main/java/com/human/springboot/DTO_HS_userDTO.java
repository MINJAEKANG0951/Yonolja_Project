package com.human.springboot;

import lombok.Data;

@Data
public class DTO_HS_userDTO {
	int user_seq;
	String user_id;
	String user_password;
	String user_name;
	String user_mobile;
	String user_email;
	String user_gender;
	String user_type;
	String user_signinType;
	
	String place_imgs;
	int place_seq; 
	String place_name;

    // Pagination
	private int totalCount;  // 전체 리뷰 갯수
	private int pageNumber;  // 현재 페이지 번호
	private int pageSize;    // 페이지당 출력할 항목 수

}
