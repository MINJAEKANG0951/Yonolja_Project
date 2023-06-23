package com.human.springboot;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Controller_HS {
	@Autowired
	DAO_HS hsdao;

	// 마이페이지
    @GetMapping("/mypage")
    public String MyYonolja_host(Model model, HttpServletRequest req, 
    							 @RequestParam(defaultValue = "1") int page, 
    							 @RequestParam(defaultValue = "3") int size) {
        HttpSession session = req.getSession();
        int user_seq = (int) session.getAttribute("user_seq");
        String name = (String) session.getAttribute("login_name");
        String type = (String) session.getAttribute("user_type");  
        
        //페이지네이션
        int groupSize = 5;
        int currentGroup = (page - 1) / groupSize;

        model.addAttribute("groupSize", groupSize);
        model.addAttribute("currentGroup", currentGroup);
        
        int totalCount = hsdao.img_count(user_seq);
        int startIndex = (page - 1) * size + 1;
        int endIndex = Math.min(startIndex + size - 1, totalCount);
        int totalPages = (int) Math.ceil((double) totalCount / size);
        ArrayList<DTO_HS_userDTO> placeList = hsdao.host_imgs(startIndex, size, user_seq);
        
        model.addAttribute("placeList", placeList);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
	    //System.out.println(reviewList);
	    System.out.println("placeList= "+placeList);
	    System.out.println("totalPages= "+totalPages);
	    System.out.println("page= "+page);
	    System.out.println("size= "+size); 

        // 사용자 정보를 Model 객체에 저장
        model.addAttribute("user_name", name);
        model.addAttribute("user_type", type);
        model.addAttribute("page", page);
        

        
        //ArrayList<DTO_HS_userDTO> placeList = hsdao.host_imgs();
        //model.addAttribute("placeList", placeList);
        
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
    public String MyYonolja_mypost(Model model, HttpServletRequest req,
    							   @RequestParam(defaultValue = "1") int page, 
    							   @RequestParam(defaultValue = "5") int size) {
        HttpSession session = req.getSession();
        int user_seq = (int) session.getAttribute("user_seq");

        //페이지네이션    
        int groupSize = 5;
        int currentGroup = (page - 1) / groupSize;

        model.addAttribute("groupSize", groupSize);
        model.addAttribute("currentGroup", currentGroup);

        
        int totalCount = hsdao.mypost_count(user_seq);
        int startIndex = (page - 1) * size + 1;
        int endIndex = Math.min(startIndex + size - 1, totalCount);
        int totalPages = (int) Math.ceil((double) totalCount / size);
        List<DTO_HS_postDTO> mypost = hsdao.myPostlist(user_seq, startIndex, size);

        model.addAttribute("mypost", mypost);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("page", page);
        
	    System.out.println("mypost= "+mypost);
	    System.out.println("totalPages= "+totalPages);
	    System.out.println("page= "+page);
	    System.out.println("size= "+size); 
        
        //List<DTO_HS_postDTO> mypost = hsdao.myPostlist(user_seq);
        //model.addAttribute("mypost", mypost);
        
        //System.out.println(mypost);

        return "MyYonolja_mypost";
    }
    
 // 예약내역조회
    @GetMapping("/MyYonolja_mybooklist")
    public String MyYonolja_mybooklist(Model model, HttpServletRequest req,
                                       @RequestParam(defaultValue = "1") int waitingPage,
                                       @RequestParam(defaultValue = "3") int waitingSize,
                                       @RequestParam(defaultValue = "1") int confirmedPage,
                                       @RequestParam(defaultValue = "3") int confirmedSize) {
        HttpSession session = req.getSession();
        int user_seq = (int) session.getAttribute("user_seq");

        // 예약대기 페이지네이션
        int waiting_groupSize = 5;
        int waiting_currentGroup = (waitingPage - 1) / waiting_groupSize;

        model.addAttribute("waiting_groupSize", waiting_groupSize);
        model.addAttribute("waiting_currentGroup", waiting_currentGroup);
        
        int waitingTotalCount = hsdao.waiting_count(user_seq);
        int waitingStartIndex = (waitingPage - 1) * waitingSize + 1;
        int waitingEndIndex = Math.min(waitingStartIndex + waitingSize - 1, waitingTotalCount);
        int waitingTotalPages = (int) Math.ceil((double) waitingTotalCount / waitingSize);
        List<DTO_HS_bookDTO> waitingList = hsdao.waiting_book(user_seq, waitingStartIndex, waitingSize);

        model.addAttribute("waitingList", waitingList);
        model.addAttribute("waitingTotalPages", waitingTotalPages);
        model.addAttribute("waitingCurrentPage", waitingPage);
        model.addAttribute("waitingPage", waitingPage);
        
        System.out.println("waitingList= "+ waitingList);

        // 예약확정 페이지네이션
        int confirmed_groupSize = 5;
        int confirmed_currentGroup = (confirmedPage - 1) / confirmed_groupSize;

        model.addAttribute("confirmed_groupSize", confirmed_groupSize);
        model.addAttribute("confirmed_currentGroup", confirmed_currentGroup);
        
        int confirmedTotalCount = hsdao.con_count(user_seq);
        int confirmedStartIndex = (confirmedPage - 1) * confirmedSize + 1;
        int confirmedEndIndex = Math.min(confirmedStartIndex + confirmedSize - 1, confirmedTotalCount);
        int confirmedTotalPages = (int) Math.ceil((double) confirmedTotalCount / confirmedSize);
        List<DTO_HS_bookDTO> confirmedList = hsdao.con_book(user_seq, confirmedStartIndex, confirmedSize);

        model.addAttribute("confirmedList", confirmedList);
        model.addAttribute("confirmedTotalPages", confirmedTotalPages);
        model.addAttribute("confirmedCurrentPage", confirmedPage);
        model.addAttribute("confirmedPage", confirmedPage);

        System.out.println("confirmedList= "+confirmedList);
        
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
    
    // 예약취소(예약삭제)
    @PostMapping("/myBook_Bye")
    @ResponseBody
    public String myBook_Bye(HttpServletRequest req) {
    	String retval="ok";
    	int book_seq = Integer.parseInt(req.getParameter("book_seq"));
    	
    	try {
    		hsdao.myBook_delete(book_seq);
    	} catch(Exception e) {
    		retval = "fail";
    		printExceptionMsg("myBook_Bye", e.getMessage());
    	}
    	
    	return retval;
    }
    
    
    // 내후기보기 페이지
    @GetMapping("/MyYonolja_myreview")
    public String MyYonolja_myreview(Model model, 
    								 HttpServletRequest req,
    								 @RequestParam(defaultValue = "1") int page, 
    								 @RequestParam(defaultValue = "5") int size) {
    	
        HttpSession session = req.getSession();        
        int user_seq = (int) session.getAttribute("user_seq");
        
		/* int review_seq = Integer.parseInt(req.getParameter("user_seq")); */

        
        //페이지네이션
        int groupSize = 5;
        int currentGroup = (page - 1) / groupSize;

        model.addAttribute("groupSize", groupSize);
        model.addAttribute("currentGroup", currentGroup);
        
        
        int totalCount = hsdao.myreview_count(user_seq);
        int startIndex = (page - 1) * size + 1;
        int endIndex = Math.min(startIndex + size - 1, totalCount);
        int totalPages = (int) Math.ceil((double) totalCount / size);
        List<DTO_HS_reviewDTO> myreview = hsdao.myReviewlist(user_seq, startIndex, size);

        model.addAttribute("myreview", myreview);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", page);
        model.addAttribute("page", page);
        
	    System.out.println("myreview= "+myreview);
	    System.out.println("totalPages= "+totalPages);
	    System.out.println("page= "+page);
	    System.out.println("size= "+size); 
        
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
    		printExceptionMsg("myReview_Bye", e.getMessage());
    	}
    	
    	return retval;
    }
    
    
    
	// 에러 메시지 체크
    private void printExceptionMsg(String methodName, String msg) {
	      System.out.println("Exception[" + methodName + "]: " + msg);
	     // printExceptionMsg("메소드이름", e.getMessage());
	   }
    
}
