package com.tonari.controller;

import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tonari.domain.BoardVO;
import com.tonari.domain.BoardlistVO;
import com.tonari.domain.MailVO;
import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.TeacherListVO;
import com.tonari.domain.TeacherPermissionListVO;
import com.tonari.service.AdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@AllArgsConstructor
@Log4j
public class AdminController {

	private AdminService service;

	@Autowired
	private JavaMailSenderImpl mailSender;

	// 로그인
	@GetMapping("/login")
	public String main() {
		return "admin/member/login";
	}

	@PostMapping("/login.do")
	public String login(MemberAuthVO MemberAuth, HttpServletRequest req, RedirectAttributes rttr) throws Exception {

		MemberAuth = service.login(MemberAuth);

		return "redirect:/admin/memberlist";
	}

	// 강사구독승인리스트 , 회원리스트
	@GetMapping("/memberlist")
	public String selectmeemberlist(Model model) {
		List<MemberAuthVO> memberlist = service.selectmemberlist();
		model.addAttribute("memberlist", memberlist);

		List<TeacherPermissionListVO> TeacherPermissionList = service.TeacherPermissionList();
		model.addAttribute("TeacherPermissionList", TeacherPermissionList);

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

	// 게시판
	@GetMapping("/board")
	public String board(Model model) {

		List<BoardlistVO> boardlist = service.selectboardlist();
		model.addAttribute("boardlist", boardlist);

		return "admin/board/board";
	}

	// 강사목록
	@GetMapping("/teacherlist")
	public String teacherlist(Model model, TeacherListVO tvo) {

		List<TeacherPermissionListVO> TeacherPermissionList = service.TeacherPermissionList();
		model.addAttribute("TeacherPermissionList", TeacherPermissionList);

		List<TeacherListVO> Teacherlist = service.selectteacherlist();
		model.addAttribute("teacherlist", Teacherlist);
		log.info("============ list length : " + Teacherlist.size());

		System.out.println(Teacherlist);

		return "admin/member/teacherlist";
	}

	// 글수정
	@GetMapping("/update")
	public String update(@RequestParam("bno") int bno, Model model) {
		// model.addAttribute("boardlist", service.selectboardlist(bno));
		return "admin/board/update";
	}

	@GetMapping("/updateboard.do")
	public String updateboard(@RequestParam("bno") int bno, Model model) {

		BoardVO board = service.selectBoard(bno);
		log.info("가져온 게시글 : " + board);
		model.addAttribute("boardlist", board);

		return "admin/board/update";
	}

	@PostMapping("/updateboardpro.do")
	public String updateboardpro(BoardVO board) {
		service.updateboardpro(board);

		return "redirect:/admin/board";
	}

	// 글작성페이지
	@GetMapping("/write")
	public String write(Model model) {

		return "admin/board/write";
	}

	// 게시글작성
	@PostMapping("/insert")
	public String insertboard(BoardVO board) {
		service.insertboard(board);
		System.out.println(board);

		return "redirect:/admin/board";
	}

	// 회원목록삭제
	@GetMapping("/delete.do")
	public String delete(MemberAuthVO MemberAuth, RedirectAttributes attr) {
		service.delete(MemberAuth);

		return "redirect:/admin/memberlist";
	}

	@GetMapping("/boarddelete.do")
	public String boarddelete(BoardlistVO Boardlist, RedirectAttributes attr) {
		service.boarddelete(Boardlist);

		return "redirect:/admin/board";
	}

	// 회원목록 강사구독승인
	@GetMapping("/permission.do")
	public String permission(@RequestParam("bno") int bno, HttpServletRequest request) {
		String uri = request.getHeader("Referer");
		String reURI = uri.substring(21);
		log.info("============================ 이전 주소값 : " + uri);
		log.info("============================ 리얼 주소값: " + reURI);
		service.permission(bno);

		return "redirect:" + reURI;

	}

//	 메일전송
	@GetMapping("/mail")
	public String mail() {
		return "/admin/mail";
	}

	@PostMapping("/sendMail")
	public String sendMail(MailVO mail) {
		
		List<MailVO> mails = new ArrayList<>();
		mails = service.selectMail();
		
		MimeMessagePreparator[] preparators = new MimeMessagePreparator[mails.size()];
		int i = 0;
		for (final MailVO vo : mails) {
			
			log.info("email : " + vo.getEmail());
			
			preparators[i++] = new MimeMessagePreparator() {
				
				@Override
				public void prepare(MimeMessage mimeMessage) throws Exception {
					final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					helper.setFrom("kdh353866@gmail.com");
					helper.setTo(vo.getEmail());
					helper.setSubject(mail.getTitle());
					helper.setText(mail.getContent(), true);
				}
			};
		}
		mailSender.send(preparators);
		
		return "redirect:/admin/memberlist";
	}
}