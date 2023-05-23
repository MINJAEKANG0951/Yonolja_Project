package com.human.springboot;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class mj_controller {
	
	@Autowired
	private mj_DAO mjdao;
	
	@Autowired
	private MailService mailService;
	
	@GetMapping("/home")
	public String showHome(HttpServletRequest req) {
		req.getSession().setAttribute("vv", "sibal");
		return "home";
	}
	
	

	@PostMapping("/showCalendar")
	public String showCalendar(HttpServletRequest req) {
		String data = req.getParameter("data");
		System.out.println(data);
		return "calendar";
	}
	
	@GetMapping("/showCalendar2")
	public String showCalendar2() {
		return "calendar";
	}
	
	
	@GetMapping("book/{room_seq}")
	public String doBook(@PathVariable("room_seq") int room_seq, Model model) {
		System.out.println(room_seq);
		model.addAttribute("room_seq",room_seq);
		return "practice_bookCalendar";
	}
	
	
	
	// 여기부터 달력 sorting 작업
	@PostMapping("/get_room_books")	// 이거 나중에 roomz table 말고 다른곳에서 가져오게 xml 코드 바꿔야함.
	@ResponseBody
	public String checkin_sort(HttpServletRequest req) {
		int room_seq = Integer.parseInt( req.getParameter("room_seq") );
		
		// 그 room 에 대한 모든 예약에 대한 체크인과 체크아웃을 가져옴. 
		// 그걸 어째 저째 계산 해가지고 달력에서 예약못하는 날짜에 x표시 하면 되는것임. 
		ArrayList<mj_bookDTO> books = mjdao.getBooks(room_seq);
		
		JSONArray ja = new JSONArray();
		for(int i=0;i<books.size();i++) {
			
			JSONObject jo = new JSONObject();
			jo.put("checkin", books.get(i).getCheckin());
			jo.put("checkout", books.get(i).getCheckout());
			
			ja.put(jo);
		}

		return ja.toString();
	}
	
	@GetMapping("/marker")
	public String makeMarker() {
		return "practice_markerMaking";
	}
	@GetMapping("/marker2")
	public String MulitmakeMarkers() {
		return "practice_MultiMarkersMaking";
	}
	@GetMapping("/hotelSearch")
	public String doSearchHotel() {
		return "practice_SearchByAddress";
	}
	
	
	@GetMapping("/hotelFind")
	public String dohotelFind() {
		return "practice_HotelRegisterAndFind";
	}
	
	@PostMapping("/addPlace")
	@ResponseBody
	public void addPlace(HttpServletRequest req) {
		String business_name = req.getParameter("business_name");
		String business_owner = req.getParameter("business_owner");
		String business_type = req.getParameter("business_type");
		String business_address = req.getParameter("business_address");
		
		mjdao.addBusiness(business_name, business_owner, business_type, business_address);
	}
	
	
	@PostMapping("/getBusinesses")
	@ResponseBody
	public String getBusinesses(HttpServletRequest req) {
		
		ArrayList<mj_hotelDTO> hotels = mjdao.getBusinessList();
		
		JSONArray ja = new JSONArray();
		for(int i=0;i<hotels.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("business_id", hotels.get(i).getBusiness_id());
			jo.put("business_name", hotels.get(i).getBusiness_name());
			jo.put("business_owner", hotels.get(i).getBusiness_owner());
			jo.put("business_type", hotels.get(i).getBusiness_type());
			jo.put("business_address", hotels.get(i).getAddress());
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	@PostMapping("/search")
	@ResponseBody
	public String search(HttpServletRequest req) {
		
		
		String keyword = req.getParameter("keyword");
		// 사실 그냥 pl/sql 문 안만들고 여기서 코드로 구현할수도 있음 아래처럼.
		
		ArrayList<mj_hotelDTO> hotels = mjdao.getBusinessList();
		JSONArray ja = new JSONArray();
		for(int i=0;i<hotels.size();i++) {
			if(hotels.get(i).getAddress().split(",")[1].contains(keyword)) {
				
				JSONObject jo = new JSONObject();

				jo.put("business_id", hotels.get(i).getBusiness_id());
				jo.put("business_name", hotels.get(i).getBusiness_name());
				jo.put("business_owner", hotels.get(i).getBusiness_owner());
				jo.put("business_type", hotels.get(i).getBusiness_type());
				jo.put("business_address", hotels.get(i).getAddress().split(",")[1]);

				ja.put(jo);
			}
		}
		System.out.println(ja.toString());
		return ja.toString();
	}
	
	
	@GetMapping("/kakaoLoginPage")
	public String dokakaoLogin() {
		return "practice_kakaoLoginTest";
	}
	@GetMapping("/naverLoginPage")
	public String donaverLogin() {
		return "practice_naverLoginTest";
	}
	
	@GetMapping("/practice_naverLogin")
	public String naverLogin() {
		return "practice_naverLogin";
	}
	
	@GetMapping("/practice_naverCallback")
	public String showDataYouveGot() {
		return "practice_naverCallback";
	}
	
	@GetMapping("/practice_login")
	public String dopracticeLogin() {
		return "practice_loginPage";
	}
	
	@GetMapping("/login_signin/{id}/{name}/{age}/{gender}")
	public String doLogin_signin(
			@PathVariable("id") String id,
			@PathVariable("name") String name,
			@PathVariable("age") String age,
			@PathVariable("gender") String gender,
			Model model, HttpServletRequest req
		) 
	{
		// path variable 로 받고 뭐어떻게하면될듯.
		System.out.println(id +":"+ name +":"+ age +":"+ gender);
		HttpSession session = req.getSession();
		
		session.setAttribute("name", name);
		
		return "practice_main";
	}
	
	
	@GetMapping("/practice_main")
	public String showMain() {
		return "practice_main";
	}
	
	
	
	@GetMapping("/practice_signup")
	public String showSigngin_practice() {
		return "practice_signup";
	}
	
	@GetMapping("/practice_emailAuthentication")
	public String practice_emailAuthentication() {
		return "practice_mailAuthentication";
	}
	
	@GetMapping("/send2")
	public void sendEmail2() {
		
//		JavaMailSender msender = new JavaMailSenderImpl(); // 이거라 안됐네 sender 그 자체는 interface 라서.
//		SimpleMailMessage message = new SimpleMailMessage();
//		message.setTo("blueie2@naver.com");
//		message.setSubject("hi");
//		message.setText("I am Yonolja Server");
//		message.setFrom("the_relaxed_tortoise@naver.com");
//		
//		msender.send(message);
		
		// controller 는 여기서 해두됨. 꼭 service 를 해서 써야하는가?
		mailService.sendEmail("blueie2@naver.com", "hi", "babo");
	}
	
	
	
	
	// 상태토큰 -> 이미 jsp 파일에서 만듬 
	
	
	
//	@PostMapping("/putData")
//	@ResponseBody
//	public void getData(HttpServletRequest req) {
//		String name = req.getParameter("name");
//		String data = req.getParameter("data");
//		System.out.println(name + ":" + data);
//		
//		mjdao.addData(name, data);
//		
//	}
//	
//	@PostMapping("/deleteData")
//	@ResponseBody
//	public void deleteData(HttpServletRequest req) {
//		String name = req.getParameter("name");
//		String data = req.getParameter("data");
//		System.out.println(name + ":" + data);
//		
//		mjdao.deleteData(name, data);
//		
//	}
//	
//	
//	@PostMapping("/updateData")
//	@ResponseBody
//	public void updateData(HttpServletRequest req) {
//		String name = req.getParameter("name");
//		String data = req.getParameter("data");
//		System.out.println(name + ":" + data);
//		
//		mjdao.updateData(name, data);
//		
//	}
//	
//	
//	@PostMapping("/getData")
//	@ResponseBody
//	public String getData() {
//		
//		
//		ArrayList<mj_DTO> data = mjdao.getData();
//		
//		JSONArray ja = new JSONArray();
//		for(int i=0;i<data.size();i++) {
//			JSONObject jo = new JSONObject();
//			jo.put("name", data.get(i).getName());
//			jo.put("data", data.get(i).getData());
//			
//			ja.put(jo);
//		}
//		
//		return ja.toString();
//	}
	
	// 상태토큰 생성 method
	public String generateState()
	{
	    SecureRandom random = new SecureRandom();
	    return new BigInteger(130, random).toString(32);
	}
	
	@GetMapping("/makeStateToken")
	public String makeStateToken(HttpServletRequest req, HttpSession res) {
		String state = generateState();
		
		// 세션 또는 별도의 저장 공간에 상태 토큰을 저장
		res.setAttribute("state", state);	// >> 로그인하는순간부터 만들어서 유지하면됨.
		
		return state;
	}
	

	/*
	 
	 	상태 토큰 생성 > 보안을위해서 이 토큰을 만들고, 세션으로 저장해서 유지시켜야한다고함.
		>> 로그인하는순간부터 만들면되지않을까? 맞는듯. 사용자가 로그인을 진행하는동안 유지되어야한다고함.
		
		// 상태 토큰으로 사용할 랜덤 문자열 생성
		String state = generateState();
		
		// 세션 또는 별도의 저장 공간에 상태 토큰을 저장
		req.session().attribute("state", state);
		return state;
		
		
		상태토큰설명 : 웹 애플리케이션은 브라우저를 기반으로 작동하기 때문에 사이트 간 요청 위조
		(cross-site request forgery, 이하 CSRF) 공격 위험이 있습니다. 
		CSRF 공격을 방지하기 위해 애플리케이션과 사용자 간의 상태를 보유하는 고유한 세션 토큰을 만들어야 합니다. 
		나중에 인증 과정의 결괏값으로 전달하는 세션 토큰과 일치하는지 확인해 사용자가 요청하지 않은 '비정상적인 요청'인지 확인할 수 있습니다.
		이 세션 토큰을 '상태 토큰'(state token) 이라 하며, 상태 토큰의 값은 사용자가 네이버 로그인을 진행하는 동안 유지되어야 하며 
		고유한 값이어야 합니다. 
		다음은 상태 토큰을 생성하는 코드를 PHP와 Java로 구현한 예입니다. 
		생성한 상태 토큰은 세션이나 별도의 저장 공간에 저장하도록 합니다.
	
	*/
	
	
}



