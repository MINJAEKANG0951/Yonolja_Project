package com.human.springboot;

import java.util.ArrayList;
import java.util.UUID;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
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
			String userCheckin = req.getParameter("checkin");
			String userCheckout = req.getParameter("checkout");
			
			sql += " and rm.room_seq not in ";
			sql += "(select room_seq from yonolja_book where ";
			sql += "( to_date('"+ userCheckin +"')<=to_date(checkin_date) and to_date(checkin_date)<to_date('"+ userCheckout +"') )";
			sql += " or ";
			sql += "( to_date('"+ userCheckin +"')< to_date(checkout_date) and to_date(checkout_date)<=to_date('"+ userCheckout +"') )";			
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
	public String showPlace(@PathVariable("place_seq") int seq) {
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
	
	
	// place page 에서 load 되자마자 그 place 에 대한 내용들을 page 에 입력함
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
		jo.put("reviewRate", mjdao.getReviewRate(place_seq));
		jo.put("reviewCount",mjdao.countReviews(place_seq));
		
		return jo.toString();
	}
	
	
	
	// 특정 place 의 모든 room의 options 종합
	@PostMapping("/getAlloptions") // place 의 모든 roomtype options 가져오기
	@ResponseBody
	public String getAlloptions(HttpServletRequest req) {
		
		int place_seq = Integer.parseInt(req.getParameter("place_seq"));
		ArrayList<String> alloptions = mjdao.placeAlloptions(place_seq);
		ArrayList<Integer> sortedAlloptions = new ArrayList<Integer>();
		
		for(int i=0;i<alloptions.size();i++) {
			if(alloptions.get(i)!=null) {
				String[]roomtypeOptions = alloptions.get(i).split(",");
				for(int j=0;j<roomtypeOptions.length;j++) {
					if(!sortedAlloptions.contains(Integer.parseInt(roomtypeOptions[j]))) {
						sortedAlloptions.add( Integer.parseInt(roomtypeOptions[j]) );
					}
				}
			}
		}
		sortedAlloptions.sort(null);
		
		JSONArray ja = new JSONArray();
		
		for(int i=0;i<sortedAlloptions.size();i++) {
			
			DTO_MJ_roomTypeOptionDTO roomtype_option
			= mjdao.getRoomTypeOption(sortedAlloptions.get(i));
			
			JSONObject jo = new JSONObject();
			
			jo.put("seq", roomtype_option.getPlace_option_seq());
			jo.put("name", roomtype_option.getPlace_option_name());
			jo.put("img", roomtype_option.getPlace_option_img());

			ja.put(jo);
			
		}
		
		return ja.toString();
	}
	
	
	// 특정 place 의 모든 roomtype 가져오기(keyword 별로)
	@PostMapping("/getRoomTypes")
	@ResponseBody
	public String getRoomTypes(HttpServletRequest req) {
		
		int place_seq = Integer.parseInt(req.getParameter("place_seq"));
		int pageNum = Integer.parseInt( req.getParameter("pageNum") );
		
		int howmanyUnits = 4;
		int start = ( (pageNum-1)*howmanyUnits ) + 1; 
		int end = (pageNum)*howmanyUnits;
		
		ArrayList<DTO_MJ_placeRoomTypeDTO> roomtypes = null;
		
		
		String sql = " ";
		

		
		if( req.getParameter("howmanypeople")!=null && 
		   !req.getParameter("howmanypeople").equals("")) 
		{	
			String howmanypeople = req.getParameter("howmanypeople");
			sql += " and (rt.roomtype_capacity>=" + howmanypeople + ")";
		}
		
		if( (req.getParameter("checkin")!=null && !req.getParameter("checkin").equals("")) &&
			(req.getParameter("checkout")!=null && !req.getParameter("checkout").equals(""))) 
		{
			String userCheckin = req.getParameter("checkin");
			String userCheckout = req.getParameter("checkout");
			
			sql += " and rm.room_seq not in ";
			sql += "(select room_seq from yonolja_book where ";
			sql += "( to_date('"+ userCheckin +"')<=to_date(checkin_date) and to_date(checkin_date)<to_date('"+ userCheckout +"') )";
			sql += " or ";
			sql += "( to_date('"+ userCheckin +"')< to_date(checkout_date) and to_date(checkout_date)<=to_date('"+ userCheckout +"') )";			
			sql += ") order by rm.room_seq";
		}
		
		roomtypes = mjdao.getRoomTypes(place_seq, sql, start, end);	
		
		JSONArray ja = new JSONArray();
		
		for(int i=0;i<roomtypes.size();i++) {
			
			JSONObject jo = new JSONObject();
			jo.put("seq", roomtypes.get(i).getRoomtype_seq());
			jo.put("name", roomtypes.get(i).getRoomtype_name());
			jo.put("capacity", roomtypes.get(i).getRoomtype_capacity());
			jo.put("price", roomtypes.get(i).getRoomtype_price());
			jo.put("imgs", roomtypes.get(i).getRoomtype_imgs());
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	
	// 주소를받아서 좌표로 나타내주는 method(새로배운거니 잘 간직)
	@GetMapping("/coordinates")
	@ResponseBody
    public String getCoordinates(@RequestParam("address") String address) {
        try {
            // Construct the API request URL
            URIBuilder uriBuilder = new URIBuilder("https://dapi.kakao.com/v2/local/search/address.json");
            uriBuilder.setParameter("query", address);

            // Create an HttpClient instance
            HttpClient httpClient = HttpClientBuilder.create().build();

            // Create an HTTP GET request with the constructed URL
            HttpGet httpGet = new HttpGet(uriBuilder.build());

            // Set the API key in the request header
            httpGet.setHeader(HttpHeaders.AUTHORIZATION, "KakaoAK 59b3853d621bd06f62c23ee5afade345");

            // Execute the request and obtain the response
            HttpResponse response = httpClient.execute(httpGet);

            // Parse the response JSON
            String jsonResponse = EntityUtils.toString(response.getEntity());

            // Process the JSON and extract the coordinates as needed
            // ...
            return jsonResponse;
        } catch (Exception e) {
            // Handle any errors that may occur during the request
            e.printStackTrace();
            return "Error occurred: " + e.getMessage();
        }
    }

	
	@PostMapping("/getReviews")
	@ResponseBody
	public String getReviews(HttpServletRequest req) {
		
		int place_seq = Integer.parseInt( req.getParameter("place_seq") );
		String keyword = req.getParameter("keyword");
		int pageNum = Integer.parseInt( req.getParameter("pageNum") );
		
		
		int howmanyUnits = 10;
		
		/*
			한 페이지당 10 개씩 표시한다고 쳐보자.
			pageNum 이 1이면
			1~10 까지 표시
			pageNum 이 2면
			11~20 까지 표시
			pageNum 이 3이면
			21~30 까지 표시
			
			start = (pageNum-1)*(10) + 1
			end = (pageNum)*10
		*/
		
		
		int start = ( (pageNum-1)*howmanyUnits ) + 1; 
		int end = (pageNum)*howmanyUnits;
		
		
		ArrayList<DTO_MJ_reviewDTO> reviews = mjdao.getReviews(place_seq, keyword, start, end);
		
		JSONArray ja = new JSONArray();
		
		for(int i=0;i<reviews.size();i++) {
			
			JSONObject jo = new JSONObject();
			
			jo.put("seq", reviews.get(i).getReview_seq());
			jo.put("user_id", reviews.get(i).getUser_id());
			jo.put("roomtype_name", reviews.get(i).getRoomtype_name());
			jo.put("star", reviews.get(i).getReview_star());
			jo.put("content", reviews.get(i).getReview_content());
			jo.put("date", reviews.get(i).getReview_date());
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	
	/*
	
	
	if(imgs[0].isEmpty()) {
			System.out.println("no img");
			return "main";
		}
	

	mutlipartFile array 에서 img 안받아두될때 쓰는 code.
	참고로 requestparam 선언시에 parameter 에 required=false 넣어주어야함.
	
	
	*/
	
	
	@GetMapping("/roomtype/{roomtype_seq}")
	public String showRoomType(@PathVariable("roomtype_seq") int roomtype_seq) {
		
		// 굳이 model 로 안실어도, jsp 에서 ${roomtype_seq} 하면 roomtype 사용가능함.
		return "roomtype";
	}
	
	
	@PostMapping("/getRoomType")
	@ResponseBody
	public String getRoomType(HttpServletRequest req) {
		
		int roomtype_seq = Integer.parseInt( req.getParameter("roomtype_seq") );
		
		DTO_MJ_roomTypeDTO roomtype = mjdao.getRoomType(roomtype_seq);
		
		
		JSONObject jo = new JSONObject();
		
		jo.put("place_seq", roomtype.getPlace_seq());
		jo.put("place_name", roomtype.getPlace_name());
		jo.put("checkin", roomtype.getPlace_checkin_time());
		jo.put("checkout", roomtype.getPlace_checkout_time());
		jo.put("seq", roomtype.getRoomtype_seq());
		jo.put("name", roomtype.getRoomtype_name());
		jo.put("imgs", roomtype.getRoomtype_imgs());
		jo.put("capacity", roomtype.getRoomtype_capacity());
		jo.put("price", roomtype.getRoomtype_price());
		jo.put("options", roomtype.getRoomtype_options());
		jo.put("guide", roomtype.getRoomtype_guide());
		jo.put("reviewCount", mjdao.countRoomTypeReviews(roomtype_seq));
		
		
		return jo.toString();
	}
	
	
	
	@PostMapping("/getRoomTypeReviews")
	@ResponseBody
	public String getRoomTypeReviews(HttpServletRequest req) {
		
		int roomtype_seq = Integer.parseInt( req.getParameter("roomtype_seq") );
		String keyword = req.getParameter("keyword");
		int pageNum = Integer.parseInt( req.getParameter("pageNum") );
		
		
		int howmanyUnits = 10;
		
		
		int start = ( (pageNum-1)*howmanyUnits ) + 1; 
		int end = (pageNum)*howmanyUnits;
		
		ArrayList<DTO_MJ_reviewDTO> reviews = mjdao.getRoomTypeReviews(roomtype_seq, keyword, start, end);
		
		JSONArray ja = new JSONArray();
		
		for(int i=0;i<reviews.size();i++) {
			
			JSONObject jo = new JSONObject();
			
			jo.put("seq", reviews.get(i).getReview_seq());
			jo.put("user_id", reviews.get(i).getUser_id());
			jo.put("roomtype_name", reviews.get(i).getRoomtype_name());
			jo.put("star", reviews.get(i).getReview_star());
			jo.put("content", reviews.get(i).getReview_content());
			jo.put("date", reviews.get(i).getReview_date());
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	
	
	
	@PostMapping("/countRoomLeft")
	@ResponseBody
	public String countRoomLeft(HttpServletRequest req) {
		
		int roomtype_seq = Integer.parseInt( req.getParameter("roomtype_seq") );

		
		
		String sql = " ";
		
		if(req.getParameter("howmanypeople")!=null && 
		  !req.getParameter("howmanypeople").equals("")) 
		{
			sql += " and rt.roomtype_capacity>=" + req.getParameter("howmanypeople") + " ";
		}

		
		if( (req.getParameter("checkin")!=null && req.getParameter("checkout")!=null) && 
				(!req.getParameter("checkin").equals("") && !req.getParameter("checkout").equals(""))) 
			{
				String userCheckin = req.getParameter("checkin");
				String userCheckout = req.getParameter("checkout");
				
				sql += " and rm.room_seq not in ";
				sql += "(select room_seq from yonolja_book where ";
				sql += "( to_date('"+ userCheckin +"')<=to_date(checkin_date) and to_date(checkin_date)<to_date('"+ userCheckout +"') )";
				sql += " or ";
				sql += "( to_date('"+ userCheckin +"')< to_date(checkout_date) and to_date(checkout_date)<=to_date('"+ userCheckout +"') )";			
				sql += ") order by rm.room_seq";    
				
			}
		

		mjdao.countRoomLeft(roomtype_seq, sql);
		
		return mjdao.countRoomLeft(roomtype_seq, sql) + "";
	}
	
	
	@PostMapping("/addBook")
	@ResponseBody
	public String addBook(HttpServletRequest req) {
		
		int roomtype_seq = Integer.parseInt( req.getParameter("roomtype_seq") );
		String checkin = req.getParameter("checkin");
		String checkout = req.getParameter("checkout");
		int book_price = Integer.parseInt( req.getParameter("book_price") );
	
	
		HttpSession session = req.getSession();
	
		if(session.getAttribute("user_seq")==null) {
			return "login";
		} else {
			
			String sql = "";
			
			sql += " and rt.roomtype_capacity>=" + req.getParameter("howmanypeople") + " ";
			
			String userCheckin = req.getParameter("checkin");
			String userCheckout = req.getParameter("checkout");
			
			sql += " and rm.room_seq not in ";
			sql += "(select room_seq from yonolja_book where ";
			sql += "( to_date('"+ userCheckin +"')<=to_date(checkin_date) and to_date(checkin_date)<to_date('"+ userCheckout +"') )";
			sql += " or ";
			sql += "( to_date('"+ userCheckin +"')< to_date(checkout_date) and to_date(checkout_date)<=to_date('"+ userCheckout +"') )";			
			sql += ") order by rm.room_seq";  
			
			int room_seq = mjdao.getAnyRoomAvailable(roomtype_seq, sql);
			
			int user_seq = (int)session.getAttribute("user_seq");
			mjdao.addBook(user_seq,room_seq,checkin,checkout,book_price);
		}
		
		return "main";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
	
	@GetMapping("/mapTest/{seq}")
	public String TestMap(@PathVariable("seq") int seq) {
		System.out.println(seq);
		return "/test/testmap";
	}
	
	@GetMapping("/email")
	public String emailCheck() {
		return "/test/EmailSending";
	}
	
	
	
	// 이메일인증 - 나중에 비밀번호 분실시 해당 이메일로 비밀번호 전송 가능(아이디/비밀번호 찾기 둘 다 가능하려면 email이 primary key 여야함)
	@Autowired
	MailSender sender;
	
	@PostMapping("/sendEmail")
	@ResponseBody
	public String sendEmail(HttpServletRequest req) {
		
		
		String toAddress = 
				req.getParameter("emAddress")!=null ? req.getParameter("emAddress"):null;
		
		
		UUID uuid = UUID.randomUUID();
		String securityCode = (uuid+"").substring(0,5);
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("the_relaxed_tortoise@naver.com");
		message.setTo(toAddress);
		message.setSubject("Yonolja 인증 메일입니다.");
		message.setText("보안코드 " + securityCode + "를 yonolja 웹사이트에서 입력해주세요.");
		sender.send(message);
		
		HttpSession session = req.getSession();
		session.setAttribute("securityCode", securityCode);
		
		return "이메일이 전송되었습니다";
	}
	
	
	@PostMapping("/confirmCode")
	@ResponseBody
	public String confirmCode(HttpServletRequest req) {
		
		
		String code = 
				req.getParameter("code")!=null ? req.getParameter("code"):null;
		
		HttpSession session = req.getSession();
		String codeSent = (String) session.getAttribute("securityCode");
		
		if(code.equals(codeSent)) 
		{session.setAttribute("securityCode", null);return "이메일 인증 완료";}
		else {return "이메일 인증 실패";}
		
		
	}
	
	
	
}
