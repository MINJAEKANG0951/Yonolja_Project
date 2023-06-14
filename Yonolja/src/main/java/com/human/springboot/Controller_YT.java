package com.human.springboot;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


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
	
	@GetMapping("/postview/{post_seq}")
	public String dopostview(@PathVariable("post_seq") int post_seq, Model model) {
		
		DTO_YT_postDTO post = dao_yt.getPost(post_seq);
		
		
		
//		System.out.println(post);
		
		int postSeq = post.getPost_seq();
		int postWriterSeq = post.getUser_seq();
		String postTitle = post.getPost_title();
		String postContent = post.getPost_content();
		String postComment = post.getPost_comment();
		String writer_id= dao_yt.getUserName(postWriterSeq);
		String post_date = post.getPost_date();
		String post_img = post.getPost_img();
		
		model.addAttribute("post_seq",postSeq);
		model.addAttribute("post_writer",writer_id);
		model.addAttribute("post_title",postTitle);
		model.addAttribute("post_content",postContent);
		model.addAttribute("post_comment",postComment);
		model.addAttribute("post_date",post_date);
		model.addAttribute("post_img",post_img);

		System.out.println(post_img);
		
		return "postview";
	}
	
	
	
//	@GetMapping("/postboard")
//	public String dopostboard() {
//		return "postboard";
//	}
	
	@PostMapping("/submit")
	public String doSubmit(@RequestParam("title") String title,
	                       @RequestParam("content") String content,
	                       @RequestParam("category") String category,
	                       @RequestParam("image") MultipartFile image, HttpServletRequest req) {
	    
		HttpSession session = req.getSession();
		String userSeq= session.getAttribute("user_seq")+"";
		System.out.println(userSeq);
		int user_seq = Integer.parseInt(userSeq);
		
		String realName = image.getOriginalFilename(); // 여권사이즈
		UUID randomStr = UUID.randomUUID(); // data Type UUID인 123123jlkjaseri123-
		// 123123jlkjaseri123--여권사이즈
		String saveName = randomStr + "-" + realName;
		
		File fileInfo = new File(postImgPath,saveName);
		
		try{ image.transferTo(fileInfo); } 
		catch(Exception e) {System.out.println("fail");}
		
		String DBpath = "/img/post_img/" + saveName;
		
	    dao_yt.insertPost(category, user_seq, title, content, DBpath);
	    

	    return "redirect:/post_board";
	}

	 
	@RequestMapping("/post_board")
	public String dopostboard(Model model) {
		ArrayList<DTO_YT> posts = dao_yt.selectPost();
		model.addAttribute("posts", posts);
		return "postboard";
	}
	
	
	@PostMapping("/postview")
		public String postview(HttpServletRequest req, Model model) {
		String post_title = req.getParameter("post_title");
		String post_Content = req.getParameter("post_Content");
		String post_date = req.getParameter("post_date");
		String user_id = req.getParameter("user_id");
		String post_img = req.getParameter("post_img");
		
		model.addAttribute("post_title",post_title);
		model.addAttribute("post_Content",post_Content);
		model.addAttribute("post_date",post_date);
		model.addAttribute("user_id",user_id);
		model.addAttribute("post_img",post_img);
		
		return "postview";
		
	}
	
	
//	@GetMapping("/postview/{post_seq}")
//	public String deletePost(@PathVariable("post_seq") int post_seq) {
//	    dao_yt.deletePost(post_seq);
//	    return "redirect:/postboard";
//	}

	@PostMapping("/postview/{post_seq}")
	public String deletePost(@PathVariable("post_seq") int post_seq) {
		dao_yt.deletePost(post_seq);
		return "redirect:/post_board";
	}
	

    @PutMapping("/postview/{post_seq}")
    public String updatePost(@PathVariable("post_seq") int post_seq, HttpServletRequest req) {
    	
    	System.out.println(req.getParameter("post_title"));
    	System.out.println(req.getParameter("post_content"));
        String updated_title = req.getParameter("post_title");
        String updated_content = req.getParameter("post_content");

        dao_yt.updatePost(updated_title, updated_content, post_seq);
        return "redirect:/postview/" + post_seq;
    }

	
	
    
    
    
    
    
    
    
    
    
	
	
	 
	
}
