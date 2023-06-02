package com.human.springboot;

import java.lang.reflect.Array;
import java.net.http.HttpRequest;
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

import jakarta.mail.Session;
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
		  
		   int pageend=tdao.member_count();
		   int pageval=pageend%10;
		   
		   
			   model.addAttribute("start",1);
			   model.addAttribute("end",pageend);
			   model.addAttribute("cur",1);
			   
		 
		   if(pageval==0) {
			   
			   pageend=pageend/10;
		   } else {
			   pageend=(pageend/10)+1;
		   }
	
	
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
	public String admin_post(HttpServletRequest req, Model model) {
		
		   HttpSession logIn=req.getSession();
		   logIn.getAttribute("logid");
		   model.addAttribute("logId",logIn.getAttribute("logid"));
		   
		   int pageend=tdao.post_count();
		   int pageval=pageend%10;
		   
		   if( logIn.getAttribute("search")!=null) {
			   model.addAttribute("search",logIn.getAttribute("search"));
			   pageend=tdao.post_list_search_count((String)logIn.getAttribute("search"));
			   if(pageval==0) {
				   
				   pageend=pageend/10;
			   } else {
				   pageend=(pageend/10)+1;
			   } 
			   model.addAttribute("search_page_start",1);  
			   model.addAttribute("search_page_end",pageend);

		   }else {
			   if(pageval==0) {
				   
				   pageend=pageend/10;
			   } else {
				   pageend=(pageend/10)+1;
			   } 
			   logIn.getAttribute("search");
			   model.addAttribute("start",1);
			   model.addAttribute("end",pageend);
			   model.addAttribute("cur",1);
		   }
		   
		   System.out.println(logIn.getAttribute("search"));
		   
		    
		   
		   

		   return "admin_post";
		
		
	}
	
	@PostMapping("/post_list")
	@ResponseBody
	public String post_list(HttpServletRequest req) {
		   HttpSession logIn=req.getSession();
		   logIn.getAttribute("logid");   
		   String page=req.getParameter("page");

		   int curpage=Integer.parseInt(page);
		   int rowSize=10;
		   int start=curpage*rowSize-(rowSize-1);;
		   int end=curpage*rowSize;
		   

		ArrayList<DTO_TH> list=tdao.post_list(start,end);
		JSONArray ja= new JSONArray();
		

		String str="";


		int count =tdao.post_count();
		System.out.println(count);
		for(int i=0;i<list.size();i++) {
			
			JSONObject jo=new JSONObject();
			str=list.get(i).getPost_comment();
			System.out.println("a");
			if(str=="" || str==null) {
				str="답변대기";
			} else {
				str="답변완료";
			}
			jo.put("post_seq",list.get(i).getPost_seq());
			jo.put("user_id",list.get(i).getUSER_ID());
			jo.put("post_category",list.get(i).getPost_category());
			jo.put("post_title",list.get(i).getPost_title());
			jo.put("post_date",list.get(i).getPost_date());
			jo.put("post_comment",str);
			

			ja.put(jo);
			System.out.println("test commet");
			
		}
		System.out.println(ja.toString());
		return ja.toString();
		
	}
	
	@PostMapping("/admin_post_comment")
	@ResponseBody
	public String admin_post_commnet(HttpServletRequest req,Model model) {
		int post_seq=Integer.parseInt(req.getParameter("post_date"));
		System.out.println(post_seq+"test seq");
		tdao.post_seq_data(post_seq);
		System.out.println(tdao.post_seq_data(post_seq));
		model.addAttribute("post_seq", post_seq);
		System.out.println("model test"+model.addAttribute("post_seq", post_seq));
		DTO_TH list=tdao.post_seq_data(post_seq);
		JSONArray ja= new JSONArray();
		

		String str="";

			JSONObject jo=new JSONObject();
			str=list.getPost_comment();
			System.out.println("a");
			if(str=="" || str==null) {
				str="답변대기";
			} else {
				str="답변완료";
			}
			jo.put("post_seq",list.getPost_seq());
			jo.put("user_id",list.getUSER_ID());
			jo.put("post_category",list.getPost_category());
			jo.put("post_title",list.getPost_title());
			jo.put("post_date",list.getPost_date());
			jo.put("post_comment",str);
			jo.put("post_content",list.getPost_content());
			System.out.println("content test"+list.getPost_content());

			ja.put(jo);
			System.out.println("test commet");
			
		
		System.out.println(ja.toString());
		return ja.toString();
//		return "ok";
	}
	@PostMapping("/admin_comment_registration")
	@ResponseBody
	public String admin_comments_registration(HttpServletRequest req) {
		
		String reVal="ok";
		
		String admin_comment=req.getParameter("admin_comment");

		int post_seq=Integer.parseInt(req.getParameter("post_seq"));
		System.out.println(admin_comment+"myTest1test"+post_seq);
		try {
			if(!admin_comment.equals("") || !admin_comment.equals(null)) {
				tdao.post_admin_comment(admin_comment, post_seq);
			}
		} catch (Exception e) {
			System.out.println("admin_comment_registration error");
			reVal="fail";
			// TODO: handle exception
		}
		

		
		return reVal;
	}
	
	@PostMapping("/post_search")
	@ResponseBody
	public String post_search(HttpServletRequest req) {
		
		String search=req.getParameter("admin_post_searchBar");
		HttpSession search_session= req.getSession();
		
		
		search_session.setAttribute("search", search);
		
		String select_select=req.getParameter("admin_post_search_select");
		String page=req.getParameter("page");
		   
		int pageend=tdao.post_list_search_count(search);
		int pageval=pageend%10;
		 if(pageval==0) {
			   
			   pageend=pageend/10;
		   } else {
			   pageend=(pageend/10)+1;
		   }
		   int curpage=Integer.parseInt(page);
		   int rowSize=10;
		   int start=curpage*rowSize-(rowSize-1);;
		   int end=curpage*rowSize;
		
		ArrayList<DTO_TH> list=tdao.post_list_search(search,start,end);
		JSONArray ja= new JSONArray();
		

		String str="";

		
		for(int i=0;i<list.size();i++) {
			
			JSONObject jo=new JSONObject();
			str=list.get(i).getPost_comment();
			System.out.println("a");
			if(str=="" || str==null) {
				str="답변대기";
			} else {
				str="답변완료";
			}
			jo.put("post_seq",list.get(i).getPost_seq());
			jo.put("user_id",list.get(i).getUSER_ID());
			jo.put("post_category",list.get(i).getPost_category());
			jo.put("post_title",list.get(i).getPost_title());
			jo.put("post_date",list.get(i).getPost_date());
			jo.put("post_comment",str);
			

			ja.put(jo);
			System.out.println("test search");
			
		}
		System.out.println(ja.toString());
		return ja.toString();
				
	}
	@PostMapping("/admin_post_reset")
	@ResponseBody
	public String admin_post_reset(HttpServletRequest req) {
		String reVal="ok";

		
		try {
			
			HttpSession reset_session=req.getSession();
			reset_session.setAttribute("search",null);
			System.out.println(reset_session.getAttribute("search"));
		} catch (Exception e) {
			reVal="fail";
		}
		
		
		return reVal;
		
	}
	
	
}
