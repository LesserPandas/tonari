package com.tonari.config;

import org.springframework.stereotype.Component;

@Component
public class QueueName {
	public String buildFor(String name) {
		return "chat.user" + name;
	}
}
