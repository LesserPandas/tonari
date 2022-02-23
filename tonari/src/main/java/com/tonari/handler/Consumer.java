package com.tonari.handler;

import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class Consumer {

	public void handleMessage(Object message) {
		log.info("테스트중입니다.");
	}
}
