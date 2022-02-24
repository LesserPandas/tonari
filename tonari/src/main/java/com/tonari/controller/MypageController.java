package com.tonari.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.MemberVO;
import com.tonari.domain.ReviewVO;
import com.tonari.domain.TeacherVO;
import com.tonari.domain.Teacherinfo_viewVO;
import com.tonari.service.MypageService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

import com.tonari.domain.MemberVO;
import com.tonari.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// 컨트롤러엔 무조건 @AllArgsConstructor 쓰기
@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("/mypage/*")
@AllArgsConstructor
@Log4j
public class MypageController {

	@Setter
	private MypageService service;
	
	
	//teacher 
	@GetMapping("/teacherJoin")
	public String tjoin(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("nick")==null) {
			return "/join/login";
		}else {
			String nick = (String)session.getAttribute("nick");
			MemberAuthVO mavo = service.tjoinpage(nick);
			model.addAttribute("info",mavo);
			return "/mypage/teacher/teacherJoin";
		}
	}
	
	@PostMapping(value="/teacherJoin", produces="application/json; charset=utf8")
	public String teacherjoin (@RequestParam("uploadFile") MultipartFile upimage,TeacherVO tvo) {
		tvo.setImage(UploadImageFile(upimage));
		service.teacherjoin(tvo);
		return "redirect: /";
	}
	
	//imageupload
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
		//IE
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("//")+1);
		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString()+"_"+uploadFileName;
		File uploadPath = new File(uploadFolder, getFolder());
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		File savefile = new File(uploadPath, uploadFileName);
		try {
			file.transferTo(savefile);
			uploadFileName = (savefile.toString().substring(10));
			url = "/upload/"+uploadFileName;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return url;
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator); //분리가 된다
	 }
	

	@GetMapping("/teacherInfo")
	public String tinfo() {
		return "/mypage/teacher/teacherInfo";
	}

	@GetMapping("/teacherModify")
	public String tModify(Model model , @RequestParam("bno")int bno) {
		model.addAttribute("tvo" , service.getTeacherVO(bno));
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
	
	@GetMapping("/subscription")
	public String sub() {
		return "/mypage/teacher/subscription";
	}
}
