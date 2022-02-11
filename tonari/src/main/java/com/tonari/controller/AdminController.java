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
	@GetMapping("/notice")
	public String notice() {
		return "admin/notice";
	}
	@GetMapping("/mail")
	public String mail() {
		return "admin/mail";
	}
	@GetMapping("/teacherlist")
	public String teacherlist() {
		return "admin/teacherlist";
	}
	@GetMapping("/noticeupdate")
	public String noticeupdate() {
		return "admin/noticeupdate";
	}
	
	@GetMapping("/noticewrite")
	public String noticewrite() {
		return "admin/noticewrite";
	}
	
}
