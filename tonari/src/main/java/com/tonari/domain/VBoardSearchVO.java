package com.tonari.domain;

import lombok.Data;

@Data
public class VBoardSearchVO {
	private int member_bno;
	private int teacher_bno;
	private String title;
	private String gu;
	private String dong;
	private String image;
	private String category;
	private int bno;
	private float score;
}
