package com.tonari.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.tonari.config.ChatConstants;
import com.tonari.domain.JoinRoomVO;
import com.tonari.domain.MemberVO;
import com.tonari.domain.MessageVO;
import com.tonari.service.ChatService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@AllArgsConstructor
public class ChatController {

	@Autowired
	private RabbitTemplate template;
	
	private ChatService service;

	@MessageMapping("send.message.{you}.{me}")
	public void send(MessageVO chat, 
			@DestinationVariable("you") String you,
			@DestinationVariable("me") String me) throws Exception {

		log.info("MessageVO : " + chat);
		log.info("me : " + me + ", you : " + you);
		template.convertAndSend(ChatConstants.CHAT_EXCHANGE_NAME, ChatConstants.ROUTING_KEY + me, chat);
		template.convertAndSend(ChatConstants.CHAT_EXCHANGE_NAME, ChatConstants.ROUTING_KEY + you, chat);
	}
	
	@GetMapping("/myChatList")
	public String myChatList(HttpServletRequest request, Model model, @RequestParam("bno") int bno) {
//		HttpSession session = request.getSession();
//		MemberVO mvo = (MemberVO)session.getAttribute("nowUser");
//		int bno = mvo.getBno();
		List<JoinRoomVO> joinRoomList = service.joinRoomList(bno);
		
		Gson gson = new Gson();
		String result = gson.toJson(joinRoomList);
		System.out.println("result : " + result);
		model.addAttribute("result", result);
		return result;
	}
}
