package com.tonari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tonari.domain.MemberVO;
import com.tonari.service.BoardService;
import com.tonari.service.HomeService;
import com.tonari.util.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class HomeController {
	
	/*
	 * private BoardService bservice; private HomeService hservice;
	 */
	
	
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
