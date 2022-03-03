package com.tonari.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MyJoinRoomListVO {
	private int member_bno;
	private int room_bno;
	private String nick;
	private String content;
	private Date write_date;
	private int noreadcount;
}
