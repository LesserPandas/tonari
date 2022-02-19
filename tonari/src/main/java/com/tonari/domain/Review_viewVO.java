package com.tonari.domain;

import lombok.Data;

@Data
public class Review_viewVO {

	private String scorestar;
	private int review_bno;
	private String content;
	private int score;
	private String nick;
	private int teacher_bno;
}
