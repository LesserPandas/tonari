package com.tonari.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tonari.domain.LikeMarkVO;
import com.tonari.domain.PageVO;
import com.tonari.domain.ReviewVO;
import com.tonari.service.BoardService;
import com.tonari.util.Criteria;

import lombok.Setter;

@Controller
@RequestMapping("/board/*")
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
	public void info(Model model, LikeMarkVO lvo) {
		int bno = lvo.getTeacher_bno();
		lvo.setMember_bno(3);
		model.addAttribute("sidelist", service.sidelist());
		model.addAttribute("teacher", service.teacherinfo(bno));
		model.addAttribute("review" , service.review(bno));
		model.addAttribute("board_bno", bno);
		model.addAttribute("like", service.chkLikeone(lvo));
	}
	
	@PostMapping("/writeReview")
	public String writeReview(ReviewVO rvo,Model model, @RequestParam("teacher_bno") int bno) {
		service.writeReview(rvo);
		return "redirect:/board/info?teacher_bno="+bno;
	}
	
	@PostMapping("/board/addlike")
	@ResponseBody
	public void addlike(LikeMarkVO like) {
		service.addlike(like);
	}
	
	@PostMapping("/board/removelike")
	@ResponseBody
	public void removelike(LikeMarkVO like) {
		service.removelike(like);
	}
	
	@PostMapping("/board/chklike")
	@ResponseBody
	public List<LikeMarkVO> chklike(LikeMarkVO lvo){
		return service.chklike(lvo);
	}
}
