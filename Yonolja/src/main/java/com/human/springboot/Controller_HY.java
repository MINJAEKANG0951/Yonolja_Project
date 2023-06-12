package com.human.springboot;



//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Controller_HY {
	// 경로 나중에 변환해야함 
	String placeImgPath = 
	"C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\place_img";
	
	// roomtype_option 경로 
	
	String roomtype_optionImgPath = 
			"C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\roomtype_option";
	
	
	// 업장추가페이지 
	@Autowired
	private DAO_HY hydao;
	
//	@GetMapping("/imgTest")
//	public String showTest() {
//		return "imgSendingTest";
//	}
//	
//	@PostMapping("/imgSending")
//	public String TakingImg(
//			@RequestParam(value="name") String name,
//			@RequestParam(value="img") MultipartFile[] imgs
//	) {
//		
//		
//		String DBimgPaths = "";
//		for(int i=0;i<imgs.length;i++) {
//			
//			MultipartFile img = imgs[i];
//			
//			String realName = img.getOriginalFilename();
//			UUID randomStr = UUID.randomUUID();
//			String rstr = (""+randomStr).substring(0,20);
//			String saveName = rstr + "-" + realName;
//			
// 			File file = new File(placeImgPath, saveName);
// 		
// 			try { img.transferTo(file);}
// 			catch(Exception e) {System.out.println("fail");}
//
// 			DBimgPaths += "," + "/img/place_img" + saveName;
//			
//		}
//		
//		DBimgPaths.replaceFirst(",", "");
//		System.out.println(DBimgPaths);
//		System.out.println(DBimgPaths.length());
//		
//		return "redirect:/imgTest";
//	}
//	
//	
	
//	
	
