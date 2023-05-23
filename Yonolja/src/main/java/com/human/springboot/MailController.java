package com.human.springboot;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class MailController {

	@Autowired
	private MailService mailService;
	
	public MailController(MailService mailService) {
		this.mailService = mailService;
	}
	
	@GetMapping("/send")
	public void sendMail() {
		
		mailService.sendEmail("dudxo940@naver.com", "야", "안녕");
		
	}
	
	
	@PostMapping("/sendCode")
	@ResponseBody
	public void sendCode(HttpServletRequest req) {
		
		String to = req.getParameter("id");
		String code = UUID.randomUUID().toString().substring(0,10);
		
		// 어떤사람에게 코드를 보내고, 그 코드로 그 컴퓨터에 대한 code 를 만들어놓음.
		// 그래서 다른사람이 다른컴퓨터로 인증하려고 할 때, 다른사람의 컴퓨터에대한 code는 
		// 그사람의 code 와 달라서 인증아 안됨...?
		
		HttpSession session = req.getSession();
		
		session.setAttribute("id", to);
		session.setAttribute("code", code);

		
		mailService.sendEmail(to, "yonolja 인증메일", code);
	}
	
	@PostMapping("/checkCode")
	@ResponseBody
	public String checkCode(HttpServletRequest req) {
		
		System.out.println("check");
		
		String answer = "fail";
		
		
		HttpSession session = req.getSession();
		
		String id = req.getParameter("id");
		String usercode = req.getParameter("code");
		
		session.getAttribute("id");
		session.getAttribute("code");
		
		
		System.out.println(id);
		System.out.println(usercode);
		System.out.println( session.getAttribute("id") );
		System.out.println( session.getAttribute("code") );
		
		if(
				id.equals( session.getAttribute("id") ) &&
				usercode.equals(  session.getAttribute("code")   )
		) {
			answer = "success";
		} 
		
		return answer;
	}
	
	
	
}
