package com.tonari.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@GetMapping("/search")
	public String search(/*@RequestParam("searchText")String search , @RequestParam("orderBy")String orderBy*/Model model){
//		List<TeacherVO> list = mapper.---
//		model.addAttribute("list" , list);
		return "/board/search";
	}
	
	@GetMapping("/info")
	public void info(Model model) {
		
	}

}