//	@GetMapping("/mypage")
//	public String showMypage() {
//		return "mypage";
//	}
	
	
	@GetMapping("/host_addPlace")
	public String showAddplace(Model model) {
	    ArrayList<DTO_HY_P> ptypes = hydao.showPtype(); // DB에서 옵션 데이터 조회
	    model.addAttribute("ptypes", ptypes); // JSP로 데이터 전달
	    
	    ArrayList<DTO_HY_P> pfeatures = hydao.showPoption();
	    model.addAttribute("pfeatures", pfeatures); // JSP로 데이터 전달
	    
	    ArrayList<DTO_HY_P> environments = hydao.getEnvironments();
	    model.addAttribute("environments", environments);
	    
	    return "host_addPlace";
	}
	
	
	@PostMapping("/insertPlace")
	public String insertPlace(HttpServletRequest req, Model model,
			
			@RequestParam(value="pname") String pname,
			@RequestParam(value="ptype") String ptype,
			@RequestParam(value="pzip_code") String pzipCode,
			
			@RequestParam(value="paddress1") String pad1,
			@RequestParam(value="paddress2") String pad2,
			@RequestParam(value="pmobile") String pmobile,
			@RequestParam(value="pcheckin") String pcheckin,
			@RequestParam(value="pcheckout") String pcheckout,
			@RequestParam(value="pguide") String pguide,
			
			@RequestParam(value="pfeatures") String[] selectedOptions,
			@RequestParam(value="environments") String[] selectedEnvironments,
			/* 사진도 받아야함 나중에 */
			@RequestParam(value="img") MultipartFile[]imgs
			) {
		

		HttpSession session = req.getSession();
		int user_seq = (int) session.getAttribute("user_seq");
//		System.out.println(user_seq);
		int place_type_seq = Integer.parseInt(ptype);
		String address = pzipCode + "," + pad1 + "," + pad2;
		String place_options = Arrays.toString(selectedOptions).replace(" ","").
				replace("[","").replace("]", "");
		
		String place_environments = Arrays.toString(selectedEnvironments).replace(" ","").
				replace("[","").replace("]", "");
		System.out.println(Arrays.toString(selectedEnvironments));
		//////////////////////////////////////////////////////////////////////////
		
//		String originalName = img.getOriginalFilename();
//		UUID randomStr = UUID.randomUUID(); 
//		String rstr = (""+randomStr).substring(0,8);
//		String saveName = rstr + originalName;
//	
//		File file = new File(placeImgPath,saveName);
//		
//		String DBpath = "/img/place_img/" + saveName;
		
		
//		hydao.addplace(pname, user_seq, place_type_seq, pcheckin, pcheckout, address, DBpath, pmobile, place_options, pguide);
		
		String DBpath = "";
		for(int i=0;i<imgs.length;i++) {
			MultipartFile img = imgs[i];
			
			String realName = img.getOriginalFilename();
			UUID randomStr = UUID.randomUUID();
			String rstr = (""+randomStr).substring(0,8);
			
			String saveName = rstr + "-" + realName;
			
			File file = new File(placeImgPath,saveName);
			try { img.transferTo(file); }
			catch(Exception e) { System.out.println("fail"); }
			
			DBpath += "," + "/img/place_img/" + saveName;
		}
		DBpath = DBpath.replaceFirst(",", "");
		
		hydao.addplace(pname, user_seq, place_type_seq, pcheckin, pcheckout, address, DBpath, pmobile, place_options, pguide, place_environments);
		
		return "main";
	}
	
	//////////////////////////managePlace page///////////////////////////
	
	@GetMapping("/host_managePlace/{place_Seq}")
	public String managePlace(@PathVariable("place_Seq") int place_Seq, Model model){
		
		
		///////////////place type, option select box 관련 ////////
		
	    ArrayList<DTO_HY_P> ptypes = hydao.showPtype(); // DB에서 옵션 데이터 조회
	    model.addAttribute("ptypes", ptypes); // JSP로 데이터 전달
	    
	    ArrayList<DTO_HY_P> pfeatures = hydao.showPoption();
	    model.addAttribute("pfeatures", pfeatures); // JSP로 데이터 전달
	    
	    ArrayList<DTO_HY_P> environments = hydao.getEnvironments();
	    model.addAttribute("environments", environments);
	    //////////////////업장 정보수정창에서 해당 place 정보 기본셋팅//////////////
	   
	    model.addAttribute("place_seq", place_Seq);
	   
	    /////////////////객실타입 게시하는 코드시작/////////////
	   
	    ArrayList<DTO_HY_roomtypeDTO> roomTypes = hydao.getRoomtype(place_Seq);
        model.addAttribute("roomTypes", roomTypes);
        
        
		
		return "host_managePlace";
		
	}
	
	
	@PostMapping("/getPlaceInfo")
	@ResponseBody
	public String getPlaceInfo(HttpServletRequest req) {
		
		DTO_HY_placeDTO place = hydao.getPlace( Integer.parseInt( req.getParameter("place_seq") ));
		
	
		JSONObject jo = new JSONObject();
		
		jo.put("name", place.getPlace_name());
		jo.put("type_seq", place.getPlace_type_seq());
		jo.put("address", place.getPlace_address());
		jo.put("mobile", place.getPlace_mobile());
		jo.put("checkin", place.getPlace_checkin_time());
		jo.put("checkout", 	place.getPlace_checkout_time());
		jo.put("guide", place.getPlace_guide());
		jo.put("environments", place.getPlace_environment());
		jo.put("options", place.getPlace_options());
		
		
		
		return jo.toString();
	}
	
	
	
	@PostMapping("/modifyPlace")
	@ResponseBody
	public String modifyPlace(HttpServletRequest req) {
		

		HttpSession session = req.getSession();
		
//	  	int place_seq=  Integer.parseInt(req.getParameter("place_seq"));
		String placeSeq = (String)req.getParameter("place_seq");
	    int place_seq = Integer.parseInt(placeSeq);
    	String place_name= req.getParameter("pname");
    	System.out.println(place_name);
    	int user_seq = (int) session.getAttribute("user_seq");
    	System.out.println(user_seq);
    	int place_type_seq=Integer.parseInt(req.getParameter("ptype"));
    	String place_checkin_time = req.getParameter("pcheckin");
    	String place_checkout_time = req.getParameter("pcheckout");
    	String place_address = req.getParameter("paddress");
    	String place_mobile = req.getParameter("pmobile");
    	String place_options = req.getParameter("checkOpt");
    	String place_guide = req.getParameter("pguide");
    	String place_environment = req.getParameter("checkEnv");
    	
    	
    	hydao.changePlace(place_seq, place_name, user_seq, place_type_seq, place_checkin_time,
    		    place_checkout_time, place_address, place_mobile, place_options, place_guide,
    		    place_environment);
		
    	
    	   return "ok";// 수정한 부분
	}
	
	
