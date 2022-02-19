package com.tonari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
/*import org.springframework.security.crypto.password.PasswordEncoder;*/
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tonari.domain.MemberVO;
import com.tonari.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/join/*")
@AllArgsConstructor
@Log4j
public class MemberController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService service;

//	@Setter(onMethod_ = @Autowired)
//	private PasswordEncoder pwencoder;

	@PostMapping("/login")
	 public String login(HttpServletRequest request, MemberVO member) {
		
		//0) DB검색
		String nick = service.loginCheck(member);
		// 1이면 로그인 성공 , 0이면 실패	
		log.info("=======================결과값 : " + nick);
		if (nick != null) {
			

			log.info("=======================로그인~ " + nick);
			//1) 세션 가져오기
			HttpSession session = request.getSession();
			
			//2) 표출되는 권한 명칭 설정
			/*
			 * String authName = "게시판 관리자"; if ( member.getAuth().equals("ADMINISTRATOR") )
			 * { authName = "전체관리자"; }
			 */
			
			//3) 세션 유지시간 설정
			/*
			 * session.setMaxInactiveInterval(1800); // 1800 = 60s*30 (30분)
			 */        
			//4) 회원정보 설정
			session.setAttribute("nick", nick);
			/* session.setAttribute(AUTH, member.getAuth()); */
			/* session.setAttribute(AUTH_NAME, authName); */
		} else {  
			return "redirect:/join/loginerror"; }
		
		return "redirect:/";
	}
	
	@GetMapping("/loginerror")
	public String loginerror() {
		return "/join/loginerror";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		request.getSession(true);
		return "redirect:/";
	}
	
	@GetMapping("/member.do")
	public void memberView() {

	}
	
	/*
	 * @GetMapping("/checkUserid.do") public @ResponseBody int
	 * checkUserId(@RequestParam("userid") String email) { int result =
	 * service.emailCheck(email); log.info(result); return result; }
	 */

	
	  @PostMapping("/memberinsertpro.do") 
	  public String register(MemberVO member,RedirectAttributes rttr) {
			/*
			 * log.info(member.getO_addr()); log.info(member.getGu());
			 * log.info(member.getDong());
			 */
	 /* String inputPass = pwencoder.encode(member.getPasswd());*/
	 /* member.setPasswd(inputPass);*/
	  
	  service.register(member);
	  //rttr.addFlashAttribute("result",member.getUserid()); return "redirect:/"; }
	return"redirect:/";
	
	  }
	//내가 추가함


    // 아이디 체크
    @PostMapping("/emailCheck")
    @ResponseBody
    public String idCheck(@RequestParam("email") String email){
        log.info("userIdCheck 진입");
        log.info("전달받은 id:"+ email);
        String result = "" + service.emailCheck(email);
        log.info("확인 결과:" + result);
        return result;
	
        
       
	
      //내가 추가함

}
    
    //닉네임 체크
    @PostMapping("/nickCheck")
    @ResponseBody
    public String nickCheck(@RequestParam("nick") String nick){
        log.info("userIdCheck 진입");
        log.info("전달받은 id:"+ nick);
        String result = "" + service.nickCheck(nick);
        log.info("확인 결과:" + result);
        return result;
        
    }
}
