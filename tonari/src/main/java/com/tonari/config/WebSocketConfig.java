package com.tonari.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;


@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	//@Autowired 안써주면 동작 안함
	@Autowired
	private GlobalPropertySource source;
	
	@Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.setApplicationDestinationPrefixes("/app", "/pub");
        //registry.enableSimpleBroker("/topic");
        registry.enableStompBrokerRelay("/topic/", "/queue/")
        .setRelayHost(source.getRabbitHost())
        .setRelayPort(source.getRabbitStompPort())
        .setClientLogin(source.getRabbitUsername())
        .setClientPasscode(source.getRabbitPassword())
        .setSystemLogin(source.getRabbitUsername())
        .setSystemPasscode(source.getRabbitPassword())
        .setVirtualHost(source.getRabbitVirtualHost());
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry stompEndpointRegistry) {
        stompEndpointRegistry
        .addEndpoint("/ws")
        .setAllowedOrigins("*")
        .withSockJS();
    }


}
