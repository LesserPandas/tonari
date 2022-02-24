package com.tonari.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PayListVO {
	private int bno;
	private int member_bno;
	private int submonth;
	private Date write_date;
	private String pay_check;
}
