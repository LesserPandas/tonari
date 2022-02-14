package com.tonari.domain;

import lombok.Data;

@Data
public class ReviewVO {
	private int bno;
	private int member_bno;
	private int teacher_bno;
	private String content;
	private int score;
}
