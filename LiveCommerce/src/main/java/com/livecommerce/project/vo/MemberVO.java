package com.livecommerce.project.vo;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
/**
 * @author 신기원
 * @since 2023.01.12
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.12    신기원                최초 생성
*/
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
	private String streamKey;
}