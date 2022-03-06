package com.tonari.controller;

import java.io.File;
import java.lang.reflect.Type;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.MemberVO;
import com.tonari.domain.PayListVO;
import com.tonari.domain.TeacherVO;
import com.tonari.domain.Teacherinfo_viewVO;
import com.tonari.domain.studentpaylistVO;
import com.tonari.service.BoardService;
/*import com.tonari.service.BoardServiceImpl;*/ /*한준희 컨트롤러에선 안쓰임*/
import com.tonari.service.MemberService;
import com.tonari.service.MypageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// 컨트롤러엔 무조건 @AllArgsConstructor 쓰기
@Controller
@RequestMapping("/mypage/*")
@AllArgsConstructor
@Log4j
public class MypageController {

	private MemberService service;
	private MypageService pservice;
	private BoardService bservice;

	@GetMapping("/teacherJoin")
	public String tjoin(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("nowUser");
		System.out.println(mvo);
		if (mvo == null) {
			return "/join/login";
		} else {
			String nick = mvo.getNick();
			MemberAuthVO mavo = pservice.tjoinpage(nick);
			model.addAttribute("info", mavo);
			return "/mypage/teacher/teacherJoin";
		}
	}

	@PostMapping(value = "/teacherJoin", produces = "application/json; charset=utf8")
	public String teacherjoin(@RequestParam("uploadFile") MultipartFile upimage, TeacherVO tvo) {
		tvo.setImage(UploadImageFile(upimage));
		pservice.teacherjoin(tvo);
		return "redirect: /";
	}

	// imageupload
	@PostMapping(value = "/ImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String ImageFile(@RequestParam("file") MultipartFile file) {
		JsonObject jsonObject = new JsonObject();
		String url = UploadImageFile(file);
		jsonObject.addProperty("url", url);
		String upload = jsonObject.toString();
		log.info(upload);
		return upload;
	}

	public String UploadImageFile(MultipartFile file) {
		String url = "";
		String uploadFolder = "c://upload";
		String uploadFileName = file.getOriginalFilename();
		// IE
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("//") + 1);
		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		File uploadPath = new File(uploadFolder, getFolder());
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		File savefile = new File(uploadPath, uploadFileName);
		try {
			file.transferTo(savefile);
			uploadFileName = (savefile.toString().substring(10));
			url = "/upload/" + uploadFileName;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}

	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator); // 분리가 된다
	}

	@GetMapping("/teacherUpdate")
	public String tModify(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("nowUser");
		if (mvo == null) {
			return "redirect: /join/login";
		}
		int bno = mvo.getBno();
		Teacherinfo_viewVO tvo = pservice.getTeacherVO(bno);
		if (tvo == null) {
			return "redirect:/mypage/teacherError";
		}

		model.addAttribute("tvo", tvo);
		int dodate = tvo.getDodate();
		List<Integer> list = pservice.getdate(dodate);
		String jsonText = new String();
		try {
			ObjectMapper objectmapper = new ObjectMapper();
			jsonText = objectmapper.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("json", jsonText);
		return "/mypage/teacher/teacherUpdate";
	}
	
	

	// 기본개인정보 수정
	@GetMapping("/studentinfo")
	public String studentinfo(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("nowUser");
		String nick = mvo.getNick();
		/* log.info("nick : " + nick); */
		MemberVO member = service.selectMember(nick);
		/* log.info("member Data : " + member); */
		model.addAttribute("member", member);
		return "/mypage/student/studentInfoModify";
	}

	@GetMapping("/studentList")
	public String studentList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("nowUser");
		int bno = mvo.getBno();
		PayListVO subResult = pservice.subResult(bno);
		model.addAttribute("subResult", subResult);
		Teacherinfo_viewVO tvo = pservice.getTeacherVO(bno);
		if (tvo == null) {
			return "redirect:/mypage/teacherError";
		}
		return "/mypage/teacher/studentList";
	}

	//선생님등록 1 구독창 열기
		@GetMapping("/subscription")
		public String sub(HttpServletRequest request, Model model) {
			HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO) session.getAttribute("nowUser");
			if (mvo == null) {
				return "redirect: /login";
			}
			int bno = mvo.getBno();
			PayListVO subResult = pservice.subResult(bno);
			model.addAttribute("subResult", subResult);
			Teacherinfo_viewVO tvo = pservice.getTeacherVO(bno);
			if (tvo != null) {
				return "redirect:/mypage/teacherError2";
			}
			return "/mypage/teacher/subscription";
		}
	
	// 선생 구독 기간(월) 저장
		@GetMapping("/payMonthJoin")
		public String payInsert(PayListVO pay) {

			pay.setPay_check("N");
			log.info("페이 정보 : " + pay);
			pservice.payInfo(pay);

			return "redirect:/mypage/teacherJoin";
		}

	// 구독 결과
	@GetMapping("/subResult")
	public String subResult(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("nowUser");
		if (mvo == null) {
			return "redirect: /mypage/teacherJoin";
		}
		int bno = mvo.getBno();
		PayListVO subResult = pservice.subResult(bno);
		model.addAttribute("subResult", subResult);
		Teacherinfo_viewVO tvo = pservice.getTeacherVO(bno);
		if (tvo == null) {
			return "redirect:/mypage/teacherError";
		}
		model.addAttribute("tvo", tvo);

		return "/mypage/teacher/subResult";
	}

	@GetMapping("/teacherError")
	public String teacherError() {
		return "/mypage/teacher/teacherError";
	}

	@GetMapping("/teacherError2")
	public String teacherError2() {
		return "/mypage/teacher/teacherError2";
	}

	// 좋아요 리스트
	@GetMapping("/like")
	public String likeList(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("nowUser");
		if (mvo == null) {
			return "redirect: /mypage/teacherJoin";
		}
		int member_bno = mvo.getBno();
		List<Teacherinfo_viewVO> tvo = pservice.likeList(member_bno);
		for (Teacherinfo_viewVO teacher : tvo) {
			String days = bservice.dodate(teacher);
			teacher.setDate(days);

			String[] a = days.split("、");
			int day_count = a.length;
			teacher.setDodate(day_count);
		}
		model.addAttribute("like", tvo);
		/*
		 * if(tvo == null) { return "redirect:/mypage/teacherError"; }
		 */
		return "/mypage/student/teacherlike";
	}

	// 학생이 좋아요 한 선생님 결제한 정보 저장
	@GetMapping(value = "/teacherlikePay", produces = "application/json; charset=utf8")
	@ResponseBody
	public void teacherlikePay(@RequestParam("myList") String myList) {
		
		Gson gson = new Gson();
		Type listType = new TypeToken<List<studentpaylistVO>>() {}.getType();
		List<studentpaylistVO> list = gson.fromJson(myList, listType);
		pservice.teacherlikePay(list);
		
	}

	// 학생이 결제한 선생 정보 보이기
	@GetMapping("/payteacherList")
	public String teacherList(HttpServletRequest request, Model model) {
		int bno = ((MemberVO) request.getSession().getAttribute("nowUser")).getBno();
		List<Teacherinfo_viewVO> myTeacherList = pservice.payTeacherList(bno);
		DateFormat fm = DateFormat.getDateInstance(DateFormat.LONG);
		
		for(Teacherinfo_viewVO teacher : myTeacherList) {
			teacher.setDate(bservice.dodate(teacher));
			teacher.setWrite_date2(fm.format(teacher.getWrite_date()));
		}
		
		model.addAttribute("last", myTeacherList);
		log.info(myTeacherList);
		return "/mypage/student/teacherList";
	}

}
