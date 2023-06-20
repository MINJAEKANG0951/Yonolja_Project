package com.human.springboot;

import lombok.Data;

@Data
public class DTO_MJ_reviewDTO {
		
	int review_seq;
	String user_id;
	String roomtype_name;
	int review_star;
	String review_content;
	String review_date;
	
	public int getReview_seq() {
		return review_seq;
	}
	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRoomtype_name() {
		return roomtype_name;
	}
	public void setRoomtype_name(String roomtype_name) {
		this.roomtype_name = roomtype_name;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	
	
}
