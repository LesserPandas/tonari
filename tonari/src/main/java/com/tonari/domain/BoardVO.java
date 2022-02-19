package com.tonari.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int bno;
	private int member_bno;
	private int category;
	
	private String title;
	private String content;
	private int viewcount;
	private String write_date;
	private String upDate_date;
}



	
	  