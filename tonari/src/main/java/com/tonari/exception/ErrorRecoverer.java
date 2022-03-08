package com.tonari.exception;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.retry.RejectAndDontRequeueRecoverer;
import org.springframework.stereotype.Component;

@Component
public class ErrorRecoverer extends RejectAndDontRequeueRecoverer {

	// Exception이 발생하면 recover 메소드가 호출된다.
	@Override
	public void recover(Message message, Throwable cause) {
		// do Something
	}
}
