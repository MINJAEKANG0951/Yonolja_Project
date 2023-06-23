package com.human.springboot;

//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.http.protocol.HTTP;
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

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Controller_HY {

	// test path
	private String path = "C:/Users/admin/Desktop/imgs";
	private String PlaceImgPath = "C:/Users/admin/Desktop/placeImgs";
	private String RoomTypeImgPath = "C:/Users/admin/Desktop/roomTypeImgs";

	// 경로 나중에 변환해야함
	String placeImgPath = "C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\place_img";

	// roomtype_option 경로

	String roomtype_optionImgPath = "C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\roomtype_option";

	// 업장추가페이지
	@Autowired
	private DAO_HY hydao;

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


			@RequestParam(value = "environments") String[] selectedEnvironments)
			/* 사진도 받아야함 나중에 */
			 {

		HttpSession session = req.getSession();
		int user_seq = (int) session.getAttribute("user_seq");
//		System.out.println(user_seq);
		int place_type_seq = Integer.parseInt(ptype);
		String address = pzipCode + "," + pad1 + "," + pad2;
		
		String place_environments = Arrays.toString(selectedEnvironments).replace(" ", "").replace("[", "").replace("]",
				"");
		System.out.println(Arrays.toString(selectedEnvironments));
		//////////////////////////////////////////////////////////////////////////
//		사진관리 코드인데 다른코드쓸예정이라 막음 
//		String DBpath = "";
//		for (int i = 0; i < imgs.length; i++) {
//			MultipartFile img = imgs[i];
//
//			String realName = img.getOriginalFilename();
//			UUID randomStr = UUID.randomUUID();
//			String rstr = ("" + randomStr).substring(0, 8);
//
//			String saveName = rstr + "-" + realName;
//
//			File file = new File(placeImgPath, saveName);
//			try {
//				img.transferTo(file);
//			} catch (Exception e) {;
//				System.out.println("fail");
//			}
//
//			DBpath += "," + "/img/place_img/" + saveName;
//		}
//		DBpath = DBpath.replaceFirst(",", "");
		hydao.addplace(pname, user_seq, place_type_seq, pcheckin, pcheckout, address, pmobile, pguide, place_environments);

		return "main";
	}

	
	
	
	////////////////////////// managePlace page///////////////////////////

	
	@GetMapping("/host_managePlace/{place_seq}")
	public String showManagePlace(@PathVariable("place_seq") int place_seq) {

		return "host_managePlace";
	}
	
	
	@PostMapping("/getPlaceInfo")
	@ResponseBody
	public String getPlace(HttpServletRequest req) {
		
		int place_seq = Integer.parseInt(req.getParameter("place_seq"));
		DTO_HY_placeDTO place = hydao.getPlace(place_seq);
		
		
		JSONObject jo = new JSONObject();
		
		jo.put("seq", place.getPlace_seq());
		jo.put("name", place.getPlace_name());
		jo.put("user_seq", place.getUser_seq());
		jo.put("type_seq", place.getPlace_type_seq());
		jo.put("checkin_time", place.getPlace_checkin_time());
		jo.put("checkout_time", place.getPlace_checkout_time());
		
		jo.put("address", place.getPlace_address());
		jo.put("imgs", place.getPlace_imgs());
		jo.put("mobile", place.getPlace_mobile());
		jo.put("options", place.getPlace_options());
		jo.put("guide", place.getPlace_guide());
		jo.put("environment", place.getPlace_environment());
		
		
		return jo.toString();
	}
	
	
	@PostMapping("/getPlaceRoomTypes")
	@ResponseBody
	public String getPlaceRoomTypes(HttpServletRequest req) {
		
		int place_seq = Integer.parseInt( req.getParameter("place_seq") );
		int pageNum = Integer.parseInt( req.getParameter("pageNum") );
		int howmanyUnits = Integer.parseInt( req.getParameter("howmanyUnits") );
		
		int start = ((pageNum-1)*howmanyUnits) + 1;
		int end = pageNum*howmanyUnits;
		
		
		// 1페이지가 클릭되고, 보여주고싶은 unit 이 5개일때 
		// 1번-5번 보여줘야함.
		
		// 즉, 가져올 unit 의 번호의 start 는 ((pageNum-1)*howmanyUnits) + 1
		//						end 는 (pageNum)*howmanyUnits 임
		
		// 예를들어서 보여주고싶은 unit 이 10개일때,
		// 페이지 2번을 클릭한다면,
		// 11번부터 20번까지 보여줘야하므로, 11 -> ((2-1)*10)   + 1 
		//							20 -> (2)*10
		
		ArrayList<DTO_HY_roomtypeDTO> roomtypes = 
				hydao.getRoomTypes(place_seq, start, end);
		
		JSONArray ja = new JSONArray();
		
		for(int i=0;i<roomtypes.size();i++) {
			JSONObject jo = new JSONObject();
			
			jo.put("seq", roomtypes.get(i).getRoomtype_seq());
			jo.put("name", roomtypes.get(i).getRoomtype_name());
			jo.put("imgs", roomtypes.get(i).getRoomtype_imgs());
			jo.put("capacity", roomtypes.get(i).getRoomtype_capacity());
			jo.put("price", roomtypes.get(i).getRoomtype_price());
			
			System.out.println(roomtypes.get(i).getRoomtype_imgs());
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	
	
	@PostMapping("/getRoomTypePageNums")
	@ResponseBody
	public String loadRoomTypePageNums(HttpServletRequest req) {
		
		
		int place_seq = Integer.parseInt( req.getParameter("place_seq") );
		int howmanyUnits = Integer.parseInt( req.getParameter("howmanyUnits") );
		
		int amountOfUnits = hydao.countAllRoomTypes(place_seq);
		
		int howmanyPages = ( (amountOfUnits)/howmanyUnits ) + 1;
		if((amountOfUnits)%howmanyUnits==0){
			howmanyPages--;
		}

		return howmanyPages+"";
	}
	
	
	
	@PostMapping("/getPlaceRooms")
	@ResponseBody
	public String getPlaceRooms(HttpServletRequest req) {
		
		int place_seq = Integer.parseInt( req.getParameter("place_seq") );
		int pageNum = Integer.parseInt( req.getParameter("pageNum") );
		int howmanyUnits = Integer.parseInt( req.getParameter("howmanyUnits") );
		
		
		int start = ((pageNum-1)*howmanyUnits) + 1;
		int end = pageNum*howmanyUnits;
	
		String sql = "";
		
		if(!req.getParameter("selected_roomType").equals("-1")) {
			sql = " and rt.roomtype_seq=" + req.getParameter("selected_roomType") + " ";
		}
		
		
		ArrayList<DTO_HY_roomDTO> rooms = hydao.getRooms(place_seq, sql, start, end);
		
		JSONArray ja = new JSONArray();
		
		for(int i=0;i<rooms.size();i++) {
			JSONObject jo = new JSONObject();
			
			jo.put("seq", rooms.get(i).getRoom_seq());
			jo.put("type_name", rooms.get(i).getRoomtype_name());
			jo.put("number", rooms.get(i).getRoom_number());
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	
	@PostMapping("/getRoomPageNums")
	@ResponseBody
	public String loadRoomPageNums(HttpServletRequest req) {
		
		
		int place_seq = Integer.parseInt( req.getParameter("place_seq") );
		int howmanyUnits = Integer.parseInt( req.getParameter("howmanyUnits") );
		
		String sql = "";
		
		if(!req.getParameter("selected_roomType").equals("-1")) {
			sql = " and rt.roomtype_seq=" + req.getParameter("selected_roomType") + " ";
		}
		
		int amountOfUnits = hydao.countAllRooms(place_seq, sql);
		
		System.out.println(amountOfUnits);
		
		int howmanyPages = ( (amountOfUnits)/howmanyUnits ) + 1;
		
		System.out.println(howmanyPages);
		
		if(amountOfUnits%howmanyUnits==0){
			howmanyPages--;
		}
		
		System.out.println(howmanyPages);
		
		System.out.println("eee");
		return howmanyPages+"";
	}
	
	
	
	
	@PostMapping("/searchPlaceRoomTypes")
	@ResponseBody
	public String searchPlaceRoomTypes(HttpServletRequest req) {
		
		int place_seq = Integer.parseInt( req.getParameter("place_seq") );
		
		
		ArrayList<DTO_HY_roomtypeDTO> roomtypes = hydao.getPlaceRoomTypes(place_seq);
	
		JSONArray ja = new JSONArray();
		
		for(int i=0;i<roomtypes.size();i++) {
			
			JSONObject jo = new JSONObject();
			
			jo.put("seq", roomtypes.get(i).getRoomtype_seq());
			jo.put("name", roomtypes.get(i).getRoomtype_name());
			
			ja.put(jo);
		}
		
		
		
		return ja.toString();
	}
	
	
	
	@PostMapping("/deleteRoom")
	@ResponseBody
	public void deleteRoom(HttpServletRequest req) {
		
		if(req.getParameter("roomSeqs")!=null && 
		   !req.getParameter("roomSeqs").equals("")) 
		{
			
			String[]RoomSeqs = req.getParameter("roomSeqs").split(",");
			for(int i=0;i<RoomSeqs.length;i++) {
				
				int room_seq = Integer.parseInt(RoomSeqs[i]);
				
				hydao.deleteRoom(room_seq);
				
			}
			
		}
		
	}
	
	
	@PostMapping("/addRoomInvalidation")
	@ResponseBody
	public String addRoomInvalidation(HttpServletRequest req) {
		
		int place_seq = Integer.parseInt( req.getParameter("place_seq") );		
		int room_number = Integer.parseInt( req.getParameter("room_number") );
		
		int roomtaken = hydao.roomNumberInvaildation(place_seq, room_number);
		if(roomtaken>=1) {return "fail";}
		else {return "doit";}
		
	}
	
	@PostMapping("/addRoom")
	@ResponseBody
	public void addRoom(HttpServletRequest req) {
		int roomtype_seq = Integer.parseInt( req.getParameter("roomtype_seq") );		
		int room_number = Integer.parseInt( req.getParameter("room_number") );
		hydao.addRoom(roomtype_seq, room_number);
	}
	
	
	
	
	
	
	@PostMapping("/getAllPlaceTypes")
	@ResponseBody
	public String getAllPlaceTypes(HttpServletRequest req) {
		
		ArrayList<DTO_HY_placeTypeDTO> placeTypes = hydao.getPlaceTypes();
		
		JSONArray ja = new JSONArray();
		
		for(int i=0;i<placeTypes.size();i++) {
			
			JSONObject jo = new JSONObject();
			
			jo.put("seq", placeTypes.get(i).getPlace_type_seq());
			jo.put("name", placeTypes.get(i).getPlace_type_name());
			jo.put("img", placeTypes.get(i).getPlace_type_img());
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	@PostMapping("/getAllPlaceEnvironments")
	@ResponseBody
	public String getAllPlaceEnvironments(HttpServletRequest req) {
		
		ArrayList<DTO_HY_placeEnvironmentDTO> placeEnvironments = hydao.getPlaceEnvironments();

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
	
	@PostMapping("/getAllRoomTypeOptions")
	@ResponseBody
	public String getAllRoomTypeOptions(HttpServletRequest req) {
	
		ArrayList<DTO_HY_roomtypeOption> roomtypeOptions = hydao.getRoomTypeOptions();

		JSONArray ja = new JSONArray();
		
		for(int i=0;i<roomtypeOptions.size();i++) {
			
			JSONObject jo = new JSONObject();
			
			jo.put("seq", roomtypeOptions.get(i).getPlace_option_seq());
			jo.put("name", roomtypeOptions.get(i).getPlace_option_name());
			jo.put("img", roomtypeOptions.get(i).getPlace_option_img());
			
			ja.put(jo);
		}
		
		return ja.toString();
	}
	
	
	@PostMapping("/updatePlace")
	@ResponseBody
	public String updatePlace(HttpServletRequest req) {
		
		int place_seq = Integer.parseInt( req.getParameter("place_seq") );
		int place_type_seq = Integer.parseInt( req.getParameter("place_type_seq") );
		String place_name = req.getParameter("place_name");
		String place_checkin = req.getParameter("place_checkin");
		String place_checkout = req.getParameter("place_checkout");
		String place_mobile = req.getParameter("place_mobile");
		String place_address =req.getParameter("place_address");
		String place_guide = req.getParameter("place_guide");
		String place_environment = req.getParameter("place_environment");
		
	
			hydao.updatePlace
			(place_seq, place_name,place_type_seq,  
			place_checkin, place_checkout, 
			place_address, place_mobile, 
			place_guide, place_environment);
		
		return "success";
	}
	
	@PostMapping("/getPlaceImgs")
	@ResponseBody
	public String getPlaceImgs(HttpServletRequest req) {
		
		int place_seq = Integer.parseInt( req.getParameter("place_seq") );
		System.out.println(hydao.getPlaceImgs(place_seq));
		return hydao.getPlaceImgs(place_seq);
	}
	
	
	@PostMapping("/addPlaceImg")
	@ResponseBody
	public String addPlaceImg(
			@RequestParam("place_seq") int place_seq,
			@RequestParam("img") MultipartFile img ) 
	{
		
		UUID uuid = UUID.randomUUID();
		String randomStr = (uuid + "").substring(0, 5);
		
		String FileName = randomStr + "-" + img.getOriginalFilename();
		
		File file = new File(PlaceImgPath,FileName);
		
		try {img.transferTo(file);}
		catch(Exception e) {return "fail";}

		String DBpath = "/placeImgs/";
		String DB = DBpath + FileName;
		
		
		if(hydao.getPlaceImgPath(place_seq)==null) {
			hydao.updatePlaceImg(DB, place_seq);
		} else {
			String newDBpath = hydao.getPlaceImgPath(place_seq) + "," + DB;
			hydao.updatePlaceImg(newDBpath, place_seq);
		}
		
		return "success";
	}
	
	
	@PostMapping("/deletePlaceImg")
	@ResponseBody
	public String deletePlaceImg(HttpServletRequest req) {
		
		int place_seq = Integer.parseInt( req.getParameter("place_seq") );
		String src = req.getParameter("src");
		
		String[]placeImgs = (hydao.getPlaceImgPath(place_seq)+"").split(",");
		
		
		String newImgs = "";
		for(int i=0;i<placeImgs.length;i++) {
			if(placeImgs[i].equals(src)) {
				// ignore
			} else {
				newImgs += "," + placeImgs[i];
			}
		}
		newImgs = newImgs.replaceFirst(",", "");
		
		hydao.updatePlaceImg(newImgs, place_seq);
		
		String fileName = src.replace("/placeImgs/", "");
		
		File file = new File(PlaceImgPath + "/" + fileName);
		
		try {
			if(file.exists()) {
				file.delete();
			}
		}
		catch(Exception e) {return "fail";}
		

		return "success";
	}
	
	@PostMapping("/add_update_RoomType")
	@ResponseBody
	public String add_update_RoomType(HttpServletRequest req) {
		
		
		
	try {
			String roomtype_name = req.getParameter("roomtype_name");
			int place_seq = Integer.parseInt( req.getParameter("place_seq") );
			int roomtype_capacity = Integer.parseInt( req.getParameter("roomtype_capacity") );
			int roomtype_price = Integer.parseInt( req.getParameter("roomtype_price") );
			String roomtype_guide = req.getParameter("roomtype_guide");
			String roomtype_options = req.getParameter("roomtype_options");
			
			
				
			System.out.println(roomtype_name);
			System.out.println(place_seq);
			System.out.println(roomtype_capacity);
			System.out.println(roomtype_price);
			System.out.println(roomtype_guide);
			System.out.println(roomtype_options);
			
			if(req.getParameter("roomtype_seq")==null || 
			   req.getParameter("roomtype_seq").equals("")) 
			{	hydao.addRoomType( /*  insert  */	
					roomtype_name, 
					place_seq, 
					roomtype_capacity, 
					roomtype_price, 
					roomtype_options, 
					roomtype_guide );						}
			else { 
				int roomtype_seq = Integer.parseInt(req.getParameter("roomtype_seq"));
				hydao.modifyRoomtype( /* update */
					roomtype_seq, 
					roomtype_name, 
					roomtype_capacity, 
					roomtype_price, 
					roomtype_options, 
					roomtype_guide);
			}
		} catch(Exception e) {
			return "올바른 정보를 입력해주세요";
		}
		return "success";
	}
	
	
	@PostMapping("/getRoomTypeInfo")
	@ResponseBody
	public String getRoomTypeInfo(HttpServletRequest req) {
		
		int roomtype_seq = Integer.parseInt( req.getParameter("roomtype_seq") );
		
		DTO_HY_roomtypeDTO roomtype = hydao.getRoomTypeInfo(roomtype_seq);
		
		
		JSONObject jo = new JSONObject();
		
		jo.put("seq", roomtype.getRoomtype_seq());
		jo.put("name", roomtype.getRoomtype_name());
		jo.put("capacity", roomtype.getRoomtype_capacity());
		jo.put("price", roomtype.getRoomtype_price());
		jo.put("guide", roomtype.getRoomtype_guide());
		jo.put("options", roomtype.getRoomtype_options());
		

		return jo.toString();
	}
	
	
	@PostMapping("/deleteRoomType")
	@ResponseBody
	public String deleteRoomType(HttpServletRequest req) {
		
		int roomtype_seq = Integer.parseInt( req.getParameter("roomtype_seq") );
		hydao.deleteRoomtype(roomtype_seq);
		return "success";
	}
	
	
	
	@PostMapping("/getRoomTypeImgs")
	@ResponseBody
	public String getRoomTypeImgs(HttpServletRequest req) {
		int roomtype_seq = Integer.parseInt( req.getParameter("roomtype_seq") );
		return hydao.getRoomTypeImgs(roomtype_seq);
	}
	
	
	
	@PostMapping("/addRoomTypeImg")
	@ResponseBody
	public String addRoomTypeImg(
			@RequestParam("roomtype_seq") int roomtype_seq,
			@RequestParam("img") MultipartFile img ) 
	{
		
		System.out.println(img);
		
		UUID uuid = UUID.randomUUID();
		String randomStr = (uuid + "").substring(0, 5);
		
		String FileName = randomStr + "-" + img.getOriginalFilename();
		
		File file = new File(RoomTypeImgPath,FileName);
		
		try {img.transferTo(file);}
		catch(Exception e) {return "fail";}

		String DBpath = "/roomTypeImgs/";
		String DB = DBpath + FileName;
		
		
		if(hydao.getRoomTypeImgPath(roomtype_seq)==null) {
			hydao.updateRoomTypeImg(DB, roomtype_seq);
		} else {
			String newDBpath = hydao.getRoomTypeImgPath(roomtype_seq) + "," + DB;
			hydao.updateRoomTypeImg(newDBpath, roomtype_seq);
		}
		
		return "success";
	}
	
	@PostMapping("/deleteRoomTypeImg")
	@ResponseBody
	public String deleteRoomTypeImg(HttpServletRequest req) {
		
		int roomtype_seq = Integer.parseInt( req.getParameter("roomtype_seq") );
		String src = req.getParameter("src");
		
		String[]roomtypeImgs = (hydao.getRoomTypeImgPath(roomtype_seq)+"").split(",");
		
		
		String newImgs = "";
		for(int i=0;i<roomtypeImgs.length;i++) {
			if(roomtypeImgs[i].equals(src)) {
				// ignore
			} else {
				newImgs += "," + roomtypeImgs[i];
			}
		}
		newImgs = newImgs.replaceFirst(",", "");
		
		hydao.updateRoomTypeImg(newImgs, roomtype_seq);
		
		String fileName = src.replace("/roomTypeImgs/", "");
		
		File file = new File(RoomTypeImgPath + "/" + fileName);
		
		try {
			if(file.exists()) {
				file.delete();
			}
		}
		catch(Exception e) {return "fail";}
		

		return "success";
	}

}
