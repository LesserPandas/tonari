package com.tonari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/*")
@Controller
public class AdminController {
	
	@GetMapping("/login")
	public String main() {
		return "admin/login";
	}
	
	@GetMapping("/memberlist")
	public String memberlist() {
		return "admin/memberlist";
	}
	
	@GetMapping("/teachersales")
	public String teachersales() {
		return "admin/teachersales";
	}
	@GetMapping("/sales")
	public String sales() {
		return "admin/sales";
	}
	@GetMapping("/studentsales")
	public String studentsales() {
		return "admin/studentsales";
	}
	@GetMapping("/adminnotice")
	public String adminnotice() {
		return "admin/adminnotice";
	}
	@GetMapping("/adminmail")
	public String adminmail() {
		return "admin/adminmail";
	}
	@GetMapping("/teacherlist")
	public String teacherlist() {
		return "admin/teacherlist";
	}
	@GetMapping("/adminnoticeupdate")
	public String adminnoticeupdate() {
		return "admin/adminnoticeupdate";
	}
	
	@GetMapping("/adminnoticewrite")
	public String adminnoticewrite() {
		return "admin/adminnoticewrite";
	}
	
	
	
}
