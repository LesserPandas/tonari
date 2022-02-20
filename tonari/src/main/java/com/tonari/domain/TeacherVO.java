package com.tonari.domain;

import lombok.Data;

@Data
public class TeacherVO {

	private int bno;
	private int member_bno;
	private int age;
	private String content;
	private String image;
	private int category;
	private String permission;
}
