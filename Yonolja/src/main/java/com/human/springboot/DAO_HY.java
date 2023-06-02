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

	// manage place 에서 해당place_seq를 대조하여 일치하는 ptype만 자동으로 체크되어있게 하고 
	// 저장되어있던 option만 꺼내서 select 하는 코드 만들기 
	
	ArrayList<DTO_HY_P> showmyPtype();
	ArrayList<DTO_HY_P> showmyPopt();

}
