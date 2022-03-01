package com.tonari.controller;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.stereotype.Controller;

import com.tonari.config.ChatConstants;
import com.tonari.domain.MessageVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class ChatController {

	@Autowired
	private RabbitTemplate template;

	@MessageMapping("send.message.{you}")
	public void send(MessageVO chat, 
			@DestinationVariable("you") String you) throws Exception {
		log.info("MessageVO : " + chat);
		template.convertAndSend(ChatConstants.CHAT_EXCHANGE_NAME, ChatConstants.ROUTING_KEY + you, chat);
	}
}
