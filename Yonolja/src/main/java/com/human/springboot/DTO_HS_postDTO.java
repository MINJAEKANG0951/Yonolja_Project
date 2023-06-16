package com.human.springboot;

import lombok.Data;

@Data
public class DTO_HS_postDTO {

	int post_seq;
	int post_category;
	int user_seq;
	String post_title;
	String post_content;
	String post_date;
	String post_comment;
	String post_img;
	
    // Pagination
	private int totalCount;  // 전체 리뷰 갯수
	private int pageNumber;  // 현재 페이지 번호
	private int pageSize;    // 페이지당 출력할 항목 수
}
