package com.human.springboot;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Controller_HY {
	
	
	
	
	// 업장추가페이지 
	@Autowired
	private DAO_HY dao_hy;
	
	
	
	@GetMapping("/host_addPlace")
	public String showAddplace(Model model) {
	    ArrayList<DTO_HY_P> ptypes = dao_hy.showPtype(); // DB에서 옵션 데이터 조회
	    model.addAttribute("ptypes", ptypes); // JSP로 데이터 전달
	    
	    ArrayList<DTO_HY_P> pfeatures = dao_hy.showPoption();
	    model.addAttribute("pfeatures", pfeatures); // JSP로 데이터 전달
	    
	    
	    return "host_addPlace";
	}

	
	
	
}
