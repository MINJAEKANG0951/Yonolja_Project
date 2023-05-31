package com.human.springboot;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class Controller_YT {

	@Autowired
	    private DAO_YT dao_yt;
	
	String postImgPath = 
	"C:\\Users\\admin\\git\\Yonolja_Project\\Yonolja\\src\\main\\resources\\static\\img\\post_img";
	
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
	public String doSubmit(@RequestParam("title") String title,
	                       @RequestParam("content") String content,
	                       @RequestParam("category") String category,
	                       @RequestParam("image") MultipartFile image, HttpServletRequest req) {
	    
		String userSeq = (String) req.getSession().getAttribute("user_seq");
		int user_seq = Integer.parseInt(userSeq);
		
		String realName = image.getOriginalFilename(); // 여권사이즈
		UUID randomStr = UUID.randomUUID(); // data Type UUID인 123123jlkjaseri123-
		// 123123jlkjaseri123--여권사이즈
		String saveName = randomStr + "-" + realName;
		
		File fileInfo = new File(postImgPath,saveName);
		
		try{ image.transferTo(fileInfo); } 
		catch(Exception e) {System.out.println("fail");}
		
		String DBpath = "/img/post_img" + saveName;
		
	    dao_yt.insertPost(category, user_seq, title, content, DBpath);
	    

	    return "redirect:/postboard";
	}

	 
	 
	
}
