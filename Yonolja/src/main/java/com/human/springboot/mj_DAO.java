package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface mj_DAO {
	
	void addData(String name, String data);
	void deleteData(String name, String data);
	void updateData(String name, String data);
	ArrayList<mj_DTO> getData();
	
	// 수정함 ㅋㅋ 
	ArrayList<mj_bookDTO> getBooks(int room_seq);
	
	
	void addBusiness(String name, String owner, String type, String address);
	ArrayList<mj_hotelDTO> getBusinessList();
	
	ArrayList<mj_hotelDTO> keywordSearchByName(String keyword);
	ArrayList<mj_hotelDTO> keywordSearchByRegion(String keyword);
	
	
	void empty_user_connected();
}
