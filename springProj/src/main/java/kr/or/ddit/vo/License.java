package kr.or.ddit.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class License {
	@NotBlank(message = "입력")
	private String empNo;
	@NotBlank(message = "입력")
	private String licNo; //자격증 번호
	private String licNm; // 자격증 명
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date licDt; //발급일
}
