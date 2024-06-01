package kr.or.ddit.vo;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
/*
1. 입력값 검증
스프링 MVC는 Bean Validation 기능을 이용해 요청 파라미터 값이 바인딩된
도메인 클래스(또는 커맨드 클래스)의 입력값 검증을 함
*/

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
*/

//POHO가 약해짐
@Data
public class MemberVO {
	//입력값 검증 규칙 지정함
	@NotBlank(message="아이디를 입력해주세요")
	private String userId;
	//여러개 입력값 검증 규칙을 지정 할 수 있음
	@NotBlank(message="사용자명을 입력해주세요")
	@Size(max=3, message="최대 3글자까지만 작성해주세요") //최대 3글자
	private String userName;
	private String password="1234";
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	private int    coin;
	private String enabled;
	//이메일 주소 형식인지 검사
	@NotBlank(message="올바른 이메일주소르 입력해주세요")
	@Email(message="올바른 이메일주소르 입력해주세요")
	private String email;
	private String birthDay;
	//스프링폼에서 rediobuttons의 path로 사용
	private String gender;
	//스프링폼에서 radiobuttons의 ㅑㅅ드dmfh tkdyd
	private Map<String,String> genderCodeMap;
	//스프링폼에서 select의 path로 사용
    private String nationality;
    //스프링폼에서 select의 item으로 사용
    private Map<String,String> nationalityCodeMap;
    private String cars;
    private String[] carArray;
    //스프링폼에서 checkboxes의 path으로 사용
    private ArrayList<String> carList;
    //스프링폼에서 checkboxes의 item으로 사용
    private Map<String,String> carMap;
    
    private String hobby;
    private String[] hobbyArray;
    private ArrayList<String> hobbyList;
    private Map<String,String> hobbyMap;
    private String developer;
    private boolean foreigner;
    private String introduction;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Past(message="과거 날짜를 입력해주세요")
    private Date dateOfBirth;
    
    
    //중첩된(nested) 자바빈즈
    //MEMBER : ADDRESS = 1:1
    /*
    4. 중첩된 자바빈즈 입력값 검증
    중첩된 자바빈즈와 자바빈즈의 컬렉션(1:N)에서 정의한 프로퍼티에 대해
    입력값 검증을 할 때는 골뱅이Valid를 지정함
    */
    //중첩된 자바빈즈의 입력값 검증을 지정함
    @Valid
    private Address address;
    
    //MEMBER : CARD = 1: N
    //자바빈즈 컬렉션의 입력값 검증을 지정함
    @Valid
    private List<Card> cardList;
    
    //스프링프레임워크에서 제공하는 MultipartFile 파일객체타입
    private MultipartFile picture;
    
    // <p><input type="file" name="pictures" multiple/></p>
    private MultipartFile[] pictures;
    
    //부모(MEMBMER) 1 : 자식 (MBMBER_AUTH) N = 1 : N
    private List<MemberAuthVO> memberAuthVOList;

}
