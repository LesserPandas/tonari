package com.tonari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@GetMapping("/teacherJoin")
	public String join() {
		return "/mypage/teacher/join";
	}
}
