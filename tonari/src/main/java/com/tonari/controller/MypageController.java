package com.tonari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {
	
	@GetMapping("/teacherJoin")
	public String join() {
		return "/mypage/teacher/teacherJoin";
	}
	@GetMapping("/teacherInfo")
	public String info() {
		return "/mypage/teacher/teacherInfo";
	}
	@GetMapping("/teacherModify")
	public String tModify() {
		return "/mypage/teacher/teacherModify";
	}
	@GetMapping("/subscription")
	public String sub() {
		return "/mypage/teacher/subscription";
	}
	@GetMapping("/studentInfoModify")
	public String sModify() {
		return "/mypage/student/studentInfoModify";
	}
	@GetMapping("/like")
	public String steacherLike() {
		return "/mypage/student/teacherlike";
	}
	
}
