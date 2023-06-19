package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
			String place_checkout_time, String place_address,String place_mobile,
			String place_guide,String place_environment);
	
	// RoomType insert 
	
	void addRoomType(String rname,int place_seq, String defalt_img, int maxCapacity, int nightRate, String roomtype_options, String roomGuide);
	
	// RoomType select
	
	ArrayList<DTO_HY_roomtypeDTO> getRoomtype(int place_seq);
	
	//Roomtype update
	
	void modifyRoomtype(int roomtype_seq, String roomtype_name, int place_seq,  int roomtype_capacity, int roomtype_price,String roomtype_opt, String roomtype_guide);	

	//Roomtype delete 
	
	void deleteRoomtype(int roomtype_seq);
	
	//Room insert
	
	void addRoom(int roomtype_seq, int room_number);
	
	//Room select 
	ArrayList<DTO_HY_roomtypeDTO> showRooms(int roomtype_seq);
	
	//Room delete 
	void deleteRoomNum(int room_number);

	//room insert 시 동일객실존재하는지 체크 part 
//	int checkRoomExists(int place_seq, int roomNumber);
	Integer checkRoomExists(int place_seq, int roomNumber);


	// place Delete 
	void deletePlace(int place_seq);	
	
	
	// roomtype_optin name 관련 
	ArrayList<DTO_HY_roomtypeDTO> getroomtype2(int place_option_seq);
	
	
	
	
	
	
	
	
	
	
	
	// test img insert
	Object getImgAddress(int img_seq);
	void updateImg(String img_address, int roomtype_seq);
	void insertimg(String img_address);
	
	
}
