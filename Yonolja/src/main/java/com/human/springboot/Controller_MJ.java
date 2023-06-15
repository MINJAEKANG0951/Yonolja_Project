package com.human.springboot;

import java.util.ArrayList;
import java.util.Arrays;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Controller_MJ {

	@Autowired
	DAO_MJ mjdao;
	
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
		
		mjdao.addUser(id, ps_check, name, mobile, email ,gender, type, "normal");
		
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
	

	// 메인 보여주기
	@GetMapping("/main")
	public String showMain(Model model) {
		
		// filter modal 에 place_type 이랑, place_options 보여주기위함.
		// 아니면 그냥 ajax 로 ready 때만 붙여놓고 나중에 안건드리는방법도 있음. 
		
		
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
			
			jo.put("option_seq", placeOptions.get(i).getPlace_option_seq());
			jo.put("option_name", placeOptions.get(i).getPlace_option_name());
			jo.put("option_img", placeOptions.get(i).getPlace_option_img());
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	
	// PlaceEnvironment 가져오기
	@PostMapping("/getPlaceEnvironments")
	@ResponseBody
	public String getPlaceEnvironments() {
		
		ArrayList<DTO_MJ_placeEnvironmentDTO> placeEnvironments = mjdao.getPlaceEnvironments();
		
		JSONArray ja = new JSONArray();
		
		for(int i=0;i<placeEnvironments.size();i++) {
			JSONObject jo = new JSONObject();
			
			jo.put("seq", placeEnvironments.get(i).getPlace_environment_seq());
			jo.put("name", placeEnvironments.get(i).getPlace_environment_name());
			jo.put("img", placeEnvironments.get(i).getPlace_environment_img());
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	
	// PlaceTypes 가져오기
	@PostMapping("/getPlaceTypes")
	@ResponseBody
	public String getPlaceTypes() {
		
		ArrayList<DTO_MJ_placeTypeDTO> placeTypes = mjdao.getPlaceTypes();
		
		JSONArray ja = new JSONArray();
		
		for(int i=0;i<placeTypes.size();i++) {
			
			JSONObject jo = new JSONObject();
			
			jo.put("type_seq", placeTypes.get(i).getPlace_type_seq());
			jo.put("type_name", placeTypes.get(i).getPlace_type_name());
			jo.put("type_img", placeTypes.get(i).getPlace_type_img());

			
			ja.put(jo);
			
		}
		
		return ja.toString();
	}
	
	
	
	
	// main page 에 places 가져오기
	@PostMapping("/getPlaces")
	@ResponseBody
	public String getPlacesForMain(HttpServletRequest req) {
		
		ArrayList<DTO_MJ_placeDTO_forMain> places = null;
		
		String sql = " ";
		
		if(  req.getParameter("selected_environment")!=null && 
			!req.getParameter("selected_environment").equals("") ) 
		{
			String environmentSeq = req.getParameter("selected_environment");
			sql += "and (place_environment like '" + environmentSeq + ",%' or ";
			sql += "place_environment like '%," + environmentSeq + ",%' or ";
			sql += "place_environment like '%," + environmentSeq + "' or ";
			sql += "place_environment like '" + environmentSeq + "') ";

		}
		if(  req.getParameter("destination_around")!=null &&
			!req.getParameter("destination_around").equals("")  ) 
		{	// 라는 단어를 포함해야함
			String location = req.getParameter("destination_around");
			sql += "and (place_address like '%" + location + "%') "; 
		}
		
		if( req.getParameter("howmanypeople")!=null && 
		   !req.getParameter("howmanypeople").equals("")  ) 
		{	// 보다 많아야함
			String howmanypeople = req.getParameter("howmanypeople").replace("명", "");
			sql += "and (rt.roomtype_capacity>=" + howmanypeople + ") ";
		}
		if( req.getParameter("price")!=null && 
		   !req.getParameter("price").equals("")  ) 
		{	// 보다 작아야함.
			String price = req.getParameter("price");
			sql += "and (rt.roomtype_price<=" + price + ") ";
		}
		if( req.getParameter("placeTypes")!=null &&
			!req.getParameter("placeTypes").equals("")) 
		{	
			String []placeTypes = req.getParameter("placeTypes").split(",");
			System.out.println(Arrays.toString(placeTypes));
			sql += "and (";
			for(int i=0;i<placeTypes.length;i++) {
				if(i==0) {sql += "place_type_seq=" + placeTypes[i];}
				else {sql += " or place_type_seq=" + placeTypes[i];}
			}
			sql += ")";
		}
		if( req.getParameter("roomtype_options")!=null &&
		   !req.getParameter("roomtype_options").equals("")) 
		{	// 이건 place option 마냥.
			// 근데 여러개니깐 str 만드는 for문 만들어서 돌린다음에 그 문자열을 ${param1} 으로 보내야할듯
			String []roomtype_options = req.getParameter("roomtype_options").split(",");
			
			for(int i=0;i<roomtype_options.length;i++) {
				sql += "and (roomtype_options like '" + roomtype_options[i] + ",%' or ";
				sql += "roomtype_options like '%," + roomtype_options[i] + ",%' or ";
				sql += "roomtype_options like '%," + roomtype_options[i] + "' or ";
				sql += "roomtype_options like '" + roomtype_options[i] + "') ";
			}
	
		}
		// 예약날짜로 거르기
		if( (req.getParameter("checkin")!=null && req.getParameter("checkout")!=null) && 
			(!req.getParameter("checkin").equals("") && !req.getParameter("checkout").equals(""))) 
		{
			String checkin = req.getParameter("checkin");
			String checkout = req.getParameter("checkout");
			
			sql += "and rm.room_seq not in ";
			sql += "(select room_seq from yonolja_book where ";
			sql += "( to_date('" + checkin + "')>=to_date(checkin_date) and to_date(checkout_date) > to_date('" + checkin + "') )";
			sql += " or ";
			sql += "( to_date('" + checkout + "')>to_date(checkin_date) and to_date(checkout_date) >= to_date('" + checkout + "') )";
			sql += ") order by rm.room_seq";
			
		}
		sql += " ";
		
		
		// place_type 으로 거르는것도 해두 될듯..?
		
		places = mjdao.getPlaces(sql);
		
		// json 작업해서 client 로 보내기.
		JSONArray ja = new JSONArray();
		for(int i=0;i<places.size();i++) {
			
			JSONObject jo = new JSONObject();
			
			jo.put("place_seq", places.get(i).getPlace_seq());
			jo.put("place_name", places.get(i).getPlace_name());
			jo.put("place_address", places.get(i).getPlace_address());
			jo.put("place_imgs", places.get(i).getPlace_imgs());
			jo.put("roomtype_price", places.get(i).getRoomtype_price());
			
			// 리뷰 가져와서 더하기 
			float review = mjdao.getReviewRate(places.get(i).getPlace_seq());
			jo.put("place_review", review);
			
			ja.put(jo);
		}
		return ja.toString();
	}

	
	
	// place (숙소/숙박업소 상세페이지 보여주기)
	
	@GetMapping("/place/{place_seq}")
	public String showPlace(Model model, @PathVariable("place_seq") int seq) {
		/* 
		  main.jsp 에서 place/place_seq url을 보낼때
		  만약에 searchbar keyword 에 대한 global variable 값이 null 이 아니라면,
		  그 keyword 들을 session 으로 생성하면됨.
		  keyword 에 대한 내용들을 session 으로 client(jsp)에서 생성한다음,
		  여기서 받고 바로 삭제.
		  session 은 더도말고 덜도말고 3개(where,when,howmanypeople) 에 대한것만 받고,
		  그거만 옮기고 바로 삭제하면됨.
		  
		  일단 그건 나중에하고, searchbar 로 검색 안하고 place/seq 보냈을시 작업먼저 해보자.
		*/
		
		// place 에 대한 정보를 가져와서, model 을 통해서 page 로 전송해주면됨.
		
		return "place";
	}
	
	
	
	@PostMapping("/getPlace")
	@ResponseBody
	public String getPlaceInfo(HttpServletRequest req) {
		
		int place_seq = Integer.parseInt(req.getParameter("place_seq"));
		DTO_MJ_placeDTO place = mjdao.getPlace(place_seq);
		
		JSONObject jo = new JSONObject();
		
		jo.put("name", place.getPlace_name());
		jo.put("imgs", place.getPlace_imgs());
		jo.put("address", place.getPlace_address());
		jo.put("checkin_time", place.getPlace_checkin_time());
		jo.put("checkout_time", place.getPlace_checkout_time());
		jo.put("guide", place.getPlace_guide());
		jo.put("mobile", place.getPlace_mobile());

		return jo.toString();
	}
	
	
	
	
	
	/*
	
	
	if(imgs[0].isEmpty()) {
			System.out.println("no img");
			return "main";
		}
	

	mutlipartFile array 에서 img 안받아두될때 쓰는 code.
	참고로 requestparam 선언시에 parameter 에 required=false 넣어주어야함.
	
	
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 테스트
	@GetMapping("/test")
	public String showtestPage() {
		return "test/slideImgTest";
	}
	@GetMapping("/test2")
	public String showtestPage2() {
		return "test/ImgUploadTest";
	}
	@GetMapping("/test3")
	public String showtestPage3() {
		return "test/portraitModuleTest";
	}
	@GetMapping("/test4")
	public String showtestPage4() {
		return "test/portraitModuleTest2";
	}
	@GetMapping("/modalTest")
	public String showModalTestPage() {
		return "/test/modal_practice";
	}
	@GetMapping("/modalTest2")
	public String showModalTestPage2() {
		return "/test/modal_byMyself";
	}
	@GetMapping("/test5")
	public String showKakaoMapsAPI() {
		return "/test/kakaoMapsAPI";
	}
	@GetMapping("/calendar")
	public String showCalendar() {
		return "/test/calendar";
	}
	@GetMapping("/calendarTest")
	public String showCalendarTest() {
		return "/test/calendarTest";
	}
	
	@GetMapping("/showStructure")
	public String showStructure() {
		return "/structure/all";
	}
	
	@PostMapping("/getImg")
	public void getImg(@RequestParam(value="img") MultipartFile img) {
		System.out.println(img);
	}
	
}
