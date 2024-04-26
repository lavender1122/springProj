package kr.or.ddit.vo;

import lombok.Data;

// POJO(Plain Old Java Object)가 약해짐 
@Data
public class ContUsVO {
	private String cuCode;
	private String name;
	private String email;
	private String subject;
	private String message;
}
