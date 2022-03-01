package com.tonari.service;

import java.io.IOException;

import org.springframework.stereotype.Service;

import com.rabbitmq.client.Channel;
import com.tonari.config.ChatConstants;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ChatServiceImpl implements ChatService {

	private Channel ch;

	@Override
	public void setQueue(int bno) {

		try {
			ch.queueDeclare(ChatConstants.CHAT_QUEUE_NAME + bno, true, false, false, null);
			System.out.println("큐 생성 완료!");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ch.queueBind(ChatConstants.CHAT_QUEUE_NAME + bno, ChatConstants.CHAT_EXCHANGE_NAME,
						ChatConstants.ROUTING_KEY + bno);
				System.out.printf("큐 : %s, 인스체인지 : %s, 라우팅 키 : %s", ChatConstants.CHAT_QUEUE_NAME + bno,
						ChatConstants.CHAT_EXCHANGE_NAME, ChatConstants.ROUTING_KEY + bno);
				System.out.println("바인딩 완료!");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
