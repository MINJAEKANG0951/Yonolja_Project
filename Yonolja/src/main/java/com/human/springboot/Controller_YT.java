package com.human.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class Controller_YT {

	  @Autowired
	    private DAO_YT dao_yt;
	
//	@GetMapping("/main")
//	public String showMain() {
//		return "main";
//	}
	
	@GetMapping("/postwrite")
	public String dopostwrite() {
		return "postwrite";
	}
	
	@GetMapping("/postview")
	public String dopostview() {
		return "postview";
	}
	
	
	
	@GetMapping("/postboard")
	public String doYonljaboard() {
		return "postboard";
	}
	

    @PostMapping("/submit")
    public String submitForm(@RequestParam("title") String title,
                             @RequestParam("content") String content,
                             @RequestParam("category") String category,
                             @RequestParam("image") MultipartFile image) {
       
    	dao_yt.insertPost(0, category, 0, content, null, title);
    	
        return "success";
    }

	 
	 
	 
	 
	 
	
}
