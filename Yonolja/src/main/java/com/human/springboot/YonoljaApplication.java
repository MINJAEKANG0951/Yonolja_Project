package com.human.springboot;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class YonoljaApplication {
	

	public static void main(String[] args) {
		// 어플리케이션의 메인
		
		System.out.println("server start");
		
		// 여기다 user_connected table 초기화하는거 만들면되지않을까?
	
		SpringApplication.run(YonoljaApplication.class, args);
	}
	
	
	
	
	

}



