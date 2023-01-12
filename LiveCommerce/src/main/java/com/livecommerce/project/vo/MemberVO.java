package com.livecommerce.project.vo;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberVO {
	private String mid;
	private String mpassword;
	private String mname;
	private String mtel;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate mbirth;
	private String memail;
	private String mzipcode;
	private String maddress1;
	private String maddress2;
	private String mgender;
	private LocalDate mjoindate;
	private int mpoint;
	private String mrole;
}