package com.tonari.service;

import java.io.IOException;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ChatServiceImpl implements ChatService {

	@Autowired
    private RabbitTemplate rabbitTemplate;
	
	@Override
	public void send(@Payload String message) throws IOException {
        log.info("send message = " + message);
		rabbitTemplate.convertAndSend("/topic/foo.bar", message);
	}

	@Override
	public void onMessage(byte[] message) {
        String msg = null;
        try {
            msg = new String(message);
        } catch (Exception e) {
//            msg = new String(message, "UTF-8");
//        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        log.info("메세지 원본 : " + message);
        log.info("메세지 스트링 :  " + msg );
    }

	
	@Override
	public void onMessage(Message message) {
		// TODO Auto-generated method stub
	}
	
	
}
