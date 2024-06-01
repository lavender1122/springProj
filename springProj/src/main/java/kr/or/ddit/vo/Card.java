package kr.or.ddit.vo;

import java.util.Date;

import javax.validation.constraints.Future;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Card {
	//Member 자바빈 클래스의 프로퍼티(식별자)
	private String userId;	
	@NotBlank(message="카드번호를 입력해주세요")
	private String no;
	@Future(message="미래의 날짜를 입력해주세요")
	@DateTimeFormat(pattern="yyyyMMdd")
	private Date validMonth;
}
