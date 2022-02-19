package com.tonari.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberAuthVO {
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
}
