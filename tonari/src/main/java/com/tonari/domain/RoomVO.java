package com.tonari.domain;

import java.util.Date;

import lombok.Data;

@Data
public class RoomVO {
	private int bno;
	private int member_bno;
	private String nick;
	private String content;
	private Date write_date;
	private int noreadcount;
}
