package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DAO_MJ {
	
	ArrayList<DTO_MJ_userDTO> getNormalUsers();
	void addUser(String id, String ps, String name, String email, String mobile, String gender, String type, String SigninType);
	
	
	ArrayList<DTO_MJ_placeOptionDTO> getPlaceOptions();
	
}
