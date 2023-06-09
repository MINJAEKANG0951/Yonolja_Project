package com.human.springboot;

import java.io.File;
import java.lang.reflect.Array;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.Random;
import java.util.UUID;

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
	
	@GetMapping("/notAllowed")
	public String notAllowed() {
		return "notAllowed";
	}
	
	
	
	
	@GetMapping("/admin")
	public String admin(HttpServletRequest req, Model model) {
		HttpSession logIn=req.getSession();
		logIn.getAttribute("user_id");
		System.out.println("admintest");

		
		if(logIn.getAttribute("user_id")==null) {
			System.out.println("check id admin");
			return "notAllowed";
		}else if(!logIn.getAttribute("user_id").equals("admin")) {
			return "notAllowed";
		}
		
		return "admin";
	}

	@GetMapping("/admin_user")
	public String admin_user(Model model, HttpServletRequest req) {

		   HttpSession logIn=req.getSession();
		   
		   model.addAttribute("user_id",logIn.getAttribute("user_id"));
		   
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
			   
		 
				if(logIn.getAttribute("user_id")==null) {
					System.out.println("check id admin");
					return "notAllowed";
				}else if(!logIn.getAttribute("user_id").equals("admin")) {
					return "notAllowed";
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
	@PostMapping("/member_list_paging")
	@ResponseBody
	public int member_list_paging(HttpServletRequest req) {
		int page=tdao.member_count();
		int paging;
		if(page%10==0) {
			paging=page/10;
		}else {
			paging=page/10+1;
		}
		
		return paging;
	}
	
	@PostMapping("/admin_user_search")
	@ResponseBody
	public String admin_user_search(HttpServletRequest req) {
		String search=req.getParameter("search");
		int page=Integer.parseInt(req.getParameter("number"));
		System.out.println("checkseq="+req.getParameter("searchVal"));
		int searchVal=Integer.parseInt(req.getParameter("searchVal"));
		int end=page*10;
		int start=end-9;
		System.out.println(searchVal);
		ArrayList<DTO_TH> list=null;
		JSONArray ja=new JSONArray();
		if(searchVal==0) {
			list=tdao.admin_user_search(search,start,end);
			System.out.println("list"+list);
		
		
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
		}else if(searchVal==1) {
			list=tdao.admin_user_search_name(search,start,end);
			System.out.println("list"+list);
			System.out.println(searchVal+"1 ???");
			
			
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
		}else if(searchVal==2) {
			list=tdao.admin_user_search_id(search,start,end);
			System.out.println("list"+list);
			System.out.println(searchVal+"2 ???");
		
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
		}

		
		
		
		
		
		
		return ja.toString();
	}
	
	@PostMapping("/admin_user_search_paging")
	@ResponseBody
	public int admin_user_search_paging(HttpServletRequest req) {
		String search=req.getParameter("search");
		int number=0;
		System.out.println("search_va=l="+search);
		int searchVal=Integer.parseInt(req.getParameter("searchVal"));
		System.out.println("va;l"+searchVal);
		if(searchVal==0) {
			number=tdao.admin_user_search_count(search);
		}else if(searchVal==1) {
			number=tdao.admin_user_search_name_count(search);
		}else if(searchVal==2) {
			number=tdao.admin_user_search_id_count(search);
		}
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
		   
		   model.addAttribute("user_id",logIn.getAttribute("user_id"));
			if(logIn.getAttribute("user_id")==null) {
				System.out.println("check id admin");
				return "notAllowed";
			}else if(!logIn.getAttribute("user_id").equals("admin")) {
				return "notAllowed";
			}

		   return "admin_post";
		
		
	}
	
	@PostMapping("/post_list")
	@ResponseBody
	public String post_list(HttpServletRequest req) {
 
		   String page=req.getParameter("page");

		   int curpage=Integer.parseInt(page);
		   int rowSize=10;
		   int start=curpage*rowSize-(rowSize-1);;
		   int end=curpage*rowSize;
		   

		ArrayList<DTO_TH> list=tdao.post_list(start,end);
		JSONArray ja= new JSONArray();
		

		String str="";

		int category;
		String postCate="";
		System.out.println("end val="+end);
		int count =tdao.post_count();
		System.out.println(count);
		
		System.out.println("count%10="+(count%10));
		for(int i=0;i<list.size();i++) {
			
			JSONObject jo=new JSONObject();
			str=list.get(i).getPost_comment();
			category=list.get(i).getPost_category();
			System.out.println("a");
			if(str=="" || str==null) {
				str="답변대기";
			} else {
				str="답변완료";
			}
			if(category==1) {
				postCate="공지";
			}else {
				postCate="일반게시글";
			}
			if(curpage==1) {
				jo.put("num", count-(i));
			}else {
				
					jo.put("num", count-(i+(curpage*10-10)));
				
		
				
				
			}
			System.out.println("val cur="+curpage);
			System.out.println("why? i value="+i);
			System.out.println("int="+(count-(end-i)));
			System.out.println("check jo="+jo);
			System.out.println(list.get(i).getPost_seq());
			jo.put("post_seq",list.get(i).getPost_seq());
			jo.put("user_id",list.get(i).getUSER_ID());
			jo.put("post_category",postCate);
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
		int category;
		String postCate="";
			JSONObject jo=new JSONObject();
			str=list.getPost_comment();
			category=list.getPost_category();
			System.out.println("a");
			if(str=="" || str==null) {
				str="답변대기";
			} else {
				str="답변완료";
			}
			if(category==1) {
				postCate="공지";
			}else {
				postCate="일반게시글";
			}
			jo.put("post_seq",list.getPost_seq());
			jo.put("user_id",list.getUSER_ID());
			jo.put("post_category",postCate);
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
	
	@PostMapping("/admin_post_list_diolog")
	@ResponseBody
	public String admin_post_list_diolog(HttpServletRequest req) {
		int seq=Integer.parseInt(req.getParameter("seq"));
		
		DTO_TH list=tdao.post_list_diolog(seq);
		System.out.println(list);
		JSONArray ja=new JSONArray();
		JSONObject jo=new JSONObject();
		jo.put("post_title", list.getPost_title());
		jo.put("user_id", list.getUSER_ID());
		jo.put("post_seq", list.getPost_seq());
		jo.put("post_content", list.getPost_content());
		jo.put("post_comment", list.getPost_comment());
		System.out.println("img="+list.getPost_img());
		System.out.println("hello");
		jo.put("post_img",list.getPost_img());
		ja.put(jo);
		System.out.println("check pls"+ja);
		return jo.toString();
				
	}
	
	
	
	@PostMapping("/post_search")
	@ResponseBody
	public String post_search(HttpServletRequest req) {
		
		String search=req.getParameter("admin_post_searchBar");
		
		ArrayList<DTO_TH> list=null;
		

		String select=req.getParameter("admin_post_search_select");
		System.out.println("select test"+select);
		
		
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
		int category;
		String postCate="";
		for(int i=0;i<list.size();i++) {
			
			JSONObject jo=new JSONObject();
			str=list.get(i).getPost_comment();
			category=list.get(i).getPost_category();
			System.out.println(category);
			if(str=="" || str==null) {
				str="답변대기";
			} else {
				str="답변완료";
			}
			 
			if(category==1) {
				postCate="공지";
			}else {
				postCate="일반게시글";
			}
			jo.put("post_seq",list.get(i).getPost_seq());
			jo.put("user_id",list.get(i).getUSER_ID());
			jo.put("post_category",postCate);
			jo.put("post_title",list.get(i).getPost_title());
			jo.put("post_date",list.get(i).getPost_date());
			jo.put("post_comment",str);
			

			ja.put(jo);
			System.out.println("test search");
		}
		
		
		System.out.println(ja.toString());
		return ja.toString();
				
	}
	
	@PostMapping("/admin_post_paging")
	@ResponseBody
	public int admin_post_paging(HttpServletRequest req) {
		int page=(int)tdao.post_count();
		int paging;
		if(page%10==0) {
			paging=page/10;
		}else {
			paging=page/10+1;
		}
		
		
		
		return paging;
	}
	
	@PostMapping("/post_delete_service")
	@ResponseBody
	public String post_delete_service(HttpServletRequest req){
			String[] seq;
			String number=req.getParameter("seq");
			seq=number.split(",");
			String returnVal="ok";
			try {
				for(int i=0;i<seq.length;i++) {
					tdao.post_delete_list(seq[i]);
				}				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				returnVal="fail";
			}

			System.out.println(returnVal);
		
		return returnVal;
	}
	
	
	
	@PostMapping("/admin_post_search_paging")
	@ResponseBody
	public int admin_post_search_paging(HttpServletRequest req) {
		
		String search = req.getParameter("search");
		int searchVal=Integer.parseInt(req.getParameter("searchVal"));
		
		
		int page=0;
		int paging;
		if(searchVal==0) {
			page=tdao.post_list_search_count(search);
		}else if(searchVal==1) {
			page=tdao.post_list_search_title_count(search);
		}else if(searchVal==2) {
			page=tdao.post_list_search_id_count(search);
		}else if(searchVal==3) {
			page=tdao.post_list_search_content_count(search);
		}
			
		System.out.println("admin_post_search_paging="+page);
		
		if(page%10==0) {
			paging=page/10;
		}else {
			paging=page/10+1;
		}
		

		return paging;
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

	      UUID uuid=UUID.randomUUID();
	      String random = (uuid + "").substring(0, 5);
		   try {
	         String fileName = random+file.getOriginalFilename();
//	         String fileName = file.getOriginalFilename();
	         String uploadDir = req.getServletContext().getRealPath("/main/resources/static/img/place_type");
	         String filePath = uploadDir + "\\"  + fileName;
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
	      UUID uuid=UUID.randomUUID();
	      String random = (uuid + "").substring(0, 5);
		   try {
	         String fileName = random+file.getOriginalFilename();
//	         String fileName = file.getOriginalFilename();
	         String uploadDir = req.getServletContext().getRealPath("/main/resources/static/img/place_type");
	         String filePath = uploadDir + "\\"+ fileName;
//	         C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\place_type
	         // webapp 폴더까지의 경로 정보를 가져온다. 
	         String data_img_url="/img/place_type/" + fileName;
	         System.out.println("check="+filePath);
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
		String name=req.getParameter("name");
		
		DTO_TH placeType = tdao.getPlaceType(seq);
		placeType.getPlace_type_img();
		String absPath = "C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static";
		String DBpath = placeType.getPlace_type_img();  // /img/place_type/airbnb.png
		if(DBpath==null) {
			DBpath="//";
		}
		try {
			
			String deletePath = absPath + DBpath;
			
			System.out.println("path="+deletePath);
			File file = new File(deletePath);
			if(file.exists()) {
				tdao.yonolja_place_type_update_all(seq,name, imgUrl);
				file.delete();
				System.out.println("ok");
			} else {
				System.out.println("fail");
			}

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
		
		DTO_TH placeType = tdao.getPlaceType(seq);
		
		placeType.getPlace_type_img();
		
//		String absPath = "C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\place_type";
		String absPath = "C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static";
		String DBpath = placeType.getPlace_type_img();  // /img/place_type/airbnb.png
		// dbpath + 파일명.확장자
		
		String deletePath = absPath + DBpath;
		
		System.out.println(deletePath);
		File file = new File(deletePath);
		
	
		
		try {
			if(file.exists()) {
				tdao.yonolja_place_type_delete(seq);
				file.delete();
				System.out.println("ok");
			} else {
				System.out.println("fail");
			}
			
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
	      UUID uuid=UUID.randomUUID();
	      String random = (uuid + "").substring(0, 5);
		   try {
	         String fileName = random+file.getOriginalFilename();
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
	      UUID uuid=UUID.randomUUID();
	      String random = (uuid + "").substring(0, 5);
		   try {
	         String fileName = random+file.getOriginalFilename();
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
		String name=req.getParameter("name");
		
		DTO_TH placeType = tdao.getPlaceOption(seq);
		
		
//		String absPath = "C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\place_type";
		String absPath = "C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static";
		String DBpath = placeType.getPlace_option_img();  // /img/place_type/airbnb.png
		// dbpath + 파일명.확장자
		
		String deletePath = absPath + DBpath;
		
		System.out.println(deletePath);
		File file = new File(deletePath);
		
	
		try {
			
			if(file.exists()) {
				tdao.yonolja_place_option_update_all(seq,name, imgUrl);
				file.delete();
				System.out.println("ok");
			} else {
				System.out.println("fail");
			}
			
		

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
		DTO_TH placeType = tdao.getPlaceOption(seq);
		String absPath = "C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static";
		String DBpath = placeType.getPlace_option_img();  // /img/place_type/airbnb.png
		// dbpath + 파일명.확장자
		
		String deletePath = absPath + DBpath;
		
		System.out.println(deletePath);
		File file = new File(deletePath);
		
		
		try {
			if(file.exists()) {
				tdao.yonolja_place_option_delete(seq);
				file.delete();
				System.out.println("ok");
			} else {
				System.out.println("fail");
			}
			tdao.yonolja_place_option_delete(seq);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			checkVal="fail";
		}
		
		return checkVal;		
	}
	
	
	@GetMapping("/admin_review")
	public String admin_review(HttpServletRequest req, Model model) {
		 HttpSession logIn=req.getSession();
		   
		   model.addAttribute("user_id",logIn.getAttribute("user_id"));
			if(logIn.getAttribute("user_id")==null) {
				System.out.println("check id admin");
				return "notAllowed";
			}else if(!logIn.getAttribute("user_id").equals("admin")) {
				return "notAllowed";
			}
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
			
			jo.put("review_seq", list.get(i).getReview_seq());
			jo.put("place_name", list.get(i).getPlace_name());
			jo.put("user_id",list.get(i).getUSER_ID());
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
	
	@PostMapping("/admin_review_search")
	@ResponseBody
	public String admin_review_search(HttpServletRequest req) {
		
		String search=req.getParameter("search");
		int number=Integer.parseInt(req.getParameter("number"));
		int end=number*10;
		int start=end-9;
		
		ArrayList<DTO_TH>list=tdao.yonolja_review_search(search,start,end);
		JSONArray ja= new JSONArray();
		
		
		for(int i=0;i<list.size();i++) {
			JSONObject jo= new JSONObject();
			
			jo.put("review_seq", list.get(i).getReview_seq());
			jo.put("place_name", list.get(i).getPlace_name());
			jo.put("user_id", list.get(i).getUSER_ID());
			jo.put("review_content", list.get(i).getReview_content());
			jo.put("review_date", list.get(i).getReview_date());
			jo.put("review_star", list.get(i).getReview_star());
			System.out.println(jo);
			ja.put(jo);
		}
		
		return ja.toString();
		
	}
	
	@PostMapping("/admin_review_search_paging")
	@ResponseBody
	public int admin_review_search_paging(HttpServletRequest req) {
		String search=req.getParameter("search");
		int pageend=0;
		if(tdao.yonolja_review_search_page(search)!=0) {
			int page=(int)tdao.yonolja_review_search_page(search);
			
			if(page%10==0) {
				pageend=page/10;
				System.out.println(pageend);
			}else {
				pageend=page/10+1;
				System.out.println(pageend);
			}
		}
		
		
		
		
		
		return pageend;
		
	}
	@PostMapping("/review_delete_service")
	@ResponseBody
	public String reivew_delete_service(HttpServletRequest req){
			String[] seq;
			String number=req.getParameter("seq");
			seq=number.split(",");
			String returnVal="ok";
			try {
				for(int i=0;i<seq.length;i++) {
					tdao.review_delete_list(seq[i]);
				}				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				returnVal="fail";
			}

			System.out.println(returnVal);
		
		return returnVal;
	}
	
	@PostMapping("/admin_review_dig")
	@ResponseBody
	public String admin_review_dig(HttpServletRequest req) {
		
		int seq= Integer.parseInt(req.getParameter("seq"));
		DTO_TH review=tdao.yonolja_review_dig(seq);
			JSONArray ja=new JSONArray();
			JSONObject jo=new JSONObject();
		try {
			
			jo.put("review_seq", review.getReview_seq());
			jo.put("place_name", review.getPlace_name());
			jo.put("review_date", review.getReview_date());
			jo.put("review_content", review.getReview_content());
			jo.put("user_id", review.getUSER_ID());
			ja.put(jo);
		} catch (Exception e) {
			System.err.println(e.getMessage());
			ja.put("fail");
		}
		
		System.out.println(ja);
		
		return ja.toString();
	}
	
}