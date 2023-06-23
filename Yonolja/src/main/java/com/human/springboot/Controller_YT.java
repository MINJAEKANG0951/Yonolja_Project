package com.human.springboot;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String dopostview(@PathVariable("post_seq") int post_seq, Model model,HttpServletRequest req) {
		
		DTO_YT_postDTO post = dao_yt.getPost(post_seq);
		HttpSession session= req.getSession();
		
		
//		System.out.println(post);

		int postSeq = post.getPost_seq();
		int postWriterSeq = post.getUser_seq();
		String session_id=(String) session.getAttribute("user_id");
		String postTitle = post.getPost_title();
		String postContent = post.getPost_content();
		String postComment = post.getPost_comment();
		String writer_id= dao_yt.getUserName(postWriterSeq);
		String post_date = post.getPost_date();
		String post_img = post.getPost_img();
		
		
//		model.addAttribute("post_seq",seq_text);
		model.addAttribute("id",session_id);
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
		
	    int num = posts.size();
	    for (int i = 0; i < posts.size(); i++) {
	        posts.get(i).setNum(num);
	        num--;
	        
	    }
	    
//		model.addAttribute("seq_hidden",seq_hidden);
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

    
//    @PostMapping("/postcomment")
//    public String postComment(@RequestParam("user_id") String user_id, @RequestParam("post_comment") String post_comment, HttpServletRequest req) {
//       
//        String userSeq= session.getAttribute("user_seq")+"";
//        System.out.println(userSeq);
//        int user_seq = Integer.parseInt(userSeq);
//		
//        //Insert the comment into the database
//        dao_yt.insertComment(user_id, post_comment);
//
//        //redirect to the page that displays the post with the new comment
//        return "redirect:/postview";
//    }


//	@GetMapping("/getSearchList")
//	@ResponseBody
//	private List<DTO_YT> getSearchList(@RequestParam("type") String type,
//			@RequestParam("keyword") String keyword, Model model) throws Exception{
//		DTO_YT dtoyt = new DTOYT();
//		
//	}
//			)
//    
    
    
    
    @GetMapping(value = "/search", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<List<DTO_YT>> searchPosts(@RequestParam("searchCategory") String searchCategory, @RequestParam("keyword") String keyword) {
        List<DTO_YT> searchResults = dao_yt.searchPosts(searchCategory, keyword);
        System.out.println(searchResults );
        return new ResponseEntity<>(searchResults, HttpStatus.OK);
    }


//grid post_image
    
    @GetMapping("/getPostImages")
    @ResponseBody
    public List<DTO_YT> getPostImages() {
        List<DTO_YT> posts = dao_yt.getPostImages();

        return posts;
    }


    @PostMapping("getPosts")
    @ResponseBody
    public String getPosts(HttpServletRequest req) {
    	
    	
    	System.out.println( req.getParameter("keyword_select") );
    	System.out.println( req.getParameter("keyword") );
    	System.out.println( req.getParameter("howmanyposts") );
    	System.out.println( req.getParameter("pageNum") );
		   	
    	String keyword_select = req.getParameter("keyword_select");
    	String keyword = req.getParameter("keyword");
    	
    	System.out.println(keyword);
    	
    	int howmanyposts = Integer.parseInt(req.getParameter("howmanyposts")); // 보여줄포스트수
    	int pageNum = Integer.parseInt(req.getParameter("pageNum")); // 페이지번호
    	
    	int start = ( (pageNum-1)*howmanyposts ) + 1;
    	int end = (pageNum)*howmanyposts;
    	
    	ArrayList<DTO_YT_boardPostDTO> adminPosts = dao_yt.getAdminPosts();
    	ArrayList<DTO_YT_boardPostDTO> posts = dao_yt.getPosts(keyword_select, keyword, start, end);
    	
    	JSONArray ja = new JSONArray();
    	
    	for(int i=0;i<adminPosts.size();i++) {
    		
    		JSONObject jo = new JSONObject();
    		jo.put("seq", adminPosts.get(i).getPost_seq());
    		jo.put("category", adminPosts.get(i).getPost_category());
    		jo.put("title", adminPosts.get(i).getPost_title());
    		jo.put("user_id", adminPosts.get(i).getUser_id());
    		jo.put("date", adminPosts.get(i).getPost_date());
    		jo.put("comment", adminPosts.get(i).getPost_comment());
    		jo.put("content", adminPosts.get(i).getPost_content());
    		jo.put("img", adminPosts.get(i).getPost_img());
    		
    		ja.put(jo);
    	}
    	
 
    	
    	for(int i=0;i<posts.size();i++) {
    		
    		JSONObject jo = new JSONObject();
    		
    		
    		jo.put("seq", posts.get(i).getPost_seq());
    		jo.put("category", posts.get(i).getPost_category());
    		jo.put("title", posts.get(i).getPost_title());
    		jo.put("user_id", posts.get(i).getUser_id());
    		jo.put("date", posts.get(i).getPost_date());
    		jo.put("comment", posts.get(i).getPost_comment());
    		jo.put("content", posts.get(i).getPost_content());
    		jo.put("img", posts.get(i).getPost_img());
    		ja.put(jo);
    	}
    	
    	return ja.toString();
    }
    
    
    
    
    @PostMapping("getPageNums")
    @ResponseBody
    public String getPageNums(HttpServletRequest req) {
    	
    	System.out.println( req.getParameter("keyword_select") );
    	System.out.println( req.getParameter("keyword") );
    	System.out.println( req.getParameter("howmanyposts") );
    	
    	String keyword_select = req.getParameter("keyword_select");
    	String keyword = req.getParameter("keyword");
    	int howmanyposts = Integer.parseInt(req.getParameter("howmanyposts"));
    	
    	int allPostsAmount = dao_yt.allPostCounts(keyword_select, keyword);
    		
    	int howmanyPages = ( (allPostsAmount)/howmanyposts ) + 1;
     	if( (allPostsAmount)%howmanyposts==0 ) {
    		howmanyPages--;
    	}
    	
    	// 페이지 개수 계산
   /* 	
    	keyword_select 와 keyword 에 의해 검색된 포스트 수가 16개
    	5개씩 표시하고 싶음. (howmanyposts 는 5)
    	
    	이때 필요한 페이지 개수.
    	
    	1-5,6-10,11-15,16- 까지 표시해야하므로,
    	총 4page 필요.
    	
    	즉, 필요한 page개수는 
    	(총 포스트수/howmanypost) + 1임
    	
    	그런데, 만약에 (총 포스트수%howmanypost) == 0 이면
    	필요한 page 개수는
    	(총 포스트수/howmanypost)  개임.
    	
    	그리고, 예를들어서
    	포스트가 5개라고 치자.
    	
    	포스트가 0개면, 
    	0/5 + 1
    	0%5 => page 수가 0 >>> 이때는 검색결과가 없습니다. 라고 표시. 
    	
   */ 	
    	return howmanyPages+"";
    }
    
   
	
	 
	
}
