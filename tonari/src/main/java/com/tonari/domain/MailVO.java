package com.tonari.domain;

import java.sql.Date;

import lombok.Data;
@Data
public class MailVO {
	private int bno;
	private String email;
	private String passwd;
	private String nick;
	private String name;
	private String sex;
	private int zipcode;
	private String address;
	private String o_addr;
	private String gu;
	private String dong;
	private String phone;
	private Date join_date;
	private Date recent_login_date;
	private String auth;
	

	private int member_bno;
	private int category;
	
	private String title;
	private String content;
	private int viewcount;
	private String write_date;
	private String upDate_date;
}