// 객실타입 추가 관련
	@PostMapping("/insertRoomType")
	public String insertRoomType(HttpServletRequest req, Model model,
			
			@RequestParam(value="place_seq") String place_Seq,
//			@RequestParam(value="roomtype_seq") String roomtype_seq,
			@RequestParam(value="roomtype_name") String rname,
			@RequestParam(value="roomtype_imgs") MultipartFile[]imgs, 
			@RequestParam(value="roomtype_capacity") String rcap,
			@RequestParam(value="roomtype_price") String nightrate,
//			@RequestParam(value="roomtype_options") String amenities,
			@RequestParam(value="roomtype_guide") String roomGuide
			) {
		
			int place_seq = Integer.parseInt(place_Seq);
			//int roomtype_Seq = Integer.parseInt(roomtype_seq);
			System.out.println(place_seq);
			int maxCapacity = Integer.parseInt(rcap);
			System.out.println(maxCapacity);
			int nightRate = Integer.parseInt(nightrate);
			System.out.println(nightRate);
			System.out.println(rname);
			System.out.println(roomGuide);


		//////////////////////////////////////////////////////////////////////////
///////////////////////////사진파트
		String DBpath = "";
		for(int i=0;i<imgs.length;i++) {
			MultipartFile img = imgs[i];
			
			String realName = img.getOriginalFilename();
			UUID randomStr = UUID.randomUUID();
			String rstr = (""+randomStr).substring(0,8);
			
			String saveName = rstr + "-" + realName;
			
			File file = new File(roomtype_optionImgPath,saveName);
			try { img.transferTo(file); }
			catch(Exception e) { System.out.println("fail"); }
			
			DBpath += "," + "/img/roomtype_option/" + saveName;
		}
		DBpath = DBpath.replaceFirst(",", "");
	//사진파트 끝 	
		hydao.addRoomType(rname, place_seq, DBpath, maxCapacity, nightRate, roomGuide);
		
		return "main";
	}
	
	
	
	///////////////////객실타입 수정 코드 /////////////////
	@PostMapping("/modifyRoomtype")
	public String modifyRoomtype(HttpServletRequest req, Model model,
	        @RequestParam(value="place_seq") String place_Seq,
	        @RequestParam(value="roomtype_seq") int roomtype_seq,//수정부분
	        @RequestParam(value="roomtype_name") String rname,
	        @RequestParam(value="roomtype_imgs") MultipartFile[]imgs, 
	        @RequestParam(value="roomtype_capacity") String rcap,
	        @RequestParam(value="roomtype_price") String nightrate,
//	        @RequestParam(value="roomtype_options") String amenities,
	        @RequestParam(value="roomtype_guide") String roomGuide
	        ) {
	    
	    int place_seq = Integer.parseInt(place_Seq);
	    System.out.println(place_seq);
	    int roomtype_Seq = req.getParameter("roomtype_seq") != null ? Integer.parseInt(req.getParameter("roomtype_seq")) : 0;
	    System.out.println(roomtype_Seq);
	    int maxCapacity = Integer.parseInt(rcap);
	    System.out.println(maxCapacity);
	    int nightRate = Integer.parseInt(nightrate);
	    System.out.println(nightRate);
	    System.out.println(rname);
	    System.out.println(roomGuide);

	    // 사진파트
	    String DBpath = "";
	    for(int i=0;i<imgs.length;i++) {
	        MultipartFile img = imgs[i];
	        
	        String realName = img.getOriginalFilename();
	        UUID randomStr = UUID.randomUUID();
	        String rstr = (""+randomStr).substring(0,8);
	        
	        String saveName = rstr + "-" + realName;
	        
	        File file = new File(roomtype_optionImgPath,saveName);
	        try { img.transferTo(file); }
	        catch(Exception e) { System.out.println("fail"); }
	        
	        DBpath += "," + "/img/roomtype_option/" + saveName;
	    }
	    DBpath = DBpath.replaceFirst(",", "");
	    // 사진파트 끝

	    hydao.modifyRoomtype(roomtype_Seq, rname, place_seq, DBpath, maxCapacity, nightRate, roomGuide);
	    
	    return "redirect:/mypage";
	}
