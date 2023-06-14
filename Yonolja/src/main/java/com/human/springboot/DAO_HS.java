package com.human.springboot;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DAO_HS {
	
	// 마이페이지 업주 등록한 업장 사진 select
	ArrayList<DTO_HS_userDTO> host_imgs();
	
	// 유저 정보 user_seq에 맞게 가져오기
	List<DTO_HS_userDTO> user_all(int user_seq);
	
	// 마이페이지 내정보관리에서 yonolja_user 정보 수정하기
	void updateUserNolja(int user_seq, String user_email, String user_password, String user_mobile);
	
	// 마이페이지 내정보관리에서 회원탈퇴 눌렀을 때 DB 정보 삭제
	void YonoljaBye(int user_seq);
	
	// 내문의내역에서 user_seq에 맞게, 본인이 쓴 문의 내역 리스트 출력하기
	List<DTO_HS_postDTO> myPostlist(int user_seq);
	
	// 예약내역에서 user_seq에 맞게, 본인이 예약한 호텔 정보 불러오기
	List<DTO_HS_bookDTO> myBooklist(int user_seq);
	
	// 예약내역에서 예약한 내역을 클릭하면 리뷰 등록하기 review insert
	void review_insert(String review_content, int review_star, int book_seq);
	
	// 예약내역에서 예약한 내역 취소(삭제)하기 book delete
	void myBook_delete(int book_seq);
	
	// 나의후기에서 등록한 리뷰 내역 가져오기
	List<DTO_HS_reviewDTO> myReviewlist(int user_seq);
	
	// 나의후기에서 리뷰 수정(업데이트) 하기
	void myreview_update(int review_seq, String review_content, int review_star);
	
	// 나의후기에서 리뷰 삭제 하기
	void myReview_delete(int review_seq);
}
