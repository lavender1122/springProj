package kr.or.ddit.vo;

import java.util.List;

import javax.validation.Valid;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EmployeeVO {
	@NotBlank(message="직원번호를 등록해주세요")
	private String empNo;
	
	@NotBlank(message="직원 명을 등록해주세요")
	private String empName;
	
	@NotBlank(message="등록 주소를 등록해주세요")
	private String empAddress;
	
	@NotBlank(message = "입력")
	private String empTelno;
	
	@Range(min=1,message = "입력")
	private int    empSalary;
	
	private String filename; //일부러 살려줌
	private String empPwd; 
	private String enabled; 
	
	
	//EMPLOYY : LICENSE = 1:N
	@Valid
	private List<License> licenseList;
	
	//중첩된 자바빈 컬렉션
	private List<EmployeeAuthVO> employeeAuthVOList;
	
	//EMPLOYEE : 증명사진 =1:1
	private MultipartFile uploadFile; // 1:1이라서 배열 아님
}
