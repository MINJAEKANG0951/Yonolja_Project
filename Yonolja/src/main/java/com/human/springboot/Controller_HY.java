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

	// test path
	private String path = "C:/Users/admin/Desktop/imgs";

	// 경로 나중에 변환해야함
	String placeImgPath = "C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\place_img";

	// roomtype_option 경로

	String roomtype_optionImgPath = "C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\roomtype_option";

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
	@GetMapping("/imgpreview")
	public String imgpreview() {
		return "/test/imgPreview";
	}
	
	@GetMapping("/imgOriginal")
	public String imgpreviewOriginal() {
		return "/test/imgOriginal";
	}


	@PostMapping("/addImg")
	@ResponseBody
	public void getData(@RequestParam("img") MultipartFile img,
			   @RequestParam("roomtype_seq") Integer roomtype_seq) {

		String testPath = "C:\\Users\\admin\\Desktop\\imgs";
		String DBpath = "/files/";

		UUID uuid = UUID.randomUUID();
		String randomStr = (uuid + "").substring(0, 5);

		String fileName = randomStr + "-" + img.getOriginalFilename();

		File file = new File(testPath, fileName);
		try {
			img.transferTo(file);
		} catch (Exception e) {
			System.out.println("fail");
		}

		
		
		if(hydao.getImgAddress(roomtype_seq)==null) {
			String dbAddress = (DBpath + fileName);
			hydao.updateImg(dbAddress,roomtype_seq);
		} else {
			String dbAddress = (String) hydao.getImgAddress(roomtype_seq);
			dbAddress += ("," + DBpath + fileName);
			hydao.updateImg(dbAddress,roomtype_seq);

		}
		
		
	}

	@PostMapping("/deleteImg")
	@ResponseBody
	public void getData(@RequestParam("src") String src,@RequestParam("roomtype_seq") int roomtype_seq) {

		System.out.println("delete Img");
		String testPath = "C:\\Users\\admin\\Desktop\\imgs";
		String DBpath = "/files/";
		/*
		 * UUID uuid = UUID.randomUUID(); String randomStr = (uuid + "").substring(0,5);
		 * 
		 * String fileName = randomStr + "-" + img.getOriginalFilename();
		 * 
		 * File file = new File(testPath,fileName); try{ img.transferTo(file); }
		 * catch(Exception e) {System.out.println("fail");}
		 */
		String name = src.replace("/files/", "");
	
		File file = new File(path + "/" + name);
		System.out.println(path + "/" + name);

		String dbAddress = (String) hydao.getImgAddress(roomtype_seq);

		String[]Alladdresses = dbAddress.split(",");
		
		String addressStr = "";
		
		for(int i=0;i<Alladdresses.length;i++) {
			if(Alladdresses[i].equals(src)) {
				// ignore
			} else {
				addressStr += "," + Alladdresses[i];
			}
		}
		// files/abc.jpg , files/add.jpg, files/acc.jpg
		// ===> [files/abc.jpg, files/add.jpg, files/acc.jpg]
		// files/add.jpg
		
		// str = '' 
		// str ==> ,files/abc.jpg
		// str ==> 
		// str ==> files/abc.jpg,files/acc.jpg
		
		
		
		addressStr = addressStr.replaceFirst(",", "");

		if (file.exists()) {
			if (file.delete()) {
				System.out.println("deleted");
			} else {
				System.out.println("failed");
			}
		} else {
			System.out.println("no file");
		}

		hydao.updateImg(addressStr,roomtype_seq);

	}

	@PostMapping("/getImgs")
	@ResponseBody
	public String getImgs(@RequestParam("roomtype_seq") int roomtype_seq) {

		String result = "";
		Object dbAddress = hydao.getImgAddress(roomtype_seq);
		if (dbAddress == null) {
			System.out.println("no photo");
			return "-";
		} else {

			result = (String) hydao.getImgAddress(roomtype_seq);
		}

		return result;
	}

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

			@RequestParam(value = "pname") String pname, @RequestParam(value = "ptype") String ptype,
			@RequestParam(value = "pzip_code") String pzipCode,

			@RequestParam(value = "paddress1") String pad1, @RequestParam(value = "paddress2") String pad2,
			@RequestParam(value = "pmobile") String pmobile, @RequestParam(value = "pcheckin") String pcheckin,
			@RequestParam(value = "pcheckout") String pcheckout, @RequestParam(value = "pguide") String pguide,


			@RequestParam(value = "environments") String[] selectedEnvironments,
			/* 사진도 받아야함 나중에 */
			@RequestParam(value = "img") MultipartFile[] imgs) {

		HttpSession session = req.getSession();
		int user_seq = (int) session.getAttribute("user_seq");
//		System.out.println(user_seq);
		int place_type_seq = Integer.parseInt(ptype);
		String address = pzipCode + "," + pad1 + "," + pad2;
		
		String place_environments = Arrays.toString(selectedEnvironments).replace(" ", "").replace("[", "").replace("]",
				"");
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
		for (int i = 0; i < imgs.length; i++) {
			MultipartFile img = imgs[i];

			String realName = img.getOriginalFilename();
			UUID randomStr = UUID.randomUUID();
			String rstr = ("" + randomStr).substring(0, 8);

			String saveName = rstr + "-" + realName;

			File file = new File(placeImgPath, saveName);
			try {
				img.transferTo(file);
			} catch (Exception e) {;
				System.out.println("fail");
			}

			DBpath += "," + "/img/place_img/" + saveName;
		}
		DBpath = DBpath.replaceFirst(",", "");

		hydao.addplace(pname, user_seq, place_type_seq, pcheckin, pcheckout, address, address, pmobile, DBpath, pguide, place_environments);

		return "main";
	}

	////////////////////////// managePlace page///////////////////////////

	@GetMapping("/host_managePlace/{place_Seq}")
	public String managePlace(@PathVariable("place_Seq") int place_Seq, Model model) {

		/////////////// place type, option select box 관련 ////////

		ArrayList<DTO_HY_P> ptypes = hydao.showPtype(); // DB에서 옵션 데이터 조회
		model.addAttribute("ptypes", ptypes); // JSP로 데이터 전달

		ArrayList<DTO_HY_P> pfeatures = hydao.showPoption();
		model.addAttribute("pfeatures", pfeatures); // JSP로 데이터 전달

		ArrayList<DTO_HY_P> environments = hydao.getEnvironments();
		model.addAttribute("environments", environments);
		////////////////// 업장 정보수정창에서 해당 place 정보 기본셋팅//////////////

		model.addAttribute("place_seq", place_Seq);

		///////////////// 객실타입 게시하는 코드시작/////////////

		ArrayList<DTO_HY_roomtypeDTO> roomTypes = hydao.getRoomtype(place_Seq);
		model.addAttribute("roomTypes", roomTypes);

		return "host_managePlace";

	}

	@PostMapping("/getPlaceInfo")
	@ResponseBody
	public String getPlaceInfo(HttpServletRequest req) {

		DTO_HY_placeDTO place = hydao.getPlace(Integer.parseInt(req.getParameter("place_seq")));

		JSONObject jo = new JSONObject();

		jo.put("name", place.getPlace_name());
		jo.put("type_seq", place.getPlace_type_seq());
		jo.put("address", place.getPlace_address());
		jo.put("mobile", place.getPlace_mobile());
		jo.put("checkin", place.getPlace_checkin_time());
		jo.put("checkout", place.getPlace_checkout_time());
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
		String placeSeq = (String) req.getParameter("place_seq");
		int place_seq = Integer.parseInt(placeSeq);
		String place_name = req.getParameter("pname");
		System.out.println(place_name);
		int user_seq = (int) session.getAttribute("user_seq");
		System.out.println(user_seq);
		int place_type_seq = Integer.parseInt(req.getParameter("ptype"));
		String place_checkin_time = req.getParameter("pcheckin");
		String place_checkout_time = req.getParameter("pcheckout");
		String place_address = req.getParameter("paddress");
		String place_mobile = req.getParameter("pmobile");
//    	String place_options = req.getParameter("checkOpt");
		String place_guide = req.getParameter("pguide");
		String place_environment = req.getParameter("checkEnv");

		hydao.changePlace(place_seq, place_name, user_seq, place_type_seq, place_checkin_time, place_checkout_time,
				place_address, place_mobile, place_guide, place_environment);

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
			@RequestParam(value ="pfeatures") String[] roomtype_options,
			@RequestParam(value="roomtype_guide") String roomGuide
			) {
		
			int place_seq = Integer.parseInt(place_Seq);
			//int roomtype_Seq = Integer.parseInt(roomtype_seq);
			System.out.println(place_seq);
			int maxCapacity = Integer.parseInt(rcap);
			System.out.println(maxCapacity);
			int nightRate = Integer.parseInt(nightrate);
			String roomtype_opt = Arrays.toString(roomtype_options).replace(" ", "").replace("[", "").replace("]",
					"");

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
		hydao.addRoomType(rname, place_seq, DBpath, maxCapacity, nightRate,roomtype_opt, roomGuide);
		
		return "main";
	}

	

	/////////////////// 객실타입 수정 코드 /////////////////////

	  ///////////////////객실타입 수정 코드 /////////////////
		@PostMapping("/modifyRoomtype")
		public String modifyRoomtype(HttpServletRequest req, Model model,
		        @RequestParam(value="place_seq") String place_Seq,
		        @RequestParam(value="roomtype_seq") int roomtype_seq,//수정부분
		        @RequestParam(value="roomtype_name") String rname,
		        @RequestParam(value="roomtype_imgs") MultipartFile[]imgs, 
		        @RequestParam(value="roomtype_capacity") String rcap,
		        @RequestParam(value="roomtype_price") String nightrate,
		        @RequestParam(value ="pfeatures") String[] roomtype_options,
		        @RequestParam(value="roomtype_guide") String roomGuide
		        ) {
		    
		    int place_seq = Integer.parseInt(place_Seq);
		    int roomtype_Seq = req.getParameter("roomtype_seq") != null ? Integer.parseInt(req.getParameter("roomtype_seq")) : 0;
		    int maxCapacity = Integer.parseInt(rcap);
		    int nightRate = Integer.parseInt(nightrate);
		    String roomtype_opt = Arrays.toString(roomtype_options).replace(" ", "").replace("[", "").replace("]",
					"");
		
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

		    hydao.modifyRoomtype(roomtype_Seq, rname, place_seq, DBpath, maxCapacity, nightRate,roomtype_opt, roomGuide);
		    
		    return "redirect:/mypage";
		}
