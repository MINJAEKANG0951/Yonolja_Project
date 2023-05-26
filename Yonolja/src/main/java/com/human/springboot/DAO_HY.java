package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DAO_HY {
	
	// add place 업장추가페이지
	
	ArrayList<DTO_HY_P> showPtype();
	ArrayList<DTO_HY_P> showPoption();
	
	

}
