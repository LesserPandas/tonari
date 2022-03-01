package com.tonari.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import lombok.Data;

@Data
@Configuration
@PropertySource(value = "/WEB-INF/spring/config/rabbitmq.properties", ignoreResourceNotFound = true)
public class GlobalPropertySource {

	@Value("${rabbitmq.host}")
	private String rabbitHost;

	@Value("${rabbitmq.port}")
	private String rabbitPort;

	@Value("${rabbitmq.stompPort}")
	private String rabbitStompPort;

	@Value("${rabbitmq.username}")
	private String rabbitUsername;

	@Value("${rabbitmq.password}")
	private String rabbitPassword;

	@Value("${rabbitmq.virtual-host}")
	private String rabbitVirtualHost;
	
	public int getRabbitPort() {
		return Integer.parseInt(rabbitPort);
	}
	
	public int getRabbitStompPort() {
		return Integer.parseInt(rabbitStompPort);
	}
}
