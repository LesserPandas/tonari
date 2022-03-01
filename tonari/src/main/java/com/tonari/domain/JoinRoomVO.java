package com.tonari.domain;

import lombok.Data;

@Data
public class JoinRoomVO {
	private int bno;
	private int member_bno;
	private int room_bno;
	private String nick;
}
