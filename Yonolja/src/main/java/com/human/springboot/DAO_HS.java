package com.human.springboot;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DAO_HS {
	ArrayList<DTO_HS_userDTO> host_imgs();
	List<DTO_HS_userDTO> user_all(int user_seq);
	void updateUserNolja(int user_seq, String user_email, String user_password, String user_mobile);
	void YonoljaBye(int user_seq);
	
	List<DTO_HS_postDTO> myPostlist(int user_seq);

}
