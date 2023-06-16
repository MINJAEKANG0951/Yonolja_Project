package com.human.springboot;

import lombok.Data;

@Data
public class DTO_HS_bookDTO {
	int book_seq;
	int user_seq;
	int room_seq;
	String checkin_date;
	String checkout_date;
	int book_price;
	
	String roomtype_name;
	String place_name;
	int roomtype_seq;
	int place_seq;
	int review_seq;
	String review_status;
	
    // Pagination
	private int totalCount;  // 전체 리뷰 갯수
	private int pageNumber;  // 현재 페이지 번호
	private int pageSize;    // 페이지당 출력할 항목 수
}
