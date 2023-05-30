package com.human.springboot;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Controller_MJ {

	@Autowired
	DAO_MJ mjdao;
	
	// 테스트
	
	@GetMapping("/test")
	public String showtestPage() {
		return "test/slideImgTest";
	}
	
	// 회원가입 (나중에 바꿔야함. 조금 더 간편하게)
	@GetMapping("/signin")
	public String showSignin() {
		return "signin";
	}
	
	@PostMapping("/doSignin")
	public String doSignin(HttpServletRequest req, Model model) {
		
		String guide = "";
		
		String id = req.getParameter("user_id");
		String ps = req.getParameter("user_ps");
		String ps_check = req.getParameter("user_ps_check");
		
		String name = req.getParameter("user_name");
		String email = req.getParameter("user_email");
		
		String mobile = req.getParameter("user_mobile");
		
		String gender = req.getParameter("user_gender");
		String type = req.getParameter("user_type");
		
		ArrayList<DTO_MJ_userDTO> users = mjdao.getNormalUsers();
		
		
		guide = "<script> alert('모든항목을 입력해주세요.') </script>";
		if(id.equals("")||id==null) {model.addAttribute("guide",guide);return "signin";}
		if(ps.equals("")||ps==null) {model.addAttribute("guide",guide);return "signin";}
		if(name.equals("")||name==null) {model.addAttribute("guide",guide);return "signin";}
		if(email.equals("")||email==null) {model.addAttribute("guide",guide);return "signin";}
		if(mobile.equals("")||mobile==null) {model.addAttribute("guide",guide);return "signin";}
		if(gender.equals("")||gender==null) {model.addAttribute("guide",guide);return "signin";}
		if(type.equals("")||type==null) {model.addAttribute("guide",guide);return "signin";}
	
		// 비밀번호 일치 검사
		if(!ps.equals(ps_check)) {
			guide = "<script> alert('두 비밀번호가 서로 일치하지 않습니다.') </script>";
			model.addAttribute("guide",guide);
			return "signin";
		}
	
		// 아이디 중복검사 
		for(int i=0;i<users.size();i++) {
			if(id.equals(users.get(i).getUser_id())) {
				guide = "<script> alert('이미 다른사용자가 이용중인 아이디입니다.') </script>";
				model.addAttribute("guide",guide);
				return "signin";
			}
		}
		
		mjdao.addUser(id, ps_check, name, email, mobile, gender, type, "normal");
		
		return "main";
	}
	
	
	// 로그인, 로그아웃
	@GetMapping("/login")
	public String showLogin() {
		return "login";
	}
	
	@PostMapping("/doLogin")
	public String doLogin(HttpServletRequest req, Model model) {
		
		String guide = "";
		
		String id = req.getParameter("login_id");
		String ps = req.getParameter("login_ps");
		
		ArrayList<DTO_MJ_userDTO> users = mjdao.getNormalUsers();
		
		for(int i=0;i<users.size();i++) {
			if( users.get(i).getUser_id().equals(id) && 
				users.get(i).getUser_password().equals(ps))
			{
				// 세션생성하고 메인으로
				HttpSession session = req.getSession();
				session.setAttribute("user_seq", users.get(i).getUser_seq());
				session.setAttribute("user_id", users.get(i).getUser_id());
				session.setAttribute("user_name", users.get(i).getUser_name());
				session.setAttribute("user_type", users.get(i).getUser_type());
				session.setAttribute("user_signinType", users.get(i).getUser_signinType());
				
				System.out.println(session.getAttribute("user_seq"));
				System.out.println(session.getAttribute("user_id"));
				System.out.println(session.getAttribute("user_name"));
				System.out.println(session.getAttribute("user_type"));
				System.out.println(session.getAttribute("user_signinType"));
				return "main";
			}
		}
		
		guide = "<script>alert('존재하지 않는 아이디이거나 비밀번호가 일치하지 않습니다')</script>";
		model.addAttribute("guide",guide);
		return "login";
	}
	
	@GetMapping("/logout")
	public String doLogout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "main";
	}
	

	// 메인
	@GetMapping("/main")
	public String showMain() {
		return "main";
	}
	
	
	// PlaceOptions 가져오기
	@PostMapping("/getPlaceOptions")
	@ResponseBody
	public String getPlaceOptions() {
		
		ArrayList<DTO_MJ_placeOptionDTO> placeOptions = mjdao.getPlaceOptions();
		
		JSONArray ja = new JSONArray();
		
		for(int i=0;i<placeOptions.size();i++) {
			JSONObject jo = new JSONObject();
			
			jo.put("seq", placeOptions.get(i).getPlace_option_seq());
			jo.put("name", placeOptions.get(i).getPlace_option_name());
			jo.put("img", placeOptions.get(i).getPlace_option_img());
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	
	
	
	
}
