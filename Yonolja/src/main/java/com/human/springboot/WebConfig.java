package com.human.springboot;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer{
	
	// 파일경로
	private String path = "file:///C:/Users/admin/Desktop/imgs/";
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/files/**").
		addResourceLocations("file:///C:/Users/admin/Desktop/imgs/");
	}
	
}
