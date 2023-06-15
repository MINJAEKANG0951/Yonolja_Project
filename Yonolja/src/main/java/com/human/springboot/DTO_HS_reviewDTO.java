package com.human.springboot;

import lombok.Data;

@Data
public class DTO_HS_reviewDTO {
	int review_seq;
	String review_content;
	String review_date;
	int review_star;
	int book_seq;

	int user_seq;
	String place_name;
	String checkin_date;
	int place_seq;
	String roomtype_name;
	
    // Pagination
	private int totalCount;  // 전체 리뷰 갯수
	private int pageNumber;  // 현재 페이지 번호
	private int pageSize;    // 페이지당 출력할 항목 수
}
