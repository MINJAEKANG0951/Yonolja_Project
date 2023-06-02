package com.human.springboot;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DAO_HS {
	ArrayList<DTO_HS_userDTO> host_imgs();
}
