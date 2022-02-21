package com.tonari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tonari.domain.MemberVO;
import com.tonari.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// 컨트롤러엔 무조건 @AllArgsConstructor 쓰기
@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/mypage/*")
public class MypageController {

	private MemberService service;

	@GetMapping("/teacherJoin")
	public String tjoin() {
		return "/mypage/teacher/teacherJoin";
	}

	@GetMapping("/teacherInfo")
	public String tinfo() {
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

	@GetMapping("/studentinfo")
	public String studentinfo(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("nick");
		log.info("nick : " + nick);
		MemberVO member = service.selectMember(nick);
		log.info("member Data : " + member);
		model.addAttribute("member", member);
		return "/mypage/student/studentInfoModify";
	}

	@GetMapping("/like")
	public String steacherLike() {
		return "/mypage/student/teacherlike";
	}

}
