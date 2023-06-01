package com.human.springboot;



import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Controller_HY {
	// 경로 나중에 변환해야함 
	String placeImgPath = 
	"C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\place_img";
	
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
	@GetMapping("/host_addPlace")
	public String showAddplace(Model model) {
	    ArrayList<DTO_HY_P> ptypes = hydao.showPtype(); // DB에서 옵션 데이터 조회
	    model.addAttribute("ptypes", ptypes); // JSP로 데이터 전달
	    
	    ArrayList<DTO_HY_P> pfeatures = hydao.showPoption();
	    model.addAttribute("pfeatures", pfeatures); // JSP로 데이터 전달
	    
	    
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
		
		hydao.addplace(pname, user_seq, place_type_seq, pcheckin, pcheckout, address, DBpath, pmobile, place_options, pguide);
		
		return "main";
	}
	
	//////////////////////////managePlace page///////////////////////////
	
	@GetMapping("/host_managePlace")
	public String managePlace() {
		
		return "host_managePlace";
		
	}
	
}
