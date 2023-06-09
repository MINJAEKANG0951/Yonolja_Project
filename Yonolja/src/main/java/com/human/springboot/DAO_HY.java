package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DAO_HY {
	
	// add place 업장추가페이지
	
	ArrayList<DTO_HY_P> showPtype();
	ArrayList<DTO_HY_P> showPoption();
	
	// 업장추가페이지에서 db에 업장 insert
	
	void addplace(String pname, int user_seq, int ptype, String checkin, String checkout, String address, String img, String mobile, String options, String guide, String place_environments);
	ArrayList<DTO_HY_P> getEnvironments();
	
	DTO_HY_placeDTO getPlace(int place_seq);
	
	
	// host_managePlace 관련 정보수정 
	
	void changePlace(int place_seq, String place_name, int user_seq, int place_type_seq, String place_checkin_time,
			String place_checkout_time, String place_address,String place_mobile, String place_options,
			String place_guide,String place_environment);
	
	// RoomType insert 
	
	void addRoomType(String rname,int place_seq, String img, int maxCapacity, int nightRate, String roomGuide);
	
	// RoomType select
	
	DTO_HY_roomtypeDTO getRoomtype(int place_seq);

}
