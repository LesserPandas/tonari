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

@Controller
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
		String uploadFolder = "c://upload";
		String uploadFileName = upimage.getOriginalFilename();
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("//")+1);
		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString()+"_"+uploadFileName;
		File uploadPath = new File(uploadFolder, getFolder());
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		File savefile = new File(uploadPath, uploadFileName);
		try {
			upimage.transferTo(savefile);
			uploadFileName = (savefile.toString().substring(10));
			tvo.setImage("/upload/"+uploadFileName);
			log.info(tvo.getImage());
		}catch(Exception e) {
			e.printStackTrace();
		}
		service.teacherjoin(tvo);
		return "redirect: /";
	}
	
	
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator); //분리가 된다
	 }
	
	//imageupload (summernote)
	@PostMapping(value = "/ImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String ImageFile(@RequestParam("file") MultipartFile file) {
		JsonObject jsonObject = new JsonObject();
		String uploadFolder="c:\\upload";
		log.info("file name : "+file.getOriginalFilename());
	 
		String uploadFileName = file.getOriginalFilename();
		//IE
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("//")+1);
		log.info("only file name : "+uploadFileName);
		 
		UUID uuid = UUID.randomUUID();
		 
		uploadFileName = uuid.toString()+"_"+uploadFileName;
		 
		File uploadPath = new File(uploadFolder, getFolder());
	 
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		File savefile = new File(uploadPath,uploadFileName);
		String saveUrl = uploadFileName.toString();
		log.info(saveUrl);
		 
		try {
			file.transferTo(savefile);
			uploadFileName = (savefile.toString().substring(10));
			jsonObject.addProperty("url", "/upload/"+uploadFileName);
			jsonObject.addProperty("responseCode", "success");
			log.info(uploadFileName);
		}catch(Exception e) {
			e.printStackTrace();
			jsonObject.addProperty("responseCode", "error");
		}
		String upload = jsonObject.toString();
		log.info(upload);
		return upload;
	}
	
	
	@GetMapping("/teacherInfo")
	public String tinfo() {
		return "/mypage/teacher/teacherInfo";
	}
	@GetMapping("/teacherModify")
	public String tModify() {
		return "/mypage/teacher/teacherModify";
	}
	@GetMapping("/subscription")
	public String sub() {
		return "/mypage/teacher/subscription";
	}
	
	
	
	//student
	@GetMapping("/studentInfoModify")
	public String sModify() {
		return "/mypage/student/studentInfoModify";
	}
	@GetMapping("/like")
	public String steacherLike() {
		return "/mypage/student/teacherlike";
	}
	
	
	
	
	
	
	
	

}
