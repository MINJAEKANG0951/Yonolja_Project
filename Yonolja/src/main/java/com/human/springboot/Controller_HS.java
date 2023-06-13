package com.human.springboot;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Controller_HS {
	@Autowired
	DAO_HS hsdao;

	// 마이페이지
    @GetMapping("/mypage")
    public String MyYonolja_host(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession();
        int user_seq = (int) session.getAttribute("user_seq");
        String name = (String) session.getAttribute("login_name");
        String type = (String) session.getAttribute("user_type");

        // 사용자 정보를 Model 객체에 저장
        model.addAttribute("user_name", name);
        model.addAttribute("user_type", type);
        
        ArrayList<DTO_HS_userDTO> placeList = hsdao.host_imgs();
        model.addAttribute("placeList", placeList);
        
        List<DTO_HS_userDTO> user_ps = hsdao.user_all(user_seq);
        if (!user_ps.isEmpty()) {
            String ps = user_ps.get(0).getUser_password();
            model.addAttribute("user_password", ps);
        } else {
            
        }
        

        return "MyYonolja";
    }
    
    // 내정보관리(수정페이지)
	@GetMapping("/MyYonolja_myinfo")
	public String MyYonolja_info(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession();
        int user_seq = (int) session.getAttribute("user_seq");
		
        List<DTO_HS_userDTO> user = hsdao.user_all(user_seq);
        if (!user.isEmpty()) {
            String email = user.get(0).getUser_email();
            model.addAttribute("user_email", email);
            String gender = user.get(0).getUser_gender();
            model.addAttribute("user_gender", gender);
            String mobile = user.get(0).getUser_mobile();
            model.addAttribute("user_mobile", mobile);
            int seq = user.get(0).getUser_seq();
            model.addAttribute("user_seq", seq);
        } else {
           
        }
	    return "MyYonolja_myinfo";
	}
    
	// 내정보수정(업데이트)
    @PostMapping("/updateUserNolja")
    @ResponseBody
    public String updateUserNolja(HttpServletRequest req) {
    	String retval = "ok";
    	int user_seq = Integer.parseInt(req.getParameter("user_seq"));
    	String user_email = req.getParameter("user_email");
    	String user_password = req.getParameter("user_password");
    	String user_mobile = req.getParameter("user_mobile");
    	
    	
    	try {
    		hsdao.updateUserNolja(user_seq, user_email, user_password, user_mobile);
    	} catch(Exception e) {
    		retval = "fail";
    		printExceptionMsg("updateUserNolja", e.getMessage());
    	}
    	
    	return retval;
    }
    
    // 내정보삭제(회원탈퇴)
    @PostMapping("/YonoljaBye")
    @ResponseBody
    public String YonoljaBye(HttpServletRequest req) {
    	String retval="ok";
    	int user_seq = Integer.parseInt(req.getParameter("user_seq"));
    	
    	try {
    		hsdao.YonoljaBye(user_seq);
    	} catch(Exception e) {
    		retval = "fail";
    		printExceptionMsg("YonoljaBye", e.getMessage());
    	}
    	
    	return retval;
    }
    
    // 나의문의 페이지
    @GetMapping("/MyYonolja_mypost")
    public String MyYonolja_mypost(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession();
        int user_seq = (int) session.getAttribute("user_seq");

        List<DTO_HS_postDTO> mypost = hsdao.myPostlist(user_seq);
        model.addAttribute("mypost", mypost);
        
        System.out.println(mypost);

        return "MyYonolja_mypost";
    }
    
    // 예약내역조회 페이지
    @GetMapping("/MyYonolja_mybooklist")
    public String MyYonolja_mybooklist(Model model, HttpServletRequest req) {
    	
        HttpSession session = req.getSession();
        int user_seq = (int) session.getAttribute("user_seq");

        List<DTO_HS_bookDTO> mybook = hsdao.myBooklist(user_seq);
        model.addAttribute("mybook", mybook);
        
        System.out.println(mybook);
        System.out.println(user_seq);
        
		/* printExceptionMsg("MyYonolja_mybooklist", e.getMessage()); */
    	
    	return "MyYonolja_mybooklist";
    }
    
    // 예약내역조회 페이지에서 리뷰(review) 등록하기insert
    @PostMapping("/book_review_insert")
    @ResponseBody
    public String Yonolja_book_review_insert(HttpServletRequest req) {
    	String retval = "ok";
    	
    	String review_content = req.getParameter("review_content");
    	int review_star = Integer.parseInt(req.getParameter("review_star"));
    	int book_seq = Integer.parseInt(req.getParameter("book_seq"));
    	
    	try {
    		hsdao.review_insert(review_content, review_star, book_seq);
    	} catch(Exception e) {
    		retval = "fail";
    		printExceptionMsg("Yonolja_book_review_insert", e.getMessage());
    	}
    	
    	return retval;
    }
    
    
    // 내후기보기 페이지
    @GetMapping("/MyYonolja_myreview")
    public String MyYonolja_myreview(Model model, HttpServletRequest req) {
    	
        HttpSession session = req.getSession();
        int user_seq = (int) session.getAttribute("user_seq");

        List<DTO_HS_reviewDTO> myreview = hsdao.myReviewlist(user_seq);
        model.addAttribute("myreview", myreview);
        
    	return "MyYonolja_myreview";
    }
    
	// 리뷰수정(업데이트)
    @PostMapping("/myReview_update")
    @ResponseBody
    public String myReview_update(HttpServletRequest req) {
    	String retval = "ok";
    	int review_seq = Integer.parseInt(req.getParameter("review_seq"));
    	String review_content = req.getParameter("review_content");
    	int review_star = Integer.parseInt(req.getParameter("review_star"));
    	
    	
    	try {
    		hsdao.myreview_update(review_seq, review_content, review_star);
    	} catch(Exception e) {
    		retval = "fail";
    		printExceptionMsg("myReview_update", e.getMessage());
    	}
    	
    	return retval;
    }
    
    // 리뷰삭제
    @PostMapping("/myReview_Bye")
    @ResponseBody
    public String myReview_Bye(HttpServletRequest req) {
    	String retval="ok";
    	int review_seq = Integer.parseInt(req.getParameter("review_seq"));
    	
    	try {
    		hsdao.myReview_delete(review_seq);
    	} catch(Exception e) {
    		retval = "fail";
    		printExceptionMsg("YonoljaBye", e.getMessage());
    	}
    	
    	return retval;
    }
    
    
    
	// 에러 메시지 체크
    private void printExceptionMsg(String methodName, String msg) {
	      System.out.println("Exception[" + methodName + "]: " + msg);
	     // printExceptionMsg("메소드이름", e.getMessage());
	   }
    
}
