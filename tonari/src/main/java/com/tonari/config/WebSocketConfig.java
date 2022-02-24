package com.tonari.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;


@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	@Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.setApplicationDestinationPrefixes("/app", "/foo");
        //registry.enableSimpleBroker("/topic");
        registry.enableStompBrokerRelay("/topic", "queue")
        .setRelayHost("localhost")
        .setRelayPort(61613)
        .setClientLogin("rabbit")
        .setClientPasscode("1234")
        .setSystemLogin("rabbit")
        .setSystemPasscode("1234")
        .setVirtualHost("/");
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry stompEndpointRegistry) {
        stompEndpointRegistry
        .addEndpoint("/ws")
        .setAllowedOrigins("*")
        .withSockJS();
    }


}
