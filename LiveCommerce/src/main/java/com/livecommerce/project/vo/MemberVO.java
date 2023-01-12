package com.livecommerce.project.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class MemberVO {
	private String mid;
	private String mpassword;
	private String mname;
	private String mtel;
	private LocalDate mbirth;
	private String memail;
	private String maddress1;
	private String maddress2;
	private String mgender;
	private LocalDate mjoindate;
	private int mpoint;
	private String mrole;
	private String mzipcode;
}
