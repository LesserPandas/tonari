package com.tonari.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO  {
	private int room;
	private String content;
	private Date date;
}
