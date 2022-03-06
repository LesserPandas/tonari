package com.tonari.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Teacherinfo_viewVO {

	private int member_bno;
	private int teacher_bno;
	private String nick;
	private String title;
	private String gu;
	private String dong;
	private String image;
	private int category_bno;
	private String category_name;
	private float score;
	private String content;
	private String coment;
	private int dodate;
	private int age;
	private int tmoney;
	private int auth;
	
	private String date;
	private int tmoney;
	
	private Date write_date;
	private String write_date2;
	private int submonth;			
	private int pay;
}