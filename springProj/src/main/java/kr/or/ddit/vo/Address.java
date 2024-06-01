package kr.or.ddit.vo;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class Address {
	private String userId;
	@NotBlank(message="우편번호를 입력해주세요") //String은 @NotBlank TJdigka
	private String postCode; //우편번호
	@NotBlank(message="주소를 입력해주세요")
	private String location; // 주소
	
}
