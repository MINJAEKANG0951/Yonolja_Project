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

        return "MyYonolja_mypost";
    }
    
	// 에러 메시지 체크
    private void printExceptionMsg(String methodName, String msg) {
	      System.out.println("Exception[" + methodName + "]: " + msg);
	     // printExceptionMsg("메소드이름", e.getMessage());
	   }
    
}
