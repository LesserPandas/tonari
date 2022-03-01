package com.tonari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {

	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/login")
	public String login() {
		return "/join/login";
	}

	@GetMapping("/join")
	public String join() {
		return "/join/join2";
	}

	@GetMapping("/mypage")
	public String mypage() {
		return "/mypage/mypage";
	}

	@GetMapping("/admin")
	public String admin() {
		return "redirect:/admin/login";
	}
}
