package com.tonari.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MessageVO  {
	private int bno;
	private int sender;
	private String content;
	private Date write_date;
	private int room_bno;
	private int read_check;
}
