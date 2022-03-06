package com.tonari.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	private String rank1;
	private String rank2;
	private String rank3;
	
	private Integer category_bno;
	private String dong;
	
	public Criteria() {
		this(1,9);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
	
}