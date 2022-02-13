package com.tonari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/*")
@Controller
public class AdminController {
	
	@GetMapping("/login")
	public String main() {
		return "admin/member/login";
	}
	
	@GetMapping("/memberlist")
	public String memberlist() {
		return "admin/member/memberlist";
	}
	
	@GetMapping("/teachersales")
	public String teachersales() {
		return "admin/sales/teachersales";
	}
	@GetMapping("/sales")
	public String sales() {
		return "admin/sales/sales";
	}
	@GetMapping("/studentsales")
	public String studentsales() {
		return "admin/sales/studentsales";
	}
	@GetMapping("/board")
	public String board() {
		return "admin/board/board";
	}
	@GetMapping("/mail")
	public String mail() {
		return "admin/mail";
	}
	@GetMapping("/teacherlist")
	public String teacherlist() {
		return "admin/member/teacherlist";
	}
	@GetMapping("/update")
	public String update() {
		return "admin/board/update";
	}
	
	@GetMapping("/write")
	public String write() {
		return "admin/board/write";
	}
	
	
	
}
