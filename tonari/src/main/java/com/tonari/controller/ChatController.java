package com.tonari.controller;

import java.io.IOException;
import java.util.Date;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tonari.domain.ChatVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@AllArgsConstructor
public class ChatController {

	private RabbitTemplate template;

	private final static String CHAT_EXCHANGE_NAME = "chat.exchange";
	private final static String CHAT_QUEUE_NAME = "chat.queue.1";
//	private final static String ROUTING_KEY = "room.";

	@MessageMapping("chat.enter")
	public void enter(ChatVO chat) {

		chat.setContent(chat.getRoom() + "번 방에 입장하셨습니다.");
		chat.setDate(new Date());
		template.convertAndSend(CHAT_EXCHANGE_NAME, "room.1", chat); // exchange
		// template.convertAndSend("room." + chatRoomId, chat); //queue
		// template.convertAndSend("amq.topic", "room." + chatRoomId, chat); //topic
	}

	@MessageMapping("send.message")
	public void send(ChatVO chat) {

		chat.setDate(new Date());
		System.out.println("룸번호 : room." + chat.getRoom());
		template.convertAndSend(CHAT_EXCHANGE_NAME, "room.1", chat);
		// template.convertAndSend( "room." + chat.getRoom(), chat);
		// template.convertAndSend("amq.topic", "room." + chatRoomId, chat);
	}

	// receive()는 단순히 큐에 들어온 메세지를 소비만 한다. (현재는 디버그용도)
	@RabbitListener(containerFactory = "RabbitContainer", queues = CHAT_QUEUE_NAME)
	public void receive(ChatVO chat) throws IOException {
		System.out.println("received : " + chat.getContent());
		template.convertAndSend(CHAT_EXCHANGE_NAME, "room.2", chat);
	}
}
