package com.tonari.controller;



import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tonari.domain.LikeMarkVO;
import com.tonari.domain.MemberVO;
import com.tonari.domain.PageVO;
import com.tonari.domain.ReviewVO;
import com.tonari.domain.TeacherSearch_viewVO;
import com.tonari.service.BoardService;
import com.tonari.util.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
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
		model.addAttribute("cri", cri);
	}
	
	@GetMapping("/info")
	public void info(Model model,@RequestParam("teacher_bno") int teacher_bno,HttpServletRequest request) {
		model.addAttribute("sidelist", service.sidelist());
		model.addAttribute("teacher", service.teacherinfo(teacher_bno));
		model.addAttribute("review" , service.review(teacher_bno));
		model.addAttribute("teacher_bno", teacher_bno);
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("nowUser");
		log.info("mvo : "+mvo);
		if(mvo != null) {
			LikeMarkVO lvo =new LikeMarkVO();
			lvo.setMember_bno(mvo.getBno());
			lvo.setTeacher_bno(teacher_bno);
			model.addAttribute("like", service.chkLikeone(lvo));
		}
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
	
	@GetMapping("/mainsearch")
	public void mainsearch(Model model, Criteria cri) {
		model.addAttribute("sidelist", service.sidelist());
		List<TeacherSearch_viewVO> list = service.mainsearch(cri);
		log.info("listlistlistlistlist"+list);
		model.addAttribute("list", list);
		int total = service.total(cri);
		model.addAttribute("pageMaker",new PageVO(cri, total));
	}
	
	@GetMapping("/viewboard")
	public void viewboard(Model model, @RequestParam("board_bno")int bno) {
		model.addAttribute("bvo",service.viewboard(bno));
	}
	
	@GetMapping("/listboard")
	public void listboard(Model model, @RequestParam("category") int category) {
		model.addAttribute("list",service.listboard(category));
		model.addAttribute("category",category);
	}
}
