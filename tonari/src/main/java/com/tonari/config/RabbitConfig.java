package com.tonari.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.core.TopicExchange;
import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.amqp.rabbit.config.SimpleRabbitListenerContainerFactory;
import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.connection.Connection;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitAdmin;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.amqp.support.converter.Jackson2JsonMessageConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.retry.backoff.ExponentialBackOffPolicy;
import org.springframework.retry.policy.SimpleRetryPolicy;
import org.springframework.retry.support.RetryTemplate;

import com.rabbitmq.client.Channel;

@Configuration
@EnableRabbit
public class RabbitConfig {

	final int MAX_TRY_COUNT = 3;
	final int INITIAL_INTERVAL = 500;
	final int MULTIPLIER = 2;
	final int MAX_INTERVAL = 10000;

	private static final String CHAT_QUEUE_NAME = "chat.user.all";
	private static final String CHAT_EXCHANGE_NAME = "chat.exchange";
	private static final String ROUTING_KEY = "user.all";

	// Queue 등록
	@Bean
	public Queue queue() {
		return new Queue(CHAT_QUEUE_NAME, true);
	}

	// Exchange 등록
	@Bean
	public TopicExchange exchange() {
		return new TopicExchange(CHAT_EXCHANGE_NAME);
	}

	// Exchange와 Queue 바인딩
	@Bean
	public Binding binding(Queue queue, TopicExchange exchange) {
		return BindingBuilder.bind(queue).to(exchange).with(ROUTING_KEY);
	}

	@Autowired
	private GlobalPropertySource source;

	@Bean
	public ConnectionFactory connectionFactory() {
		CachingConnectionFactory cf = new CachingConnectionFactory();
		cf.setHost(source.getRabbitHost());
		cf.setPort(source.getRabbitPort());
		cf.setVirtualHost(source.getRabbitVirtualHost());
		cf.setUsername(source.getRabbitUsername());
		cf.setPassword(source.getRabbitPassword());
		return cf;
	}

	@Bean
	public RabbitAdmin admin() {
		return new RabbitAdmin(connectionFactory());
	}
	
	@Bean
	public Channel channel() {
		Connection connect = connectionFactory().createConnection();
		Channel ch = connect.createChannel(false);
		return ch;
	}

	@Bean
	public RabbitTemplate rabbitTemplate() {
		RabbitTemplate rabbit = new RabbitTemplate(connectionFactory());
		rabbit.setMessageConverter(jsonMessageConverter());
		rabbit.setRetryTemplate(retryTemplate());
		return rabbit;
	}

	@Bean
	public Jackson2JsonMessageConverter jsonMessageConverter() {
		return new Jackson2JsonMessageConverter();
	}

	@Bean("RabbitContainer")
	public SimpleRabbitListenerContainerFactory container() {
		SimpleRabbitListenerContainerFactory factory = new SimpleRabbitListenerContainerFactory();
		factory.setConnectionFactory(connectionFactory());
		factory.setMessageConverter(jsonMessageConverter());
		return factory;
	}
	
	@Bean
	public RetryTemplate retryTemplate() {
		RetryTemplate retry = new RetryTemplate();
		ExponentialBackOffPolicy policy = new ExponentialBackOffPolicy();
		policy.setInitialInterval(INITIAL_INTERVAL);
		policy.setMaxInterval(MAX_INTERVAL);
		policy.setMultiplier(MULTIPLIER);
		retry.setBackOffPolicy(policy);
		retry.setRetryPolicy(new SimpleRetryPolicy(5));
		return retry;
	}

}