////////////////////////////객실타입 삭제 코드/////////////////

	@PostMapping("/deleteRoomtype")
	public RedirectView deleteRoomtype(@RequestParam("roomtype_seq") int roomtype_seq,
			@RequestParam("place_seq") int place_seq) {
		hydao.deleteRoomtype(roomtype_seq);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/host_managePlace/" + place_seq);
		return redirectView;
	}

	@PostMapping("/addRoom")
	public RedirectView addRoom(@RequestParam("roomTypeId") int roomTypeId, @RequestParam("roomNumber") int roomNumber,
			@RequestParam("place_seq") int place_seq) {

		System.out.println(roomTypeId);
		System.out.println(roomNumber);
		System.out.println(place_seq);

		hydao.addRoom(roomTypeId, roomNumber);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl("/host_managePlace/" + place_seq);

		return redirectView;
	}
///////////수정했었던 코든데 오류남 /////////
//	@PostMapping("/addRoom")
//	public RedirectView addRoom(
//			@RequestParam("roomTypeId") int roomTypeId,
//			@RequestParam("roomNumber") String roomNumber,
//			@RequestParam("place_seq") int place_seq) {
//		
//		System.out.println(roomTypeId);
//		System.out.println(roomNumber);
//		System.out.println(place_seq);
//		
//		int room_Num = Integer.parseInt(roomNumber);
//		
//		hydao.addRoom(roomTypeId, room_Num);
//		  RedirectView redirectView = new RedirectView();
//		  redirectView.setUrl("/host_managePlace/" + place_seq);
//
//		return redirectView;
//	}

	///////////////// 객실타입별 객실 게시 코드 //////////////
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
				jo.put("room_seq", room.getRoom_seq());
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
	public ResponseEntity<?> deleteRoomNum(@RequestParam("roomSeq") int roomSeq,
			@RequestParam("placeSeq") int place_seq) {
		hydao.deleteRoomNum(roomSeq);
		Map<String, Object> response = new HashMap<>();
		response.put("status", "success");
		response.put("redirectUrl", "/host_managePlace/" + place_seq);
		return ResponseEntity.ok(response);
	}

	////////////// 객실 insert시 동일객실번호 체크 part/////////////////

//	@GetMapping("/checkRoomExists")
//	@ResponseBody
//	public Map<String, Boolean> checkRoomExists(
//	        @RequestParam("place_seq") int place_seq,
//	        @RequestParam("roomNumber") int roomNumber) {
//
//	    int count = hydao.checkRoomExists(place_seq, roomNumber);
//	    System.out.println(count);
//	    boolean exists = count >= 1;
//
//	    Map<String, Boolean> response = new HashMap<>();
//	    response.put("exists", exists);
//
//	    return response;
//	}

	@GetMapping("/checkRoomExists")
	@ResponseBody
	public Integer checkRoomExists(@RequestParam("place_seq") int place_seq,
			@RequestParam("roomNumber") int roomNumber) {

		Integer count = hydao.checkRoomExists(place_seq, roomNumber);
		return count != null ? count : 0;
	}

//	
	// Place Delete 삭제 part

	@DeleteMapping("/deletePlace/{placeSeq}")
	public ResponseEntity<Void> deletePlace(@PathVariable("placeSeq") int placeSeq) {
		hydao.deletePlace(placeSeq);
		return ResponseEntity.ok().build(); // 삭제가 성공적으로 이루어졌을 때 응답
	}

}