////////////////////////////객실타입 삭제 코드/////////////////
//	@PostMapping("/deleteRoomtype")
//	@ResponseBody
//	public String deleteRoomtype(@RequestParam("roomtype_seq") int roomtype_seq) {
//	    // 객실 타입을 삭제하는 로직을 작성합니다.
//	    hydao.deleteRoomtype(roomtype_seq);
//	    return "redirect:/main";
//	}
	
	@PostMapping("/deleteRoomtype")
	public RedirectView deleteRoomtype(@RequestParam("roomtype_seq") int roomtype_seq, @RequestParam("place_seq") int place_seq) {
	    hydao.deleteRoomtype(roomtype_seq);
	    RedirectView redirectView = new RedirectView();
	    redirectView.setUrl("/host_managePlace/" + place_seq);
	    return redirectView;
	}
	
	@PostMapping("/addRoom")
	public RedirectView addRoom(
			@RequestParam("roomTypeId") int roomTypeId,
			@RequestParam("roomNumber") int roomNumber,
			@RequestParam("place_seq") int place_seq) {
		
		hydao.addRoom(roomTypeId, roomNumber);
		  RedirectView redirectView = new RedirectView();
		  redirectView.setUrl("/host_managePlace/" + place_seq);

		return redirectView;
	}

	/////////////////객실타입별 객실 게시 코드 //////////////
//	@PostMapping("/showRooms")
//	public RedirectView showRooms(
//			  @RequestParam(value="roomTypeNum") int roomtype_seq,
//			  @RequestParam("place_seq") int place_seq,
//			  Model model) {
//		
//		System.out.println(roomtype_seq);
//		System.out.println(place_seq);
//		
//		ArrayList<DTO_HY_roomtypeDTO> roomNums = hydao.showRooms(roomtype_seq);
//        model.addAttribute("roomNums", roomNums);
//        System.out.println(roomNums);
//        
//        RedirectView redirectView = new RedirectView();
//		redirectView.setUrl("/host_managePlace/" + place_seq);
//
//		
//    	return redirectView;
//	}
	
	/// 객실타입 선택후 해당 객실만 select part////
	@PostMapping("/showRooms")
	@ResponseBody
	public ResponseEntity<String> showRooms(@RequestParam("roomTypeNum") String roomTypeNum, Model model) {
	    try {
	        int roomTypeId = Integer.parseInt(roomTypeNum);
	        List<DTO_HY_roomtypeDTO> rooms = hydao.showRooms(roomTypeId);

	        JSONArray jsonArray = new JSONArray();
	        for (DTO_HY_roomtypeDTO room : rooms) {
	            JSONObject jo = new JSONObject();
	            jo.put("roomtype_seq", room.getRoomtype_seq());
	            jo.put("roomtype_name", room.getRoomtype_name());
	            jo.put("room_number", room.getRoom_number());
	            jsonArray.put(jo);
	        }

	        return ResponseEntity.ok(jsonArray.toString());
	    } catch (NumberFormatException e) {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("잘못된 방 유형 번호입니다.");
	    }
	}
	
	///// 객실 삭제 part //////

	@PostMapping("/deleteRoomNum")
	@ResponseBody
	public ResponseEntity<?> deleteRoomNum(@RequestParam("roomNumber") int roomNumber, @RequestParam("placeSeq") int place_seq) {
	    hydao.deleteRoomNum(roomNumber);
	    Map<String, Object> response = new HashMap<>();
	    response.put("status", "success");
	    response.put("redirectUrl", "/host_managePlace/" + place_seq);
	    return ResponseEntity.ok(response);
	}
	
	
	// 객실 insert시 동일객실번호 체크 part///
	
	@GetMapping("/checkRoomExists")
	@ResponseBody
	public Map<String, Boolean> checkRoomExists(
	        @RequestParam("roomTypeId") int roomTypeId,
	        @RequestParam("roomNumber") int roomNumber) {

	    boolean exists = hydao.checkRoomExists(roomTypeId, roomNumber);

	    Map<String, Boolean> response = new HashMap<>();
	    response.put("exists", exists);

	    return response;
	}
	
	// Place Delete 삭제 part
	
	@DeleteMapping("/deletePlace/{placeSeq}")
	public ResponseEntity<Void> deletePlace(@PathVariable("placeSeq") int placeSeq) {
		hydao.deletePlace(placeSeq);
	    return ResponseEntity.ok().build();  // 삭제가 성공적으로 이루어졌을 때 응답
	}









	
}
