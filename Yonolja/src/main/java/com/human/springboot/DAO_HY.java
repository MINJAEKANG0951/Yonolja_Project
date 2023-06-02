package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DAO_HY {
	
	// add place 업장추가페이지
	
	ArrayList<DTO_HY_P> showPtype();
	ArrayList<DTO_HY_P> showPoption();
	
	// 업장추가페이지에서 db에 업장 insert
	
	void addplace(String pname, int user_seq, int ptype, String checkin, String checkout, String address, String img, String mobile, String options, String guide);



}
