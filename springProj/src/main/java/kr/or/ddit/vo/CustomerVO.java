package kr.or.ddit.vo;

import lombok.Data;
//POJO (Plain Old Java Object)가 약해짐
@Data
public class CustomerVO {
	private String cstNo;
	private String cstName;
	private String cstAddress;
	private String cstTelno;
}
