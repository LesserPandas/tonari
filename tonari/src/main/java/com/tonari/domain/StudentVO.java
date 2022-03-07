package com.tonari.domain;

import java.util.Date;

import lombok.Data;

@Data
public class StudentVO {
   private int bno;
   private String name;
   private String nick;
   private Date write_date;
   private int submonth;
}