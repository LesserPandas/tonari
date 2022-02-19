package com.tonari.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tonari.domain.PageVO;
import com.tonari.domain.ReviewVO;
import com.tonari.service.BoardService;
import com.tonari.util.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@GetMapping("/search")
	public void search(Model model, Criteria cri) {
		if(cri.getType()==null)cri.setType("all");
		model.addAttribute("sidelist", service.sidelist());
		model.addAttribute("list",service.OrderbyList(cri));
		int total = service.total(cri);
		model.addAttribute("pageMaker",new PageVO(cri, total));
		model.addAttribute("orderby", cri.getKeyword());
		model.addAttribute("type",cri.getType());
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
