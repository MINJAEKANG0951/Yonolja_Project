package com.human.springboot;

import java.lang.reflect.Array;
import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.springboot.DTO_TH;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
	public String admin_user(Model model, HttpServletRequest req) {
//		HttpSession login=req.getSession();
//		login.getAttribute("logid");
//	    int memberEndPageCount = tdao.member_count() / 10; // 전체수의 10을 나눴을때 값
//	    int remainder = tdao.member_count() % 10; // 나머지 값이 있는지 확인
//	    
//	    if (remainder != 0) {
//	        memberEndPageCount++;
//	        
//	    }
//	    int viewpage=tdao.member_count() / 10;
//	    System.out.println("viewpage"+viewpage);
//	    if(viewpage!=1) {
//	    		    model.addAttribute("end", memberEndPageCount);
//	    }
//	    model.addAttribute("start", viewpage);
//
//	    return "admin_user";
		   HttpSession logIn=req.getSession();
		   logIn.getAttribute("logid");
		   model.addAttribute("logId",logIn.getAttribute("logid"));
		   model.addAttribute("start",1);
		   int pageend=tdao.member_count();
		   int pageval=pageend%10;
		   
		   
		   if(pageval==0) {
			   
			   pageend=pageend/10;
		   } else {
			   pageend=(pageend/10)+1;
		   }
		   
		   model.addAttribute("end",pageend);
		   model.addAttribute("cur",1);
		   return "admin_user";
	}
	
	@PostMapping("/member_list")
	@ResponseBody
	public String memberList(HttpServletRequest req) {

		   HttpSession logIn=req.getSession();
		   logIn.getAttribute("logid");   
		   String page=req.getParameter("page");

		   int curpage=Integer.parseInt(page);
		   int rowSize=10;
		   int start=curpage*rowSize-(rowSize-1);;
		   int end=curpage*rowSize;
		   

		ArrayList<DTO_TH> list=tdao.member_list(start,end);
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
	
	
	@GetMapping("/admin_post")
	public String admin_post() {
		
		
		return "admin_post";
	}
	
	@PostMapping("/post_list")
	@ResponseBody
	public String post_list() {
		
		ArrayList<DTO_TH> list=tdao.post_list();
		String str="";
		JSONArray ja=new JSONArray();
		System.out.println("test");
		int count =tdao.post_count();
		System.out.println(count);
		for(int i=0;i<list.size();i++) {
			
			JSONObject jo=new JSONObject();
			str=list.get(i).getPOST_COMMENT();
			System.out.println("a");
			if(str=="" || str==null) {
				str="답변대기";
			} else {
				str="답변완료";
			}
			jo.put("post_seq",list.get(i).getPOST_SEQ());
			jo.put("user_id",list.get(i).getUSER_ID());
			jo.put("post_category",list.get(i).getPOST_CATEGORY());
			jo.put("post_title",list.get(i).getPOST_TITLE());
			jo.put("post_date",list.get(i).getPOST_DATE());
			jo.put("post_comment",str);
			

			ja.put(jo);
			System.out.println("test commet");
			
		}
		System.out.println(ja.toString());
		return ja.toString();
		
	}
	
	
	
}
