package com.tonari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tonari.domain.MemberVO;

@Controller
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
	public String mypage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("nowUser");
		if (mvo == null) {
			return "redirect: /login";
		}
		return "/mypage/mypage";
	}
	
	@GetMapping("/admin")
	public String admin() {
		return "redirect:/admin/login";
	}
}
