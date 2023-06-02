package com.human.springboot;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Controller_HS {
	@Autowired
	DAO_HS hsdao;
	

    @GetMapping("/MyYonolja_myinfo")
    public String MyYonolja_info() {
        return "MyYonolja_myinfo";
    }

    @GetMapping("/mypage")
    public String MyYonolja_host(Model model, HttpServletRequest req) {
        HttpSession session = req.getSession();
        String name = (String) session.getAttribute("login_name");
        String type = (String) session.getAttribute("user_type");

        // 사용자 정보를 Model 객체에 저장
        model.addAttribute("user_name", name);
        model.addAttribute("user_type", type);
        
        ArrayList<DTO_HS_userDTO> placeList = hsdao.host_imgs();
        model.addAttribute("placeList", placeList);

        return "MyYonolja";
    }
    
	// 에러 메시지 체크
    private void printExceptionMsg(String methodName, String msg) {
	      System.out.println("Exception[" + methodName + "]: " + msg);
	     // printExceptionMsg("메소드이름", e.getMessage());
	   }
    
}
