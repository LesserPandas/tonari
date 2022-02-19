package com.tonari.domain;

import java.util.Date;
import lombok.Data;

@Data
public class MemberVO {

	private int bno;
	private String auth;
	private String email;
	private String passwd;
	private String nick;
	private String name;
	private String sex;
	private String phone;
	private String address; 
	private String o_addr;
	private int zipcode;
	private String gu;
	private String dong;
	private Date join_date;
	private Date recent_login_date;
	public int memberIdPwSearch(String id, String pw) {
		// TODO Auto-generated method stub
		return 0;
	} 
}
