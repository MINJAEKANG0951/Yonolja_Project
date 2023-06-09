package com.human.springboot;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;

import com.human.springboot.DTO_TH;

import jakarta.mail.Session;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import com.human.springboot.DAO_TH;

@Controller
public class Controller_TH {
	String imgUrl="";
	String urlPass="C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\place_type";
	String urlPass_option="C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\place_option";
	@Autowired
	DAO_TH tdao;
	
	@GetMapping("/admin")
	public String admin() {
		return "admin";
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
		   	   if(pageval==0) {
			   
			   pageend=pageend/10;
		   } else {
			   pageend=(pageend/10)+1;
		   }
		   
			   model.addAttribute("start",1);
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
	
	@PostMapping("/admin_user_search")
	@ResponseBody
	public String admin_user_search(HttpServletRequest req) {
		String searchVal=req.getParameter("search");
		System.out.println(searchVal);
		ArrayList<DTO_TH> list=tdao.admin_user_search(searchVal);
		System.out.println("list"+list);
		JSONArray ja=new JSONArray();
		
		for(int i=0;i<list.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("user_seq",list.get(i).getUSER_SEQ());
			System.out.println(jo);
			jo.put("user_id",list.get(i).getUSER_ID());
			jo.put("user_email",list.get(i).getUSER_EMAIL());
			jo.put("user_gender",list.get(i).getUSER_GENDER());
			jo.put("user_mobile",list.get(i).getUSER_MOBILE());
			jo.put("user_name",list.get(i).getUSER_NAME());
			jo.put("user_type",list.get(i).getUSER_TYPE());
			ja.put(jo);
		}
		System.out.println(list.size());

		System.out.println("ja.toString="+ja.toString());
		System.out.println("test"+ja);
		return ja.toString();
	}
	
	@PostMapping("/admin_user_search_paging")
	@ResponseBody
	public int admin_user_search_paging(HttpServletRequest req) {
		String search=req.getParameter("search");
		int number=tdao.admin_user_search_count(search);
		System.out.println(number);
		int page;
		if(number%10==0) {
			page=number/10;
			
		}else {
			page=(number/10)+1;
		}
		
		return page;
	}
	
	
	@GetMapping("/admin_post")
	public String admin_post(HttpServletRequest req, Model model) {
		
		   HttpSession logIn=req.getSession();
		   logIn.getAttribute("logid");
		   model.addAttribute("logId",logIn.getAttribute("logid"));
		   
		   int pageend=tdao.post_count();
		   int pageval=pageend%10;
		   
		   if( logIn.getAttribute("search")!=null && logIn.getAttribute("select")=="0") {
			   model.addAttribute("search",logIn.getAttribute("search"));
			   pageend=tdao.post_list_search_count((String)logIn.getAttribute("search"));
			   
			   if(pageval==0) {
				   
				   pageend=pageend/10;
			   } else {
				   pageend=(pageend/10)+1;
			   } 
			   model.addAttribute("search_page_start",1);  
			   model.addAttribute("search_page_end",pageend);

		   }else if(logIn.getAttribute("search")!=null && logIn.getAttribute("select")=="1"){
			   model.addAttribute("search",logIn.getAttribute("search"));
			   model.addAttribute("select",logIn.getAttribute("select"));
			   pageend=tdao.post_list_search_title_count((String)logIn.getAttribute("search"));
			   
			   if(pageval==0) {
				   
				   pageend=pageend/10;
			   } else {
				   pageend=(pageend/10)+1;
			   } 
			   model.addAttribute("search_page_start",1);  
			   model.addAttribute("search_page_end",pageend);
		   }else if(logIn.getAttribute("search")!=null && logIn.getAttribute("select")=="2"){
			   model.addAttribute("search",logIn.getAttribute("search"));
			   pageend=tdao.post_list_search_id_count((String)logIn.getAttribute("search"));
			   
			   if(pageval==0) {
				   
				   pageend=pageend/10;
			   } else {
				   pageend=(pageend/10)+1;
			   } 
			   model.addAttribute("search_page_start",1);  
			   model.addAttribute("search_page_end",pageend);
		   }else if(logIn.getAttribute("search")!=null && logIn.getAttribute("select")=="3"){
			   model.addAttribute("search",logIn.getAttribute("search"));
			   pageend=tdao.post_list_search_content_count((String)logIn.getAttribute("search"));
			   
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
		HttpSession search_session=req.getSession();
		ArrayList<DTO_TH> list=null;
		

		String select=req.getParameter("admin_post_search_select");
		System.out.println("select test"+select);
		search_session.setAttribute("search", search);
		search_session.setAttribute("select", select);
		
		String page=req.getParameter("page");
		JSONArray ja= new JSONArray();
		
		if(select.equals("0")) {
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
	
		   list=tdao.post_list_search(search,start,end);
	
		}else if(select.equals("1")) {
			int pageend=tdao.post_list_search_title_count(search);
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
	
		   list=tdao.post_list_search_title(search,start,end);
		}else if(select.equals("2")) {
			int pageend=tdao.post_list_search_id_count(search);
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
	
		   list=tdao.post_list_search_id(search,start,end);
		} else {
			int pageend=tdao.post_list_search_content_count(search);
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
	
		   list=tdao.post_list_search_content(search,start,end);
		}

		
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
	

	@PostMapping("/yonolja_place_type_list")
	@ResponseBody
	public String yonolja_place_type_list(HttpServletRequest req) {
		
		ArrayList<DTO_TH> list = tdao.yonolja_place_type_list();
		JSONArray ja= new JSONArray();
		
		for(int i=0;i<list.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("seq",list.get(i).getPlace_type_seq());
			jo.put("name",list.get(i).getPlace_type_name());
			jo.put("img",list.get(i).getPlace_type_img());
			ja.put(jo);
		
		}
		System.out.println(ja.toString());
		return ja.toString();
	}
	
	
	
	   @PostMapping("/type_img")
	   @ResponseBody
	   public String type_Img(HttpServletRequest req, MultipartFile file) {
	      String img="ok";
	  
		   try {
	         String fileName = file.getOriginalFilename();
//	         String fileName = file.getOriginalFilename();
	         String uploadDir = req.getServletContext().getRealPath("/main/resources/static/img/place_type");
	         String filePath = uploadDir + "\\" + fileName;
//	         C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\place_type
	         // webapp 폴더까지의 경로 정보를 가져온다. 
	         String data_img_url="/img/place_type/" + fileName;
	         System.out.println(filePath);
	         file.transferTo(new File(urlPass+"\\"+fileName));
	         System.out.println("check list");
	         imgUrl=data_img_url;
//	        System.out.println("main test="+sub_url);
//	         hdao.main_img(sub_url);
	        System.out.println("??");
	      } catch (Exception ex) {
	         System.out.println(ex.getMessage());
	         img="fail";
	      }
		   return img;
	   	}
	
	
	@PostMapping("/yonolja_place_type_add")
	@ResponseBody
	public String yonolja_place_type_add(HttpServletRequest req) {
		String checkVal="ok";
		String seq="";
		String name=req.getParameter("name");
		try {
			tdao.yonolja_place_type_add(name, imgUrl);

	
		} catch (Exception e) {
			System.out.println(e.getMessage());
			checkVal="fail";
		}
		
		return checkVal;
		
	}
	
	@PostMapping("/update_type_name")
	@ResponseBody
	public String update_type_name(HttpServletRequest req) {
		String checkVal="ok";
		String name=req.getParameter("name");
		int seq=Integer.parseInt(req.getParameter("seq"));
		try {
			tdao.yonolja_place_type_update_name(seq, name);
		} catch (Exception e) {
			checkVal="fail";
				System.out.println(e.getMessage());
		}
		
		
		return checkVal;
	}
	
	@PostMapping("/update_type_img")
	@ResponseBody
	   public String update_type_Img(HttpServletRequest req, MultipartFile file) {
	      String img="ok";
	  
		   try {
	         String fileName = file.getOriginalFilename();
//	         String fileName = file.getOriginalFilename();
	         String uploadDir = req.getServletContext().getRealPath("/main/resources/static/img/place_type");
	         String filePath = uploadDir + "\\" + fileName;
//	         C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\place_type
	         // webapp 폴더까지의 경로 정보를 가져온다. 
	         String data_img_url="/img/place_type/" + fileName;
	         System.out.println(filePath);
	         file.transferTo(new File(urlPass+"\\"+fileName));
	         System.out.println("check list");
	         imgUrl=data_img_url;
//	        System.out.println("main test="+sub_url);
//	         hdao.main_img(sub_url);
	        System.out.println("??");
	      } catch (Exception ex) {
	         System.out.println(ex.getMessage());
	         img="fail";
	      }
		   return img;
	   	}
	
	@PostMapping("/yonolja_place_type_update")
	@ResponseBody
	public String yonolja_place_type_update(HttpServletRequest req) {
		String checkVal="ok";
		int seq=Integer.parseInt(req.getParameter("seq"));
		String name=req.getParameter("name")
				;
		try {
			tdao.yonolja_place_type_update_all(seq,name, imgUrl);
		

		} catch (Exception e) {
			System.out.println(e.getMessage());
			checkVal="fail";
		}
		
		return checkVal;
		
	}
	@PostMapping("/place_type_delete")
	@ResponseBody
	public String place_type_delete(HttpServletRequest req) {
		String checkVal="ok";
		int seq=Integer.parseInt(req.getParameter("seq"));
		System.out.println(seq);
		try {
			tdao.yonolja_place_type_delete(seq);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			checkVal="fail";
		}
		
		return checkVal;		
	}
	@PostMapping("/yonolja_place_option_list")
	@ResponseBody
	public String yonolja_place_option_list(HttpServletRequest req) {
		
		ArrayList<DTO_TH> list = tdao.yonolja_place_option_list();
		JSONArray ja= new JSONArray();
		
		for(int i=0;i<list.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("seq",list.get(i).getPlace_option_seq());
			jo.put("name",list.get(i).getPlace_option_name());
			jo.put("img",list.get(i).getPlace_option_img());
			ja.put(jo);
		
		}
		System.out.println(ja.toString());
		return ja.toString();
	}
	
	
	
	   @PostMapping("/option_img")
	   @ResponseBody
	   public String option_Img(HttpServletRequest req, MultipartFile file) {
	      String img="ok";
	  
		   try {
	         String fileName = file.getOriginalFilename();
//	         String fileName = file.getOriginalFilename();
	         String uploadDir = req.getServletContext().getRealPath("/main/resources/static/img/place_option");
	         String filePath = uploadDir + "\\" + fileName;
//	         C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\place_option
	         // webapp 폴더까지의 경로 정보를 가져온다. 
	         String data_img_url="/img/place_option/" + fileName;
	         System.out.println(filePath);
	         file.transferTo(new File(urlPass_option+"\\"+fileName));
	         System.out.println("check list");
	         imgUrl=data_img_url;
//	        System.out.println("main test="+sub_url);
//	         hdao.main_img(sub_url);
	        System.out.println("??");
	      } catch (Exception ex) {
	         System.out.println(ex.getMessage());
	         img="fail";
	      }
		   return img;
	   	}
	
	
	@PostMapping("/yonolja_place_option_add")
	@ResponseBody
	public String yonolja_place_option_add(HttpServletRequest req) {
		String checkVal="ok";
		String name=req.getParameter("name");
		try {
			tdao.yonolja_place_option_add(name, imgUrl);

	
		} catch (Exception e) {
			System.out.println(e.getMessage());
			checkVal="fail";
		}
		
		return checkVal;
		
	}
	
	@PostMapping("/update_option_name")
	@ResponseBody
	public String update_option_name(HttpServletRequest req) {
		String checkVal="ok";
		String name=req.getParameter("name");
		int seq=Integer.parseInt(req.getParameter("seq"));
		try {
			tdao.yonolja_place_option_update_name(seq, name);
		} catch (Exception e) {
			checkVal="fail";
				System.out.println(e.getMessage());
		}
		
		
		return checkVal;
	}
	
	@PostMapping("/update_option_img")
	@ResponseBody
	   public String update_option_Img(HttpServletRequest req, MultipartFile file) {
	      String img="ok";
	  
		   try {
	         String fileName = file.getOriginalFilename();
//	         String fileName = file.getOriginalFilename();
	         String uploadDir = req.getServletContext().getRealPath("/main/resources/static/img/place_option");
	         String filePath = uploadDir + "\\" + fileName;
//	         C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\place_option
	         // webapp 폴더까지의 경로 정보를 가져온다. 
	         String data_img_url="/img/place_option/" + fileName;
	         System.out.println(filePath);
	         file.transferTo(new File(urlPass_option+"\\"+fileName));
	         System.out.println("check list");
	         imgUrl=data_img_url;
//	        System.out.println("main test="+sub_url);
//	         hdao.main_img(sub_url);
	        System.out.println("??");
	      } catch (Exception ex) {
	         System.out.println(ex.getMessage());
	         img="fail";
	      }
		   return img;
	   	}
	
	@PostMapping("/yonolja_place_option_update")
	@ResponseBody
	public String yonolja_place_option_update(HttpServletRequest req) {
		String checkVal="ok";
		int seq=Integer.parseInt(req.getParameter("seq"));
		String name=req.getParameter("name")
				;
		try {
			tdao.yonolja_place_option_update_all(seq,name, imgUrl);
		

		} catch (Exception e) {
			System.out.println(e.getMessage());
			checkVal="fail";
		}
		
		return checkVal;
		
	}
	@PostMapping("/place_option_delete")
	@ResponseBody
	public String place_option_delete(HttpServletRequest req) {
		String checkVal="ok";
		int seq=Integer.parseInt(req.getParameter("seq"));
		System.out.println(seq);
		try {
			tdao.yonolja_place_option_delete(seq);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			checkVal="fail";
		}
		
		return checkVal;		
	}
	
	
	@GetMapping("/admin_review")
	public String admin_review() {
		return "admin_review";
	}
	
	
	@PostMapping("/admin_review_list")
	@ResponseBody
	public String review_list(HttpServletRequest req) {
		
		int number=Integer.parseInt(req.getParameter("number"));
		int end=number*10;
		int start=end-9;
		ArrayList<DTO_TH> list=tdao.yonolja_review_list(start,end);
		ArrayList<DTO_TH> listtest = tdao.yonolja_place_option_list();
		System.out.println(list);
		System.out.println("test="+listtest);
		JSONArray ja= new JSONArray();
		


		for(int i=0;i<list.size();i++) {
			JSONObject jo= new JSONObject();
			
			jo.put("review_seq", list.get(i).getReview_seq_test());
			jo.put("place_name", list.get(i).getBook_seq());
			jo.put("review_content", list.get(i).getReview_content());
			jo.put("review_date", list.get(i).getReview_date());
			jo.put("review_star", list.get(i).getReview_star());
			System.out.println(jo);
			ja.put(jo);
		}
		
		System.out.println("system test");
		System.out.println(ja);
		return ja.toString();
	}
	
	

	@PostMapping("/admin_review_paging")
	@ResponseBody
	public int admin_review_paging() {
				int review=tdao.yonolja_review_page();
		int page=0;
		int pageend=0;
		if(review%10==0) {
			pageend=review/10;
		}else if(review%10>0){
			pageend=review/10+1;
		}
		
		return pageend;
	}
}