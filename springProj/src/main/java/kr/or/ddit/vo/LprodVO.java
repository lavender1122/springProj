package kr.or.ddit.vo;

import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
//POJO(Plain Old java OBject)에 위배
@Data
public class LprodVO {
	/*
	 Bean Validation이 제공하는 제약 애너테이션
	  - NotNull : 빈 값 체크(int타입)
	  - NotBlank : null 체크, trim후 길이가 0인지 체크(String타입)
	  - Size : 글자 수 체크
	  - Email : 이메일 주소 형식 체크
	  - Past : 오늘보다 과거 날짜(ex. 생일)
	  - Future : 미래 날짜 체크(ex. 예약일)
	  - AssertFalse : false 값만 통과 가능
	  - AssertTrue : true 값만 통과 가능
	  - DecimalMax(value=) : 지정된 값 이하의 실수만 통과 가능
	  - DecimalMin(value=) : 지정된 값 이상의 실수만 통과 가능
	  - Digits(integer=,fraction=) : 대상 수가 지정된 정수와 소수 자리수보다 적을 경우 통과 가능
	  - Future : 대상 날짜가 현재보다 미래일 경우만 통과 가능
	  - Past : 대상 날짜가 현재보다 과거일 경우만 통과 가능
	  - Max(value) : 지정된 값보다 아래일 경우만 통과 가능
	  - Min(value) : 지정된 값보다 이상일 경우만 통과 가능
	  - NotNull : null 값이 아닐 경우만 통과 가능
	  - Null : null일 겨우만 통과 가능
	  - Pattern(regex=, flag=) : 해당 정규식을 만족할 경우만 통과 가능
	  - Size(min=, max=) : 문자열 또는 배열이 지정된 값 사이일 경우 통과 가능
	  - Valid : 대상 객체의 확인 조건을 만족할 경우 통과 가능
	  
	  
	 골뱅이Range(min = 1, message="정렬순서를 입력해주세요")
	   private int orderNo;
	 
	//- 문자열을 다룰 때 사용
	//Size(min=?, max=?) // 최소 길이, 최대 길이 제한
	//- 숫자를 다룰 때 사용
	//Positive // 양수만 허용
	//PositiveOrZero // 양수와 0만 허용
	//Negative // 음수만 허용
	//NegativeOrZero // 음수와 0만 허용
	 */
	@Range(min=1,message="상품분류 아이디를 입력해주세요")
	private int    lprodId;
	@NotBlank(message="상품분류 코드를 입력해주세요")
	private String lprodGu;
	@NotBlank(message="상품분류 명를 입력해주세요")
	private String lprodNm;
	
	//상품분류 코드 : 상품 = 1:M
	//LPROD : PRODUCT = 1:M
	@Valid
	private List<ProductVO> productVOList;
	
	private MultipartFile[] pictures;
}
