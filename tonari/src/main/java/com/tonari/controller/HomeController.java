package com.tonari.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tonari.domain.MemberVO;
import com.tonari.domain.TeacherSearch_viewVO;
import com.tonari.domain.TeacherVO;
import com.tonari.service.BoardService;
import com.tonari.service.HomeService;
import com.tonari.util.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class HomeController {
	
	private BoardService bservice; 
	private HomeService hservice;
	
	
	@GetMapping("/")
	 public String index(Model model, HttpServletRequest request) {
		
		Criteria cri = new Criteria();
		HttpSession session = request.getSession();
		cri.setType("orderby");
		cri.setKeyword("score");
		model.addAttribute("bestlist",bservice.OrderbyList(cri));
		cri.setKeyword("new");
		model.addAttribute("newlist",bservice.OrderbyList(cri));
		MemberVO mvo = (MemberVO)session.getAttribute("nowUser");
		if(mvo != null) {
			cri.setType("area");
			cri.setKeyword(mvo.getNick());
			model.addAttribute("locationlist",bservice.OrderbyList(cri));
		}
		model.addAttribute("likelist",hservice.likelist());
		model.addAttribute("review",hservice.review());
		model.addAttribute("notice",hservice.board(1));
		model.addAttribute("event",hservice.board(2));
		List<TeacherSearch_viewVO> list = hservice.teachers();
		String jsonText = new String();
		try {
			ObjectMapper objectmapper = new ObjectMapper();
			jsonText = objectmapper.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("teacherList", jsonText);
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
