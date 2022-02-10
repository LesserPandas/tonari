package com.tonari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/*")
@Controller
public class AdminController {
	
	@GetMapping("/login")
	public String main() {
		return "login";
	}
}
