package com.tonari.domain;

import lombok.Data;

@Data
public class Review_viewVO {
	private int review_bno;
	private int member_bno;
	private int teacher_bno;
	private String content;
	private int score;
	private String nick;
}
