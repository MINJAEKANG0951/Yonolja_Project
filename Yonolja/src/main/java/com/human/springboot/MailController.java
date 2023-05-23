package com.human.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MailController {

	private MailService mailService;
	
	@Autowired
	public MailController(MailService mailService) {
		this.mailService = mailService;
	}
	
	@GetMapping("/send")
	public void sendMail() {
		
		mailService.sendEmail("kxg3674@naver.com", "야", "안녕");
		
	}
	
	
}
