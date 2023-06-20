package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DAO_MJ {
	
	ArrayList<DTO_MJ_userDTO> getNormalUsers();
	void addUser(String id, String ps, String name, String mobile, String email, String gender, String type, String SigninType);
	
	
	ArrayList<DTO_MJ_placeOptionDTO> getPlaceOptions();
	ArrayList<DTO_MJ_placeEnvironmentDTO> getPlaceEnvironments();
	ArrayList<DTO_MJ_placeTypeDTO> getPlaceTypes();
	ArrayList<DTO_MJ_placeDTO_forMain> getPlaces(String sql);
	
	float getReviewRate(int placeSeq);
	
	
	DTO_MJ_placeDTO getPlace(int place_seq);
	int countReviews(int place_seq);
	ArrayList<String> placeAlloptions(int place_seq);
	
	
	DTO_MJ_roomTypeOptionDTO getRoomTypeOption(int place_option_seq);
	ArrayList<DTO_MJ_placeRoomTypeDTO> getRoomTypes(int place_seq, String sql, int start, int end);
	
	ArrayList<DTO_MJ_reviewDTO> getReviews(int place_seq, String sql, int start, int end);
	
	DTO_MJ_roomTypeDTO getRoomType(int roomtype_seq);
	
}
