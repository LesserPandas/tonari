package com.tonari.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.TeacherPermissionListVO;
import com.tonari.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/admin/*")
@AllArgsConstructor
@Log4j
public class AdminController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminService service;
	
	
	@GetMapping("/login")
	public String main() {
		return "admin/member/login";
	}
	

	//강사구독승인리스트 , 회원리스트
	@GetMapping("/memberlist")
	public String selectmeemberlist(Model model) {		
		List<MemberAuthVO> memberlist = service.selectmemberlist();
		model.addAttribute("memberlist", memberlist );
		List<TeacherPermissionListVO> TeacherPermissionList = service.TeacherPermissionList();
		model.addAttribute("TeacherPermissionList", TeacherPermissionList );
		return "admin/member/memberlist";
	}
	
	@GetMapping("/teachersales")
	public String teachersales() {
		return "admin/sales/teachersales";
	}
	@GetMapping("/sales")
	public String sales() {
		return "admin/sales/sales";
	}
	@GetMapping("/studentsales")
	public String studentsales() {
		return "admin/sales/studentsales";
	}
	@GetMapping("/board")
	public String board() {
		return "admin/board/board";
	}
	@GetMapping("/mail")
	public String mail() {
		return "admin/mail";
	}
	@GetMapping("/teacherlist")
	public String teacherlist() {
		return "admin/member/teacherlist";
	}
	@GetMapping("/update")
	public String update() {
		return "admin/board/update";
	}
	
	@GetMapping("/write")
	public String write() {
		return "admin/board/write";
	}
	//회원목록삭제
	@GetMapping("/delete.do")
	public String delete(MemberAuthVO MemberAuth, RedirectAttributes attr ) {
		service.delete(MemberAuth);
		
		return "redirect:/admin/memberlist";
	}
	
	

}
