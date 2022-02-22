package com.tonari.controller;

import java.io.File;
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
import com.google.gson.JsonObject;
import com.tonari.domain.MemberAuthVO;
import com.tonari.domain.MemberVO;
import com.tonari.domain.TeacherVO;
import com.tonari.domain.Teacherinfo_viewVO;
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

	@GetMapping("/teacherJoin")
	public String tjoin(Model model,HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("nowUser");
		System.out.println(mvo);
		if(mvo==null) {
			return "/join/login";
		}else {
			String nick = mvo.getNick();
			MemberAuthVO mavo = pservice.tjoinpage(nick);
			model.addAttribute("info",mavo);
			return "/mypage/teacher/teacherJoin";
		}
	}
	
	@PostMapping(value="/teacherJoin", produces="application/json; charset=utf8")
	public String teacherjoin (@RequestParam("uploadFile") MultipartFile upimage,TeacherVO tvo) {
		tvo.setImage(UploadImageFile(upimage));
		pservice.teacherjoin(tvo);
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
	
	@GetMapping("/teacherUpdate")
	public String tModify(Model model , HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("nowUser");
		if(mvo == null) {
			return "redirect: /mypage/teacherJoin";
		}
		int bno = mvo.getBno();
		Teacherinfo_viewVO tvo = pservice.getTeacherVO(bno);
		model.addAttribute("tvo" , tvo);
		int dodate = tvo.getDodate();
		List<Integer> list = pservice.getdate(dodate);
		String jsonText = new String();
		try {
			ObjectMapper objectmapper = new ObjectMapper();
			jsonText = objectmapper.writeValueAsString(list);
		}catch(Exception e) {
			e.printStackTrace();
		}
		model.addAttribute( "json", jsonText );
		return "/mypage/teacher/teacherUpdate";
	}

	@GetMapping("/subscription")
	public String sub() {
		return "/mypage/teacher/subscription";
	}
	@GetMapping("/subResult")
	public String subResult() {
		return "/mypage/teacher/subResult";
	}
	//기본개인정보 수정
	@GetMapping("/studentinfo") 
	public String studentinfo(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("nowUser");
		String nick = mvo.getNick();
		log.info("nick : " + nick);
//		MemberVO member = service.selectMember(nick);
//		log.info("member Data : " + member);
//		model.addAttribute("member", member);
		return "/mypage/student/studentInfoModify";
	}
	
	@GetMapping("/like")
	public String steacherLike() {
		return "/mypage/student/teacherlike";
	}
	
	@GetMapping("/studentList")
	public String studentList() {
		return "/mypage/teacher/studentList";
	}
	
	@GetMapping("/teacherList")
	public String teacherList() {
		return "/mypage/student/teacherList";
	}

	
	//이미지 저장
	//imageupload
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
		
		private String getFolder() {
		      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		      Date date = new Date();
		      String str = sdf.format(date);
		      
		      return str.replace("-", File.separator); //분리가 된다
		   }
}
