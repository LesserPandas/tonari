package com.tonari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/teacher/*")
public class TeacherController {
	
	@GetMapping("/search")
	public void search(){
	}
	
	@GetMapping("/info")
	public void info() {
		
	}

}
