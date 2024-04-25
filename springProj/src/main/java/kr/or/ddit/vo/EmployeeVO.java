package kr.or.ddit.vo;

import lombok.Data;

@Data
public class EmployeeVO {
	private String empNo;
	private String empName;
	private String empAddress;
	private String empTelno;
	private int    empSalary;
	private String filename;
}
