package com.tonari.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tonari.domain.ReviewVO;
import com.tonari.domain.Review_viewVO;
import com.tonari.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@GetMapping("/search")
	public void search(Model model, @RequestParam("orderby") String orderby){
		log.info(orderby);
		model.addAttribute("sidelist", service.sidelist());
		model.addAttribute("list" , service.searchBoard(orderby));
		model.addAttribute("orderby", orderby);
	}
	
	@GetMapping("/category")
	public String searchCategory(Model model, @RequestParam("category") String category) {
		model.addAttribute("sidelist", service.sidelist());
		model.addAttribute("list",service.searchcategory(category));
		return "/board/search";
	}
	
	@GetMapping("/searchall")
	public String searchAll(Model model, @RequestParam("searchword") String word) {
		model.addAttribute("sidelist", service.sidelist());
		model.addAttribute("list",service.searchall(word));
		return "/board/search";
	}
	
	@GetMapping("/info")
	public void info(Model model, @RequestParam("board_bno") int bno) {
		model.addAttribute("sidelist", service.sidelist());
		model.addAttribute("teacher", service.teacherinfo(bno));
		model.addAttribute("review" , service.review(bno));
	}
	
	@PostMapping("/writeReview")
	public String writeReview(ReviewVO rvo,Model model, @RequestParam("teacher_bno") int bno) {
		service.writeReview(rvo);
		return "redirect:/board/info?board_bno="+bno;
	}
}
