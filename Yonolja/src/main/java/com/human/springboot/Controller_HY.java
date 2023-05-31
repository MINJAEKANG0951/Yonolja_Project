package com.human.springboot;



import java.util.ArrayList;
import java.util.Arrays;

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
	
	
	
	
	// 업장추가페이지 
	@Autowired
	private DAO_HY hydao;
	
	
	
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
			@RequestParam(value="file") MultipartFile multi
			) {
		

		HttpSession session = req.getSession();
		int user_seq = (int) session.getAttribute("user_seq");
		int place_type_seq = Integer.parseInt(ptype);
		String address = pzipCode + "," + pad1 + "," + pad2;
		String place_options = Arrays.toString(selectedOptions).replace(" ","").
				replace("[","").replace("]", "");
		
		
		
		return "";
	}
	
}
