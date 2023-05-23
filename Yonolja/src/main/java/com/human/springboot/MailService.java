package com.human.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	@Autowired
	private JavaMailSender javaMailSender;		// mail sender 객체 생성. interface 임.
	
	public MailService(JavaMailSender javaMailSender) {	
		this.javaMailSender = javaMailSender;	// mailservice 만들면 초기화 
	}
	
	
	public void sendEmail(String to, String subject, String body) {
		
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		
		mailMessage.setTo(to);
		mailMessage.setSubject(subject);
		mailMessage.setText(body);
		mailMessage.setFrom("the_relaxed_tortoise@naver.com");
		
		javaMailSender.send(mailMessage);
		
	}
	
	
	
}
