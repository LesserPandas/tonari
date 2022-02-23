package com.tonari.handler;

import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Producer {
	
	@Autowired
	private RabbitTemplate rabbitTemplate;
	
	public void sendMessage(Object message) {
		rabbitTemplate.convertAndSend(message);
	}
	
//	public void send() {
//		CachingConnectionFactory cf = new CachingConnectionFactory("127.0.0.1", 5672);
//		cf.setUsername("rabbit");
//		cf.setPassword("1234");
//		
//		RabbitTemplate template = new RabbitTemplate(cf);
//	    template.setExchange("amq.direct");
//	    template.setDefaultReceiveQueue("myQueue");
//	    template.convertAndSend("foo.*", "Hello, world!");
//	    cf.destroy();
//	}
}
