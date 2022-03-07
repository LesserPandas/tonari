package com.tonari.domain;

import java.util.Date;

import lombok.Data;

@Data
public class studentpaylistVO {
	private int	bno;			
	private int teacher_bno;	
	private int member_bno;		
	private int submonth;		
	private int pay;		
	private Date write_date; 	
	
}
