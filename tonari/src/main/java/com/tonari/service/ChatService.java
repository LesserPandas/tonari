package com.tonari.service;

import java.io.IOException;

import org.springframework.amqp.core.Message;
import org.springframework.messaging.handler.annotation.Payload;

public interface ChatService {
	
	public void send(@Payload String message) throws IOException;
	
	public void onMessage(byte[] message);
	
	public void onMessage(Message message);
	
}
