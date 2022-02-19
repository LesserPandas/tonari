package com.tonari.domain;

import lombok.Data;

@Data
public class BoardSearch_viewVO {
	private int member_bno;
	private int teacher_bno;
	private String title;
	private String gu;
	private String dong;
	private String image;
	private int category_num;
	private String category_name;
	private int bno;
	private float score;
}
