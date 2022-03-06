package com.tonari.domain;

import lombok.Data;

@Data
public class TeacherSearch_viewVO {
	private int member_bno;
	private int teacher_bno;
	private String title;
	private String gu;
	private String dong;
	private String image;
	private int category_bno;
	private String category_name;
	private float score;
	private String coment;
	private String nick;
}
