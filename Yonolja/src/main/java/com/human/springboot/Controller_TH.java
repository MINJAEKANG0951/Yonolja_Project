package com.human.springboot;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.springboot.DTO_TH;
import com.human.springboot.DAO_TH;

@Controller
public class Controller_TH {

	@Autowired
	DAO_TH tdao;
	
	@GetMapping("/admin")
	public String admin() {
		return "admin";
	}
	
	@GetMapping("/admin_review")
	public String admin_review() {
		return "admin_review";
	}
	
	
	@GetMapping("/admin_user")
	public String admin_user() {
		return "admin_user";
	}
	
	@GetMapping("/admin_post")
	public String admin_post() {
		return "admin_post";
	}
	
	@PostMapping("/member_list")
	@ResponseBody
	public String memberList() {
		
		int count=tdao.member_count();
		if(count%2==0) {
			
		}
		ArrayList<DTO_TH> list=tdao.member_list(1,3);
		JSONArray ja= new JSONArray();
		
		
		for(int i=0;i<list.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("user_seq",list.get(i).getUSER_SEQ());
			jo.put("user_id",list.get(i).getUSER_ID());
			jo.put("user_email",list.get(i).getUSER_EMAIL());
			jo.put("user_gender",list.get(i).getUSER_GENDER());
			jo.put("user_mobile",list.get(i).getUSER_MOBILE());
			jo.put("user_name",list.get(i).getUSER_NAME());
			jo.put("user_type",list.get(i).getUSER_TYPE());

			ja.put(jo);
			
		}
		System.out.println(ja.toString());
		return ja.toString();
		
	}
	
}
