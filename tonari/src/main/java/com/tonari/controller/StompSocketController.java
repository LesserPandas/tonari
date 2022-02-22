package com.tonari.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class StompSocketController {

	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
	//클라이언트에서 JSON.stringify 를 사용하여 문자를 가져옴
	@MessageMapping("/message")
	public void showUser(@Payload String msg) {
		log.info("msg: " + msg);
		simpMessagingTemplate.convertAndSend("/topic/a", msg);
	}
}
