package com.tonari.controller;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Controller;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class StompSocketController {

	@Autowired
	private RabbitTemplate rabbitTemplate;
	
	//클라이언트에서 JSON.stringify 를 사용하여 문자를 가져옴
	@MessageMapping("/message")
	public void showUser(@Payload String msg) {
		log.info("msg: " + msg);
		rabbitTemplate.convertAndSend("/topic/a", msg);
	}
}
