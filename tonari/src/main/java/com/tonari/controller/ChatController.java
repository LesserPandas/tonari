package com.tonari.controller;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.tonari.service.ChatService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChatController {

	private RabbitTemplate rabbitTemplate;
	
	private ChatService service;
	
	//클라이언트에서 JSON.stringify 를 사용하여 문자를 가져옴
	@MessageMapping("/message")
	public void showUser(@Payload String msg) {
		log.info("msg: " + msg);
		rabbitTemplate.convertAndSend("/topic/a", msg);
	}
	
	@GetMapping("/chatTest")
	public void chatTest() {
		try {
			String test = "Test";
			log.info(test);
			service.send(test);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
